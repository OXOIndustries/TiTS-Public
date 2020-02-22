//Spinarran Silk&Steel
//Written by Kinathis
//Coded by Fenoxo Fenbuttprobably

//Map description
//output("\n\nTo the DIRECTION you see a large shop. The holograpic sign above the shop features a decal of a multilegged tauric alien and the words <i>“Spinarran Silk&Steel”</i>. The display windows on either side of the entrance show off samples of what is sold inside. Polished weapons, exotic body armor and even more mundane clothing.");

public function showKirila(nude:Boolean = false):void
{
	showName("\nKIRILA");
	if(nude) showBust("KIRILA_NUDE");
	else showBust("KIRILA");
}

//Entering Shop
public function spinarranSilkAndSteelBonusFunc():Boolean
{
	author("Kinathis");
	output("The shop is large with oddly wide spaces between displays. The interior looks to be divided neatly in two. One side is devoted to clothing, silkwear, suits and dresses and the other to all manner of spinarran weapons and armor.");
	output("\n\nYou [pc.walk] over to the shop keeper: a tall, well built, feminine figure with long, finger-thick cords of copper carapace for hair and a silky dress. A name tag stands out against her dress, spelling “Kirila”. The humanoid alien looks over at you from under a set of dark, six-eyed goggles. One of her hands is playing with a small bowl of what looks like decorative bluish gravel, though even as you watch, she plucks one of the small rocks out of the pile and pops it into her mouth. You can hear a small pop, then several crunching sounds before she swallows.");
	
	removeUvetoCold(true);
	
	addButton(0,"Kirila",approachKirila);
	return false;
}

public function backFromShop():void { approachKirila(true); }

public function approachKirila(back:Boolean = false):void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	if(back)
	{
		output("Kirila looks over her shoulder at her shop. <i>“Is there something else I can help you with?”</i> she asks with a smile on her copper-skinned lips.");
	}
	else
	{
		output("Kirila gives you a little wave. <i>“Hey there, welcome to Spinarran Silk & Steel. Are you here for silk or for steel?”</i> she asks with a smile on her copper-skinned lips.");
		
		if(flags["MET_KIRILA"] == undefined) flags["MET_KIRILA"] = 1;
	}
	if(!CodexManager.entryUnlocked("Spinarrans"))
	{
		output("\n\nYour Codex gives a little beep to indicate that it has prepared an article on Kirila’s race. <b>(New Codex entry unlocked: Spinarrans.)</b>");
		CodexManager.unlockEntry("Spinarrans");
	}
	silkAndSteelMenu();
}


public function silkAndSteelMenu():void
{
	clearMenu();

	addButton(0,"Talk",talkToKirila,undefined,"Talk","Talk to Kirila.");
	addDisabledButton(1,"Shop","Shop","Not yet in!");
	addButton(2,"Appearance",kirilaAppearance,undefined,"Appearance","Take a gander at Kirila’s appearance.");
	addButton(5,"Shop: Steel",kirilaShop,0,"Shop: Steel","Shop for weaponry!");
	addButton(6,"Shop: Armor",kirilaShop,1,"Shop: Steel","Shop for armor!");
	addButton(7,"Shop: Silk",kirilaShop,2,"Shop: Steel","Shop for clothing items!");
	addButton(3,"Demos",itemDemos,undefined,"Demonstrations","Ask Kirila for more information on the various weapons.");
	addButton(14,"Back",mainGameMenu);
}

//Appearance
public function kirilaAppearance():void
{
	clearOutput();
	author("Kinathis");
	showKirila();
	output("The spinarran shopkeeper stands tall for a woman, an inch or two over six feet tall. From her build you can tell she’s no pushover either. Six eyes look back at you from behind polarized goggles. Under her outfit, her entire body is covered head to toe in hard, shiny carapace of polished-looking coppery metal. Long locks of chitinous ‘hair’ flow down her back from her crested head, each tendril as thick as a finger, segmented and looking like bundles of wrapped copper cable. Standing out from her chest is the rise of her bust, what you guess to be C-cups, perfectly suited to her frame. Her strong waist flares into wide, egg bearing hips, thick thighs and a round ass.");
	clearMenu();
	addButton(0,"Next",approachKirila,true);
}

public function talkToKirila():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You lean on the counter and ask if you can just talk for a bit before buying anything.");
	output("\n\n<i>“Talk? Sure, I suppose I can spare a few minutes.”</i> Kirila sits in the chair and pulls herself up to the counter. <i>“So, what’s up, customer?”</i>");
	output("\n\n<i>“Well I’d like to know more about you? You don’t see many of your kind around.”</i>");
	output("\n\n<i>“True enough. Spinarrans are not a commonly seen species. If you wanted to know about us, you could look us up on the extranet. Our people have been a part of the UGC for a century now. Plenty of information on us is publicly available, but I suppose firsthand knowledge is always better. What would you like to talk about; about spinarrans, myself, or if you’re tired of talking you could always peruse our wares.”</i>");
	kirilaTalkMenu(kirilaTalkMenu);
}

public function kirilaTalkMenu(arg:Function):void
{
	clearMenu();
	if(arg != kirilasSight) addButton(0,"Her Vision",kirilasSight,undefined,"Her Vision","Ask the curious creature about her vision.");
	else addDisabledButton(0,"Her Vision","Her Vision","You just asked that!");

	if(arg != kirilasDiet) addButton(1,"Her Diet",kirilasDiet,undefined,"Her Diet","Ask the curious creature what she eats.");
	else addDisabledButton(1,"Her Diet","Her Diet","You just asked that!");

	if(arg != kirilasPastWork) addButton(2,"Past Work",kirilasPastWork,undefined,"Past Work","Ask Kirila about her previous work.");
	else addDisabledButton(2,"Past Work","Her Work","You just asked that!");

	if(arg != kirilaRushTalk) addButton(3,"The Rush",kirilaRushTalk,undefined,"The Rush","Ask Kirila about the Planet Rush, maybe talk to her a bit about it.");
	else addDisabledButton(3,"The Rush","The Rush","You just asked that!");

	addButton(14,"Back",approachKirila,true);
}

//Spinarrans
//(Sight, Diet.)
//Sight
public function kirilasSight():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("<i>“We like to live deep underground, you see. Many of our kin go their whole lives without seeing the sky or even the surface of a planet. Our eyes don’t see very well in bright light,”</i> the copper-plated alien says as she taps a clawed finger against the polarised surface of her goggles. <i>“Spinarrans need protective lenses to keep our eyes safe on the surface or in alien cities, we would be almost blinded by even the lights most beings need to see.”</i>");
	output("\n\n<i>“On the plus side, we see in infrared and ultraviolet. We are very well adapted to living in near or total darkness,”</i> the drider says, adding to the topic at hand. <i>“With our sight, smell, and our antennae, we can even sense all the different types of rock and minerals in the walls and ground around us.”</i>");
	output("\n\nYou look at their covered eyes before gazing around the store. It’s hard to imagine seeing things like that all at once. You have no idea what it would be like to just sense minerals like that. <i>“Hard to imagine seeing all those different things at once,”</i> you say, voicing your thoughts.");
	output("\n\nHer antennae shudder with amusement and she smiles. <i>“To others, yes. To us, it’s beautiful. We see a world of patterns and twilight. People look like fire of all shades, cold lends notes of shadowy twilight. UV adds detail to your blazing form.”</i> Her antennae twitch several times, and you can hear her sniffing. <i>“If you had been down in the mines I would even be able to smell the minerals in the dust on your clothing.”</i>");
	output("\n\n<i>“That’s pretty cool. It must be nice being able to see in complete darkness,”</i> you say as you get comfortable at the counter.");
	output("\n\n<i>“It is I suppose. It’s normal to us. It does come with a price; we can’t stand daylight at all, and alien cities are... intense for us. Some places have so much neon that it may as well be daylight. Got to wear our goggles all the time just to be able to see. Give me a nice dark spinarran city any day.”</i> The chitinous alien looks at you apologetically. <i>“No offence to you, honestly. Biological differences, that’s all. It’s just a lot more comfortable for us. And most aliens don’t like UV light, so we can’t make full use of our antennae.”</i>");
	output("\n\nYour eyes look up to the occasionally twitching feelers. <i>“You can’t?”</i>");
	output("\n\nKirila shakes her head. <i>“No, we can’t, or, well, we choose not too. We can make them glow with ultraviolet light so we can see better in the dark, and most aliens don’t handle UV rays very well. In fact I could probably give you a bad sunburn or cause permanent eye damage if I were to make them glow. So we don’t unless we are alone, or when It’s just spinarrans anyway.”</i>");
	output("\n\nYeah, you could do without getting a sunburn indoors. <i>“I see. Well it’s thoughtful of you to keep them unlit around aliens.”</i>");
	output("\n\nShe nods. <i>“We try, not all aliens adapt to galactic life easily. The UV sight isn’t just for not bumping into stuff, you don’t see it on us, but we are covered in patterns and markings that are only visible in the ultraviolet spectrum. Helps us tell each other apart and warn creatures we are dangerous, as if being covered head to toe in metal, having claws, pick arms, and strong jaws weren’t enough to give that away,”</i> the arachnid says, jabbing the air with one of her pickaxe-like secondary limbs for emphasis.");
	processTime(7);
	kirilaTalkMenu(kirilasSight);
}

//Diet
public function kirilasDiet():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You look down at the bowl filled with bluish rocks and pick one up. <i>“These looks like rocks, but I saw you eat one earlier. Are they really rocks?”</i> you ask, playing with the little bluish rock in your hand.");
	output("\n\nShe nods. <i>“Of course, what else would they be?”</i>");
	output("\n\n<i>“You seriously do eat rocks?”</i> you question, eyes drifting down to the bowl of small rocks on the counter. You know you saw her eat one.");
	output("\n\nKirila smiles, showing the many sharp and crushing teeth. The pearlescent rock breakers almost seem to sparkle like crystal. <i>“Indeed I do, and yes, they are real rocks. Rocks impregnated with copper ore to be exact. I snack on them often. Got to keep up my lovely exoskeleton!”</i> she says, running a hand back over her head and through her copper tresses.");
	output("\n\n<i>“");
	if(!pc.isBimbo()) output("They talk about people having hair like spun copper, but for you it’s literal, your ski-chitin and uhh... hair, it’s all copper?");
	else output("So, like, your hair is actual copper? Like the metal. Coooool");
	output("!”</i>");

	output("\n\nThe spinarran nods. <i>“Mmhmm, it’s all metal, well, almost all. There is a little bit of organic matter laced throughout, but for the most part I am covered head to toe in a lovely alloy of nearly 90% copper plus a bunch of other stuff.”</i> She lifts her chin and smiles, clearly proud of her chitin.");
	output("\n\n<i>“");
	if(!pc.isBimbo()) output("Well it’s very shiny, looks like you take good care of it,");
	else output("Oh it’s, like, sooo shiny! You must take such amazing care of it!");
	output("”</i> you muse aloud while looking at your reflection in her metal plates.");

	output("\n\nHer antenna rattle, and she plays with one of the long locks of copper. <i>“Why thank you, I take good care of it. I make sure to get an acid bath every other week and polish it every few days after. Makes it oh so shiny, like a mirror.”</i>");

	output("\n\nThe copper clad spinarran smiles, showing off her teeth again. <i>“While we can eat just about anything, our primary diet is rock and minerals. Metallic ore in particular is considered highly nutritious, and volcanic ore is, like, the best tasting thing ever. Though you probably don’t quite understand, I’m sure you have something that you really enjoy eating. To us the freshly formed rock and metal is amazingly delicious.”</i> She taps a finger on the plate of her forearm. <i>“We use the minerals to make our exoskeletons and keep our bodies running. Biologically speaking, we are quite a bit different from many other species. Heh, if we were more aggressive or feral, I suspect our race would be a scourge: physically strong, tough, quick to breed, eat resources many races use. If all we did was eat as much as we could and breed as much as we could, we could multiply uncontrollably and eat whole worlds...”</i> She lets that grim idea linger for a moment before grinning. <i>“But that’s not the case thankfully. It’s not just eating and fucking.”</i>");
	output("\n\nKirila coughs. <i>“But umm. I think we got a little off track.”</i>");
	output("\n\nYou nod your head. <i>“Just a little bit.”</i>");
	output("\n\n<i>“Anyway. So yeah, we eat rock and minerals. What we eat is reflected in our carapace.”</i> She points to herself. <i>“I like to eat copper, and thus I’m copper colored. My sister Koritha is a big silver drider; she eats a lot of different metals, most of them silvery. She maintains a very strict diet though due to her job.”</i>");
	output("\n\n<i>“You must be quite strong to carry all that weight around with you. Just the exoskeleton alone must weigh... what 36 kilos?”</i>");
	output("\n\nShe smiles and nods. <i>“Something like that. Spinarrans are quite physically strong, we must be to carry our carapace and smash and dig through rock. I’m fairly average now. In the past I was a soldier, and warriors are more formidable.”</i> Her voice is rich with pride. Her pride soon deflates, however. <i>“Despite that, rockworms are still a menace back home.”</i> Kirila explains before you can ask, <i>“Rockworms are a native species on Spinarra. They start off as worms about as large as a car, and can grow to be as large as a small apartment tower. Like us, they eat rock, but also spinarrans. We take great pains to keep track of the giant ones, but from time to time, small communities can just... disappear, swallowed up by them. Thankfully they are slow, and they don’t need to eat as often as us. We are just as happy to chow down on them as well. Young rockworm meat is quite tasty. A hot, thick slab of rockworm meat, crusted in rock salt and sand, with a freshly kilned clay bun, baked just enough so it’s still soft inside but crunchy on the outside, yum,”</i> Kirila finishes with a sigh. You’re pretty sure she’s drooling a little bit.");
	output("\n\nWell the way she put it, it did sound tasty.... Well maybe not the bun made of searing hot clay, but a big steak sounds good. The idea is whimsical enough to earn a chuckle.<i>“Well I’m not sure about the bun, but I wonder what rockworm tastes like.”</i>");
	output("\n\nKirila gives you a sidelong glance. <i>“Probably not at all like meat you’re used to. Your... uhh... what was it...cows? They don’t chow down on boulders and veins of metallic ore. Probably wouldn’t taste too good to you. It’d be too...”</i> She pauses, trying to decide how to describe rockworm meat to a non-spinarran. <i>“Mineraly?”</i> She shrugs. <i>“Not sure how else to describe it.”</i> The shopkeeper reaches down to her rocks and plucks one up before popping it into her mouth, then offers you one.");
	output("\n\nYou give her a flat look.");
	output("\n\nShe grins and chews her rock, cracking and popping and grinding it down before swallowing. <i>“Perhaps it would taste like really nice dirt.”</i>");
	output("\n\nWeird rock eating bugs.");
	output("\n\n<i>“Eating is very important for us actually, well, I mean, obviously it’s important, but aside from the standard reasons. Our teeth are constantly growing, and while they are like diamonds, chewing on rocks grinds them down to keep them under control. While a spinarran can live off just eating yummy m-jelly, it would be bad since their teeth would get huge or they would have to file em down manually.”</i>");
	output("\n\n<i>“I can’t imagine that would be very enjoyable. Grinding your teeth down.”</i> You shudder and grimace.");
	output("\n\nThe spinarran shrugs. <i>“Ehh, it’s fine I guess. It’s normal for us so it’s not really uncomfortable. Doing it manually is just boring I guess, like a human clipping their nails.”</i>");
	output("\n\n<i>“So what is m-jelly, some kind of nutrient paste?”</i>");
	output("\n\nThe spinarran looks at you for a moment before smiling. <i>“Yeah, something like that.”</i>");
	output("\n\n<i>“Something like that?”</i> That’s an odd response.");
	output("\n\n<i>“M-Jelly is basically a jelly that is made of suspended metallic grains and minerals. Our bodies store it as excess nutrients. It’s kind of like... milk from a Terran cow, or I guess more accurately a New Texan cowgirl, or maybe honey would be a closer example.”</i>");
	output("\n\nYou look at her, or more specifically, the rise of her chest. <i>“Is that sooo...”</i>");
	output("\n\nShe notice your looks. <i>“Well it’s not quite like that, but you’re sort of on the right track. Let’s just say that driders make it and some are even paid to maintain a steady diet and get milked for others to eat. It’s kind of neat-looking actually, like your average fruit jam but shiny and metallic in color, like liquid chrome in a lot of cases.”</i>");
	output("\n\nYou think about that for a few minutes, and decide it’s either gross or kind of kinky.");
	processTime(13);
	kirilaTalkMenu(kirilasDiet);
}

//Past work
public function kirilasPastWork():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("In a bout of curiosity, you wonder about the business here. How long has this spinarran been here? <i>“So how long have you been running this place?”</i>");
	output("\n\n<i>“Hmm?”</i> Kirila perks up and twitches her antennae. <i>“How long? Oh, well, five or so years now. Used to be in the military before I started this business.”</i>");
	output("\n\n<i>“The military, huh? What was that like?”</i> you ask, settling in for what could be a long story.");
	output("\n\nThe copper-skinned spinarran just shrugs. <i>“It’s probably just like any other military force out there, though spinarrans do make for some scary shock troops. Tall, strong, covered head to toe in hardened metal plates, and there are a lot of us. Then there is the military body armor and shields to boot. But we don’t like to fight on the surface, unless it’s night. Then it’s alright. So night strikes and digging tunnels behind enemy lines is what we excel at. I don’t think any spinarrans have ever fought in space before. Probably for the best. We don’t handle the sheer vast openness of space very well. You will never see a spinarran with claustrophobia, but plenty have agoraphobia. Some can’t even look out a window in space without getting totaly freaked out. We’re just not really made for it. I myself was a member of my legion’s 3rd sapper cohort. Now, in most militaries, sappers are engineers. They build stuff and break stuff. Spinarrans however, when we break stuff, we get in under you and fuck you up...”</i> Kirila sighs <i>“I’ll tell you one thing, we are dedicated. Peace is as prevalent as it seems, but military and civil protection are constantly performing training exercises to stay in top condition and ready for action. Most soldiers come from families that have a long tradition of service, all of them career soldiers.”</i>");
	output("\n\n<i>“For me, it was a lot of digging - <b>strategic</b> digging, using seismic scanners to map “enemy” encampments and then finding the best place to come on up. <b>Bam!</b> Flood in through the new beachhead in the enemy lines and attack from within, or <b>boom!</b> Collapse fortified positions or identified artillery. Well that’s against surface threats. If they got dug-in hardpoints, it’s even better, we just smash or melt our way inside and flood in through the basements. And before you ask, we can dig really fast, what do you think these extra limbs are for?”</i>");
	output("\n\n<i>“Right, well, have you ever seen real combat?”</i> you ask, curious about her service.");
	output("\n\n<i>“Yeah, once or twice. Some groups don’t think the peaceful arrangement that The Empress got with the other races is good. You know the usual species superiority types. They think spinarrans are better, higher forms of life. Sometimes they get a bit too rowdy... one time intelligence sniffed out that one of these groups had all gotten together and relocated to one our colonies. They were planning on breeding up an army. That was no good for sure. They were probably going to come back home and try to off The Empress and take over then pull some ‘manifest destiny’ stuff. That was one of the times I got into a real fight. Now the other time was a lot more interesting. World called Rakshasis. Nice place. All twilight, sand and mountains. All in all, not bad for my kind, even on the surface. Not too bright. Get hungry, and all you have to do is lean down and scoop up and handful of sand. Not very nutritious, but it gets the job done. It’s one of our few colonies. We don’t spread out much since we can make use of vastly more of a planet’s mass than non-lithophages can. Anyway, back to the story. This happened when it was a new place. Our settlements were still small. Tunnels were being dug around the clock to dig in as we do. The colony’s garrison was still on the way to the planet, so it had nothing but some local militia to stand up to the incoming attack”</i>");
	output("\n\nYou grimace at that. Either pirates or slavers, a new and still undefended colony was a golden opportunity for loot, equipment, or slaves.");
	output("\n\n<i>“We make for good heavy labour, can work in hazardous environments, and don’t really need to be fed, plus driders can have their fangs milked for their venom. It’s a potent and highly addictive aphrodisiac. We make for fairly valuable slaves,”</i> Kirila says as if sensing your train of thought.");
	output("\n\nShe shakes her head. <i>“It was naive of us to not send a full military detachment with the colony. They could have warded it from a raid, and the engineering cohorts could’ve helped dig in and set up the infrastructure.”</i> She shows a small smile. <i>“I didn’t think they expected us to get there as soon as we did. Our ships might not be nearly as fast as everyone else’s, but like the people that built them, they are hardy as hell, tanks every one of them, and we got plasma cannons. They also have these things that are technically supposed to be used to cut apart asteroids, but they also work on ships if you can get close enough. I do wish we would catch up with the more established races though. Imagine a ship with our armor and weapons carrying ausar shields and terran engines.”</i> She sighs wistfully.");
	output("\n\nThe copper-skinned alien waves her daydream away before returning to her story. <i>“We took their hits and got in close before pounding their ships with plasma lances and lasers. We made them fall back around to the dark side of the planet. Several ships in the flotilla gave a slow chase, some curved around to head them off. The rest of us, the transports, made their way down to the planet’s surface. Our colony was still small, only about a thousand spinarrans, but enough to get things started. The raiders, several hundred, were well armed. Our force was better armed: five hundred combat trained, armed soldiers and another hundred support personnel. Just a small army, barely even a cohort’s worth.”</i>");
	output("\n\n<i>“All colonies set up prefab structures to start. It’s easy even for us dark-dwellers to use them until we can get a proper space dug underground for a settlement. It was set up in a valley at the base of a huge mountain range - perfect terrain to build up and down inside the mountain. They had landed a craft just on the outskirts of town. Our transports buzzed the prefab town with the doors open, driders jumping out of the back doors, arachne repelling down cables. If you think Spinarrans are hardy already, then a warrior in full armor with shields is a monster. I saw a drider go leaping full speed and come down on a concrete wall. Both her pedipalps slammed into it and just plowed through the wall to crush the raider behind it.”</i>");
	output("\n\n<i>“We swarmed over the town. Every non-spinarran was either subdued or killed. There was a bit of a hostage crisis though. Some of the raiders took prisoners into the tunnels we were building. I guess they were desperate, going into those pitch black tunnels. They didn’t know that the militia had taken a bunch of the colonists into the caves. They took shots from behind, then the last of the free raiders in the town were dead. We had a few wounded. One drider got unlucky. A shot got through her visor and into her eye. It was a noble death. We heard that once the raiders lost contact from the ground attack, the ships above hauled ass away from the planet. The one that got crippled in the opening salvo was boarded, most of the pirates were arrested, and anyone that fought back was put down. We weren’t yet set up to handle them, so we sent them off with an escort up the chain of command; let them handle it.”</i>");
	output("\n\n<i>“Probably got sent off to some penal colony after that,”</i> you hazard a guess.");
	output("\n\n<i>“Yeah, it was either that or just kill all of them. I mean, we didn’t have the food to keep them locked up on planet. I mean no food at all. All we had were the huge tanks of M-Jelly to eat and, you know, all the rock everywhere.”</i>");
	processTime(15);
	pc.changeLust(-50);
	kirilaTalkMenu(kirilasPastWork);
}

//The rush
public function kirilaRushTalk():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("The spinarran behind the counter looks at you with curiosity. <i>“So how is the ‘verse treating ya? Been out to see any of the new systems and planets that just opened up?”</i>");
	output("\n\nYou nod your head and affirm your status as a brave, adventurous rusher. <i>“Yeah I’ve been out there, seen a lot of cool stuff, a lot of new alien races.”</i> Kirila leans in, resting her cheek in her palm, watching you closely and listening intently to your tales.");
	var story:int = 0;
	var choices:Array = new Array();
	//If been to mhen’ga: 
	if(flags["KIRILA_RUSH_STORY"] != 1 && flags["MET_FLAHNE"] != undefined) choices.push(1);
	//If PC has been to tarkus:
	if(flags["KIRILA_RUSH_STORY"] != 2 && flags["UNLOCKED_JUNKYARD_PLANET"] != undefined && flags["UNLOCKED_JUNKYARD_PLANET"] >= 2) choices.push(2);
	//Myrellion:
	if(flags["PLANET_3_UNLOCKED"] != undefined)
	{
		if(flags["KIRILA_RUSH_STORY"] != 4 && (flags["KQ2_MYRELLION_STATE"] == 1 || flags["KQ2_MYRELLION_STATE"] == 2)) choices.push(4);
		else if(flags["KIRILA_RUSH_STORY"] != 3) choices.push(3);
	}

	//Failsafe Mhenga story. Fuck ya'll.
	if(choices.length == 0) choices.push(1);
	story = choices[rand(choices.length)];

	//If been to mhen’ga: 
	if(story == 1) 
	{
		output("\n\n<i>“On one planet I encountered the zil, this whole primitive race of aliens that are a lot like Terran bees. They even buzz and make all this sweet tasting honey. There was also the vanae, this all female-looking hunter race with all these wiggling tentacles around their waists.”</i> You wiggle your fingers emphasis, and the spinarran smiles.");
		output("\n\n<i>“My my, sounds exciting, it’s a shame they are so primitive though. It will be so long before they are ready to join everyone else, I may never get too see them. Oh, maybe I can try and get a ship to take me there someday, like a vacation. I would love to see those zil. Oh! I bet those vanae give great hugs.”</i>");
		output("\n\nYou grin. Mhen’ga isn’t the best vacation spot, but maybe in a few years something would be possible. Then again, not many things could possibly bring down one of these spinarrans.");
	}
	//If PC has been to tarkus:
	else if(story == 2)
	{
		output("\n\n<i>“There was this one place, Tarkus. It was a planet covered in junk, like, fields of broken tech and rusted out ships. There was even this old old Terran colony ship - one of those slow boats that were launched before the Ausar hooked the galaxy up with their warp gate technology. There were a bunch of races in that planet, though I don’t think your people would like it too much,”</i> you say as you look over Kirila’s metal exoskeletons.");
		output("\n\n<i>“Oh? Why’s that?”</i> the copper clad spinarran asks, giving you a curious look.");
		output("\n\n<i>“Well, one of the races there, the sydians. They are... well, they’re a lot like you actually: buggy, exoskeleton covering their whole body. They even have a metallic diet like your people,”</i> you explain to her, just about to get to the part she won’t like. <i>“This is going to be a bit umm... horrific, I suppose is the word. You guys are lithophages, you eat rock and minerals, the sidians however are ferrovores, they corrode and eat refined metal. You spinarrans are kind of made of it; probably a place you wouldn’t like to go to.”</i>");
		output("\n\nKirila grimaces and shudders at what you say, obviously disturbed by this information. <i>“Oh... Well, I can see why I would not like that place. I can’t even... Eat us alive...”</i> She shudders again.");
		output("\n\n<i>“But not everything there is like that, the raskvel that live there are pretty cute little guys, real short and excitable. They love to fix things; I’m pretty sure they get off on fixing machines. There are also all these silvery nano-goos around. They are very amorous but not actually threatening.”</i>");
		output("\n\nStill reeling from the talk of sydians she nods. <i>“Well, it’s good to know not everything there is horrific. Those sydians are going to have some problems with spinarrans if they get out - probably wouldn’t be allowed on any spinarran settlement or world.”</i>");
		output("\n\nYou can kind of understand that. You wouldn’t want an alien that would eat your skin around you either.");
	}
	//Myrellion:
	//(If myrellion is not nuked)(after the third PC visit)
	else if(story == 3)
	{
		output("\n\nKirila looks particularly perky, as if she got some good news.");
		output("\n\nYou lean on the counter and ask what’s up. Why does she looks so pleased?");
		output("\n\nShe claps her chitinous hands together and beams a pearly grin at you. <i>“I was browsing the news on the planet rush and there was a report on a place called Myrellion. A new planet in the rush that’s full of insect-like aliens, and I heard a bunch of them like to live underground too. It would be nice to get some fellow dark-dwellers to talk to, relate ya know.”</i> She quivers in seeming anticipation. <i>“Oh, I hope things go well with them. I want to have these myr and nyrea around.”</i>");
	}
	//(If myrellion gets nuked)(after the third PC visit)
	else if(story == 4)
	{
		output("\n\nKirila looks sad, her copper plated face is set in a perpetual pout of disappointment. Her arms are crossed and she sighs before looking up at you. <i>“Oh hello there, what can I do for you today?”</i>");
		output("\n\nYou give her a look. <i>“What’s up with you, you look awfully unhappy.”</i>");
		output("\n\nShe sighs again. <i>“I was checking the news and there was a report on a planet in the rush, Myrellion.”</i>");
		output("\n\nYou can see where this is going.");
		output("\n\n<i>“A new planet in the rush that’s... was full of insectoid aliens, ones that liked to live underground too. Apparently they have been pretty warlike and resorted to nuclear weapons, the UGC blew them all back into the Stone Age with orbital weapons.”</i> She gets a sour face again and clenches a hand on the counter, her claws peeling thin ribbons of metal off the top. <i>“It would have been so nice to get some other aliens that like the darkness and living underground. But I mean, was blowing them up the thing to do? I bet the empress is real mad. She would have pushed for occupation by spinarran legions, let us get down there and choke hold em. We would have been perfect for it. Literally bred by nature to fight underground. Maybe if a race more like them was talking them down, maybe they would have listened. It’s all just such a waste. Maybe my people can get the green light on some aid for them. Help them get back on their feet.”</i>");
		output("\n\nShe looks at her counter and hisses in displeasure. <i>“Aww damnit, I fucked up my countertop.”</i>");
	}
	//(For both)
	if(story == 3 || story == 4)
	{
		output("\n\nThe copper spinarran sighs and puts her chin in her hand. <i>“No offence, but there is an overwhelming number of aliens that like the surface and a scant few that like to live in the underground.”</i>");
		output("\n\nYou think about it for a moment, and you have to agree. It must be a bit lonely for spinarrans, being so adapted to an environment that would be uncomfortable to most others. Your eyes flick to the goggles she wears over their eyes. It would be hard to have to wear protective equipment everywhere you go just to keep yourself from going blind. <i>“Well here’s hoping that something can be made of this.”</i>");
		output("\n\nKirila smiles. <i>“Thank you, I hope so too.”</i>");
	}
	flags["KIRILA_RUSH_STORY"] = story;
	processTime(5);
	clearMenu();
	kirilaTalkMenu(kirilaRushTalk);
}

//Shop
public function kirilaShop(choice:Number = 0):void
{
	clearOutput();
	//(menu button)
	shopkeep = chars["KIRILA"];
	if(choice == 0)
	{
		
		shopkeep.keeperBuy = "<i>“Steel please,”</i> you say as you look at the racks of various weapons and armor on display.\n\n<i>“Alrighty, one minute!”</i> she says before ducking down under the counter. Out of curiosity, you lean over, look down and catch sight of a pair of round, mirror-polished asscheeks as the shopkeep changes clothes. You cover your mouth at her sudden desire to strip; does she do this every time? Not that you’re complaining. The alien woman has a very nice body, looking fit with wide hips and a round butt. You really get to appreciate how polished her exoskeleton is. Every plate is like a copper mirror.\n\nAfter a moment, the copper spinarran appears again, this time wearing a coat made of synth-leather, ballistic padding, and tightly woven silvery mesh. She takes a moment to smooth out her new outfit before grinning and showing off rows of sharp pearlescent teeth. <i>“Please, take a look around and let me know if you want to see something in particular. Much of it is registered military surplus.”</i>\n";
		//set inventory here
		shopkeep.inventory = new Array();
		shopkeep.inventory.push(new PlasmaBore());
		shopkeep.inventory.push(new SunFire());
		shopkeep.inventory.push(new BlackLight());
		shopkeep.inventory.push(new ThermalScalpel());
		shopkeep.inventory.push(new MonofilamentSaber());
		shopkeep.inventory.push(new PredatorTalons());
	}
	else if(choice == 1)
	{
		shopkeep.keeperBuy = "You gesture to the armor on display and ask about it. The spinarran behind the counter nods her head and fingers her outfit again.\n\n<i>“Ahh, alright. I hope you like what we have. All of it is of the highest quality I assure you. My clutchmate makes all the armor herself from her own weave. I guarantee that it will offer very good protection, though it won’t help against the cold outside.”</i>\n";
		shopkeep.inventory = new Array();
		shopkeep.inventory.push(new WeavemailShirt());
		shopkeep.inventory.push(new WeavemailCoat());
		shopkeep.inventory.push(new WeavemailDress());
	}
	else if(choice == 2)
	{
		shopkeep.keeperBuy = "<i>“Silk please,”</i> you say as you look at the racks of clothing on display.\n\n<i>“Alrighty, one minute!”</i> she says before ducking down under the counter. Out of curiosity, you lean over, look down, and catch sight of a pair of round, mirror-polished asscheeks as the shopkeep changes clothes. You cover your mouth at her sudden desire to strip. Does she do this every time? Not that you’re complaining, the alien woman has a very nice body, fit with wide hips and round butt. You really get to see how polished her exoskeleton is, every plate is like a copper mirror.\n\nAfter a moment the copper spinarran appears again, this time wearing a frilly gothic dress. The girly outfit is covered in lace, frills, and looks to be made of silk or satin. She takes a moment to smooth out her new outfit before grinning and showing off rows of sharp pearlescent teeth. <i>“Please, take a look around and let me know if you want to see something in particular.”</i>\n";
		shopkeep.inventory = new Array();
		shopkeep.inventory.push(new ClassySuit());
		shopkeep.inventory.push(new SilkDress());
		shopkeep.inventory.push(new MaidUniform());
		shopkeep.inventory.push(new ThermalBodysuit());
		shopkeep.inventory.push(new WinterGear());
	}
	buyItem();
}

public function itemDemos():void
{
	clearOutput();
	showKirila();
	output("Kirila would be happy to tell you more about her wares. Which items do you want to know more about?");
	clearMenu();
	addButton(0,"“Steel”",kirilaSteelItemDemos,undefined,"“Steel”","Ask Kirila to demo her weaponry.");
	addButton(1,"Armor",kirilaArmorItemDemos,undefined,"Armor","Ask Kirila to demo her armors.");
	addButton(2,"Silk",kirilaSilkItemDemos,undefined,"Silk","Ask Kirila to demo her clothing.");
	addButton(14,"Back",approachKirila,true);
}

public function kirilaSteelItemDemos():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("<i>“Steel please,”</i> you say as you look at the racks of various weapons and armor on display.\n\n<i>“Alrighty, one minute!”</i> she says before ducking down under the counter. Out of curiosity, you lean over, look down and catch sight of a pair of round, mirror-polished asscheeks as the shopkeep changes clothes. You cover your mouth at her sudden desire to strip; does she do this every time? Not that you’re complaining. The alien woman has a very nice body, looking fit with wide hips and a round butt. You really get to appreciate how polished her exoskeleton is. Every plate is like a copper mirror.\n\nAfter a moment, the copper spinarran appears again, this time wearing a coat made of synth-leather, ballistic padding, and tightly woven silvery mesh. She takes a moment to smooth out her new outfit before grinning and showing off rows of sharp pearlescent teeth. <i>“Please, take a look around and let me know if you want to see something in particular. Much of it is registered military surplus.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"PlasmaBore",plasmaBoreDemo,undefined,"Plasma Bore","Learn more about this item.");
	addButton(1,"SunFire",sunfireDemo,undefined,"SunFire Rifle","Learn more about this item.");
	addButton(2,"B.Light",blacklightDemo,undefined,"“Black Light” Ultraviolet Laser Rifle","Learn more about this item.");
	addButton(3,"T.Scalpel",thermalScalpelDemo,undefined,"Thermal Scalpel","Learn more about this item.");
	addButton(4,"M.Saber",monofilamentDemo,undefined,"Monofilament Saber","Learn more about this item.")
	addButton(5,"P.Talons",predatorTalonsDemo,undefined,"Predator Talons","Learn more about this item.");
	addButton(14,"Back",itemDemos);
}

public function kirilaArmorItemDemos():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You gesture to the armor on display and ask about it. The spinarran behind the counter nods her head and fingers her outfit again.\n\n<i>“Ahh, alright. I hope you like what we have. All of it is of the highest quality I assure you. My clutchmate makes all the armor herself from her own weave. I guarantee that it will offer very good protection, though it won’t help against the cold outside.”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"WM Shirt",WMShirtDemo,undefined,"Weavemail Shirt","Learn more about this item.");
	addButton(1,"WM Coat",WMCoatDemo,undefined,"Weavemail Coat","Learn more about this item.");
	addButton(2,"WM Dress",WMDressDemo,undefined,"Weavemail Dress","Learn more about this item.");
	addButton(14,"Back",itemDemos);
}

public function kirilaSilkItemDemos():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("<i>“Silk please,”</i> you say as you look at the racks of clothing on display.\n\n<i>“Alrighty, one minute!”</i> she says before ducking down under the counter. Out of curiosity, you lean over, look down, and catch sight of a pair of round, mirror-polished asscheeks as the shopkeep changes clothes. You cover your mouth at her sudden desire to strip. Does she do this every time? Not that you’re complaining, the alien woman has a very nice body, fit with wide hips and round butt. You really get to see how polished her exoskeleton is, every plate is like a copper mirror.\n\nAfter a moment the copper spinarran appears again, this time wearing a frilly gothic dress. The girly outfit is covered in lace, frills, and looks to be made of silk or satin. She takes a moment to smooth out her new outfit before grinning and showing off rows of sharp pearlescent teeth. <i>“Please, take a look around and let me know if you want to see something in particular.”</i>");

	clearMenu();
	addButton(0,"C.Suit",classySuitDemo,undefined,"Classy Suit","Learn more about this item.");
	addButton(1,"S.Dress",silkDressDemo,undefined,"Silk Dress","Learn more about this item.");
	addButton(2,"Maid U.",maidUniformDemo,undefined,"Maid Outfit","Learn more about this item.");
	addButton(3,"T.Bodysuit",thermalBodysuitDemo,undefined,"Thermal Bodysuit","Learn more about this item.");
	addButton(4,"Winter G.",winterGearDemo,undefined,"Winter Gear","Learn more about this item.");
	addButton(14,"Back",itemDemos);
}


//Weavemail Shirt
public function WMShirtDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You look through the racks of protective clothing and pull out one of the thick shirts that’s a little long in both the sleeves and overall length than your basic shirt, but the material is clearly what makes this thick garment special. The armor comes in a few different styles, and you pull one out before bringing it over to the counter to ask about it.");
	output("\n\n<i>“Ahh, alright. This is our basic weavemail shirt: decent protection, light enough to wear under your clothes if you want to be discrete. Spinarran weavemail resists solid projectiles very well and distributes heat quite efficiently. While normal ballistic jackets or armor are good against bullets but not so good against being stabbed, weavemail will stop most blades as well. We make it in a few different styles here depending on how obvious you want to be about the armor.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaArmorItemDemos);
}

public function WMCoatDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You look through the racks of protective clothing and pull out one of the long duster-like trench coats. Covered in supple synth-leather on the outside, you flip up the coat’s mantle to find a fine woven mesh of metal mail. You can feel the many layers of ballistic fiber and spinarran mail under the leather of the coat. The outfit is long, reaching down a little ways past your knees, it would provide a wide area of protection from your body. The armor comes in a few different styles, some showing off the protective spinarran mail more than the others, and you pull one out before bringing it over to the counter to ask about it.");
	output("\n\nThe Spinarran smiles at the sight of the armor, her jagged pearlescent teeth showing. <i>“Oooo... a good choice, one of my favorites.”</i> She plucks a fingertip against her own outfit. <i>“Weavemail coats like these are as close to military grade protection as you can get. Made by a close personal friend of mine. It’ll stop bullets just as well as blades, heat based weapons such as lasers and plasma will be damped by the many layers and by the heat-spreading properties of the weave. We make it in a few different styles here depending on how obvious you want to be about the armor. And for an additional charge, we can install secondary shield emitters for extra protection.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaArmorItemDemos);
}

public function WMDressDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You look through the racks of protective clothing and pull out one of the flowing velvet dresses with a high collar and a mantle of silk around the shoulders. It’s covered in soft velvet on the outside. When you inspect the dress, you can feel the many layers of ballistic fiber and spinarran mail under the fine outer material. The outfit is long, reaching down a little ways past your knees. It would provide a wide area of protection for your body. The armor comes in a few different styles, some with lace, some with satin, and others showing off the protective spinarran mail more than the others, and you pull one out before bringing it over to the counter to ask about it.");
	output("\n\nThe spinarran smiles and claps her hands at the sight of the armor, her jagged pearlescent teeth showing. <i>“Oooo... A good choice. My sister absolutely loves making these. While they don’t show off a lot of skin, they are elegantly styled with satin, lace, and shiny mail. They will provide near military grade protection for you as well. It’s a bit more bulky than normal dresses, but if you’re looking to look good and be able to stop gunfire, you can’t really beat it.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaArmorItemDemos);
}

//Silk Dress
public function silkDressDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You look over several of the silky garments, your eyes falling onto a long dress. It’s simple but elegant, the kind of dress you’d see on wealthy debutantes at a formal party. That said, it looks like it wouldn’t restrict your movement that much, so wearing it casually wouldn’t be problematic.");
	output("\n\n<i>“Ah, good eye,”</i> the shopkeeper says. <i>“That dress is made from various alien silks. Well, alien to us.”</i> She gives a small laugh. <i>“I suppose to you it’s more conventional. I assume you’ve heard of chameleon silk? Our dresses weave that and traditional silks to create these beauties. Waterproof with completely customizable colors. It’s the whole package.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSilkItemDemos);
}

//Classy Suit
public function classySuitDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Hanging on many of the racks along the walls are several classic suits popular among the rich and powerful of Earth. Each suit is crisp and clean, and consists of a jacket, button-up shirt, tie, and trousers. Despite fashion changing every other week or so, the classic suit never goes out of style it seems.");
	output("\n\nThe shopkeeper’s eyes fall on you and she smiles, <i>“Oh yes, those are popular among the businessmen. Earth seems to have a way of creating timeless fashion. The tailor assures us that they are completely waterproof, stain proof, and will adjust to fit any wearer. Something about each being a “bespoke” suit.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSilkItemDemos);
}

//Maid Uniform
public function maidUniformDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Hanging from a rack in a tucked away corner of the store are several black and white maid outfits. Frills and lace adorn the various hems, and it feels silky smooth to the touch. The frilled dress would barely drop past the top of the thigh on its wearer. You’re certain it wouldn’t hide a thing if its owner bent over. Maybe that’s the point. Combined with the thigh-high stockings, the entire thing just oozes feminine sensuality.");
	output("\n\n<i>“Oh.”</i> The shopkeeper sees your interest and drops her head slightly. If she could blush, you think she’d be a bright crimson. <i>“I thought I’d only ordered one for... personal reasons. Turns out we got a full shipment. So if you’d like to take one off our hands and save me the embarrassment, I would greatly appreciate it.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSilkItemDemos);
}

//Thermal Bodysuit
public function thermalBodysuitDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Sandwiched between the fluffy parkas and the more traditional clothing is an odd bodysuit. You hold it up, noting how relatively thin it is. It looks like it would cling to your body fairly tightly. You poke at the material. Seems like it’s fairly stretchy, so it wouldn’t restrict your movements very much. In fact, it’d probably feel more like a second skin to you than anything. Several vital areas, including the spinal area and knees have extra padding. It’s not quite armor, but tougher plated sections that are still fairly flexible in their own right.");
	output("\n\n<i>“Ah yeah, the thermal bodysuit,”</i> says the spinarran shopkeeper. <i>“It’s quite comfortable, or so I’m told. Reinforced with an insulating layer of aerogel, you won’t find a better way to beat the frozen wastes. In fact, it’ll even protect you from extreme heat. The outer material is fire retardant, and the aerogel ensures that you’ll remain unaffected by the heat.”</i> she laughs jokingly. <i>“Oh, I do have to tell you that despite the insulating power of the bodysuit, you should still get a heat belt system, just to make sure you will be all right. Although, you might be alright as well if you combine the bodysuit with the winter gear we have in stock.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSilkItemDemos);
}

//Winter Gear
public function winterGearDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Your eyes wander over to several displays of wintery gear. The store seems to have a majority of its space dedicated to these outfits, and it’s no surprise why. Cold weather can be the death of most species. The outfit consists of a large parka jacket with hood, full length trousers, and large boots. Surprisingly, the inner lining of each consists of a fine, ultra-soft downy fur. It almost feels as though your hand is gliding over a cloud as you stroke the insides of the jacket. A warm, fuzzy cloud.");
	output("\n\n<i>“Yes, yes,”</i> says the shopkeeper. <i>“Our standard winter gear. Can’t get by without it on Uveto. The jacket, pants, and boots are each fitted with insulating fibers, synthetic fur, and heating pads that react to your core body temperature. They’ll help you survive a jaunt into the frigid wastes, though I’m required by law to say that it’s no substitute for a complete survival package if you intend to remain outside for extended periods.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSilkItemDemos);
}


//Thermal Scalpel
public function thermalScalpelDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You point at one the small arms under the front display counter: a straight, sleek looking gun almost as long as a human’s forearm with a long rectangular barrel on a rotating joint. On either side of the barrel are three targeting lasers. <i>“That is a respectable weapon right there. The V36 thermal scalpel is the sidearm of every spinarran soldier. It’s durable, reliable, and easy to reload. Its plasma blade can slice clean through an arm or leg as easy as it can shear through rock. A body shot can cook your insides, and it’s tough enough that you can club someone over the head or punch someone in the face with it. Everyone loves these, and they double as small mining tools as well, slicing rocks into pieces.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSteelItemDemos);
}

public function plasmaBoreDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Looking at the heavier weapons on the walls, you point to one of several heavy, two handed weapons. A big, mean looking thing, it’s clearly made to be used with two hands. You bet it packs one hell of a punch. <i>“Mmmm... a beauty.”</i> The girl behind the counter sighs as she pulls one down from the case with ease and lays the heavy weapon down on the counter for you. <i>“This is a SS-M XIII plasma bore. It is a beautiful piece of spinarran weaponry. The plasma bore is the workhorse of spinarran weapons tech, packs a hell of a punch at short and medium ranges, melts rock and metal, vaporizes flesh and bone. Tough, reliable, not too heavy, well for spinarrans or lethians anyway. Might be a bit heavy for a human or an ausar. The power pack for it is good for about 80 shots, not as many as a modern laser rifle, but like I said, hell of a punch, just, you know, keep your hands away from the emitters.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSteelItemDemos);
}

//Sunfire
public function sunfireDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Looking at the heavier weapons on the walls, you point to one of several heavy, two handed weapons. A big, mean looking thing, with two handles curved plates, what looks like a rotatory barrel. <i>“Mmmm... a beauty.”</i> The girl behind the counter sighs as she pulls one down from the case with ease and lays the heavy weapon down on the counter for you. <i>“This is a plasma bore sunfire variant. It is a beautiful piece of spinarran weaponry. While each shot doesn’t hit as hard as the standard version, the rotating barrel and expanded fuelcell means one of the shots is bound to land. What’s more all that heat might set your foes ablaze! Tough, reliable, not too heavy, well for spinarrans or lethians anyway. Might be a bit heavy for a human or an ausar.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSteelItemDemos);
}

/*UNUSED. ALREADY GOT 3 RANGED ENERGY WEAPONS
output("\n\nMagma Lance");

output("\n\nOne of the long barreled weapons catches your eye, this one is more like a traditional rifle. Pointing it out to the shopkeeper, she pulls it down for you and lays it on the counter. <i>“This is probably more familiar to you, more like a marksman’s rifle. Spinarrans don’t use these kinds of weapons too often. Growing up in caves and winding tunnels doesn’t lend too well to long ranged combat, but on planetary surfaces, it’s a deadly weapon. Fires a dense, spinning lance of plasma that will sear a hole clean through an unprotected body. Got a good set of sights in the scope, X5, X10, and X15 levels of magnification. Laser range finder and environment sensors help to mitigate projectile drop and local interference. It’s a very accurate bit of equipment, if a bit unorthodox, well, for spinarrans anyway.”</i>");
output("\n\nDamage: 20 Burning 3 electrical");
output("\n\nDamage type: Plasma");
output("\n\nAccuracy: 5");
output("\n\nCrit bonus?");
output("\n\ncost: 15500");
output("\n\nYou purchase a Magma Lance for 15500 credits");

output("\n\nTooltip: Magma Lance. An unorthodox long-barreled rifle that fires a spear of plasma to burn clean through a target at long range. Only the surface spinarran snipers use one of these long ranged weapons.");
*/

/* UNUSED. PARTICLE BEAMS ARENT REALLY KINETIC DAMAGE, AND ID LIKE TO SAVE FOR "PROTOTYPE" TIER WEAPS
Repurposed planet cracker
output("\n\nA piece of equipment that looks more like it belongs in an industrial mining ship then a weapons shop piques your interest. <i>“What about that thing?”</i> You ask as you point it out to the spinarran.");

output("\n\nKirila smiles and pulls it down for you. <i>“Well this is a bit different, it’s not really a gun, but it can definitely be used as one. This is actually a piece of spinarran mining equipment. First you charge it up. Shapedmagnetic fields spin heavy particles in this chamber here, and spits this hyper-fast bolt of energized particles out when you release again. It’s garbage at long range, but if you’re up close this thing can tear someone up or shatter small boulders. It’s also as heavy as a Kui-tan’s ballsack, so you can really bludgeon someone with it.”</i>");
output("\n\nDamage: 23 Kinetic 3 electrical");
output("\n\nDamage type: Crushing, Energy weapon");
output("\n\nAccuracy: 0");
output("\n\ncost: 15500");
output("\n\nYou purchase a Repurposed planet cracker for 15500 credits");

output("\n\nTooltip: Repurposed planet cracker. Not an actual gun but a piece of industrial mining equipment. It can be charged and fired to release a bolt of hyper kinetic particles that can blast large rocks apart.");*/

public function blacklightDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Among the heavy spinarran plasma weapons is a rifle of matte black and silver metal plates and highlights. You point out the sleek, glossy weapon and ask to see it. Kirila nods and brings it down for you. <i>“Like the plasma bore, this is another mainstay of spinarran weapons tech - one of the first weapons made once we hooked up the UGC. As a change from our plasma weapons, this is a laser rifle. It’s sleek, light, accurate, and its ultraviolet beams packs a punch civilian weapons won’t. Even comes with a high tech pop up scope for making sure those shots hit!”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSteelItemDemos);
}

//Mono Filament HF Saber
public function monofilamentDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("You look down into the front display and admire the swords set out, every one of them looks pristine, gleaming silver in their case. <i>“Ahh, a fine eye you have there. Those are some nice sabers.”</i> She reaches under and pulls one out before laying it down. <i>“Now, no touching alright, these are pretty dangerous. These here are spinarran infantry sabers. My kind are used to and well adapted to close range combat, so every soldier gets a weapon for use in melee. They are made of densely compressed and highly refined alloys of titanium and tungsten with an internal skeleton of spinarran filament silk, very durable and keeps its edge well. To help with cutting, the very edge is lined with a mono filament wire that lets the blade slide through resistance. Very dangerous. And if that wasn’t enough, it has a built in vibrational core to make the blade vibrate at ultra high frequencies.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSteelItemDemos);
}

/*Monofilament already fills kinetic weapon
output("\n\nHigh mass maul");

output("\n\nLooking at the wall behind the counter, you look at a huge imposing maul hanging on the wall. A hammer? Talk about a weapon from a bygone age. <i>“How about that?”</i> you ask pointing at it.");

output("\n\nThe copper-skinned spinarran looks back at the maul and smiles before standing up and hefting the heavy hammer down. <i>“It may not look it, but this is a very effective weapon. It has never gone out of style, at least not for my people. Time just made a couple changes.”</i>");

output("\n\n<i>“Seem’s like something that should be an antique rather than a weapon.”</i>");

output("\n\n<i>“Well I guess to some it would be. Spinarrans are covered head to toe in metal, and it’s more deadly to crush than to cut. This brute is very heavy. The head is 20 pounds of titanium, compressed under a gravity field to make the head stronger. It has a small gravity generator in it too, making the swings pack about twice the punch it normally would. Devastatingly effective.”</i>");

output("\n\nTooltip: High mass maul. This hammer is heavy and a little unwieldy. Made of compressed titanium and equipped with a gravity field generator, this super sized hammer can be swung with brutally crushing force.");
output("\n\nDamage: 19 kinetic");
output("\n\nDamage type: Crushing");
output("\n\nAccuracy: 0");
output("\n\ncost: 15000");
output("\n\nYou have purchased a High mass maul for 15000 credits");*/

//Predator Talons
public function predatorTalonsDemo():void
{
	clearOutput();
	showKirila();
	author("Kinathis");
	output("Looking at the displays you look at a pair of techno gauntlets. <i>“What are those?”</i> you ask and point them out.");
	output("\n\nKirila pulls out out and shows it off. <i>“These are Predator Talons. You wear them on your arms like so.”</i> She slips on her hand and shows you it. <i>“See here and here? When you turn them on, a pair or magnetic fields contain a plane of shaped plasma that is fed from the emitters there. Got to be careful, the blades are very thin, very sharp and burn at about 20,000 degrees centigrade. Don’t worry though, a thermal containment field keeps the heat down to about a millimeter around the blades themselves, can’t have the user burning themselves to death! But seriously, be fuckin careful not to slice yourself in half or anything. We are not responsible for self injury.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",kirilaSteelItemDemos);
}

/* NOT UNLOCKED YET
output("\n\nYou gesture to the stand holding colorful bottles of pills and ask about them.");

output("\n\n<i>“Oh these are premium mineral supplements for spinarrans. They are mainly for helping to maintain a healthy carapace and body health. But they are also full of microbots for manipulating a person’s DNA. This kind here was made by Xenogen as a genemod for alien species that are interested in being more like spinarrans. They are a little expensive, since we are a rather different species from most others, so it was pretty hard to make. It does make some pretty fundamental changes to your body, so use at your own risk. If you are interested in buying them, let me know!”</i> she finishes in a rather chipper tone.");

output("\n\nEverything above this is more or less ready, for basic use, needs lots of editing and to have proper balancing on the weapons and armor tho.");

output("\n\nBelow this is extra stuff being worked on... very slowly :(");
*/

/*output("\n\nAddons");


output("\n\nnew talk scenes");
output("\n\nFirst contact (not done)");

output("\n\n<i>“So how did your people discover the greater galaxy?”</i> You ask, wondering just how these very different aliens came to join the UGC.");

output("\n\n<i>“Oh! Thats easy, I hear it was a kind of funny story actually. Our planet is huge with little surface water, and it’s all mountains, crags and canyons.");

output("\n\nRelationships");
output("\n\n(gotta go through at least 2 other talks before getting this)");

output("\n\n<i>“So... if you don’t mind me asking. Just how do your people get together? I mean, do they date, do they paint up their chitin and do dances? How does it work for you?”</i> You ask the shopkeeper with some real curiosity. You could probably read up on this yourself, but getting it from the real deal is nice, and maybe the question will pique her interest.");

output("\n\nHer antennae twitch. <i>“You want to know about that, well I guess I could answer. You could just read this kind of stuff up on the extranet... You might get a bunch of porn links though and it might not be what you’re after...”</i> they twitch again. <i>“Or maybe you are, I’m not going to judge.”</i>");

output("\n\nShe runs a hand over one of her thick metallic locks and seems to look at you, though you can’t see her eyes past the goggles. <i>“Well first, no, we don’t do dances... for mating anyway. Things have changed a lot since first contact. A long time ago driders use to hunt us arachne, lie in wait in a tunnel, then catch us in their webs, bind up our arms and legs before envenoming us.”</i> Kirila shivers. <i>“That is the biggest part that has stayed with us forever. You see, Driders have these special fangs that fold up onto the roof of their mouth and unfold when they are going to bite. The fangs are so thin and sharp that they just go right through tough spinarran skin.”</i> She pulls back the collar of her outfit to show one of the joints in the armored plates. <i>“See right under this plate here is a big vein and the fangs are curved so that if they bite right here the needles go right into the veins.”</i>");

output("\n\nYou quirk an eyebrow. <i>“Isn’t that painful?”</i>");

output("\n\nShe shakes her head sharply. <i>“Oh no no no, not at all.”</i> She pulls back, and her antennae twitch. You get the sense she should be blushing along with the body language. <i>“In fact it’s... It’s one of the most pleasurable things I’ve ever experienced.”</i>");

output("\n\n<i>“You’ve been bitten before?”</i> you ask. Judging by her reaction there must be something else going on about that venom. (if been to myrellion: Maybe it has similar traits to red myr venom)");

output("\n\n<i>“Yeah... Well... You know how youths like to experiment... Drider venom is a really strong narcotic drug, it gives you a really strong sense of euphoria and makes your sense of touch go crazy. It’s also crazy addictive... so it’s been used for millennia as part of our courting, drider finds an arachne they like, they would capture them, drug them and mate them. The first mating would last for hours with the arachne getting blitzed out of their minds and cumming their brains out the whole time. The experience would leave them dependant on their drider for protection, companionship, and of course more of that venom.”</i> Kirila licks her plump copper lips and looks away as if remembering something.");

output("\n\n<i>“Well, that sounds pretty rapey. Is it still like that for you guys?”</i> The way she describes it certainly makes seem rather aggressive and forced.");

output("\n\nShe waves a hand nonchalantly. <i>“It’s just how we evolved. What I said is centuries past though. Things now are a bit more... consenting. The concept of gentler courting, what would be considered dating, is still a bit new only about two hundred and fifty years old. Though if one wants to be more traditional the pair will capstone their relationship by venturing into the many thousands of tunnels and relive the ways of ages past in a heart pounding hunt ending in a drugged out fuckfest that lasts for hours and ends with a massively swollen, pregnant arachne.”</i> Kirila sighs wistfully and smiles. <i>“I like the idea of that myself. There is just something so exciting about getting hunted down by some bug stud of a drider, grabbed up and bound up to have your body claimed.”</i> She looks away and smiles that sharp pearly grin as if she is a little embarrassed. <i>“Hehe...S-sorry, I got a little excited there.”</i>");

output("\n\nYou laugh and wave it off. <i>“It’s fine, it’s fine, but please, tell me more of your people.”</i>");

output("\n\n<i>“Shall I sing you their song?”</i> Kirila asks as her gaze once more falls on you. You look at her, unsure if she is joking or not. <i>“A-anyway... Dating, that evolved in our society some centuries ago, before that it was all take the arachne you want, we were a pretty one sided race actually, driders held most of the power since they had the venom and were way bigger and stronger. I guess gradual social change just crawled along enough to make something happen. These days arachne will even find a drider they like and court them.”</i>");

output("\n\n<i>“Court them in hopes of getting addicted to their chosen driders narcotic venom?”</i> You ask wryly.");

output("\n\nShe gives you a sour look. <i>“Hey now, that’s just how we are. It’s now nature made us, and we have adapted to it just fine. And these days we have countermeasures against the venom, drugs to help keep you from getting addicted, drugs to help you get over your addiction. They are more for non spinarrans to be honest, UGC didn’t like that we were walking drug dispensers so a while ago xenogen worked with our people to develop some countermeasures.”</i>");

output("\n\n<i>“Alright alright, I’m sorry, I didn’t mean to upset you.”</i> You say with upturned hands. <i>“So... If you don’t mind my asking, are you seeing anyone?”</i>");

output("\n\nThe metallic alien looks at you with surprise on her face. <i>“Why, are you interested? You know interspecies relationships with my kind are rare. We don’t really venture out, incompatible species, we could hurt you a lot with our UV generation.”</i>");

output("\n\nYou hold up a hand to try and stop her rambling. <i>“I just asked if you’re seeing anyone.”</i>");

output("\n\nKirila looks at you for a beat before answering. <i>“Well... no, not right now.”</i>");

output("\n\n<i>“Well then, if I’m not too alien to you, perhaps you and I could get to know each other better.”</i>");

output("\n\nShe seems to think it over for a moment before shrugging. <i>“Well, I’m not against the idea. People do seem to be rather open about relationships these days. Sooo... why not?”</i>");





output("\n\nsexy time?");
output("\n\nflirt with and plow the lonely shopkeeper? Sibling comes to visit and have threeway? Shopkeeper is modded to have an ovipositor?");

output("\n\n(needs: NEEDs dick. dick 10+inches long and 3+thick, spinarrans are size queens cause big drider dicks. if you don’t like that, eat me.)");


output("\n\nYou lean against the counter and give the copper girl a smile. <i>“You know, that chitin of your’s, so shiny and well cared for. I just wish I could see every perfect glossy plate of it.”</i> You say boldly as you caress one of her warm metallic hands.");

output("\n\nKirila cocks her head and her glossy lips smirk at you. If she had eyebrows you bet they would even be arched. <i>“My my, how forward, refreshing to see from an alien. Some of you are quite closed off. Or maybe I’m just too used to those repressed corporate types”</i> She looks about the store and reaches under the counter to close the shutters on the front door before turning on an ‘out to lunch’ sign. <i>“I think I have a lunch break coming up. How about we continue this... conversation elsewhere?”</i> she asks before giving you a pearlescent smile and rising from her seat behind the counter.");
*/