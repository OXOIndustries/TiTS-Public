import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Items.Guns.HammerPistol;
import classes.Items.Guns.LaserPistol;
import classes.Items.Guns.MagnumPistol;
import classes.Items.Guns.TheShocker;
import classes.Items.Melee.Shortsword;
import classes.Items.Melee.Machette;
import classes.Items.Melee.Warhammer;
//Outside?
public function outsideCarlsShop():void {
	//output("\n\nThere sits a small, humble building that is relatively unassuming given the larger works around the colony. Its fairly squat in appearance with a pair of industrialized steam stacks poking out from the roof, giving off the odd puff of heat to prove that some form of industry is going inside. Given the gaudy, faux-neon sign upfront with the vague image of a pistol, you can only assume it’s a gunsmith’s - something reaffirmed by the name of the shop that barely fits within the sign: <i>Crazy Carl’s Crude Cylinder Collection Cache</i>.");
	output("\n\nTraffic on these hard-packed paths is light the whole way around the small town of Esbeth. No matter where you are, you usually don’t see more than a few people. Most of them appear to be townsfolk on the way to some errand or in the process of improving a ramshackle abode, but every now and again you see someone who is out hunting and prospecting like yourself, kitted out for a fight and looking at everything with sharp eyes. While the road continues on to the west and east, to the north you see one of the many pre-fabricated buildings in the colony, somewhat out of place among the shacks and more nondescript buildings. A pair of industrial stacks spewing out harmless wafts of steam denotes use, while the colorful and somewhat stretched sign up front declares: <i>Crazy Carl’s Crude Cylinder Collection Cache</i>. The crude neon outline of a handgun helps you fill in the blanks.");
}
public function carlsShopDescription():void {
	author("Magic Ted");
	userInterface.showBust("CARL");
	if(flags["MET_CARL"] == undefined)
	{
		output("You enter the store through the automatic sliding door, immediately shivering involuntarily at the feeling of the cool, comfortable air from inside washing over you in comparison to the warmer, muggier jungle outside. Not wanting to waste the controlled atmosphere you quickly hop inside as the commercial door slides shut behind you.");
		output("\n\nWhile it takes a moment for your eyes to adjust to the change in lighting, you are a little surprised at what you see. This isn’t exactly just a gunsmith or even just a weapons shop; it is some sort of convenience store, too! It has an inviting, commercial atmosphere with pale white tiling and bright lighting while the plain walls of the establishment are adorned with various model weapons, rifles especially, above the shelves. The store’s floor space is dominated by rows of simple shelves crammed full of goods. With a cursory glance, you glean that the store is stocked to be a survival or hunting-focused convenience store as a secondary given the array of things like simplistic foods, basic and archaic supplies like compasses, local maps, and so forth, as well as more advanced supplies such as full environmental suits, recharging equipment and replacement parts for instruments such as common scanners and the like. The sort of items that you might need to get by out on the frontier, tailored for explorers and adventurers like yourself.");
		output("\n\nAfter a short review of your inventory as you aimlessly meander down the aisles, you come to the realization that you don’t really need anything. None of your supplies are poorly stocked and your trusty codex makes up for most of the tools, so the ‘convenience’ of the store is lost unless you want to pick up a snack. On the flipside, however, this area of the store is just a secondary portion for its real advertised purpose.");
		output("\n\nDisengaging from the thick stacks of various knick-knacks you move to the back of the store where the cashier counter is manned by the owner of the store: ‘Crazy’ Carl. Or at least so you assume, based on the simple jerkin with his name tag attached to it. The man rests laid back in his comfortable-looking office chair, hands in his lap with a book reader tucked away off to the side while he gives you his full attention like the polite business man he seems to be. You’re not entirely sure how long he has been waiting at attention for you, but you don’t pay it any mind.");
		output("\n\nCarl is old. With the advances in medical science you can hardly venture a guess at his age, but you can still tell he is <i>old</i>. A fully bald human male with little tufts of white hair ringing his shiny dome and thicker tufts appearing on his chin in the form of a well-kempt beard. His skin is fairly clean outside of a few natural blemishes on his cheeks, the product of a modern age; no liver spots, discolorations or anything of the sort. Beyond all that he actually looks pretty fit, too, with thick arms and a stocky sort of appearance, especially with his slight lack of stature. Altogether he looks to be the pinnacle of health, even if he is an old coot. He’s all smiles as you approach the counter, bright blue eyes glittering. Evidently he’s the jovial sort.");
		output("\n\nWhat’s behind him practically sets your mental image of him in stone: not mere desks and paperwork like you’d expect from an office space, but instead raw works of industry. Large machines, certainly bigger than you, sprawl across the narrow space behind him. It’s set up so there is only room to settle in one spot, though that’s likely intentional, keeping it all accessible from that one position. Cramped, but efficient.");
	}
	else
	{
		output("You enter the pre-fabricated building once again, finding that nothing has really changed. You’re pleasantly distracted by the cool, air-conditioned atmosphere in contrast to the more muggy air outside. It would be more pleasant if it wasn't for the constant burning smell niggling at your senses. The array of aisles are stocked with just as much as last time, though just like every other time you don’t really need anything in the convenience section.");
		output("\n\nMilling past the goods absently you make your way to the back counter, where the old coot sits as always. Carl is pretty quick to glance up from his reader to give you a smile.");
	}
	addButton(0,"Carl",insideCarlsShop);
}


//Inside
public function insideCarlsShop():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	//Inside (First time)
	if(flags["MET_CARL"] == undefined)
	{
		flags["MET_CARL"] = 1;
		
		output("\"<i>Hey there, stranger. Whacha need? Nothin’ in your hands, I see; old eyes ain’t givin’ out just yet. Here for a gunshow?</i>\"");
		output("\n\nYou go to nod before realizing the bad joke, making you hesitate a moment.");
		output("\n\n\"<i>I’m joshin’ ya, " + pc.mf("boy","girl") + ". C’mon, hit me. Whacha need?</i>\"");
		processTime(3);
	}
	//Inside (Subsequent) 
	else
	{
		output("Carl sets the device to the side as he gives you his full attention.");
		output("\n\n<i>“Whacha need? Collection’s all here.”</i>");
		processTime(1);
	}
	//Options
	//* Chat
	//* Shop
	//* Leave (Just exits back into the street)
	clearMenu();
	addButton(0,"Chat",carlTalkMenu);
	addButton(1,"Shop",crazyCarlShop);
	addButton(2,"Sell",sellToCarl);
	addButton(14, "Leave", mainGameMenu);
}
//Chat
public function carlTalkMenu():void
{
	clearMenu();
	author("Magic Ted");
	userInterface.showBust("CARL");
	addButton(0,"Him",chatWithCrazyCarlAboutHim);
	addButton(1,"His Store",aboutCrazyCarlsStore);
	if(flags["CRAZY_CARL_DAD_TALK_UNLOCKED"] == 1) addButton(2,"Your Dad",aboutThePCsDad);
	if(flags["TALKED_ABOUT_ZK_RIFLE_WITH_CARL"] == 1 && flags["ROBOT_QUEST_COMPLETE"] != 2) addButton(3,"The Robot",aboutTheRobotFromCrazyCarl);
	addButton(4,"Flirt",flirtWithCarl);
	addButton(14,"Back",insideCarlsShop);

}
//About him
public function chatWithCrazyCarlAboutHim():void
{	
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You lean gently against the counter and put on a friendly face, not-so-subtly hinting that you’d like to get to know him a little before making a purchase. Especially one as expensive, and legally gridlocked, as a firearm!");
	output("\n\n\"<i>Eh? Alrigh’, I sympathize some. Lesse... well! Name’s Carl! Carl Jakovich.</i>\"");
	output("\n\nYou are disappointed that the nominal alliteration doesn’t continue, though he does.");
	output("\n\n\"<i>Hm. Been workin’ in this buisness since I was a brat. Mother did it and I just kinda helped. Goin’ with it in the end just made sense, ya know? Besides, I’d like to call myself pretty good at it. Made quite the little empire in my name, ya know!</i>\"");
	output("\n\nYou get a solid scoff out of him when you glance behind yourself into the simplistic stock, pointedly.");

	output("\n\n\"<i>Ha! Ya think this is my main place of business? Nah, I’m retired! Technically, anyway. This is more of a hobby then a real bit of work now. Only gonna be out here for a bit. Got a bit stir crazy and hey, lil cuz’ got married. Might as well step in and mind the store for a bit so she can have a lively time, eh? I’ll head back home when she’s done and see to a bit of civilization n’ life in the mean time. Everyone wins!</i>\"  There is a short little pause before he bashfully murmurs, \"<i>Well. Such as it is, anyway.</i>\"");
	output("\n\nThere is a chuckle from you in response. Still, you find yourself a bit curious; how’d he make his fortune? This sort of work pays pretty well, sure, but it’s not exactly consistent.");
	output("\n\n\"<i>Ah... kicked off way back when, prolly why you haven’t heard of me. Might not of born yet even, sprout! Way back when I was just a pretty proficient, prolific craftsman. All sorts of shooters, just not a lot of clients n’ fame to go ‘round. Then comes around a future-legend, buys up a massive load of my stock over the course of a few months and sets me off as a result. Tinkered with his stuff when he needed it, too, but mostly just was a shopkeep. Said who he got his prized guns from and my popularity shot up, heh. Had a place everywhere, pretty big deal. Started to die down ‘gain, though, and I got old enough to start wantin’ to liquidate and sell off my assets to retire. Now it’s just a few stores run by my family that’s in the business usin’ the name to get them by.</i>\"  His expression reeks of nostalgia as his mind wanders, shaking his head with a fat grin. \"<i>Ah, Victor Steele. Good lad, him, wonder how he’s doing...</i>\"");
	processTime(3);
	//*Unlocks about dad*
	flags["CRAZY_CARL_DAD_TALK_UNLOCKED"] = 1;
	carlTalkMenu();
	removeButton(0);
}

//About store
public function aboutCrazyCarlsStore():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("One of the more pressing questions you have is one of the first ones you had: <i>'Crazy Carl’s Crude Cylinder Collection Cache'</i>?");
	output("\n\nCarl immediately responds with a loud, jovial guffaw. \"<i>Ha! I’ll say, yeah! Quite the eye catcher, ain’t it? Sticks in yer head. The original when I was younger and a bit of a sprout was just ‘Carl’s Gunshow’, ya can think of how well that turned over.</i>\"");
	output("\n\nEh. That could work.");
	output("\n\n\"<i>Nawh, now this place... lil’ niece, not eight years old, was listening in when I was talking about the place. Told me she thought it was dumb, ought to name it somethin’ else. Gave her a few days to think of one’, just to keep her busy. Slams down that number and - ho boy! Didn’t even know they taught those words just yet, surprising lil’ tyke. Had a good laugh with it, stuck with my word and slapped it on. Good idea in the long run, got quite a bit more returning folks over it. Strangely, alliteration keeps better than a childish joke.</i>\"");
	//*If silly mode: That fourth wall is load bearing, you know.*
	if(silly) output("\n\nThat fourth wall is load bearing, you know.");

	output("\n\n\"<i>After you get famous you just can’t change it, either. Bit hurt the brat thought I was crazy, though. Ah well.</i>\"");
	output("\n\nSimple enough.");
	processTime(1);
	carlTalkMenu();
	removeButton(1);
}

//About Dad
public function aboutThePCsDad():void {
	//*Available after About Carl*
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You’re admittedly a little incredulous about one ‘small’ detail. Leaning forward, you make a show of awe.  \"<i>You knew Victor Steele?</i>\"  Not the greatest acting, but it was passable.");
	output("\n\n\"<i>Oh yeah, before he got famous even.</i>\"  The old man leans back in his chair, causing it to creak in complaint as the thick smile on his face grows wider. It looks like he’s reminiscing about matters, though his silent reprieve doesn’t last. \"<i>Bit of a weirdo back then, though. Wry thing, ran around willy-nilly and got into everyone’s business. Got arrested for wanderin’ to folks houses a few times, even. Anyway. Once the lad got going he actually kept comin’ back to my place. Said he liked the name. Only one that ‘stood out’. Decided to buy one of everythin’ for ‘collection’s sake’, then he actually did. Of course, back then my stock was a lot bigger than what you see out here. Heh... he always said where he got ‘em, too. Good business.</i>\"");
	output("\n\nCertainly sounds like dad.");
	processTime(1);
	carlTalkMenu();
	removeButton(2);
}

//About that robot
public function aboutTheRobotFromCrazyCarl():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	//*Unlocked from ZK rifle option*
	//First time
	if(flags["TALKED_WITH_CARL_ABOUT_HIS_ROBOT"] == undefined)
	{
		flags["TALKED_WITH_CARL_ABOUT_HIS_ROBOT"] = 1;
		output("You tap the counter to get Carl’s full attention, unnecessarily, before speaking. \"<i>You mentioned something about a robot?</i>\"");
		output("\n\n\"<i>Machina, but yeah. Things apparently been goin’ haywire around here, or at least they were a bit back. Ain’t too sure what’s the reason, but the powers that be are considerin’ it was some nefarious visitor hacking everything. Wasn’t the Zil or some astro event, anyway. Got the security systems all twitchy and set the various attendants on edge until we got someone in here to reset the lot of ‘em. No one got hurt, but I wasn’t the only one to lose something.</i>\"  The old man leans back in his seat with an audible creak, hand lazily scritchin at his long chin-whiskers. \"<i>Gotta say, the nurse-bot got pretty interesting. If a bit psychotic and clingy.”</i> He stifles a light little chuckle and you can only imagine the implications.");
		output("\n\nCan’t the local security help?");
		output("\n\n\"<i>Overworked, underpaid and terribly staffed. Plus they’re a bit busy right now. Can’t go rummaging through the jungle lookin’ for lost goods that are probably fried, anyway. No, I’m afraid it’s a personal problem or nothing once it leaves the grounds.</i>\"");
		output("\n\nHm. You’ll probably be going through the jungle here, actually.");
		output("\n\n\"<i>Eh? You?</i>\"  Carl pushes himself forward, arms pressing into the countertop as he looks you over with no small amount of scrutiny. He seems rather thorough about it, too, glancing over every cleft of your body, every pronounced bit of your " + pc.armor.longName + " and the nature of your weapons - you can’t help but get a little self-conscious. Even when he leans back, evidently done peering into your very soul, he doesn’t exactly look impressed. \"<i>Well, if you’re going out there I suppose I could give you a little purpose for it, but I’m not too sure I’d feel comfortable with ya runnin’ out against a bunch of tribals like the other would-bes that run through here.</i>\"");

		//Kind, mischevious:
		if(!pc.isAss()) output("\n\nYou hold your hands up and try to reassure the old man; you’re not the hottest shit this side of the galaxy, but you can manage.");
		else output("\n\nYou scoff defensively, reassuring the old coot that nothing on this planet could slow you down, let alone an out-of-control bot.");

		output("\n\n\"<i>Well, at least you’re a bit more ");
		if(!pc.isAss()) output("humble");
		else output("confident");
		output(". Alright.</i>\"  Carl speaks in a resigned manner as he leans forward again, tapping at his counter-console and bringing up the image of a robot - your target. It’s a fairly compact thing, probably no bigger than the average person’s torso, though all the spindly arms coming out of it for its various gadgets and functions give it a larger presence. Looks like it floats in the air, too, which will help it stand out some more in the middle of the jungle, bright steel-white aside. Though that’s only assuming it still works. \"<i>Here’s the forge machina. Nothin’ too special, all in all. Ran off into the jungle to ‘fix’ things. If it’s still runnin’ right, relatively speaking, it might come at you to make modifications, so watch yerself. Don’t throw yourself in danger just for me: if it comes at you, shoot it. Besides, I just need the tools on it. Anything extra is just that.</i>\"");

		output("\n\nYou nod. That actually ought to be pretty easy. You’ve had worse.");

		output("\n\nThe coot cocks a cheeky grin as he leans back once again, the chair giving off another pathetic, woeful whine from the shifting weight. \"<i>Ha, it’s pretty fast. If you do manage to get to it in one piece there’s a off-red button hidden away in the undercarriage. It’ll switch to a factory-default profile and send it hovering back to its home beacon. Which is here, of course. If not, you’ll have to carry it home in a sack. Good news is it weighs about as much as a bucket of water.</i>\"");
		output("\n\nHeh, you’re used to lugging around pocketfuls of use-impaired junk all the time as is!");
		if(silly) output(" Though that might be a bit too self-referencing.");
		output("\n\n<i>“Now, if you do it I’ll be able to work on the toys again. Might just have something for you, then.”</i>");
		output("\n\nOff to the jungle with you!");
		processTime(4);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//During
	else if(flags["ROBOT_QUEST_COMPLETE"] == undefined)
	{
		output("\"<i>Eh? Got any news on the bot?</i>\"");
		output("\n\nYou shake your head. Nothing thus far, sadly.");
		output("\n\n\"<i>Ah, well. I ain’t expecting much. Keep snoopin’ about if you run around in the ferns. I’ll have something for ya if you do, but I can’t give you anythin’ for trying. Don’t get stung by the locals, though.</i>\"");
		processTime(1);
		carlTalkMenu();
		removeButton(3);
	}
	//Completion
	else
	{
		output("\"<i>Ah, yes!</i>\"  Carl brightens the moment you bring the subject up, rolling his creaking chair back to tug something out from underneath the counter - the machina! Pretty beat up, mostly courtesy of you, but intact. If currently limp and inert, anyway. \"<i>Ya got it back in good shape! Workin’ shape, anyway. Just need for the manufacture to toss me with the diagnostic information and it’ll be floatin’ ‘round being a bother yet again. Ya did good, sprout! Gotta say I’m even a bit surprised.</i>\"");
		output("\n\nTempering your welling pride you");
		if(!pc.isAss()) output(" bashfully hold back your bravado");
		else output("smirk");
		output(" and simply ask if anything else needs to be done.");

		output("\n\n\"<i>Nawh, I’m good. But you deserve something for it. While the bot ain’t workin’ right, I can still make do with its tools, so I finished up that rifle you were spyin’ earlier.</i>\"  Carl reaches down and leaves the rag-doll of a robot back down under the desk, coming up with the stylishly purple weapon you pointed out not that long ago! He holds it out towards you so you can appraise it as he speaks, the gleam of light giving it an attractive shine. \"<i>The ZK rifle! Slug magazines and a rail thrower. Real beauty, this thing. Did some modifications to it here and there. Actions smoothed out and tapered down. See the input panel by the trigger? Fixed the wiring and gave it new lining, buttons are subtle to prevent anything catching on them and the spring needs direct force. The input for the bayonet was removed - never made - and instead more coolant coils were added around the barrel, all smoothed out to keep it balanced. Swapped out the old sight for a corrective pop out one - a reflexive. Still can land shots at range with it. Did as much as I could with the barrel, but the ZK’s inherent design flaw is that the mass rails warp with each shot. Inset in the barrel was dug in more, but short of absolutely redesigning the firearm as a whole there isn’t anything you can do for that.</i>\"");

		// SKIP DIS: *If non-mercenary: You nod dizzily, having difficulty parsing the wealth of information as he throws at you. Slowly you catch up with the rambling and are able to piece it together; he took a pretty good gun and made it a even more reliable gun.*
		output("\n\nFollowing along without missing a beat, you nod firmly in understanding. The ZK series was already known for being a solid go-to carbine and this fixes up some of the flaws. A less egregious action that won’t catch on anything, reinforcement prevents the vulnerable wiring from being affected by environmental circumstances or attacks and the poor accuracy has been improved by adding more coolant, making the rails take longer to heat up and warp. The weapon is still marked for short ranges, ");
		if(pc.rangedWeapon.baseDamage.getTotal() < 13) output("but you’re confident that you would have a much more dependable weapon.");
		else output("of course.");
		output("\n\n\"<i>And it’s yours. As a reward.”</i>");

		output("\n\nQuite the expensive reward!");
		output("\n\n\"<i>Nah, it’s fine. Legally speakin’ this place doesn’t even have the permit to sell it normally, so this is under the table. You’ve got somethin’ going on if you sallied forth into that mess and came out with this ‘ole bucket, I might as well enable ya and make sure you don’t come out like the bucket later on. Now, then, ‘fore I do...</i>\"");

		output("\n\nUh oh.");
		output("\n\n\"<i>Do you have a license for HC-5 class weapons and energy disposal, or a Klamer’s certification card or other U.G.C accepted Eighteen Ninety Weapons Treaty-accommodating titles?”</i>");

		//*If mercenary:
		if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nYou give a firm nod. <i>“Of course.</i>\"");
		//If tech-specialist:
		else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nYou can get one by the end of the day. Legally, of <i>course</i>.");
		//If smuggler:
		else output("\n\nYou hesitate a half-moment before nodding, lying with a silver tongue, \"<i>Absolutely.</i>\"");

		output("\n\n\"<i>Oh, good. Wouldn’t want this to get miss cousin in trouble with the sheriff, now. Here ya are.</i>\"");

		output("\n\nYou barely hide your eagerness as you reach forward, taking the mean piece of rifle in your hand. This is your gun. There are many like it, but this one is now yours.");
		//*Rifle get! Removes quest from chat menu.*
		flags["ROBOT_QUEST_COMPLETE"] = 2;
		processTime(4+rand(3));
		eventQueue[eventQueue.length] = lootZKRifle;
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Flirt
public function flirtWithCarl():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("Time for a little fun.");
	output("\n\nCasually you lean forward against the countertop, pressing your pelvis into it firmly. You jut your torso forward, shoving your [pc.chest] into the air confidentiality as you further loom over the counter. Already you’re practically across it and in Carl’s face - his somewhat amused, though unimpressed face. Er.");
	output("\n\n\"<i>Heh, look at you.</i>\"  He quips, that mirthful tone still in his voice. \"<i>Glad to know I still got it, but... " + pc.mf("I'm afraid the hubby wouldn't really approve.","I’m afraid you’re just not my type.") + " I’m a business man, anyway; work and pleasure are separate. So... scoot off my counter, sprout.</i>\"");
	output("\n\nThat backfired pretty badly, but at least Carl rejected you in good stride and amusement instead of being offended.");
	processTime(1);
	//*Remove Flirt from options*
	carlTalkMenu();
	removeButton(4);
}

//Shop
public function crazyCarlShop():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("\"<i>Well alrigh’ then, scamp! Let’s take a look what I got, here! Bit underwhelmin’ right now, gotta say, but I think you might find a few things.</i>\"  He taps a button on the side and the countertop suddenly lights up with a holo overlay display, functioning as a photographic store catalog of the various wares available. You notice that most of them are actually greyed out, as well as a majority of the catalog being pistols and other similarly small firearms which promps you to glance up to the gunsmith in confusion.");
	output("\n\nLuckily, he appears to be clairvoyant; \"<i>Haven’t had the demand to make much more, gettin’ bit too up in age to just make ‘em. ‘Fraid as it stands I don’t quite got anythin’ on me to do requests, either. Whacha see is what ya can get, nothin’ more. Sorry ‘bout that.</i>\"");
	output("\n\nCurious.");
	processTime(1);
	clearMenu();
	addItemButton(0, new HammerPistol(), hammerPistolBuyTalk);
	addItemButton(1, new MagnumPistol(), magnumPistolBuyTalk);
	addItemButton(2, new LaserPistol(), lasPistolBuyTalk);
	addItemButton(3, new TheShocker(), shockerBuyTalk);
	if(flags["TALKED_ABOUT_ZK_RIFLE_WITH_CARL"] == undefined) addItemButton(4, new ZKRifle(), zkRifleCarlTalk);
	else if(flags["ROBOT_QUEST_COMPLETE"] != 2) addDisabledButton(4, "ZK Rifle");
	addItemButton(5, new Warhammer(), warhammerBuyTalk);
	addItemButton(6, new Machette(), machetteBuyTalk);
	addItemButton(7, new Shortsword(), shortswordBuyTalk);
	
	addButton(14,"Back",insideCarlsShop); 
}

public function warhammerBuyTalk():void
{
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You tap a button and it expands, displaying view of a wicked looking warhammer. <i>\"I sell a pistol called the Hammer. This is an actual hammer. You could use to crack some nuts, maybe to smash open a hostile native if'n ya need. Not too pricey, and she's effective to boot.</i>\"");
	output("\n\nYou nod and consider.");
	processTime(1);
	output("\n\nDamage Rating: 12");
	output("\nAccuracy Bonus: -4");
	output("\nDamage Type: Piercing");
	clearMenu();
	if(pc.credits >= 550) addButton(0,"Buy",buyFromCarl,"warhammer");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}
public function machetteBuyTalk():void
{
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You tap a button and it expands, displaying view of a fairly standard curved blade. <i>\"The Machete? Ya figurin' on chopping yer way through yonder jungle then? She'll serve you well without costing too much. Probably handy for dealin' with some of them snakes too.</i>\"");
	output("\n\nYou nod.");
	processTime(1);
	output("\n\nDamage Rating: 8");
	output("\nDamage Type: Slashing");
	clearMenu();
	if(pc.credits >= 550) addButton(0,"Buy",buyFromCarl,"machette");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}
public function shortswordBuyTalk():void
{
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You tap a button and it expands, displaying view of a quick, deadly-looking sword. Carly interrupts, <i>\"That's a simple shortblade. Back before we figured out how to kill each other with guns, that was the way to do it. Good for stabbing and does lots of damage. Not sure what else you'd need in a weapon.</i>\"");
	output("\n\nYou nod.");
	processTime(1);
	
	output("\n\nDamage Rating: 7");
	output("\nAccuracy Bonus: 1");
	output("\nDamage Type: Piercing");

	clearMenu();
	if(pc.credits >= 550) addButton(0,"Buy",buyFromCarl,"shortsword");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}

//[Hammer Pistol]
public function hammerPistolBuyTalk():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You tap one of the buttons and it expands, taking up most of the display. Carl cuts you off before you can start reading off the appearing information, however; \"<i>Ah, the Hammer. Good all ‘round model, that one. Never really sits in stock for too long. Modified a bit, got a different trigger mechanism to stop it from accidentally firin’ all the time. Still need to have good trigger discipline, though, sprout.</i>\"");
	output("\n\nYou nod gently, looking back down to the information.");
	processTime(1);

	//*Codex-like information here. Plus price.*
	// This DOES work, but the formatting doesn't look too nice in the main text area. I could fiddle with the CSS for that TextField to make it look better...
	//output("\n\n" + new HammerPistol().compareTo(pc.rangedWeapon));
	
	output("\n\nDamage Rating: 9");
	output("\nDamage Type: Kinetic");
	//[Buy] [Back]
	clearMenu();
	if(pc.credits >= 2000) addButton(0,"Buy",buyFromCarl,"hammer pistol");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}

//[Magnum Pistol]
public function magnumPistolBuyTalk():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You tap one of the buttons and it expands, taking up a fair amount of the display. Before you can look over the appearing information, however, Carl pipes in, \"<i>Now here’s an ancient thing, no real surprise why it doesn’t move off too fast. Still one of the best of its type; big, powerful and simple. Got a bit of a kick, though, so aimin's a bit tricky. Careful with ‘er. Gonna make ya look like a cowpoke, too. Don’t go for the look.</i>\"");
	processTime(1);
	//All the cool spacers use revolvers, right?
	//*Codex-like information here.*
	output("\n\nAccuracy Bonus: -2");
	output("\nDamage Rating: 12");
	output("\nDamage Type: Kinetic");
	clearMenu();
	//[Buy] [Back]
	if(pc.credits >= 2000) addButton(0,"Buy",buyFromCarl,"magnum pistol");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}

//[Las branded affordable Laser Pistol]
public function lasPistolBuyTalk():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You notice that a few of the choices are actually the same weapon or at least extremely similar one. Curious, you give it a tap and the screen flickers with a image of the pistol, taking up the entire display. \"<i>Cha, those things... Crowd favorite among the kids without much sense. Keep a bunch ‘round just to satisfy people who want something flashy, just in case, but if you ask me, you're better off with a good ol' fashioned powder-banger. Can’t be too careful ‘round on the frontier, even if you’re pretty well off.</i>\"");
	output("\n\nYou nod. It’s good to keep your options open, at least, and the rest of the available weapons look to be ballistic, too. Not that slugthrowers are worse than lasers, just a little less practical.");
	processTime(1);
	//yo yo, info up in here.*
	output("\n\nAccuracy Bonus: 2")
	output("\nDamage Rating: 4");
	output("\nDamage Type: Laser");
	clearMenu();
	//[Buy] [Back]
	if(pc.credits >= 1050) addButton(0,"Buy",buyFromCarl,"laser pistol");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}

//[Las branded affordable Laser Pistol]
public function shockerBuyTalk():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You push a button to bring up an interestingly named weapon, looking something like a cross between a pistol and a tesla coil. \"<i>Ah, fuckin' shocker. They're really called 'shock pistols,' but I like to call this one 'the shocker' on account of how it damn near fried my-... You know what? Let's just forget about that story. Point is, it'll fry shields like they were made of lard. Packs a bigger punch than the laser pistol too, even if it costs a bunch more.</i>\"");
	processTime(1);
	output("\n\nAccuracy Bonus: 2")
	output("\nDamage Rating: 8");
	output("\nDamage Type: Electricity");
	//yo yo, info up in here.*
	clearMenu();
	//[Buy] [Back]
	if(pc.credits >= 2300) addButton(0,"Buy",buyFromCarl,"shock pistol");
	else addDisabledButton(0,"Buy");
	addButton(14,"Back",crazyCarlShop);
}

public function buyFromCarl(arg:String = "ERROR"):void {
	var cost:int = 0;
	if(arg == "shock pistol")
	{
		cost = 2300;
		eventQueue[eventQueue.length] = lootShockPistol;
	}
	else if(arg == "laser pistol")
	{
		cost = 1050;
		eventQueue[eventQueue.length] = lootLaserPistol;
	}
	else if(arg == "magnum pistol")
	{
		cost = 2000;
		eventQueue[eventQueue.length] = lootMagnumPistol;
	}
	else if(arg == "hammer pistol")
	{
		cost = 2000;
		eventQueue[eventQueue.length] = lootHammerPistol;
	}
	else if(arg == "warhammer")
	{
		cost = 550;
		eventQueue[eventQueue.length] = lootWarhammer;
	}
	else if(arg == "machette")
	{
		cost = 550;
		eventQueue[eventQueue.length] = lootMachette;
	}
	else if(arg == "shortsword")
	{
		cost = 550;
		eventQueue[eventQueue.length] = lootShortsword;
	}
	clearOutput();
	output("You purchase a " + arg + " for " + cost + ".");
	pc.credits -= cost;
	clearMenu();
	addButton(0,"Next",crazyCarlShop);
}

public function lootWarhammer():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new Warhammer();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}
public function lootMachette():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new Machette();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}
public function lootShortsword():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new Shortsword();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}
public function lootShockPistol():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new TheShocker();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}
public function lootLaserPistol():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new LaserPistol();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

public function lootMagnumPistol():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new MagnumPistol();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}
public function lootHammerPistol():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new HammerPistol();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}

public function lootZKRifle():void {
	clearOutput();
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = new ZKRifle();
	//Set quantity!
	
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	//Start loot
	itemCollect(foundLootItems);
}
//[ZK Rifle]
public function zkRifleCarlTalk():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("Naturally your eyes are drawn to one of the only buttons that actually look worthwhile, which stands in among the bigger, tougher looking though greyed out images. You tap the rifle, though you find yourself confused when some of the more mercantile information is missing. No price?");
	output("\n\n\"<i>Ah, that ain’t supposed to be on there. We’ve got one of those laying around and it’s almost ready to go, but it needs some more tinkerin’ unless ya want it to explode. Or just not fire, more likely. I’d love to give it to ya, but I don’t got my tools for it. Went psycho and wandered off.</i>\"");
	output("\n\nNaturally, you respond with a curious look.");
	output("\n\n\"<i>Assistant machina, floatin’ forge robot. Old hands ain’t quite what they were, don’t have it in me for some of the stuff. Start muckin’ with fusion or plasma fueled rail coils n’ it takes a bit more than a screwdriver and a bit of leg room. Ran off to the jungle, bastard thing. I can’t do the real workin’ for a while. Just tinker, really.</i>\"");
	output("\n\nHm. <b>Maybe you should ask him about that.</b>");
	processTime(2);
	//*Information here, anyway. Unlocks about robot. Can’t buy, obv.*
	flags["TALKED_ABOUT_ZK_RIFLE_WITH_CARL"] = 1;
	//[Back]
	clearMenu();
	addButton(0,"Next",carlTalkMenu);
}

//[Sell?]
public function sellToCarl():void {
	clearOutput();
	author("Magic Ted");
	userInterface.showBust("CARL");
	output("You glance over the display for a moment, though find yourself curious about something. Looking up to the old man, you ask if he’ll buy anything instead of just sell.");
	output("\n\n\"<i>Ah, ‘fraid not. Laws of the place says no... ya’d have to chuck it over at Artie the Junk Hut if ya wanted to lose some guns off ya, I can’t purchase ‘em. License whatsits, the Oogie-sea get a bit messed with ‘em.</i>\"");
	output("\n\nYou nod gently in understanding.");
	output("\n\n\"<i>Careful ‘bout the guy, though. Bit weird n’ wiry</i>\"");
	processTime(1);
	//[Back] 
	clearMenu();
	addButton(0,"Next",insideCarlsShop);
}

//Questin’
/*Overview

The forge machina is a mini-boss for that point of the game, designed to give the player a hard time and prepare themselves with level-appropriate gear, items and so forth ahead of time for a rather juicy reward. The fight is triggered after you talk to Carl and get it off him, then go galavanting around the wilderness - it’s a random encounter, mixed in with whatever else. 

If the PC loses the fight, it’s a game over. But a soft-game over, as it just kicks the PC out to into the area they were in at full-health again for a second chance. I don’t want to fuck over a player who didn’t expect a hard boss, nor fuck them over by being weird about losing a fight and denying them the quest reward. 

Being a robot, an industrial robot at that, it is not susceptible to lust attacks. Not sure what its weakness/etc would be, though. Standard robot template? *Wavey arms*/

//Intro
public function carlsEncounterStart():Boolean {
	if(flags["TALKED_WITH_CARL_ABOUT_HIS_ROBOT"] != undefined && flags["ROBOT_QUEST_COMPLETE"] == undefined)
	{
		clearOutput();
		userInterface.showBust("MACHINA");
		userInterface.showName("\nMACHINA");
		output("You crunch your way through the brush, swatting irritability at the odd fern that decides to accost you - which is most of them. As much as you’d like to avoid it, the thick, choking ferns rustle rather noisily with every step you make. The jungle life isn’t exactly quiet either, what with the shrill cries of the birds and bees. And the local avian and bee-inspired population, too. Despite all the noise, however, you can still make out something distinctly unnatural whispering from a bit away, like thick fans of some bit of industrial machinery. Like, say, something that hovers.");
		output("\n\nYou glance down to your codex, curiously. The scanner doesn’t appear to be detecting anything, though whether it’s because whatever is making the noise doesn’t register as a threat or is simply out of the diminutive range you’re not sure. Figures. Probably just a survey probe drone....");
		output("\n\nThe task of finding Carl’s wayward robot suddenly springs to mind. That’s probably it! You thrust your way through the greens once again, yanking at any leaves that come your way for propulsion as you chase after that whispering sound. Soon enough it gets louder and louder, until....");
		output("\n\nYou poke your head out from a bush and find yourself looking into a clearing in the jungle floor. While there are plenty of low hanging plants still, the sky is mercifully visible up above and the space is relatively clear of trees and other obstructions, at least any tall ones. A perfect arena to fight the prey that’s hovering in the middle!");
		output("\n\nThe machina isn’t exactly large as far as industrial robots go, about the size of an average human torso - just like Carl said. The machine looks to be comprised of two steel-grey colored parts; a circular core, shaped in a way very similar to a tire made of uncompromising metal while the top is a sometimes-translucent dome, with an insignificant gap in between the two pieces. Small, flickering lights shine through the faux-glass, identifying its various visible sensors and the like. Below, attached to the undercarriage is the main concern, though; a dozen spindly little robotic arms all holding onto various tools and gadgets. You recognize one of them as a welder, while there are a few grasping hands among them. Everything else is a bit of a toss-up, though.");
		output("\n\nYou look away from the machine after a moment, surveying the ‘arena’ as you realize something smells off. The smell of death fills your nostrils for one grisly moment as you realize just what that corrupted machine has been doing to the local wildlife. As a point of order, it lifts up the corpse of a small local marsupial from the cloak of leaves in its grasping hand, tugging out its messy bones before chirping.");
		output("\n\n<i>“Insufficient material.”</i>");
		output("\n\nThat’s... rather macabre!");
		if(silly) output(" The worst kind of fell mood!");

		output("\n\nYou know full well this is Carl’s machina, gone off the deep end with whatever programming corruption it received. You’ll have to defeat this thing before it hurts someone - or someone else maybe, you can’t see the mess under the sometimes bloodied plants.");
		output("\n\n<b>This will be a hard fight</b> just looking at the tools its carrying and its thick, industrial nature. Given the scene, <b>you’re not sure you’d make it out if you lose.</b>");
		output("\n\nThe machina hasn’t noticed you yet, though. You could engage it or fight another day.");
		//[Fight] [Back off]
		clearMenu();
		addButton(0,"Fight",fightMachina);
		addButton(1,"Back Off",move,"GIANT LEAVES 2");
		return true;
	}
	else {
		return jungleDeepEncounters();
	}
}

public function fightMachina():void {
	flags["JUNGLE_STEP"] = 0;
	startCombat("machina");
}

//FIGHTAN’
/*The Forge Machina

Mechanics
AI: No lust attacks, immune to lust. Uses normal attacks, spinner at a 30-40% chance and the weld-gun n repair at a 30% chance after it goes under 50%. Suicide is only at under 10%~ and is a surefire thing. The encounter ends if it fails. (And ends normally by HP, otherwise.)
*/

public function machinaAI():void {
	userInterface.showBust("MACHINA");
	userInterface.showName("\nMACHINA");
	if(foes[0].HP() <= foes[0].HPMax() * .1) suicideBullshit();
	//Repaaaaaiiiiiiir
	else if(foes[0].hasStatusEffect("Repair Queued") || (foes[0].HP() < foes[0].HPMax()/2 && rand(10) <= 2))
	{
		botRepairGo();	
	}
	else if(foes[0].HP() < foes[0].HPMax()/2 && rand(10) <= 2) weldGunAttack();
	else if(rand(3) == 0) theSpinner();
	else machinaAttackNormal();	
}

//Normal
public function machinaAttackNormal():void {
	output("The machine jerks towards you, zig-zagging unexpectedly as it closes in - one of the grasping appendages reaches out to club at you!\n");
	foes[0].physique(5);
	attack(foes[0],pc,false,0);
	foes[0].physique(-5);
}

//Spinner
public function theSpinner():void {
	output("You hear a loud whir from the corrupt machine before it jerks forwards, coming at you as the main body starts to rotate. Not too soon after it is spinning at a blur of a pace, appendages sprawled outwards and in range of you! Watch out!\n");
	//*Up to seven normal damage attacks.*
	var damage:TypeCollection = (foes[0] as Creature).meleeDamage();
	damage.kinetic.damageValue -= 3;
	if (damage.kinetic.damageValue < 1) damage.kinetic.damageValue = 1;
	
	var attacks:uint = 5 + ((rand(2) == 0) ? 1 : 0) + ((rand(3) == 0) ? 1 : 0);
	
	for (var i:uint = 0; i < attacks; i++)
	{
		if (combatMiss(foes[0], pc))
		{
			output("You manage to avoid " + foes[0].a + possessive(foes[0].short) + " " + foes[0].meleeWeapon.attackVerb + ".");
		}
		else if (rand(100) <= 45 && !pc.isImmobilized())
		{
			if (pc.customDodge.length > 0) output(pc.customDodge);
			else output("You manage to avoid " + foes[0].a + possessive(foes[0].short) + " " + foes[0].meleeWeapon.attackVerb + ".");
		}
		else if (mimbraneFeetBonusEvade(pc))
		{
			output("\nYou’re taken by surprise as your [pc.foot] suddenly acts on its own, right as you’re about be attacked. The action is intense enough to slide you right out of the face of danger. Seems your Mimbrane is even more attentive than you are!\n");
		}
		else
		{
			output(foes[0].capitalA + foes[0].short + " connects with " + foes[0].mfn("his", "her", "its") + " " + foes[0].meleeWeapon.longName + "!");
			
			applyDamage(damage, foes[0], pc, "melee");
		}
		output("\n");
	}
	processCombat();
}

//Weld-gun
public function weldGunAttack():void {
	output("One of the machine’s appendages raises upwards and flattens out in the span of half a second, and molten-red flames burst out and fly across the arena at you! The intense heat only lasts for a moment, however, as the modified welder immediately overheats.");
	applyDamage(new TypeCollection( { burning: 10 + rand(5) } ), foes[0], pc);
	processCombat();
}

//Repair!
public function botRepairGo():void {
	//*On the turn before*
	if(!foes[0].hasStatusEffect("Repair Queued"))
	{
		output("As it attacks, the spare appendages race up its form and begin to mend the damage to its structure! You’ll have to jostle it if you want to stop it before it completes!");
		foes[0].createStatusEffect("Repair Queued",foes[0].HP(),0,0,0,true,"","",true,0);
	}
	//*That turn, PC does good damage*
	else if(foes[0].statusEffectv1("Repair Queued") > foes[0].HP() + 5)
	{
		output("Your attack causes the machine to bounce severely, and the tool-appendages fall away from the chassis. You prevented it from repairing!");
		foes[0].removeStatusEffect("Repair Queued");
	}
	//*That turn, if PC does poor damage.*
	else
	{
		output("You were unable to shake the robot up enough to interrupt it, so now you can only watch as the holes of damage and scarred metal are mended before your very eyes, showing just how vain your progress was.");
		foes[0].HP(Math.round(foes[0].HPMax()/3));
		foes[0].removeStatusEffect("Repair Queued");
	}
	processCombat();
}

//Suicide bullshit
public function suicideBullshit():void {
	output("Rattled and damaged, even smoking somewhere, the machina wobbles closer to the earth. You relax a bit, thinking that this might be the robot’s final ‘death throes’. You’re quick to go back on the alert as the machine reaches into the brush with a grasping appendage, pulling out... a weapon?! You are not sure what sort it is, too dirty and masked by plants, but you don’t have a lot of time to figure out. The thick firearm explodes out in short order, sending a massive pellet your way!\n\n");

	//insert miss chances, damage, etc
	if(rangedCombatMiss(foes[0],pc)) {
		output("You dodge out of the way!");
	}
	//Blind chances!
	//Extra miss for blind
	else if(foes[0].hasStatusEffect("Blind") && rand(10) > 0) {
		output(foes[0].capitalA + possessive(foes[0].short) + " blinded shots fail to connect!");
	}
	//Shit, got hit.
	else
	{
		output(foes[0].capitalA + foes[0].short + " connects with " + foes[0].mfn("his", "her", "its") + " massive gun!");
		var damage:TypeCollection = new TypeCollection( { kinetic: 15 } );
		damage.add(foes[0].aim() / 2);
		damageRand(damage, 15);
		var damageResult:DamageResult = calculateDamage(damage, foes[0], pc, "ranged");

		if (damageResult.shieldDamage > 0)
		{
			if (pc.shieldsRaw > 0) output(" Your shield crackles but holds.");
			else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
		}
		
		if (damageResult.hpDamage > 0)
		{
			output(" The hit carries on through to damage you!");
		}
		
		outputDamage(damageResult);
	}
	//*PC survives by HP, dodging, whatever.*
	if(pc.HP() >= 1 && pc.lust() <= 99) {
		output("\n\nSeeing its failure, the machine prepares to fire again - this time, though, the weapon explodes in a <i>different</i> way; you manage to duck as shrapnel goes flying over your head from the faulty firearm, and it’s the machina that takes the brunt of the blast. As you rise back up, you hear a pathetic sounding whir, petering out to nothing in short order. You’re left with a crumpled heap of a machine on the jungle floor.");
		foes[0].HP(-1000);
	}
	//*PC doesn’t.*
	else output("\n\nSeeing its success the machine tosses away the firearm in short order, though as you fall backwards in pain you’re not really in the mindset to care.");
	processCombat();
}

//Victory!
//SHIT YEAH I PRESS THAT BUTTON
//looks kinda like a jelly fish
public function pushButtanOnMagicTedsFireRobot():void {
	author("Magic Ted");
	userInterface.showBust("MACHINA");
	userInterface.showName("\nMACHINA");
	output("You loom over the fallen, inert machine as it lays there sprawled across a particularly large, low-hanging fern. After you give it a few kicks to make sure, you are confident that the robot has been knocked out from the damage. You feel a swell of pride kick up in your chest at the victory, though that immediately starts to falter under the realization you still need to lug this thing back. Ugh.");
	output("\n\nYou lean over the machine, brushing off the limp appendage-arms to either side. It looks an awful lot like a jellyfish, come to think of it. You recall Carl saying there was a factory-reset button somewhere in the undercarriage, so reach your hand into the mess and grope about. The outlet for its coolant, a few wires here and there. A button, a vent for what you can only assume is-- Wait, a button. You press in on the small, out-of-the-way thing firmly.");
	output("\n\nImmediately the robot chirps and you yank your hand away, preparing to go back to fighting. However, instead of aggression the machine lazily hovers itself upright, spins in place once and then continues upwards. You can only watch as it rises up past the trees and floats to off to the side - towards town, you realize. Looks like it’s going to what it considers home after you reset it.");
	output("\n\n<b>Best speak with Carl when you get back.</b>\n\n");
	flags["ROBOT_QUEST_COMPLETE"] = 1;
	genericVictory();
}

//Defeat, bad end...
public function ohShitLoseToRobot():void {
	author("Magic Ted");
	userInterface.showBust("MACHINA");
	userInterface.showName("\nMACHINA");
	if(pc.lust() > 99) output("Though you sink to your [pc.knees] in need, that all changes when the robot fires a huge metal slug at you.\n\n");
	output("Pain.");

	output("\n\nYou are wracked by waves and waves of pain, your vision becoming a hazy blur as your body falls against the thick ferns and other plants below. You can feel the damp ground all around you, knowing it'll be the last thing you'll get to feel - besides pain. As the machine looms closer, tools whirring ominously, you close your eyes, resigned.");
	output("\n\nThis is how the handpicked heir of Steele goes out. Not in a blaze of glory, not from sexual fatigue, not from old age after fucking over the life of your test tube baby. No, from a fucking gun smith’s attendant robot.");
	badEnd();
}
