//Available Flags

//MET_BUSKY:						If the PC met Busky (true or undefined)
//BUSKY_AFFECTION:					A meter measuring Busky's affection for the PC (undefined or 0.5-200)
//BUSKY_TALKED_ABOUT_HIMSELF:		If the player talked with Busky about himself (true or undefined)
//BUSKY_TALKED_ABOUT_STRAPS:		If the player talked with Busky about Straps (true or undefined)
//BUSKY_TALKED_ABOUT_TREATMENT:		If the player talked with Busky about the treatment (true or undefined)
//BUSKY_TALKED_ABOUT_GYM:			If the player talked with Busky about the ten ton gym (true or undefined)
//BUSKY_TALKED_ABOUT_MODELING:		If the player talked with Busky about modeling for him/her (true or undefined)
//BUSKY_TALKED_ABOUT_PREPOCKET:		If the player talked with Busky about the pre-pocket upgrade (true or undefined)
//BUSKY_SEXED_TEASENDENIAL:			If the player ever did Busky's tease and denial scene (true or undefined)
//BUSKY_CHEST_WORSHIPED:			If the player ever did Busky's chest worship scene (true or undefined)
//BUSKY_SEXED_COUNT:				Counter how often player and Busky had sex (true or undefined)
//BUSKY_SEXED_GET_BLOWN:			If the player ever did Busky's get blown scene (true or undefined)
//BUSKY_SEXED_ANAL_PITCH:			If the player ever did Busky's anal pitch scene (true or undefined)
//BUSKY_SEXED_ANAL_CATCH:			If the player ever did Busky's anal catch scene (true or undefined)
//BUSKY_SEXED_SEXUALLY_MOTIVATED:	If the player ever sexually motivated Busky at Ten Tons Gym (true or undefined)
//BUSKY_SEXED_BENCH_ANAL:			If the player ever did Busky's bench anal scene at Ten Ton Gym (true or undefined)
//BUSKY_SEXED_HOTTUBFUCK:			If the player ever did Busky's hot tub fuck scene at Ten Ton Gym (true or undefined)
//BUSKY_MODELLED_PLAINSHIRT:		If Busky modeled the plain undershirt for the pc (true or undefined)
//BUSKY_MODELLED_CORNYSHIRT:		If Busky modeled the corny t-shirt for the pc (true or undefined)
//BUSKY_MODELLED_FISHNETTOP: 		If Busky modeled the fishnet top for the pc (true or undefined)
//BUSKY_MODELLED_COWPRINTEDSHIRT:	If Busky modeled the cow print shirt for the pc (true or undefined)
//BUSKY_MODELLED_HARNESS:			If Busky modeled the harness for the pc (true or undefined)
//BUSKY_MODELLED_HORSESHOEBOXERS:	If Busky modeled the horseshow boxers for the pc (true or undefined)
//BUSKY_MODELLED_COCKPASTY:			If Busky modeled the cock pasty for the pc (true or undefined)
//BUSKY_MODELLED_FISHNETBRIEFS:		If Busky modeled the fishnet briefs for the pc (true or undefined)
//BUSKY_MODELLED_MALETIGHTS:		If Busky modeled the male tights for the pc (true or undefined)
//BUSKY_MODELLED_JOCKSTRAP:			If Busky modeled the bull's jockstrap for the pc (true or undefined)
//BUSKY_MODELLED_COWPRINTEDSHORTS:	If Busky modeled the cow printed shorts for the pc (true or undefined)

//added during shop initialization with date check for christmas
import classes.Items.Transformatives.Nutnog;
import classes.Items.Transformatives.Peckermint;

//added for clothing shop with show off
import classes.Items.Apparel.Undershirt;
import classes.Items.Apparel.BullsJockstrap;
import classes.Items.Apparel.CockPasty;
import classes.Items.Apparel.CornyTShirt;
import classes.Items.Apparel.CowPrintedShirt;
import classes.Items.Apparel.CowPrintedShorts;
import classes.Items.Apparel.FishnetBriefs;
import classes.Items.Apparel.FishnetTop;
import classes.Items.Apparel.Harness;
import classes.Items.Apparel.HorseshoeBoxers;
import classes.Items.Apparel.MaleTights;
import classes.Items.Apparel.PlainUndershirt;


//display Busky's name + author infos
public function showBusky(nude:Boolean = false):void
{
	if(flags["MET_BUSKY"]) showName("\nBUSKY");
	else showName("\nSHOPKEEPER");
	if(nude) showBust("BUSKY_NUDE");
	else showBust("BUSKY");
	author("Altair Hayes");
}

//get the int value of Busky's affection meter
public function buskyAffection():int {
	if(flags["BUSKY_AFFECTION"] == undefined) return 0;
	else return flags["BUSKY_AFFECTION"];
}

//update Busky's affection meter. Current min value is 0, max value is 200
public function buskyAdjustAffection(adjustment:int):void 
{
	if(flags["BUSKY_AFFECTION"] == undefined) flags["BUSKY_AFFECTION"] = 0;
	
	flags["BUSKY_AFFECTION"] += adjustment;
	
	if(flags["BUSKY_AFFECTION"] > 200.0) flags["BUSKY_AFFECTION"] = 200.0;
	else if(flags["BUSKY_AFFECTION"] < 0) flags["BUSKY_AFFECTION"] = 0;
}

//function to increase busky's sexed counter
public function buskySexed(times:int):void {
	if(flags["BUSKY_SEXED_COUNT"] == undefined) flags["BUSKY_SEXED_COUNT"] = 0;
	flags["BUSKY_SEXED_COUNT"] += times;
}

//meeting busky at Straps
public function buskyStrapsShopFunc():Boolean {
	
	//The shop is only open from 6.00am to 5.00pm
	if (hours >= 6 && hours < 17) {
		
		//clearOutput();
	
		//First visit
		if(flags["MET_BUSKY"] == undefined) {
			showBusky();
			
			output("You enter the small shop, across the street from the Barn and Ten Ton Gym. Taking in your first breath, you notice the aroma filling the air, a musk so powerful you’re taken aback by the sheer palpable amount of virility. You stand there, paralyzed by the intoxicating fumes. The scent is familiar to you, having passed by unwashed New Texans coming back from their sessions at the milkers, however the simple description of a well fucked cow cannot depict the full scale of the musk emanating from the walls. It smells like you’ve walked in on the aftermath of a ranch-wide orgy.");
			if (pc.isTreated()) output("\n\nIn fact, you start to visualize it, daydreaming in the middle of the store. Worn out and used cows strewn about on the floor, some lying in a pile, resting their heads on each other’s mammoth mammaries. The few voluptuous cows that aren’t entirely worn out or incapacitated by the amount of cum lying in their wombs moaning in dissatisfaction of an empty hole, crawling along the cum soaked hay to a group of spent bulls, most of whom spoon with their curvy cows. The bulls that lack a resting partner quickly meet up with the cows, males lying down on their backs as the cows straddle their tools with cum soaked thighs.");
			
			output("\n\nYou snap out of your");
			if (pc.isTreated()) output(" daydream");
			else output(" daze");
			output(" when a cow accidentally bumps into you. She apologizes while you shake your head, gathering your thoughts. However, before she moves on, she gives your crotch an extended glance. You follow her eyes and notice your");
			
			if(pc.isSexless()) output(" face, flushed with arousal");
			else output(" [pc.crotch] dripping fluids, which are clearly visible");
			
			if (!pc.isCrotchExposed()) output(" through your clothes");
			output(", if anybody were to give you a good look over.");
			
			output("\n\nThe man at the counter is an Adonis, no muscle on his body undefined, with pectorals the size of throw pillows. The bull’s light skin somewhat contrasts his brown hair, within which a pair of fully grown horns sprout, sticking up on either side of his head. Short, dark stubble is visible where a beard could be. It’s hard to miss the outline of his pectorals and abdominals showing through his strained undershirt.");
			output("\n\n<i>“So uh... you gonna buy something or just stare?”</i>");
			output("\n\nThe bull’s voice snaps you out of your trance. You stammer for a bit, trying to explain yourself but the bull just laughs it off. He comes out from behind the counter and gives you a friendly slap on the back.");
			output("\n\n<i>“Name’s Busky. And don’t worry ‘bout staring, ain’t no big deal. I’m no stranger to being gawked at, if you want a good view, go on ahead,”</i> the giant bull steps back, giving you a full view of his well defined body.");
			output("\n\nHe stands there flexing, trying to show off, however you can’t help but notice he isn’t wearing anything below the belt. Busky slowly comes to realize that he is unintentionally showing off his semi-erect hefty horsecock, resting over his quartet of grapefruit sized balls.");
			output("\n\n<i>“Oh crap,”</i> Busky rushes back behind the counter and puts on a jockstrap. <i>“Was rubbing one out before you came in, heh. Anyway, welcome to Straps.”</i>");
			
			flags["MET_BUSKY"] = true;
			
		//Follow-up visits	
		} else {
			showBust("BUSKY");
			
			output("You enter the small shop across the street from the Barn and Ten Ton Gym. After you readjust to the thick scent you look around. Aside from the occasional bull rummaging through the clothes, the shop is mostly filled with cows; possibly purchasing products for their bulls. You turn to look at the front of the store, greeted by the warm smile of the musclebound bull behind the counter.");
			output("\n\n<i>“Looking to buy somethin’? Other than me,”</i> the bull jokes. <i>“Can’t buy what’s already free.”</i>");
			output("\n\nA monitor behind the counter Busky works at reads <i>“Despite Straps’s recent debut, it is already a major distributor of the freshest male enhancing products and male clothing. We are fully stocked in male underwear and tops, and have received a shipment of newly released mods. While our stock may be small now, there are more mods to come, so check back while we restock and stock your jocks!”</i>");
		}
		
		//clearMenu();
		addButton(0, "Busky", buskyMenu, undefined, "Busky", "Walk up to the muscular bull."); 
		addButton(1, "Mods", buyModsFromBusky, undefined, "Mods", "Check the mod aisle of Busky’s shop.");
		addButton(2, "Clothes", buskyClothesMenu, undefined, "Clothes", "See what clothes are up for sale.");
	
	//if between 5pm and 6am - no one's home
	} else {
		output("Straps is currently closed.\n\nA sign beside the door announces the opening hours: <b>06:00 to 17:00</b>.");
		
		//put player back on previous tile
		moveTo("508");
		showLocationName();
		clearMenu();
		addButton(0,"Next", mainGameMenu);
		return true;
	}
	
	return false;
}

//prints busky's menu with Appearance/Sex/Talk options
public function buskyMenu():void {
	clearOutput();
	showBusky();
	
	output("<i>“Welcome. If you need anything or anyone,”</i> Busky winks at you, <i>“just ask.”</i>");
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Appearance", buskyAppearance, undefined, "Appearance", "Take a gander at Busky.");
	addButton(1, "Talk", buskyTalk, undefined, "Talk", "Strike up a conversation with the bull.");
	addButton(2, "Sex", buskySex, undefined, "Sex", "See if Busky’s up for a roll in the hay.");
	addButton(14, "Back", mainGameMenu);
}

//prints busky's appearance screen
public function buskyAppearance():void {
	clearOutput();
	showBusky();
	
	output("The hunk standing before you can be summarized with the simple title of <i>“The Beefcake Next Door”</i>, a mixture of playful happy-go-lucky cheer combined with slabs of muscle adorned on his body. His pair of horns are fully grown, possibly around eight inches long, the ivory tusks sticking up on either side of his short, messy brown hair. His hair brings out his sea blue eyes. A light stubble adorns his well defined jawline. He looks as if he hasn’t a care in the world, always carrying a relaxed, happy-to-be-there smile.");
	output("\n\nHis torso is hugged tight by the undershirt he’s wearing. The outline of his pectorals and abs are clearly visible through the white cloth, and you can see hints of chest hair peaking out from under his shirt. The male bull seems to work out constantly, as his body and arms are perfectly defined. There is a decent amount of hair on his arms as well. Not enough to pass for fur, but more akin to an unshaven lumberjack.");
	output("\n\nOn Busky’s lower body are two legs that are just as hairy and muscular, ending in regular old human feet. And between those legs, constrained in a brown leather jockstrap, are a quartet of grapefruit sized balls supporting a hefty 20 inch horsecock that is spotted brown at the base, and pink up towards the flare.");
	output("\n\nBusky has one tight ass, placed exactly where it belongs. Resting above his ass is a standard bovine tail, with a tuft of brown fur at the end.");

	addDisabledButton(0, "Appearance");
}

//busky's talk screen
public function buskyTalk():void {
	clearOutput();
	showBusky();
	
	output("<i>“Sure, I’m down to talk, whaddya wanna know?”</i> Busky asks as he fold his arms and leans back against the wall, a calm, placid expression painted on his face, as if he has nothing to hide.");
	
	buskyTalkNavigation();
}

//navigation for busky's talk screen and the different topics you can talk with him
public function buskyTalkNavigation(activeTopic:Function = undefined):void {
	clearMenu();
	
	if(activeTopic == buskyTalksAboutHimself) addDisabledButton(0, "Himself", "Himself", "You just spoke about that.");
	addButton(0, "Himself", buskyTalksAboutHimself, undefined, "Himself", "Ask Busky about himself.");
	
	if(activeTopic == buskyTalksAboutStraps) addDisabledButton(1, "Straps", "Straps", "You just spoke about that.");
	addButton(1, "Straps", buskyTalksAboutStraps, undefined, "Straps", "Ask about Busky’s shop.");
	
	if(activeTopic == buskyTalksAboutTreatment) addDisabledButton(2, "Treatment", "Treatment", "You just spoke about that.");
	else if(flags["BUSKY_TALKED_ABOUT_STRAPS"]) addButton(2, "Treatment", buskyTalksAboutTreatment, undefined, "The Treatment", "Ask Busky what he thinks about the Treatment.");
	else addDisabledButton(2, "Treatment", "The Treatment", "Maybe you should ask him about Straps first.");
	
	if(activeTopic == buskyTalksAboutTenTonGym) addDisabledButton(3, "TenTonGym", "Ten Ton Gym", "You just spoke about that.");
	if(flags["BUSKY_TALKED_ABOUT_TREATMENT"]) addButton(3, "TenTonGym", buskyTalksAboutTenTonGym, undefined, "Ten Ton Gym", "Ask about the gym next door.");
	else addDisabledButton(3, "TenTonGym", "Ten Ton Gym", "Maybe you should ask him about the Treatment first.");
	
	if(activeTopic == buskyTalksAboutModeling) addDisabledButton(4, "Model", "Model", "You just spoke about that.");
	if(flags["BUSKY_TALKED_ABOUT_STRAPS"]) addButton(4, "Model", buskyTalksAboutModeling, undefined, "Model", "Request the bull to model an article of clothing for you.");
	else addDisabledButton(4, "Model", "Model", "Maybe you should ask him about Straps first.");
	
	addButton(14, "Back", buskyMenu);
}

public function buskyTalksAboutHimself():void {
	clearOutput();
	showBusky();
	
	output("<i>“Name’s Buskurt Agnos, people just call me Busky though, and honestly I’m just your run of the mill New Texan Bull.”</i> Busky says casually. <i>“Not much different than Ol’ Big T. himself.”</i>");
	output("\n\n<i>“So you spend every waking moment ogling at the biggest pair of breasts in the room,”</i> you joke. Busky himself chuckles for a second before responding.");
	output("\n\n<i>“Not exactly a woman person myself, if you know what I mean. Instead of Aphrodite, I’d rather get with Priapus, or as he’s known around here, ‘Brynn’, heh. Here’s a tip, with him, there’s no such thing as ‘just the tip’, made that mistake myself and by the end of it, I couldn’t sit down for a month.”</i>");
	output("\n\nYou chuckle, amused at Busky’s honesty. It seems like everyone really has nothing to hide in New Texas.");
	output("\n\n<i>“Anyway,”</i> Busky starts, <i>“who are you exactly? Haven’t seen your face ‘round here.”</i>");
	output("\n\nYou introduce yourself as Steele, [pc.name] Steele.");
	output("\n\n<i>“Kind of an odd last name; it Terran or something?”</i>");
	output("\n\nYou awkwardly explain Steele Co. and how you’re the soon to be CEO while Busky nods in understanding.");
	output("\n\n<i>“Cool. Never really paid attention to Steele Co. myself, not much of a big deal to me since I don’t really have much need for tetratazmanian carbonoid alloys or whatever. Anyway, nice to meet you, [pc.name].”</i>");
	
	processTime(2);
	
	if (flags["BUSKY_TALKED_ABOUT_HIMSELF"] == undefined) buskyAdjustAffection(1);
	flags["BUSKY_TALKED_ABOUT_HIMSELF"] = true;
	
	buskyTalkNavigation(buskyTalksAboutHimself);
}

public function buskyTalksAboutStraps():void {
	clearOutput();
	showBusky();
	
	output("<i>“Take a look ‘round here. Ya see <b>any</b> other shops selling stuff for guys? I mean, aside from Ellie selling Suma, there’s nothing, which I why I set up shop here, went through a couple of names before finally settling on Straps. It cost a crap ton to construct and stock, so I took out a loan from Ol’ T. He’s pretty reasonable, no interest or anything. All I’ve gotta do is give him a bit of control on our stock till I pay him back.”</i> Busky pauses and glances at the mods lining the wall behind the counter. <i>“‘Cept for some reason he doesn’t want me selling Treatment Medipens. Plus he tends to let me order shipments first, and then blacklist stuff after the fact. Got a whole store of products collecting dust in the back.”</i>");
	output("\n\nYou ask about what kind of products are back there.");
	output("\n\n<i>“Ever see a bull with milky pecs?”</i> he chuckles.");
	output("\n\nYou can’t say that you have.");
	output("\n\n<i>“Anyway, I was a real bookworm before I took The Treatment, studied a bit of everything, took a bunch of business classes and so here I am. Not doing too bad if I say so myself. Thankfully the Treatment didn’t mess with me too much, can still focus on work, though, if there’s a particularly large butt passing by...”</i> he trails off for a moment, before before snapping back to reality, <i>“‘course, if it doesn’t work out I could always become a breeding stud to pay T. back. Anyway I finalized the location, constructing right next to the gym, seein’ how I spend most of my free time there anyway. Plus it’s a good way to get people to notice the place.”</i>");
	
	processTime(2);
	
	if (flags["BUSKY_TALKED_ABOUT_STRAPS"] == undefined) buskyAdjustAffection(1);
	flags["BUSKY_TALKED_ABOUT_STRAPS"] = true;
	
	buskyTalkNavigation(buskyTalksAboutStraps);
}

public function buskyTalksAboutTreatment():void {
	clearOutput();
	showBusky();
	
	output("You ask about The Treatment and what his life was like before he took it.");
	output("\n\n<i>“I knew you’d ask about that sooner or later.");
	
	if (pc.isTreated()) output(" A lot of people do, although it’s usually just tourists, and you...”</i> he glances at your treated physique, <i>“you’re no newcomer.");
	else output(" Everyone wants to know the changes before they take it themselves.");
	output(" Well, The Treatment was originally a fertility drug administered to the initial immigrants who landed on this here planet, used to boost the population to colonize and fight against what Big T. calls ‘Mega Varmints’. After we got control of the planet a few... scratch that. A buncha people took a liking to The Treatment, soft women, strong men, was pretty natural to ‘em. The details around this time are a little fuzzy for me, but fast forward a couple generations and now it’s sunk into our genes, mandatory on our 18th birthday, and better than ever.”</i>");

	output("\n\n<i>“And what about you? Were you always the hulking slab of meat you are today?”</i> You ask sarcastically, underestimating the power of the Treatment.");
	output("\n\n<i>“Actually, I was quite the nerd. Glasses, thin, nose-deep in books, no muscle bulk. Nothin’. But then once I got the Treatment at the beginning of my Senior school year things turned out much better for me. You see, before my Treating I was... close with the football team.");
	
	if(pc.femininity <= 40) output(" I had a huge submissive streak. Whenever the cheerleaders were away I’d help the team get their rocks off; can’t let your boys play while pent up right? I never could bear to watch them suffer.");
	output(" Anyway, their Quarterback had a bad run in with The Treatment; turned him into a Faux-Cow,”</i> you raise an eyebrow at Busky and he explains.");

	output("\n\n<i>“A Faux-Cow is a male who took The Treatment, but lost muscle mass, and masculine traits. They also tend to be much more submissive, however they’re still male. Hence the ‘Faux’. And since I was so, er, close with the football team, and I had the same build the old quarterback had, I was the best choice for a replacement.");
	if(pc.femininity <= 40) output(" It also helped me relieve them after practice. Poor boys were always so pent up, I had to take care of them in the showers just to wash it all away.");
	output("”</i>");
	
	output("\n\n<i>“Nowadays if I’m not here in the shop I’m at the gym, bulking up");
	if(pc.femininity <= 40) output(", taking nostalgic showers if you know what I mean,");
	output(" and maintaining this body. Not planning on going back to being a twig any time soon.”</i>");
	
	processTime(2);
	
	if (flags["BUSKY_TALKED_ABOUT_TREATMENT"] == undefined) buskyAdjustAffection(0.5);
	flags["BUSKY_TALKED_ABOUT_TREATMENT"] = true;
	
	buskyTalkNavigation(buskyTalksAboutTreatment);
}

public function buskyTalksAboutTenTonGym():void {
	clearOutput();
	showBusky();
	
	output("<i>“Hey kid, if you’re looking for someone to spot ya, I gotcha,”</i> Busky says, planting a firm hand on your shoulder, as if to show his reliability. <i>“But yeah, I’ve kept this body in check for this long, I could probably do the same for you.");
	if (pc.femininity <= 40) output(" And, if you’re ever looking for a spa buddy, we could spend a few hours in there.");
	output(" I know I ordered a shipment of muscle packing mods a while back. They’re probably still going through customs or somethin’, but once I get them, we’ll take them for a test at the gym.");

	output("\n\n<i>“Anyway, they’ve got their credit’s worth setting that place up, a whole track strip, competitive lap pools, and more weights than I could have imagined");
	if (pc.femininity <= 40) output(" and good lord those showers, almost forgot to tell you ‘bout them. Honestly, they’re really high quality, and they really bring me back to my football years. That place is full of willing Bulls and Faux-Cows, half of the time you can just walk on over, tell them what’s up, and you’ll be fucking faster than a Varmint chasing after a packet of silicone. I’d pretty much purchased a life pass just for the ‘communal experience’.");
	else output(" -- the whole shebang.");
	output("”</i>");
	
	processTime(1);
	
	flags["BUSKY_TALKED_ABOUT_GYM"] = true;
	
	buskyTalkNavigation(buskyTalksAboutTenTonGym);
}

public function buskyTalksAboutModeling():void {
	clearOutput();
	showBusky();
	
	output("<i>“I’ve been looking at what you’ve got here, and I’ve got to say, I like what I see,”</i> you start. <i>“But I’ve been wondering if I can see them put in action.”</i>");
	output("\n\n<i>“Mannequins are set up all throughout the store,”</i> he grins, knowing where this conversation is headed. He leans on the counter as he points out one of the many faceless white statues.");
	output("\n\n<i>“True, but they’re so still and lifeless. I need something dynamic,”</i> you continue.");
	output("\n\n<i>“Hardlight mannequin, dead center of the displays, can’t miss it,”</i> he says nonchalantly.");
	output("\n\n<i>“Can’t compliment it either,”</i> you joke. <i>“So I was wondering. If you’d be willing to try on your clothes for me.”</i>");
	output("\n\n<i>“You want me to model eh? Well why didn’t you say so.”</i> Busky laughs a bit. <i>“Well, I can’t say I’m opposed to the idea. Also can’t say you’re the first to ask. But if you want, I’ll be glad to put myself on display.”</i>");
	
	processTime(1);
	
	flags["BUSKY_TALKED_ABOUT_MODELING"] = true;
	
	buskyTalkNavigation(buskyTalksAboutStraps);
}

//busky's sex menu
public function buskySex(): void {
	clearOutput();
	showBusky();
	
	//no sexy time for feminine gals or guys, or individuals with tits
	if (pc.femininity > 40 || pc.hasBreasts()) {
		output("<i>“Sorry. Not Interested.”</i>");
		output("\n\nYou raise an eyebrow at his response, and say it’s a bit odd for a New Texan to turn down a free fuck.");
		output("\n\n<i>“I’m just not really interested in");
		
		if (pc.hasBreasts() && pc.femininity <= 40) output(" tits on a guy");
		else if (pc.hasBreasts() || pc.femininity > 40) {
			if (pc.isFemboy() || pc.isManHerm() || pc.isCuntboy()) output(" femboys");
			else if (pc.isTreated()) output(" cows");
			else output(" chicks");
		}
		output(", plenty of other bulls are, just not me. Sorry,");
		if (pc.isFemboy() || pc.isManHerm() || pc.isCuntboy()) output(" you’re a bit too girly for my tastes - not into that myself.");
		else output(" just really not looking for what you’ve got");
		output(". No offense intended of course.”</i>");
		
		clearMenu();
		addButton(14, "Back", buskyMenu);

	//guys, or masculine chars	
	} else {
		output("<i>“Oh so you wanna take me out for a ride, eh? What do you have in mind,”</i> he leans over the counter, beginning to list off sexual exploits. <i>“I’d be more than happy to pump you full of cum, of course I could always get on my knees and go from there. Or maybe you’d like to stuff me up like a cow. Honestly, I’m down for everything.”</i>");
		output("\n\nYour head swims with thoughts of what to do...");
		
		buskySexNavigation();
	}
}

//navigation for busky's sex menu
public function buskySexNavigation(activeTopic:Function = undefined): void {
	clearMenu();
	
	if(pc.isTaur() || !pc.hasCockOrStrapOrClit()) addDisabledButton(0, "Tease&Denial", "Tease ‘n’ Denial", "Requires a cock, a large enough clit or a strapon. You can’t be a Taur either.");
	else addButton(0, "Tease&Denial", buskySexTeaseAndDenial, new Undershirt(), "Tease ‘n’ Denial", "Go for a round of teasing, including analingus, nipple play, and asshole prodding.");
	
	if(activeTopic == buskySexChestWorship) addDisabledButton(1, "ChestWorship", "Chest Worship", "You just did that.");
	addButton(1, "ChestWorship", buskySexChestWorship, new Undershirt(), "Chest Worship", "Worship the chest of the muscular adonis.");
		
	if(!pc.hasCock() || buskyGetLargestBlowableCockIndex() == -1) addDisabledButton(2, "Get Blown", "Get Blown", "Requires a cock with girth under 10 inches and length under 36 inches.");
	else addButton(2, "Get Blown", buskySexGetBlown, undefined, "Get Blown", "Get the bull to blow you.");
		
	if (!pc.hasCock()) addDisabledButton(3, "Anal Pitch", "Anal Pitch", "You’ll need a real cock to take him for a ride.");
	else if(pc.hasCock() && pc.smallestCockVolume() > chars["BUSKY"].analCapacity()) addDisabledButton(3, "Anal Pitch", "Anal Pitch", "You’re too big for him.");
	else addButton(3, "Anal Pitch", buskySexAnalPitch, undefined, "Anal Pitch", "See if Busky’s up for a ride from behind.");
		
	if(pc.analCapacity() < chars["BUSKY"].cockVolume(0)) addDisabledButton(4, "Anal Catch", "Anal Catch", "You can’t take a bull as well endowed as Busky.");
	else addButton(4, "Anal Catch", buskySexAnalCatch, undefined, "Anal Catch", "Offer the bull to ride your ass.");
	
	addButton(14, "Back", buskyMenu);
}

//returns the index of the largest cock Busky can still blow, or -1 if all are too large
//his limits are a girth of 10 inches and a length of 36
public function buskyGetLargestBlowableCockIndex():int {
	var largestCockIndex:int = -1;
	
	var counter: int = pc.cocks.length;
	while (counter > 0) {
		counter--;
		//check for cock with girth under 10 and length under 36
		if (pc.cocks[counter].thickness() * Math.PI < 10 && pc.cocks[counter].cLength() < 36) {
			//save index of first found cock, when none saved yet
			if (largestCockIndex == -1) largestCockIndex = counter;
			//check if current cock is longer than saved index cock
			if (pc.cocks[counter].cLength() > pc.cocks[largestCockIndex].cLength()) largestCockIndex = counter;
		}
	}
	return largestCockIndex;
}

//sex and denial scene, can be passed an item busky should wear - currently supports only CockPasty
public function buskySexTeaseAndDenial(modelingItem:*):void {
	clearOutput();
	showBusky(true);
	
	if(modelingItem is CockPasty) output("You walk on over to Busky, now leaning against a wall, presenting his ass to you and whisper into his ear. Telling him that you want to see just how much cock the cock pasty can handle. Busky moans softly and nods.");
	else output("You whisper into Busky’s ear and ask if he’s up for another round of ass teasing. Busky, with a grin, walks into the dressing room. You follow him, and find him leaning against the wall as he presents his ass to you, wearing nothing but his jockstrap.");
	
	output("\n\nYour hand slides down his body and begins to fondle Busky’s crotch through");
	if(modelingItem is CockPasty) output(" the thin layer of the pasty");
	else output(" Busky’s brown leather jockstrap");
	output(". His shaft pulses with blood and his 4 balls churn with excitement, preparing a fresh load for you. With your spare hand you begin to work his nipples. You form a vice grip between your thumb and index finger as you assault Busky’s left nipple, and a sharp gasp leaves Busky’s throat as you begin to grind it. Every few seconds you lightly tug his nipple, just barely enough to get him to moan in a mixture of pain and pleasure.");

	if (pc.hasCock() && !pc.hasVagina()) output(" By this point both of your shafts are fully erect and drooling pre.");
	else if (!pc.hasCock() && pc.hasVagina()) output(" By this point your cunt is dripping on the floor as Busky’s cock is drooling pre.");
	else output(" By this point your genitals are leaking, creating a sexual stew on the floor.");
	
	output("\n\nQuickly swapping hands you begin your assault on his right nipple, steadily switching between grinding and tugging as Busky resumes his moans");
	if (pc.hasArmor()) output(". You stop playing with his nipples for a moment to undo your [pc.armor] as you think of yet another way to tease your bovine lover");
	if (pc.hasCockOrStrapOrClit()) output(". Without any warning you begin to rub your tool in between his cheeks, slowly grinding against him. Busky begs you to fuck him, but you continue grinding against his hole as if you can’t hear him");
	
	if (pc.hasLowerGarment() && pc.hasCock()) {
		output(". Eagerly [pc.eachCock] strain");
		if (pc.cocks.length == 1) output("s");
		output(" against your [pc.lowerGarment], trying to burst free and assault Busky’s ass");
	} else if (pc.hasLowerGarment() && pc.hasHardLightEquipped()) {
		output(" You almost consider taking off your [pc.lowerGarment] and forcing Busky to wear it inside out, but you decide maintain control of the situation");
	} else if (silly && pc.clitLength >= 12) {
		output(" You nibble on Busky’s ear as you rub your [pc.clit] against Busky’s tight ass, you shiver in delight and let out a soft moan as the pleasure courses through you");
	}
	output(". As you resume stroking his cock you can’t help but wonder if you can possibly find a way to tease him further. You were so lost in though you almost didn’t notice Busky’s panting and groaning getting louder.");

	output("\n\n<i>“Oh god nrf, gonna uf, gonn-,”</i> you quickly stop all sexual assault on his body. <i>“Pl-please don’t stop, I need to cum, I NEED to.”</i> Busky whines as he continues rubbing his length through the");
	if(modelingItem is CockPasty) output(" elastic cock pasty");
	else output(" strong leather jockstrap");
	output(". You slap his ass and tell him that he’ll cum when or if you let him, and until then he should grin and bear it.");

	output("\n\nSinking to your knees you grip Busky’s toned ass cheeks and brush away his tail, exposing his tight hole. With little hesitation you bury your face in between his cheeks, letting the damn sweaty crevice welcome you. After taking a good deep sniff you run your tongue down from the");
	if(modelingItem is CockPasty) output(" pasty up to his tail");
	else output(" taut brown jockstrap");
	output(", feeling Busky shiver in delight. After taking a moment to process the flavor of his ass you take two fingers and lightly pry it open. When enough space is made you ram your [pc.tongue] into Busky’s ass, once you’re in you let go and let your tongue work his ass. Soon you’re sliding in and out slathering his rectal walls with your spit, tongue fucking him raw.");
	
	output("\n\nYour bovine lover uses one hand to pull his right ass cheek as you spread his left. In unison you both begin to stroke his length through");
	if(modelingItem is CockPasty) output(" the pasty");
	else output(" is brown leather jockstrap");
	output(". Busky limply falls to his knees, his chest leaning against the wall. Occasionally the overworked bull lets out a moan as he mindlessly strokes his cock while you fuck his ass with your tongue. You spend minutes suckling and tongue fucking his ass, taking brief moments to slurp up any saliva you might have drooled. Eventually you finish, deciding to let Busky keep his blue balls. He rolls over, exhausted from the abuse his ass took. The bull tries to get up but collapses from exhaustion instead.");

	output("\n\nDeciding it was unfair that he hadn’t been able to indulge in the taste of your body, you open his mouth and");
	if (pc.hasCock() && !pc.hasVagina()) output("insert your [pc.biggestCockHead] into your slackjawed fuckbuddy’s throat. You start slowly, his throat almost choking your cock, but with time you begin to form a rhythm. Soon you’re gripping him by the horns and fucking him raw, pulling his head forward in tune with your thrusts. After a few long minutes of sexual fervorous thrusts you blow your load, most of it spraying out of his mouth and onto his unconscious body.");
	if (!pc.hasCock() && pc.hasVagina()) {
		output(" mount his face. As soon as you get comfortable you begin rubbing your labia against his mouth as you play with your [pc.clits]. You grab him by a horn and slowly begin to move, working yourself into a rhythm. After a few minutes of grinding yourself against him you let out a");
		if(pc.isTreated()) output(" a loud moo");
		else output(" soft moan");
		output(" as your knees begin to buckle. Your breath comes faster and shallower, gasping as you cum, spurting your [pc.girlCum] onto his face and into his mouth. Once you finish you look down at Busky’s face, which is now [pc.girlCumVisc] and [pc.girlCumColor] with your [pc.girlCum].");
	}
	if (pc.hasCock() && pc.hasVagina()) {
		output(" apply your [pc.girlCum] to your cock. After your rod");
		if (pc.hasCocks()) output("s");
		output(" are sufficiently lubed with your cunt juices you mount his face with your cunt. As soon as you get comfortable you begin rubbing your labia against his mouth as you play with [pc.eachCock]. You grip one of his horns as you use your other hand to stroke [pc.oneCock], a dollop of precum dripping onto his nose. As you slowly get worked up, you begin to lose self control, shoving your cunt into his mouth and rapidly stroking your [pc.cocks]. No less than a minute later you cry out in pure ecstasy as you spurt cum upwards, arcing and landing right back on Busky’s body and face. Although focused on your [pc.cum] flying into the air, you can’t ignore your cunt spraying Busky’s face with your [pc.girlCum]. You breathlessly cry out in the sheer force and impact of the orgasm. Taking a moment to rest, look down at the floor and see that you’ve created a");
		if (pc.cumQ() < 100) output(" small");
		else if (pc.cumQ() >= 100 && pc.cumQ() < 1000) output(" decent");
		else if (pc.cumQ() >= 1000 && pc.cumQ() < 5000) output(" large");
		else if (pc.cumQ() >= 5000) output(" enormous");
		output(" puddle of sexual fluid under Busky.");
	}
	
	output("\n\nStruggling to get up, you look at Busky, also lying on the floor, used and exhausted. For a moment you consider cleaning him up, or at least attempting to wake him. Instead you clothe yourself and head to the front of the store, looking at some products until he wakes up. After a while Busky stumbles back behind the counter");
	if (pc.hasCock() && !pc.hasVagina()) {
		output(" wiping away the cum you left on his");
		if (pc.cumQ() < 100) output(" chin.");
		else output(" body, brushing the liters onto the floor as cleaning drones struggle to take care of the mess.");
	}
	if (!pc.hasCock() && pc.hasVagina()) output(" licking your fem-lube off of his lips.");
	
	if (pc.hasCock() && pc.hasVagina()) {
		output(" licking your fem-lube off of his lips and wiping away the cum you left in his");
		if (pc.cumQ() < 100) output(" hair.");
		else output(" body, brushing the liters onto the floor as cleaning drones struggle to take care of the mess.");
	}
	
	processTime(25 + rand(10));
	pc.orgasm();
	
	if (flags["BUSKY_SEXED_TEASENDENIAL"] == undefined) buskyAdjustAffection(0.5);
	flags["BUSKY_SEXED_TEASENDENIAL"] = true;
	
	buskySexed(1);
	
	clearMenu();
	addButton(14, "Next", buskyMenu);
}

//busky’s chest worship scene, an item can be passed to show was busky is wearing
//currently supports all upper garnments sold by him, called from the model scenes
public function buskySexChestWorship(modelingItem:*):void {
	clearOutput();
	showBusky(true);
	
	if(modelingItem == null) output("You move your hand to his hulking pectorals and ask if you could go spend a bit of time appreciating his hard work. Now eagerly grinning, Busky motions for you to follow him into the changing room. As you walk in, you can see that he’s already ready to start the show.\n\n");
	output("Leaning back in your chair, you admire the performance Busky’s providing, flaunting his chiseled body for your pleasure. Flexing his arms, running his fingers along his perfectly defined pecs giving them a hard squeeze, your own personal exotic dancer. He slips one hand down to his crotch, giving his groin a decent shake as he plays with a nipple. You let out a small round of applause, clearly wanting more.");
	
	output("\n\nBusky just smiles and says, <i>“I think I’m going to make myself more comfortable,”</i> as he proceeds to strip off his top. With even the slightest movement, you can almost see his muscle fibers at work, dancing under his skin as he tosses away the");
	if (modelingItem is CornyTShirt) output(" T-shirt");
	else if (modelingItem is CowPrintedShirt) output(" cow printed shirt");
	else if (modelingItem is FishnetTop) output(" fishnet top");
	else if (modelingItem is Harness) output(" black, leather harness");
	else output(" undershirt");
	output(" that he was wearing. Even though he has his jock on, you can clearly see the outline of his New Texan package. His conditioning is obscene, the peak of human perfection. It takes you a few seconds to realize that you haven’t taken a breath since he tore off his top. You slowly regain your breath through pants, reflecting your growing arousal.");
	
	output("\n\nThe ripped bull has what looks to be a waist that is no bigger than 25”</i>. Not only that, his six-pack is extremely defined, his abdominal muscles forming deep ridges in his stomach. The hulking bull seems to enjoy having an audience, his blood clearly rushing south.");
	output("\n\nDarker than the rest of the hair on his chest and abs, you can see a thick happy trail hidden between his abs, leading down into his groin.");
	output("\n\n<i>“If you’re lookin’ for something a bit more hands on, be my guest,”</i> the bovine adonis says. You almost bolt out of your seat, but manage to act with some sense of restraint, slowly getting up. Busky’s just smiling away as he watches you try to hide your arousal. He attempts to peel the now extremely strained leather jockstrap off of his crotch, but you swiftly stop him.");
	output("\n\n<i>“Keep it in your pants for now.”</i>");
	output("\n\nBusky smirks as he resumes posing for you, one arm flexing as he strokes his abs with his calloused hand. You attempt to wrap your hands around his flexed bicep, but you don’t even come close to enveloping his massive arm. For a moment, you fantasize about being lifted by Busky, carried to wherever he wants. He could literally squish you, it would not be hard.");
	output("\n\nEntranced by his strength, you wrap your arms around his bicep, attempting to find a soft spot in the mass of muscle, but to no avail, there was no a single spot of flab. You let out small huff of arousal, quickly being replaced by a gasp of air as the large bull forcefully pulls you to him, using only a single arm to pin you to his chest.");
	output("\n\nYou struggle for a moment, your leg brushing up against his raging hard on as you try to push yourself away from the bull. You struggle against the bull, eventually working your arms up to his glorious, hairy pecs, one hand planted firmly on each. You try to push yourself away, but fail. After a moment of struggling you realize that you’re feeling up the bull’s chest. Not knowing how to feel about this predicament, you look away, your hands still groping Busky’s hulking pectorals.");
	output("\n\nFor a moment, you just stay there, looking away from Busky, standing perfectly still, no struggle, no movement. Until Busky pushes your head against his massive pecs, so close you can feel the hard drumming of his heartbeat.");
	output("\n\nTaking your hands off of his pecs, you reach around and grope his perfectly defined ass. A few quick squeezes confirm your suspicions, his ass is as toned as it is plump and fuckable. Your hands running up his back, overwhelmed by his sheer size.");
	
	output("\n\nEventually Busky lets up his grip on your head, and");
	if(pc.femininity <= 40 && !pc.hasBreasts()) output(" begins groping your ass instead. With your head free");
	output(" you’re quick to take the opportunity to fully worship his chest.");
	
	output("\n\nStarting off with his right nipple, you plant your lips on it, lightly nibbling it inciting a rather particular moan from Busky, you bite down slightly harder, confirming your suspicions that he in no way discourages nipple play, you decide to save this information for later. Your hands wander to other places, one groping the pectoral whose nipple you aren’t currently teasing, as the other plays with his ass, squeezing his cheeks and gently prodding his hole.");
	output("\n\nBut you can’t keep your hands contained to such a small area when there’s so much more to cover, you explore the rest of his body, lats, traps, deltoids, and a bunch of other muscles that you recognize, their definitions being lost in the haze of musk. Busky lets a out deep groan, clearly enjoying your worship. He closes his eyes as his head falls back.");
	output("\n\nYou stay like that for a few more minutes, playing with the musclebound bull’s strapped body. Eventually, Busky pushes you off of himself, a playful smile on his lips.");
	
	output("\n\n<i>“Okay, that’s enough for now. I’ve got to...”</i> he pauses, not out of confusion, but out of a relaxed and lustful bliss, fishing for the words out of a swamp of ecstasy, <i>“get back to work.");
	if(pc.femininity <= 40 && !pc.hasBreasts()) output(" Unless... you want to have a more, <b>thorough</b> tour of my body. How about it?");
	output("”</i>");
	
	processTime(25 + rand(10));
	pc.lust(33);
	
	if (flags["BUSKY_CHEST_WORSHIPED"] == undefined) buskyAdjustAffection(1.5);
	flags["BUSKY_CHEST_WORSHIPED"] = true;
	
	clearMenu();
	
	if(pc.femininity <= 40 && !pc.hasBreasts()) {
		buskySexNavigation(buskySexChestWorship);
	} 
	
	addButton(14, "Back", buskyMenu);
}

public function buskySexGetBlown():void {
	clearOutput();
	showBusky(true);
	
	//get index of the largest cock busky will blow for parser calls
	var cockIndex:int = buskyGetLargestBlowableCockIndex();
	
	//first blow-job
	if(flags["BUSKY_SEXED_GET_BLOWN"] == undefined) {
		output("<i>“How about a blowjob?,”</i> you ask nonchalantly as your hand gestures to his crotch, the fabric of his jockstrap slowly tightening, <i>“You seem pretty up to the idea, don’t you?”</i>");
		output("\n\nAs if to emphasise your point, you stroke his length through his brown leather jock. His calm demeanor shifts into questioning, not doubt, but consideration on his next course of action, before returning to his calm happy grin. As your hand caresses Busky’s glorious rod, you notice his breathing shallow into soft a panting as his heavy tool swells, stretching his jock to its limits.");
		
		output("\n\nAlthough he’s clearly ready, as soon as you start to pull off his jockstrap, he falls to his knees");
		if(pc.hasArmor()) output(" fiddling with your clothes until he finally gets access to your package,");
		output(" and buries his face in your crotch, your fully erect [pc.cocks] already throbbing against it.");
		
		output("\n\nOvercome by Busky’s pheromones saturating the air, it’s all you can do to lean back against the countertop, a limp smile crawling across your face as Busky presses his face against your " + GLOBAL.TYPE_NAMES[pc.cocks[cockIndex].cType].toLowerCase() + " crotch");
		if(pc.hasPerk("Pheromone Cloud")) output(", drinking in the overwhelming scent of masculinity emanating from you");
		output(".");
	
	//follow-up blow jobs
	} else {
		output("You walk up behind Busky and plant a hand on his shoulder, turning him to face you. You stare into his eyes for a moment, before slowly pushing his shoulder down, signalling him to get on his knees.");
		output("\n\n<i>“I think you know what to do,”</i> you say, your tone mostly casual with a slight domineering tinge.");
		
		if(!pc.isNude()) output("\n\nBusky fiddles with your [pc.gear] briefly, expertly gaining access to your cock. It was clear that he had done this many, many times before.");
		output(" The second he sees your cock he presses his face against it, breathing in your");
		if (pc.hasPerk("Pheromone Cloud")) output(" musky, masculine");
		output(" scent.");
	}
	
	//balls
	if (pc.balls >= 1) {
		output("\n\nBusky takes in one of your testicles into his mouth for a brief moment, before slowly pulling away, his lips sealed against your nuts. Eventually a wet popping sound emanates from Busky’s mouth as your balls swing back down to their original position. The muscleslut of a bull continues to worship your [pc.balls] as such, rotating between kissing, licking, sucking, pulling, and popping. During his ball worship, your [pc.cock " + cockIndex + "] is pressed vertically, the pulsing underside resting between his eyes.");
		output("\n\nEventually he releases your balls and starts working his way back up your cock, his tongue wrapping around your base as he works his way up your cock, lips sealing around your [pc.cockhead " + cockIndex + "]. Every drop of pre that spills from it is instantly swallowed by Busky, as he slowly takes your length deeper in, inch by inch until he bottoms out. He stops briefly to catch his breath, pulling his face off of your [pc.cockShort].");
		output("\n\nHowever, he doesn’t stop caring for your balls, as he fondles them profusely, giving them so much attention, that you’d think they were celebrity autographed.");
	
	//no balls
	} else {
		output("\n\nBusky starts at the");
		if (pc.hasSheath()) output(" [pc.sheath]");
		else output(" base of your shaft");
		if (pc.hasKnot()) output(" kissing your [pc.knot]");
		output(" before making his way up your long, glistening length. With every inch of his advance you release more and more pre, smearing your fuckbuddy’s face with your virility.");
	
		output("\n\nSoon he works his tongue all the way up, and his lips seal around your [pc.cockhead " + cockIndex + "]. Every drop of pre that spills from it is instantly swallowed by Busky, as he slowly take your length deeper in, inch by inch until he bottoms out. He stops briefly to catch his breath, pulling his face off of your [pc.cock " + cockIndex + "].");
	}
	
	//if foreskinned or human cock
	if(pc.cocks[cockIndex].hasFlag(GLOBAL.FLAG_FORESKINNED) || pc.cocks[cockIndex].cType == GLOBAL.TYPE_HUMAN) {
		output("\n\nWhile most of your pre was accessible to Busky, he found himself lusting for more. As he was catching his breath, he noticed a few drops of pre hiding under your foreskin. With a greedy smile he slides his tongue under it, swirling his tongue around your [pc.cockhead" + cockIndex + "], happily licking up your pre from under your hood. And just to be thorough, he pulls your foreskin down and wraps his lips around your length once more, sloppily slurping up a mixture of your pre and his saliva.");
	}
	
	if(pc.isTreated()) output("\n\n<i>“Swallow it all like a good little Faux");
	else output("\n\n<i>“That’s it, every drop you cumslut");
	output(",”</i> you say as you ruffle Busky’s hair.");
	
	output("\n\nWhether it’s from the humiliation of being called a");
	if(pc.isTreated()) output(" Faux");
	else output(" cumslut");
	output(", or his own perversion, Busky’s ministrations double in speed and force, almost making you fall over from sheer pleasure, however your solution is to grab onto his horns, giving you a pair of steady handlebars to hold on to while your [pc.biggestCock] gets the sucking of a lifetime. Within a few seconds you find yourself moaning in pleasure, reaching your zenith. Before nutting you force out two words.");

	output("\n\n<i>“Every... drop,”</i> you manage, thrusting as much as of your cock into Busky’s mouth as you can.");
	
	if(pc.cocks[cockIndex].cLength() < 8) output(" You push past his lips and fill his face full of your cock, while his tongue teases your cock head.");
	else if (pc.cocks[cockIndex].cLength() >= 8 && pc.cocks[cockIndex].cLength() <20) output(" You thrust all the way down to his throat, which constricts like a vice around your cock.");
	else output(" You thrust all the way down his constricting throat, until the head of your length must be pressed firmly against the entrance of his stomach.");
	
	output("\n\nYour seed begins to flow, ropes of liquid virility gushing into Busky’s");
	if (pc.cocks[cockIndex].cLength() < 8) output(" willing mouth");
	else if (pc.cocks[cockIndex].cLength() >= 8 && pc.cocks[cockIndex].cLength() < 20) output(" accepting throat");
	else output(" gullet");
	output(". Your [pc.hands] tighten, grasping the Busky’s horns with all your strength as your length throbs and pulses. Somehow though, you retain your composure, your powerful voice letting out deep groans of pleasure.");

	output("\n\nAudible gulps echo in the room as Busky swallows all of your seed.");
	output("\n\n<i>“Good boy...”</i> you force out, in the middle of your intense orgasm.");
	
	if (pc.cumQ() < 300) output("\n\nYou look down at the bull, who easily swallows all of your seed, either he’s really experienced, or your load isn’t large enough to trouble him. Either way, all of your spunk ends up in his belly.");
	else if (pc.cumQ() >= 300 && pc.cumQ() < 3000) output("\n\nGlancing down at Busky, you watch him struggle to keep up with your load. Small rivulets of your cum trickle down his chin, and his cheeks expand slightly with the last of your [pc.cumColor] nectar. As he finally swallows all of it, he pats his belly, content with his meal. But not before licking his chops, greedily lapping up the mixture of spit and cum.");
	else if (pc.cumQ() >= 3000) output("\n\nYou watch the bull holding on for dear life as your spunk forces it’s way into his stomach, the torrent of [pc.cumColor] coating his throat and filling him up. Within the first few moments of your orgasm he’s already filled to the brim, and trying to pull himself off of your cock. But your hands are still firmly grasped around his horns, holding him in place.\n\nHe looks up at you with wide, worried eyes as he struggles to pull away, but you hold him tight, forcing each spurt of cum down his throat and into his gut. You watch as his stomach expands with your cum, bloating as you force him to swallow all of your cum, until he’s well filled. The bull’s belly slowly takes on the dimensions of half of an exercise ball, with a pack of abs on top. As the last spurts of your cum die down, Busky wraps his arms around his belly, holding it tight as he slurps up the last few drops of your cum.");

	if(pc.hasVagina()) {
		output("\n\nIn unison with your cock, your cunt");
		if (pc.vaginas.length > 1) output("s");
		output(" convulse");
		if (pc.vaginas.length == 1) output("s");
		output(" and quiver");
		if (pc.vaginas.length == 1) output("s");
		output(" as you orgasm, sending rivulets of your [pc.girlCum] down your thighs.");
	}
	
	output("\n\nThe bull slowly pulls his head back, his lips still locked around your");
	if (pc.hasKnot()) output(" [pc.knot]");
	else output(" [pc.cock " + cockIndex + "]");
	output(", as he wipes your cock clean of all the saliva and cum. Once he reaches your head, a loud sloppy pop emanates from him as he slowly rises.");
	
	output("\n\n<i>“You tasted good,”</i> Busky says, his hardon still stretching his jockstrap, <i>“very [pc.cumFlavor].”</i>");
	output("\n\n<i>“Thanks,”</i> you exhaustedly sigh as you collect your belongings and head back over the counter.");
	
	processTime(25 + rand(10));
	pc.orgasm();
	chars["BUSKY"].loadInMouth(pc);
	
	if (flags["BUSKY_SEXED_GET_BLOWN"] == undefined) buskyAdjustAffection(0.5);
	flags["BUSKY_SEXED_GET_BLOWN"] = true;
	
	buskySexed(1);
	
	clearMenu();
	addButton(14, "Next", buskyMenu);
}

public function buskySexAnalPitch():void {
	clearOutput();
	showBusky(true);
	
	//get largest cock that fits
	var cockIndex:int = pc.cockThatFits(chars["BUSKY"].analCapacity());
	
	output("Having a muscular hunk of man bent over in front of you proves to be irresistible, and your legs move on their own to put you right behind the bull.");
	if(!pc.isNude()) output(" After stripping off your [pc.gear], you");
	else output(" You");
	output(" feverishly grope the bull’s muscular ass as his tail slaps you, swishing back and forth in excitement.");
	
	output("\n\nYou slowly probe a finger against his hole without attempting to penetrate, just playing with his anus. But when this gets no reaction from Busky, you choose to slip your finger in, feeling his warmth. Despite how many bulls must have been in his ass, he is still incredibly tight. You decide to change that. You slide a second, and then a third finger inside him.");
	output("\n\n<i>“C’mon, get to the main course. You know why we’re both here,”</i> Busky chuckles, his hearty laugh making you feel comfortable and at peace. You get up off your knees, and move up behind him, your [pc.cock " + cockIndex + "] pressing against his ass, and your hands groping his taut, firm cheeks.");

	output(" You");
	if (pc.isTaur()) output(" maneuver your taur body and put your front legs up on the counter, pressing your lower body against his.");
	output(" press your body against his, leaning over him and whispering into his ear.");
	
	output("\n\n<i>“Oh really?”</i> You ask. <i>“Why <b>are</b> you here?”</i>");
	output("\n\n<i>“To have sex with you, duh,”</i> he says, trying to hurry this along. You stop leaning over him and begin to prod his ass with your cock, silently poking at his hole as he smiles to himself. But before you penetrate, you stop and give his ass a nice slap.");
	output("\n\n<i>“Wrong answer. You’re here to get <b>fucked</b> by me.”</i> Another slap follows. <i>“Now beg.”</i>");
	output("\n\n<i>“Fuck me, please,”</i> he says noncommittally, trying to act as if he’s not into it yet. You quickly see through his facade.");
	
	if (pc.isTaur()) output("\n\n<i>“You don’t seem very into it, I guess I’ll leave then.”</i> But when you start to move your front legs off the counter, Busky responds, begging in desperation.");
	else output("\n\nYou slap his ass again, and a yelp of pain and pleasure escapes his lips.\n\n<i>“Not very convincing,”</i> you say, administering another slap, leaving his ass red with your handprints.");
	
	output("\n\n<i>“Fuck me like a little faux! Breed me like a cow! Please!”</i>");
	
	output("\n\nYour eyes widen at how quickly his desperation for");
	if(silly) output(" a dicking");
	else output(" cock");
	output(" escalated. But, you are a man of your word. You press your cock against the welcoming hole between his cheeks. He arches his back and you feel his hole accepting your member.");
	
	if (!pc.isTaur()) output(" You lean forward over his body, your hands stroking his hands, before gliding over to his arms and gripping his biceps, and finally working your fingers to his nipples, tweaking and playing with them. All the while,");
	else output(" You push the side of Busky’s face to the glass, pinning him to the counter while");
	output(" prodding your [pc.biggestCockHead] against his willing asshole. You know you can slip in at any time and begin fucking him raw, but instead you wait, teasing him.");

	output("\n\nYou continue to rub your [pc.cockHead " + cockIndex + "] over his anus, which is now coated with your pre. All you’re waiting for is a signal, and you finally get it when you hear a whimper of need emanate from Busky. It wasn’t over the top, but it was one of submission and pleading. You’re depriving the bull of the [pc.cockLight " + cockIndex + "] he craves, so you choose to end his torture. With one strong thrust, you shove your cock into his warm hole.");
	
	if (pc.cocks[cockIndex].cLength() > 20) output("\n\n<i>“Oh... god”</i> you hear him gasp, desperately trying to catch his breath <i>“Gi...gimmie a sec... too... too... big.”</i> Busky exhales deeply as he adjusts to your cock.");
	else if (pc.cocks[cockIndex].cLength() < 5) output("\n\n<i>“That feels really nice, you really know how to use your tool, Steele.”</i> He says, letting out a little moan of acceptance as he backs his ass up against you.");
	else output("\n\n<i>“A perfect fit,”</i> Busky turns back to you and smiles as he snuggly backs up into you. You give his ass slap of approval, but wonder how he’d react if you were bigger...");
	
	output("\n\nYou");
	if (!pc.isTaur()) output(" plant your hands firmly on his ass, your hands sinking into the muscle as your grip tightens.");
	else output(" firmly grip his horns as you press your tauric lower body against his back.");
	output(" The adonis below you lets out a loud, trembling moan, you can <i>hear</i> him quiver with pleasure. Having the ability to make this adonis of a man cry out in pleasure just from your cock is extremely erotic to you. In a haze of lust, you lose control and ram into him, forcing your pelvis against his ass, hilting inside of him. Another moan is followed by Busky’s tail wrapping around your waist, almost <i>“claiming you”</i> as his. And that only turns you on more.");
	
	if(pc.cocks[cockIndex].hasFlag(GLOBAL.FLAG_NUBBY)) output("\n\n<i>“Oh... fuck yeees. Your cock... the nubs... nmph,”</i> Busky moans in pleasure, grinding his ass back onto your cock. <i>“Just like Yancy.”</i>");
	
	output("\n\nSoon you’re ready to spill your load, and");
	if (!pc.isTaur()) output(" with a slap to his ass,");
	output(" you tell Busky to get ready for his reward. You try to focus on ramming into his prostate even harder; your goal is to make him to cum before you, tightening his ass and making your orgasm all the better.");
	if(pc.hasKnot()) output(" As Busky’s rectum clenches in preparation for orgasm, you feel yourself push back. A familiar warmth and growth starts at the base of your cock: it’s your knot, expanding. It starts to become more and more of a challenge to thrust, but you redouble your efforts and continue to ram Busky’s ass. Curious to see his reaction, you look down at him. He is now biting his knuckle, trying to stay silent. But you can tell that he’s loving every moment of it.");
	
	output("\n\nBusky’s ass");
	if(pc.hasKnot()) output(" continues");
	else output(" begins");
	output(" to clench and tighten in preparation for orgasm, but that’s not the only way you can tell.");
	
	if (!pc.isTaur()) output(" You let go of his ass cheeks and move boths hands to");
	else output(" You turn your attention to");
	output(" his throbbing rod of horsemeat, which is rubbing against the glass of the countertop, smearing the once pristine glass with his pre-coated cock.");
	
	if (!pc.isTaur()) output(" As soon as you plant your hands on his length he pushes himself off of the counter and lets out a loud trembling moan as he cums, your hands rapidly pumping his shaft, riding him through the orgasm. Busky’s ropes of cum arch into the air before landing on the countertop.");
	else output(" The friction of rubbing his cock against the glass and his abs spurs on his own orgasm. He cries out in pleasure as he cums, his spurts of liquid ivory spreading across the glass counter.");
	
	output("\n\nAs Busky cums, so do you. Gritting your teeth you let out a low, echoing growl as you continue to thrust into his vice of an ass. Your vision starts to darken around the edges as you fill his ass with your seed. Each spurt goes deep within the bull’s warm, soft hole.");

	if (pc.cumQ() < 1000) output("\n\nYou grit your teeth as you empty your load inside of him, painting his walls with your hot, thick seed. Filling him quite well.");
	else if (pc.cumQ() >= 1000 && pc.cumQ() < 5000) output("\n\nThe amount of spunk you pour into Busky is clearly enough to make an impression, as you can see him place a hand over his belly, your seed filling him to the brim.");
	else if (pc.cumQ() >= 5000) output("\n\nThe first few spurts of your seed are already enough to fill him full, but your balls are still churning, and you aren’t pulling out.\n\nHe looks back at you as he tries to get away but you hold him tight, forcing each drop of your load into his ass. You watch as his belly expands with your cum, slowly growing and growing, until he looks like he’s about to give birth.");

	output("\n\nAfter you both finish, Busky collapses on the countertop, lying in a pool of his own cum and heaving in air. You follow suit and fall " + (pc.isTaur() ? "right next to" : "on top of") + " him, still hilted inside his ass. You don’t pull out just yet, instead you take some time to rest yourself, absolutely wrecked by your orgasm. It takes a while, but you finally regain the strength to stand up.");
	
	if(pc.hasKnot()) {
		output("\n\nYou mindlessly try to pull out, only to be met with a tug of resistance, forgetting about your knot. Busky pulls his face out of the puddle cum and wipes it off with his hand, before turning back to face you.");
		output("\n\n<i>“Why aren’t you... oh yeah,”</i> he sheepishly looks away.");
		output("\n\nYou lean over and whisper into his ears that this might take a while. All he can do is nod and reply.");
		output("\n\n<i>“...I’m going to move back over to the other side of the counter, I still have to ring people up...”</i>");
		output("\n\nYou agree with him, and you both awkwardly make your way back around the counter as he activates a cleaning drone to wipe up the counter and tosses on his stock standard undershirt.");
		output("\n\nAn hour passes, with Busky trying to ring up customers as nonchalantly as possible, trying not to bring attention to the cock knotted in his ass, and the person attached to it. However, as Busky is ringing up a customer, you start to feel your knot die down, and you start to pull.");
		
		output("\n\n<i>“That’ll be fi-I-ve hundre- oof, credits,”</i> he turns back to you with pleading eyes and whispers for you to stop. But you keep trying,");
		if (!pc.isTaur()) output(" planting your hands on his ass cheeks as you push away");
		else output(" trying as hard as possible to pull yourself out of Busky. This’d be easier if you weren’t a taur");
		output(".");
		
		output("\n\n<i>“Would you-ooo, like anything... else...?”</i> he says through clenched teeth.");
		output("\n\n<i>“As a matter of fact, yes. One dose of Equilibricum please,”</i> the customer replies.");
		
		output("\n\n<i>“Alrighty,”</i> Busky forces out, bending down to pick up a vial from under the counter, as he bends over, you feel the opportunity to pull out and take it. With a loud, wet pop you push yourself off of him,");
		if (!pc.isTaur()) output(" falling onto your");
		else output(" stumbling");
		output(" back. Busky himself feels you leave, and falls to the floor, a wave of pleasure coursing over him.");
		
		output("\n\nHis hand weakly rises, plants the vial on the counter and says with a trembling voice.");
		output("\n\n<i>“It’s on the house,”</i> before he collapses on the floor.");
	}
	
	output("\n\nYou go and collect your belongings and head to the front of the store.");

	processTime(25 + rand(10));
	pc.orgasm();
	chars["BUSKY"].loadInAss(pc);
	
	if (flags["BUSKY_SEXED_ANAL_PITCH"] == undefined) buskyAdjustAffection(0.5);
	flags["BUSKY_SEXED_ANAL_PITCH"] = true;
	
	buskySexed(1);
	
	clearMenu();
	addButton(14, "Next", buskyMenu);
}

public function buskySexAnalCatch():void {
	clearOutput();
	showBusky(true);
	
	output("<i>“I’d rather be where you’re standing right now,”</i> you say coyly.");
	output("\n\nBusky gives you a toothy grin as he strips off his jockstrap, rubbing his length to full mast. You");
	if (pc.isTaur()) output(" prop your front legs up on the glass countertop");
	else output(" lean over onto the counter");
	output(" and look back at him, beckoning him with a finger. The bull cannot refuse, his hands feverishly groping your [pc.ass].");
	
	output("\n\nYou can tell he’s ready by the warm meaty rod you feel slap in between your ass cheeks. Busky pulls back, sliding his member over to your asshole, pressing his flare against your hole. But suddenly he stops. You look back at him and ask him what he’s waiting for.");
	output("\n\n<i>“Permission”</i> he says, blushing.");
	output("\n\n<i>“You have it, now fuck me raw,”</i> you reply, grinning.");
	
	output("\n\nAs soon as you say that, he presses his blunt flare against your ass, before pulling away. And then he presses it back against your ass, pushing in harder and pulling back again. This cycle continues, as he eases his cock into your [pc.asshole].");
	//do away with eventual viginity
	pc.buttChange(chars["BUSKY"].cockVolume(0), true, true, false);
	if(pc.ass.hasFlag(GLOBAL.FLAG_LUBRICATED) || pc.hasStatusEffect("Anal Lubricant")) output(" Soon your hole is covered with a sheen of your natural lubrication mixed with Busky’s pre.");
	output(" However, you grow impatient, knowing you can take the flare, and demand that he fuck you proper.");
	
	output("\n\n<i>“You sure... I mean thi-,”</i>");
	output("\n\n<i>“Shut up and fuck me!”</i>");
	
	output("\n\nBusky then hilts his cock fully, flare, medial ring, and all.");
	
	output(" Your eyes widen; you didn’t expect him to hilt! He wastes no time as he begins to pump himself in and out of you");
	if(pc.ass.looseness() <= 2) output(" so quickly that your [pc.asshole] barely has time to adjust.");
	else if (pc.ass.looseness() > 2 && pc.ass.looseness() <= 4) output(" steadily speeding up. Whatever resistance your sphincter once had pales in comparison to the power of his thrusts");
	else if (pc.ass.looseness() > 4) output(" at a rapid pace, but your [pc.asshole] takes it easily");
	output(". With every thrust you can feel him going harder and harder. His flare grinds against your");
	if (pc.hasVagina()) output(" G-spot, and a wave of pleasure courses through your body.");
	else output(" prostate, forcing a stream of pre to dribble out of your cock as pleasure courses through your body.");

	output("\n\nYour moans grow louder as Busky’s big veiny horsecock hilts inside of you, over over again, sending lightning bolts of pleasure through your body. You try to speak, to cry out for him to fuck you faster and harder, but the only sounds you can muster are a slew of disjointed vowels, followed by your standard cries of pleasure. Luckily, your moans seem to get your point across, as the louder you become, the harder he fucks you.");
	output("\n\nWith one final, powerful thrust, he rams hard into your prostate, causing both of you to cum in unison, his four balls churning and filling your ass with his horse <i>“glue”</i>. You writhe and arch your back, unable to control your pleasure. A deep moan of satisfaction slides out of your mouth as your belly slightly bulges, Busky’s load filling you to the brim.");
	output("\n\nYou and Busky stand there, gasping for air in the afterglow of your orgasm, his cock still hilted inside you, preventing his seed from escaping. But all good things must come to an end, and he pulls out of you, his seed pouring out of your hole. You lie there for a few more minutes, unhappy with the new emptiness of your ass, having already become accustomed to Busky’s size.");
	output("\n\nBusky taps your shoulder, and you look up. He’s giving you a happy, toothy grin, his hands extended, handing you your gear.");
	output("\n\n<i>“Here ya go!”</i> Busky cheerfully exclaims as a cleaning drone cleans up the mess the two of you left on the floor.");
	output("\n\nYou return his smile, take your gear, and head back to the front of the store.");

	processTime(25 + rand(10));
	pc.orgasm();
	pc.loadInAss(chars["BUSKY"]);
	
	if (flags["BUSKY_SEXED_ANAL_CATCH"] == undefined) buskyAdjustAffection(0.5);
	flags["BUSKY_SEXED_ANAL_CATCH"] = true;
	
	buskySexed(1);
	
	addButton(14, "Next", buskyMenu);
}

//set up busky's shop with custom text + some date dependent items 
public function buskyShopInitialization():void {
	shopkeep = chars["BUSKY"];
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	
	chars["BUSKY"].keeperBuy = "As you examine the wall of mods, their prices, and effects you can";
	if(pc.femininity <= 40) chars["BUSKY"].keeperBuy += " occasionally catch Busky taking glances at your [pc.ass]. He realizes you caught him eyeing your ass and blushes.\n";
	else chars["BUSKY"].keeperBuy += " hear the occasional banter in the background. Usually a bull using a cheesy pickup line on a cow.\n";
	
	// Unlockables
	if(StatTracking.getStat("milkers/prostate milker uses") > 0)
	{
		if(!chars["BUSKY"].hasItemByClass(SumaCream)) chars["BUSKY"].inventory.push(new SumaCream());
		CodexManager.unlockEntry("Suma Cream");
	}
	else chars["BUSKY"].destroyItemByClass(SumaCream, -1);
	
	//During christmas season sell extra stuff
	if (isChristmas()) {
		//make sure this is not added everytime you visit him
		if(!chars["BUSKY"].hasItemByClass(Nutnog)) chars["BUSKY"].inventory.push(new Nutnog());
		if(!chars["BUSKY"].hasItemByClass(Peckermint)) chars["BUSKY"].inventory.push(new Peckermint());
	}
	else
	{
		chars["BUSKY"].destroyItemByClass(Nutnog, -1);
		chars["BUSKY"].destroyItemByClass(Peckermint, -1);
	}
}

//Buy mods from Busky - call regular shop interface
public function buyModsFromBusky():void {
	buskyShopInitialization();
	buyItem();
}

//Calculate item price from base price and sellMark Up from Busky.as
public function getBuskyPrice(item:*):Number {
	//return Math.round(item.basePrice * chars["BUSKY"].sellMarkup);
	return Math.round(item.basePrice);
}

//Buy some cloths from Busky - custom menu as all pieces of clothing have a sub menu
public function buskyClothesMenu():void {
	clearOutput();
	showBusky();
	
	output("Strewn about the clothes section are mannequins, all modeled after extremely buff bulls. In the center of the displays of the store is a blue hardlight mannequin, just as buff as the rest, but unlike the others, the fact that it actually has a face, a quite attractive one at that.");
	output("\n\nThe hardlight hunk cycles through a set of preselected poses. Fluidly shifting between stretching the elastic of his jockstrap, to running his fingers across his abs, to even doing pushups. The mannequin’s crotch also bulges whenever a cow walks within a few feet of it.");
	
	clearMenu();
	addOverrideItemButton(0, new PlainUndershirt(), "Undershirt", buskyClothingItemOptions, new PlainUndershirt());
	addOverrideItemButton(1, new CornyTShirt(), "CrnyTShirt", buskyCornyTShirtOptions);
	addOverrideItemButton(2, new FishnetTop(), "NetTop", buskyClothingItemOptions, new FishnetTop());
	addOverrideItemButton(3, new Harness(), "Harness", buskyClothingItemOptions, new Harness());
	addOverrideItemButton(4, new HorseshoeBoxers(), "HorseBxs", buskyClothingItemOptions, new HorseshoeBoxers());
	addOverrideItemButton(5, new CockPasty(), "CockPasty", buskyClothingItemOptions, new CockPasty());
	addOverrideItemButton(6, new FishnetBriefs(), "NetBriefs", buskyClothingItemOptions, new FishnetBriefs());
	addOverrideItemButton(7, new MaleTights(), "GuyTights", buskyClothingItemOptions, new MaleTights());
	addOverrideItemButton(8, new BullsJockstrap(), "BullStrap", buskyClothingItemOptions, new BullsJockstrap());
	addOverrideItemButton(9, new CowPrintedShirt(), "CowShirt", buskyClothingItemOptions, new CowPrintedShirt());
	addOverrideItemButton(10, new CowPrintedShorts(), "CowShorts", buskyClothingItemOptions, new CowPrintedShorts());
	
	addButton(14,"Back",mainGameMenu);
}

//purchase a particular clothing item, can't use regular shop 
//interface since each item has additional talk options
public function purchaseClothesFromBusky(purchaseItem:*):void {
	clearOutput();
	showBusky();
	
	output("You transfer the credits.\n\n");
	//pay for item
	pc.credits -= getBuskyPrice(purchaseItem);
	
	//pack item into loot
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = purchaseItem;
	
	//collect loot and redirect to busky's clothes selection
	lootScreen = buskyClothesMenu;
	itemCollect(foundLootItems);
}

//some of Busky's items can be purchased with a 'pre-pocket', this function
//flags them automatically on purchase - not available for all items
public function purchasePrePocketClothesFromBusky(purchaseItem:*):void {
	clearOutput();
	showBusky();
	
	output("You transfer the credits.\n\n");
	//buy for regular price with additional 7000
	pc.credits -= getBuskyPrice(purchaseItem) + 7000;
	
	//add item flag
	purchaseItem.basePrice += 7000;
	purchaseItem.hasRandomProperties = true;
	//purchaseItem.addFlag(GLOBAL.ITEM_FLAG_PREPOCKET_EQUIPPED);
	
	//pack item into loot
	var foundLootItems:Array = new Array();
	foundLootItems[foundLootItems.length] = purchaseItem;
	
	//collect loot and redirect to busky's clothes selection
	lootScreen = buskyClothesMenu;
	itemCollect(foundLootItems);
}

//describes a single clothing item + prints buy + model options
public function buskyClothingItemOptions(item:*):void {
	clearOutput();
	showBusky();
	
	output("Your glance falls onto " + item.description + ". Curious you pick it up, feeling the texture and quality of it. You press it against your body, wondering if it’d look good on you.");
	if (flags["BUSKY_TALKED_ABOUT_MODELING"]) output(" On the other hand, you have Busky to model it for you...");
	else output(" If only you had someone to model it.");
	
	output("\n\nYou look the " + item.longName + " over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
	
	clearMenu();
	
	if (pc.credits >= getBuskyPrice(item)) addOverrideItemButton(0, item, "Buy", purchaseClothesFromBusky, item);
	
	if(flags["BUSKY_TALKED_ABOUT_MODELING"] == undefined) addDisabledButton(1, "Model", "Model", "Maybe you could ask Busky about modeling.");
	else addButton(1, "Model", buskyModelsClothingItem, item, "Modeling", "Head to the changing room with Busky and have him try this on.");
	
	/*if(flags["BUSKY_SEXED_COUNT"] > 0 && (item is MaleTights || item is HorseshoeBoxers || item is BullsJockstrap || item is CowPrintedShorts)) {
		addButton(2, "PrePocket", buskytalksAboutPrePocket, item, "PrePocket", "Bring this underwear to Busky and ask about upgrading it with a pre-pocket.");
	}*/
	
	addButton(14,"Back", buskyClothesMenu);
}

//special screen for the corny shirt, since it comes with different pick-up lines
public function altDescriptionCornyTShirt(variant:int = 0):String
{
	var descriptionLine:String = "";
	
	//determine PickupLine to be appended to the description
	switch(variant)
	{
		case 1:
			descriptionLine = "‘Everything’s bigger in New Texas! Take a look’ and followed by an arrow pointing down";
			break;
		case 2:
			descriptionLine = "‘Wrangling Varmints is easy! Let’s see if you are’";
			break;
		case 3:
			descriptionLine = "‘It ain’t hard to pick up horseback ridin’ How bout I pick you up for some horse<i>cock</i> ridin’’";
			break;
		case 4:
			descriptionLine = "‘I can help you saddle a horse. So long as you straddle my face.’";
			break;
		case 5:
			descriptionLine = "‘You do look mighty fine, are ya up for some 69?’";
			break;
		case 6:
			descriptionLine = "‘Sorry ‘bout the mess, I just got back from the cockmilkers. Actually I’m feeling full again, wanna help out?’ and decorated with authentic cumsplat-print";
			break;
		default:
			descriptionLine = "a corny pick-up line";
			break;
	}
	
	return descriptionLine;
}
public function altTooltipCornyTShirt(variant:int = 0):String
{
	var tooltip:String = "A black T-shirt with a new Texan pickup line on the front, generally used by bulls to pick up cows with as little spoken words as possible. The white text may seem vulgar on other planets, but there is no doubting its effectiveness on New Texans.";
	var tooltipLine:String = "";
	
	//partly like its 1999 - or before css was commonplace 
	//add &nbsp; like a hobo to emulate centered text in tooltip body
	switch(variant)
	{
		case 1:
			tooltipLine = "\n\t&nbsp;&nbsp;&nbsp;&nbsp;<b>Everything’s bigger in New Texas!</b>\n\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Take a look</b>\n\n&nbsp;&nbsp;&nbsp;(Beneath the text is an arrow pointing down.)\n";
			break;
		case 2:
			tooltipLine = "\n\t\t&nbsp;&nbsp;<b>Wrangling Varmints is easy!\n<b>\t\t\t</b>Let’s see if you are</b>\n\n";
			break;
		case 3:
			tooltipLine = "\n\t<b>It ain’t hard to pick up horseback ridin’</b>\n\t\t&nbsp;&nbsp;<b>How bout I pick you up for</b>\n\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>some horse<i>cock</i> ridin’’</b>\n\n";
			break;
		case 4:
			tooltipLine = "\n\t\t<b>I can help you saddle a horse.</b>\n\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>So long as you straddle my face.</b>\n\n";
			break;
		case 5:
			tooltipLine = "\n\t\t<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You do look mighty fine,</b>\n\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>are ya up for some 69?</b>\n\n";
			break;
		case 6:
			tooltipLine = "\n\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Sorry ‘bout the mess,</b>\n\t&nbsp;&nbsp;&nbsp;&nbsp;<b>I just got back from the cockmilkers.</b>\n&nbsp;&nbsp;&nbsp;<b>Actually I’m feeling full again, wanna help out?</b>\n\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Beneath the text is some cumsplat-print.)\n";
			break;
	}
	
	if(tooltipLine != "") return (tooltip + " This one reads:\n" + tooltipLine);
	return tooltip;
}
public function buskyCornyTShirtOptions():void {
	clearOutput();
	showBusky();
	
	var plainShirt:CornyTShirt = new CornyTShirt();
	var shirtVariation1:CornyTShirtV1 = new CornyTShirtV1();
	var shirtVariation2:CornyTShirtV2 = new CornyTShirtV2();
	var shirtVariation3:CornyTShirtV3 = new CornyTShirtV3();
	var shirtVariation4:CornyTShirtV4 = new CornyTShirtV4();
	var shirtVariation5:CornyTShirtV5 = new CornyTShirtV5();
	var shirtVariation6:CornyTShirtV6 = new CornyTShirtV6();
	
	output("Your glance falls onto " + plainShirt.description + ". Curious you pick it up, feeling the texture and quality of it. You press it against your body, wondering if it’d look good on you.");
	if (flags["BUSKY_TALKED_ABOUT_MODELING"]) output(" On the other hand, you have Busky to model it for you...");
	else output(" If only you had someone to model it.");
	
	//Corny Line specific text
	output("\n\nLooking around for a moment you find there are a number of shirts all with different lines. After some searching you find T-shirts with the following messages:");
	output("\n");
	//put custom text for this item, as the default looks good only on the appearance/buy screen
	output("\n‘Everything’s bigger in New Texas! Take a look’ (followed by an arrow pointing down)");
	output("\n" + altDescriptionCornyTShirt(2));
	output("\n" + altDescriptionCornyTShirt(3));
	output("\n" + altDescriptionCornyTShirt(4));
	output("\n" + altDescriptionCornyTShirt(5));
	//put custom text for this item, as the default looks good only on the appearance/buy screen
	output("\n‘Sorry ‘bout the mess, I just got back from the cockmilkers. Actually I’m feeling full again, wanna help out?’ (decorated with authentic cumsplat-print)");
	
	output("\n\nYou look the " + plainShirt.longName + "s over and consider your options. The holographic price tag says " + getBuskyPrice(plainShirt) + " credits.");
	
	clearMenu();
	
	//simplified check, since all have the same price anyway
	if (pc.credits >= getBuskyPrice(plainShirt)) {
		addOverrideItemButton(0, shirtVariation1, "BuyV1", purchaseClothesFromBusky, shirtVariation1);
		addOverrideItemButton(1, shirtVariation2, "BuyV2", purchaseClothesFromBusky, shirtVariation2);
		addOverrideItemButton(2, shirtVariation3, "BuyV3", purchaseClothesFromBusky, shirtVariation3);
		addOverrideItemButton(3, shirtVariation4, "BuyV4", purchaseClothesFromBusky, shirtVariation4);
		addOverrideItemButton(4, shirtVariation5, "BuyV5", purchaseClothesFromBusky, shirtVariation5);
		addOverrideItemButton(5, shirtVariation6, "BuyV6", purchaseClothesFromBusky, shirtVariation6);
	} else {
		addDisabledButton(0, "BuyV1", "Buy V1", "You will need " + getBuskyPrice(plainShirt) + " credits to by this t-shirt.");
		addDisabledButton(1, "BuyV2", "Buy V2", "You will need " + getBuskyPrice(plainShirt) + " credits to by this t-shirt.");
		addDisabledButton(2, "BuyV3", "Buy V3", "You will need " + getBuskyPrice(plainShirt) + " credits to by this t-shirt.");
		addDisabledButton(3, "BuyV4", "Buy V4", "You will need " + getBuskyPrice(plainShirt) + " credits to by this t-shirt.");
		addDisabledButton(4, "BuyV5", "Buy V5", "You will need " + getBuskyPrice(plainShirt) + " credits to by this t-shirt.");
		addDisabledButton(4, "BuyV6", "Buy V6", "You will need " + getBuskyPrice(plainShirt) + " credits to by this t-shirt.");
	}
	
	if(flags["BUSKY_TALKED_ABOUT_MODELING"] == undefined) addDisabledButton(6, "Model", "Model", "Maybe you could ask Busky about modeling.");
	else addButton(6, "Model", buskyModelsClothingItem, plainShirt, "Modeling", "Head to the changing room with Busky and have him try this on.");
	
	addButton(14,"Back", buskyClothesMenu);
}

// 9999 screen where busky talks about the pre pocket + option to buy the prepocket version (not yet implemented)
public function buskytalksAboutPrePocket(item:*):void{
	clearOutput();
	showBusky();
	
	output("<i>“Essentially, I hook up the ultra-elastic to repulsion particles inside the cloth. This makes it so any preemptive cock juices you’re spilling will stay in a ‘pocket’ in front of your crotch, expanding to a point, and never staining the cloth. And when you’re ready to release the flood of masculinity you’ve got pouring out of your crotch, all you’ve got to do it take it off and let it spill.”</i> Busky explains, with a hint of pride in his voice. You wonder how a treated bull could come up with something so advanced. <i>“Anyway, if you want a Pre Pocket upgrade you’ll need to add 7000 credits to your current purchase, the technology isn’t cheap.”</i>");
	
	clearMenu();
	
	if (pc.credits >= getBuskyPrice(item)) addButton(0, "BuyNormal", purchaseClothesFromBusky, item, "Buy normal", "Stick to the regular version.");
	if (pc.credits >= getBuskyPrice(item) + 7000) addButton(1, "BuyPrePocket", purchasePrePocketClothesFromBusky, item, "Buy PrePocket version", "Go for the upgraded version.");
	
	addButton(14,"Back", buskyClothesMenu);
}

//busky models different clothing items, has specific descriptions for all clothing items he sells
//also prints a buy button + other buttons depending on item
public function buskyModelsClothingItem(item:*):void {
	clearOutput();
	showBusky();
	
	//model the plain undershirt
	if(item is PlainUndershirt) {
		output("<i>“You can’t go wrong this, heh,”</i> Busky gestures to the plain white short sleeveless undershirt. The white cloth hugs his torso perfectly, showing off his pecs");
		if (pc.femininity <= 40) output(" abs and slowly hardening nipples");
		else output(" and abs");
		output(". Busky flexes his arms as he turns his back to you, giving you a view of his back. There are no baggy spots on the shirt at all.");
		
		output("\n\n<i>“It’s a classic, it breathes great, and it’s so cheap that if you ever break it");
		if (pc.femininity <= 40) output(" we’ll hook u- I mean,");
		output(" I’ll hook you up with whatever you want. It only comes as is. The one you’re holding right now is sleeveless, better suited for working out. More freedom in the arm department, y’know. So, lookin’ to purchase?");
		if (pc.femininity <= 40) output(" Or...”</i> Busky teases as he rubs his hands up and down his chest, occasionally giving a nipple slight pinch. <i>“Are you looking for something a little more hands on?");
		output("”</i>");
		
		output("\n\nYou look the undershirt over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_PLAINSHIRT"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_PLAINSHIRT"] = true;
		
		addButton(1, "ChestWorship", buskySexChestWorship, item, "Chest Worship", "Worship the chest of the muscular adonis.");
	
	//model the corny t-shirt
	} else if(item is CornyTShirt) {
		output("<i>“Why bother telling a cow to get on her knees,”</i> Busky pauses, waiting to get out of the changing room, <i>“when you can just have it written on your shirt instead... provided they can read,”</i> Busky says as he pops out of the room wearing a black T-Shirt.");
		output("\n\nIn a brief moment of confusion you glance back at the T-Shirts on the shelves of the store, which all looked as if they’d barely fit on Busky’s left bicep, let alone his whole body. Despite your previous observations however, the shirt fits perfectly, clutching his toned torso. Busky raises and flexes both of his arms, giving you a clear view of his biceps, which are also hugged by his second skin of a shirt. No inch of skin is untouched by the taut fabric.");
		output("\n\n<i>“Oh yeah, all of the shirts we have in stock are made from a special hyperelastic material; we can order them small, so when worn, they’ll hold you tighter than the thighs of a cow straddling a bull in the middle of a milkin’.”</i>");
		output("\n\n<i>“However do keep in mind we don’t have any plain T-Shirts, so you’ll have to settle with New Texan pickup lines. Keep in mind, said pick-up lines might not be appreciated outside of NT, but round here they can work on just about any cow, and maybe a few bulls after a drink or two.”</i>");
		output("\n\nYou look the T-shirt over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_CORNYSHIRT"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_CORNYSHIRT"] = true;
		
		addButton(1, "ChestWorship", buskySexChestWorship, item, "Chest Worship", "Worship the chest of the muscular adonis.");
	
	//model the fishnet top
	} else if(item is FishnetTop) {
		output("<i>“Fishnet Top? Well that’s a kinky pick, be right back,”</i> Busky says as he heads into the changing room.");
		output("\n\nYou stand around for a moment, twiddling your thumbs as you await your model. Glancing back at the few other customers. Suddenly Busky’s voice booms from the room.");
		output("\n\n<i>“It’s extremely revealing,”</i> he says as he steps out of the room, <i>“But it looks good on me, wouldn’t you agree?”</i>");
		output("\n\nWhile a bit of a self centered comment, you’d have to agree the shirt does look good on the bull. The black fabric hides nothing on the him, allowing you to clearly see every inch of his robust body as the cloth hugs him like a second skin.");
		
		output("\n\n<i>“No better clothes for an exhibitionist than fishnets; as you can see, it really doesn’t leave much to the imagination. Since it’s a one size fits all, it’ll just hug tighter the bigger you get. And you won’t find anywhere that sells it cheaper. I like to throw one on once in awhile myself, usually when I’m hooking up with someone.");
		if (pc.femininity <= 40) output("Feels really good against my crotch, among other things...");
		output("”</i>");
		
		output("\n\nYou look the fishnet top over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_FISHNETTOP"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_FISHNETTOP"] = true;
		
		addButton(1, "ChestWorship", buskySexChestWorship, item, "Chest Worship", "Worship the chest of the muscular adonis.");
	
	//model the cow print shirt
	} else if(item is CowPrintedShirt) {
		output("<i>“Cow print shirt, got it,”</i> Busky quips before he slips into the changing room. <i>“You’d think these shirts’d be pretty popular, and they are. But I’ve met a couple cows that take to getting real tattoos of cow print on their body. Anyway, I’m ready,”</i> Busky says as he finishes his short anecdote. You watch the musclebound behemoth step out of the room, the cow print shirt assuming its role as a second skin.");
		output("\n\nIn a brief moment of confusion you glance back at the shirts on the shelves of the store, which all looked as if they’d barely fit on Busky’s left bicep, let alone his whole body. Despite your previous observations however, the shirt fits perfectly, clutching his toned torso. Busky raises and flexes both of his arms, his armpits also hugged by his second skin of a shirt. No inch of his skin is untouched by the vacuum sealed fabric.");
		output("\n\n<i>“Oh yeah, all of the shirts we have in stock are made from a special hyperelastic material; we can order them small, so when worn, they’ll hold you tighter than the thighs of a cow straddling a bull in the middle of a milkin’.”</i>");
		
		output("\n\nYou look the T-shirt over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_COWPRINTEDSHIRT"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_COWPRINTEDSHIRT"] = true;
		
		addButton(1, "ChestWorship", buskySexChestWorship, item, "Chest Worship", "Worship the chest of the muscular adonis.");
	
	//model the harness
	} else if(item is Harness) {
		output("<i>“Oh ho ho, I see you have some kinkier tastes,”</i> Busky chuckles as he grabs one and slides into the dressing room. Within a minute he’s already busting through the door, flexing his arms.");
		output("\n\n<i>“As you can see,”</i> Busky says in between different poses, <i>“there are 4 straps crossing your body, with 2 rings on both sides that the straps are connected to.”</i>");
		output("\n\nBusky flaunts his masculinity");
		if (pc.femininity <= 40) output(" as he suggestively rolls his hips towards you");
		output(". Smirking, you ask why he’s not a stripper, since he’s certainly got the body for it. He simply disregards your question with a knowing smile.");
		output("\n\n<i>“Anyway,”</i> he exhales, <i>“the final strap leads down to another ring, not too hard to figure out where that goes.”</i> Busky gestures to his jockstrap <i>“Anyway, it’s pretty costly, and only comes in this one style, no other colors. It’s also incredibly durable.");
		output(" Although, if you have any doubts... you and I could test the strength of this baby.");
		output("”</i>");
		
		output("\n\nYou look the Harness over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_HARNESS"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_HARNESS"] = true;
		
		addButton(1, "ChestWorship", buskySexChestWorship, item, "Chest Worship", "Worship the chest of the muscular adonis.");
	
	//model the horseshow boxers
	} else if(item is HorseshoeBoxers) {
		output("<i>“Oh, so you want to look at my junk eh? Well I simply can’t refuse can I?”</i> Busky ducks into the changing room, quickly changing from his jockstrap. In under a minute he emerges out of the room adjusting the waistband of the boxers.");
		output("\n\n<i>“Yeah, they’re a bit off-putting with their waistband, but once you get used to that, they’re pretty damn comfy.”</i> The bull smirks as he grabs his crotch through the baggy fabric. <i>“Tons of space");
		if (pc.femininity <= 40) output(" for an under the cloth handjob.”</i>");
		else output(" too.”</i>");
		if (pc.femininity <= 40) output(" As you look over the pair he’s wearing he tosses a second pair of boxers at you as you’re distracted by his merchandise, you fail to catch them and they land on your face, the scent of a day long workout permeating around your head. <i>“Hey, underwear belongs on your waist... or on the floor,”</i> the musclebound bull teases.”</i> You bunch up the boxers and throw them back at him.");
	
		output("\n\nThe cloth of the fabric seemed to flow smoothly, just barely tight enough around the waist, and then baggy and loose everywhere else. The boxers themselves are white, with images of bronze horseshoes scattered around.");
		
		output("\n\n<i>“Anyway, they’re really comfy, especially if your boys need to breathe,”</i> he says he readjusts his quartet of grapefruit sized balls.");
		if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] == true && flags["BUSKY_SEXED_COUNT"] >= 1) {
			output(" Oh, and don’t forget about Pre Pocket, that’s always an option. If you need a refresher, just ask.");
		}
		else output(" Oh, and the ultra-elastic is extremely durable.");
		output("”</i>");
		
		output("\n\nYou look the boxers over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_HORSESHOEBOXERS"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_HORSESHOEBOXERS"] = true;
		
		if(pc.isTaur() || !pc.hasCockOrStrapOrClit()) addDisabledButton(1, "Tease&Denial", "Tease ‘n’ Denial", "Requires a cock, a large enough clit or a strapon. You can’t be a Taur either.");
		else addButton(1, "Tease&Denial", buskySexTeaseAndDenial, item, "Tease ‘n’ Denial", "Go for a round of teasing, including analingus, nipple play, and asshole prodding.");
		
		//show only when sexed Busky - uncomment when prePocket mechanic added
		//if(flags["BUSKY_SEXED_COUNT"] > 0) addButton(1, "PrePocket", buskytalksAboutPrePocket, item, "PrePocket", "Ask Busky about adding a PrePocket.");
		
	//model the cock pasty
	} else if(item is CockPasty) {
		output("<i>“Huh, so you want me to try on a cock pasty? Gotcha, be right back.”</i>");
		output("\n\nBusky takes a cock pasty and disappears into the dressing room. He reappears shortly wearing his standard undershirt gripping his core, giving you a clear outline of his muscles. And on his lower body, seemingly nothing, other than a large-yet-detailed bulge where his junk once was, which is obviously the work of the cock pasty. It completely covers his cock and balls, but grips him so tightly you swear it seems vacuum sealed, the outline of his veins pulsing and pumping blood to his slowly growing member.");
		output("\n\n<i>“Erm, sorry. These things are really tight and I’m really sensitive. Ahem, as you can see,”</i> Busky says as he turns around presenting you with his toned ass. <i>“They leave much more mobility for the wearer, automatically match the color of your skin or fur, and essentially make you look like a bulgy Ken doll.”</i> He bends over, presenting you with his asshole, as the pasty stretches to accommodate more of his growing cock flesh. <i>“Not to mention the elasticity allows them to be stretched to 20x their original size, and they’ll still be as tight as a factory new model.”</i>");
		output("\n\nYou look the pasty over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_COCKPASTY"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_COCKPASTY"] = true;
	
	//model fishnet briefs
	} else if(item is FishnetBriefs) {
		output("<i>“Allow me to demonstrate,”</i> Busky says as he grabs a pair of fishnet briefs and leaves to go get changed. After a moment he reappears wearing the briefs, clearly hugging his ass and crotch tightly. The undergarment looks less like clothing, and more along the lines of cloth wire, hoisting up his hefty balls as they’re displayed clearly to any present observers.");
		output("\n\n<i>“Little to the imagination indeed. As you can plainly see, I can’t hide anything in this.”</i> He gestures to his crotch, with his member and bulbous balls both plainly visible. <i>“But that’s the point, isn’t it?”</i> A smirk crawls up his face.");
		output("\n\n<i>“And they’re hyper elastic too, watch.”</i>");
		output("\n\nBusky spreads his legs, giving you a clear view of his four grapefruit sized balls, as they stay firmly pressed against his crotch as his tail swishes between his legs.");
		output("\n\n<i>“They’ll grip you tighter than the cunt of a cow in the middle of a milker orgasm. But don’t worry, the fabric is soft enough, and it definitely won’t chafe you.”</i>");
		output("\n\nYou look the fishnet briefs over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_FISHNETBRIEFS"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_FISHNETBRIEFS"] = true;
	
	//model male tights
	} else if(item is MaleTights) {
		output("<i>“Sorry, er, not much space in these things,”</i> he says as he picks at the pants, trying to redirect pressure elsewhere. Embarrassed, he turns around. giving you a clear view of his muscular, perfectly toned ass, as he tries to tuck away his massive member.");
		output("\n\nBusky throws his arms up in frustration as he turns around. <i>“I give up. I don’t even know why I have these in stock. Anyway, stare as much as you’d like, you wanted me to model it anyway. They’re not too different from your standard briefs. Just longer and better for the winters, but we don’t get those in New Texas anyway. The ultra-elastic is extremely durable.");
		/*
		if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] != true && flags["BUSKY_SEXED_COUNT"] >= 1){
			output(" And they can some with a little enhancement I’ve invented. I call it Pre Pocket. I can go into the details if you want, or you can just buy the tights as is.");
		} else if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] == true && flags["BUSKY_SEXED_COUNT"] >= 1){
			output(" Oh, and don’t forget about Pre Pocket, that’s always an option. If you need a refresher, just ask.");
		}
		*/
		output("”</i>");
		output("\n\nYou look the tights over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_MALETIGHTS"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_MALETIGHTS"] = true;
		
		//show only when sexed Busky - uncomment when prePocket mechanic added
		//if(flags["BUSKY_SEXED_COUNT"] > 0) addButton(1, "PrePocket", buskytalksAboutPrePocket, item, "PrePocket", "Ask Busky about adding a PrePocket.");
	
	//model bulls jockstrap
	} else if(item is BullsJockstrap) {
		output("<i>“As you can see, I’m already wearing one,”</i> Busky states as he turns 360°, giving you a nice view of his ass and crotch. Busky’s junk stayed put, barely moving as he tried wiggling his massive slab of cockmeat.");
		output("\n\n<i>“These babies provide simply the best in support, especially when you’re working out, in the gym or in bed. Generally us bulls have to worry about our balls flopping everywhere when we’re trying to look our best, but these things make that a trivial matter. They’re actually a popular choice for bulls to wear outside of the gym. Personally, I’m either wearing a jockstrap or nude.”</i>");
		if (pc.femininity <= 40) output("\n\nBusky pauses for a moment. <i>“Or, when I have somebody over. I have such a large stock, I can satisfy many kinks.”</i> He emphasizes the <i>“stock”</i>. You can’t tell if he’s hitting on you, or just bragging about his quartet of grapefruit size balls.");
		/*
		if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] != true && flags["BUSKY_SEXED_COUNT"] >= 1){
			output(" And they can some with a little enhancement I’ve invented. I call it Pre Pocket. I can go into the details if you want, or you can just buy the jockstrap as is.");
		} else if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] == true && flags["BUSKY_SEXED_COUNT"] >= 1){
			output(" Oh, and don’t forget about Pre Pocket, that’s always an option. If you need a refresher, just ask.");
		}
		*/
		output("”</i>");
		
		output("\n\nYou look the jockstrap over and consider your options. The holographic price tag says " + getBuskyPrice(item) + " credits.");
		
		if (flags["BUSKY_MODELLED_JOCKSTRAP"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_JOCKSTRAP"] = true;
		
		//show only when sexed Busky - uncomment when prePocket mechanic added
		//if(flags["BUSKY_SEXED_COUNT"] > 0) addButton(1, "PrePocket", buskytalksAboutPrePocket, item, "PrePocket", "Ask Busky about adding a PrePocket.");
		
	//model cow print shirts	
	} else if(item is CowPrintedShorts) {
		output("<i>“Cow print, eh? I’ll be quick,”</i> Busky ducks into the changing room, quickly changing from his jockstrap. In under a minute he emerges out of the room adjusting the waistband of the shorts.");
		output("\n\n<i>“They’re pretty damn comfy,”</i> the bull smirks as he grabs his crotch through the baggy fabric. <i>“Tons of space");
		if (pc.femininity <= 40) output(" for an under the cloth handjob.");
		else output(", too.");
		output("”</i>");
		output(" The cloth of the fabric seems to flow smoothly, just barely tight enough around the waist, and then baggy and loose everywhere else. The shorts themselves are white, with a couple patches of black scattered around, emulating a cow’s hide.");
		
		output("\n\n<i>“Anyway, they’re really roomy, great if your boys need to breathe,”</i> he says as he readjusts his quartet of grapefruit sized balls. <i>“Oh, and the ultra-elastic is extremely durable.");
		/*
		if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] != true && flags["BUSKY_SEXED_COUNT"] >= 1){
			output(" And they can some with a little enhancement I’ve invented. I call it Pre Pocket. I can go into the details if you want, or you can just buy the tights as is.");
		} else if (flags["BUSKY_TALKED_ABOUT_PREPOCKET"] == true && flags["BUSKY_SEXED_COUNT"] >= 1){
			output(" Oh, and don’t forget about Pre Pocket, that’s always an option. If you need a refresher, just ask.");
		}
		*/
		output("”</i>");
		
		if (flags["BUSKY_MODELLED_COWPRINTEDSHORTS"] == undefined) buskyAdjustAffection(0.5);
		flags["BUSKY_MODELLED_COWPRINTEDSHORTS"] = true;
		
		//show only when sexed Busky - uncomment when prePocket mechanic added
		//if(flags["BUSKY_SEXED_COUNT"] > 0) addButton(1, "PrePocket", buskytalksAboutPrePocket, item, "PrePocket", "Ask Busky about adding a PrePocket.");
	}
	
	processTime(3);
	
	if (pc.credits >= getBuskyPrice(item)) addButton(0, "Buy", purchaseClothesFromBusky, item, item.shortName, item.tooltip);
	
	//overwrite button for CornyTShirt - go to TShirt selection instead
	if(item is CornyTShirt) addButton(0, "Buy", buskyCornyTShirtOptions, undefined, item.shortName, item.tooltip);
}

//menu for busky's interactions at the ten ton gym
public function buskyWorkoutMenu():void {
	clearOutput();
	showBusky();
	
	output("You head on over towards Busky calling his name, quickly getting his attention. He puts down the weight and sits up on the bench, readjusting his strained undershirt as he uses a towel to wipe the sweat off of his face.");
	
	output("\n\n<i>“How ya doin’ [pc.name]? Lookin’ to");
	if(pc.tone >60) output(" keep yourself toned?");
	else output(" bulk up?");
	output(" That’s good, don’t want you to be a flimsy sack of bones, do we?”</i> Busky says as he reaches for his water bottle, downing a couple gulps.");
	
	if (pc.femininity <= 40 && !pc.hasBreasts()) {
		output("\n\n<i>“Say, while you’re here. You feel like doing somethin’ a bit more erm... interestin’?”</i>");
		
		clearMenu();
		if(pc.isTaur()) addDisabledButton(0, "S.Motivate", "Sexually Motivate", "You can’t be a Taur when you want to do this.");
		else addButton(0, "S.Motivate", buskySexMotivation, undefined, "Sexually Motivate", "Give Busky the motivation to push his limits. You will be on the receiving end of all action.");
		
		if(pc.isTaur()) addDisabledButton(1, "BenchAnal", "Bench Anal", "As a taur it’d be out of the question to do this.");
		else if(!pc.hasCock()) addDisabledButton(1, "BenchAnal", "Bench Anal", "You’ll need a cock.");
		else if(pc.analCapacity() < chars["BUSKY"].cockVolume(0)) addDisabledButton(1, "BenchAnal", "Bench Anal", "You can’t take a bull as well endowed as Busky.");
		else addButton(1, "BenchAnal", buskySexBenchAnal, undefined, "Bench Anal", "Use the bench for some anal fun, pitching and catching.");
		
		if (!pc.hasVagina() && pc.analCapacity() < chars["BUSKY"].cockVolume(0)) addDisabledButton(2, "HotTubFuck", "Hot-Tub Fuck", "You can’t take a bull as well endowed as Busky.");
		else if(pc.hasVagina() && pc.vaginalCapacity(0) < chars["BUSKY"].cockVolume(0)) addDisabledButton(2, "HotTubFuck", "Hot-Tub Fuck", "You can’t take a bull as well endowed as Busky.");
		else if (pc.isTaur()) addDisabledButton(2, "HotTubFuck", "Hot-Tub Fuck", "As a taur it’d be out of the question to do this.");
		else addButton(2, "HotTubFuck", buskySexHotTubFuck, undefined, "Hot-Tub Fuck", "Head to the hot tubs, relax, and ride Busky’s cock.");
	} else {
		clearMenu();
	}
	addButton(14, "Back", mainGameMenu);
}

//one of busky's ten ton gym sex scenes
public function buskySexMotivation():void {
	clearOutput();
	showBusky();
	
	output("After a short time of consideration, you finally decide on a bit of friendly motivation to help out your big bull. Casually, you ask what Busky’s benching.");
	output("\n\n<i>“300 on a 20/10 rep. Why, whatcha thinkin’ ‘bout?”</i>");
	output("\n\n<i>“Well, if you can add let’s say... 100 pounds to that, I’ll let you take your reward in the showers,”</i> you explain while adding the dense cast iron disks to his dumbbell, knowing he wouldn’t deny the offer. Busky chuckles as he accepts your challenge, getting up to stretch and prepare himself. Within a few moments you secure the weights and you give the stretching bull a nice slap on the ass. Busky quickly finishes stretching and dives under the weights, eager to take his reward.");
	output("\n\n<i>“Now look here [pc.name], you know you’re gonna have to keep your end of the bargain right?”</i> Busky chuckles as he slowly lowers the weight down to his chest and back up again. <i>“That’s one press right there, get ready to pay up.”</i>");
	output("\n\nYou watch his arms strain under the weight, glistening with beads of sweat, slowly trickling down his figure. Some drip down to the floor, most of them however, are just soaked up by his undershirt, all of this only adds to the familiar musk of the bull. You stand in a trance, only snapping out of it when you realize he already completed his third rep.");
	output("\n\nYou don’t want to make it <i>too</i> easy though, so you lower yourself to your knees. You level with his crotch and gaze at his large bulge, quite visible against the saggy gym shorts. But, you decide you’d rather see a bit more, so you pull off his gym shorts. As soon as his shorts come off his hypnotizing aroma permeates the air, making your mouth water with cocklust. Without a moment’s hesitation you tug at the jockstrap, attempting to free his bountiful crotch. You pull down his jockstrap only to be caught on his flare, after a bit of fiddling his now turgid horsecock springs out, almost smacking you in the face. As soon as you get his jockstrap off of his legs you hold it up to your face, basking in the deep, musky scent.");
	output("\n\n<i>“Hey, what you think you’re doing down there? Can’t wait till I’m done?”</i>");
	
	output("\n\nYou ignore Busky’s comments");
	if (pc.hasArmor()) output(", strip off your [pc.armor]");
	output(" and put on Busky’s leather jockstrap.");
	if (pc.hasCock()) output(" His jockstrap doing a poor job of hiding your fully erect [pc.cocksLight].");
	output(" Looking back to his crotch you find his 16 inch cock fully erect. Smirking, you run your fingers around his flare, taking your thumb and running it up and down his most sensitive spots, driving Busky into a sexual frenzy as he resists kicking you away and finishing the handjob himself. You can see him cracking under the pressure, as more of his salty sweat runs down his body.");
	
	output("\n\nNot wanting to let all of his heavenly musk juice go to waste, you run your tongue along one of his balls, lapping up all of the sweat from his love spheres. You dive your spare hand into your new jockstrap and begin");
	if (pc.balls > 0) output(" fondling your [pc.balls]");
	else {
		output(" rubbing your");
		if (pc.hasCock()) output(" [pc.multiCocks]");
		else if (pc.hasVagina()) output(" [pc.vaginas]");
		else output(" [pc.asshole]");
	}
	output(". Soon after you’ve cleaned up Busky’s first testicle you start on the second one, giving it the same treatment. <i>“Ay, if you -numph- keep that up, I’ll be blowing my load.”</i>");
	
	output("\n\nStopping your attack on his body, you stand up and trace your hand along his torso, brushing beads of sweat off of his abs and pecs, over to a nipple, giving it light squeeze. You whisper to him.");
	output("\n\n<i>“Well you’ll just have to beat me to it,”</i> quickly ducking back to his crotch you resume your assault on his horsemeat again, this time taking his pre-cum covered cock and inserting it into your mouth, your tongue sliding back and forth it’s length. You then take his quartet of balls into your hand and begin to massage them roughly, grinding them against each other, feeling them churning with your prize. Using your free hand, you start prodding a finger into Buskys tight anus, trying to work your way inside. As soon as you slip your finger all the way in, you hear a loud clunk and look up.");
	output("\n\nBusky dropped the dumbbell and is now sitting up, trying to force words through pants. <i>“20 sets ...of 10, 400 ... pounds, done. Now... showers... my prize.”</i> You get up off the floor and notice some of the other gym patrons giving you passing glances. Clearly this was not an uncommon occurrence.");
	
	clearMenu();
	addButton(0, "Next", buskySexMotivationFollowUp);
}

//second screen of sexMotivation
public function buskySexMotivationFollowUp():void {
	clearOutput();
	showBusky();
	
	output("As you head over to the shower room you get a couple of sideways glances, but most of them die out after a brief moment as the other gym-goers return to their business. You, however, keep staring at Busky’s raging erection that he proudly displays as he walks alongside you, groping your [pc.ass].");
	output("\n\nThe two of you enter the wall of steam coming from the shower room. The fog is so thick, you can barely see 5 feet in front of you, but you know you aren’t alone as you can hear the moans and grunts of sexual bovine escapades. Busky strokes his cock, looking at you expectantly. You begin to take off your jockstrap but he stops you.");
	output("\n\n<i>“I want you to wear it during.”</i> He leads you under a showerhead and turns it on, hot water pouring down your face washing off the residue from a few minutes prior. You press your ass against Busky’s raging, throbbing length, putting your hands on the wall for support.");
	output("\n\n<i>“You really want my cock don’t you? Well, you’ll get it,”</i> Busky teases as he slid his long pink spotted horsecock against your [pc.vagOrAss], smearing pre-cum all over your dilating hole.");
	//do penetration checks
	var isTight:Boolean = ((pc.hasVagina() && pc.looseness() <= 2) || pc.ass.looseness() <= 2);
	if (pc.hasVagina()) pc.cuntChange(0, chars["BUSKY"].cockVolume(0), true, true, false);
	else pc.buttChange(chars["BUSKY"].cockVolume(0), true, true, false);
	
	output(" You become numb with anticipation as you anticipate Busky fucking you raw. You lose your footing, almost falling, but Busky catches you. You look up at him, holding you tightly, staring at you with greedy eyes. The bull gently rests you facedown on the floor, your ass his for the taking. Busky begins to prod your [pc.vagOrAss] with his cock, finally forcing the flare in.");
	
	if(isTight) output(" After your hole finishes adapting to his girth, he slowly pulls it out.");
	output(" Losing your patience, you start");
	if (pc.isBro()) output(" demanding him to ram his length so far into you you’d have trouble walking for the next two weeks");
	else if (pc.isBimbo()) output(" begging for his cock, asking him to ram it so far inside you you’ll be coughing up his cum for a week");
	else output(" telling Busky to fuck you sideways to next Tuesday");
	output(".");
	
	output("\n\n<i>“You want it that bad, eh? Well I’ll give it to you, but I wanna see your face when you cum,”</i> Busky says as you flip over, onto your back. You close your eyes as you lift your legs into the air waiting for his cock, as you feel being lifted up by a pair of strong masculine arms. Busky’s now holding you up by your [pc.ass], your [pc.vagOrAss] hovering just over his cock. You look into his eyes and beg one last time <i>“Please.”</i>");
	
	output("\n\nBusky then rams his cock into you, his medial ring providing some resistance, before your " + (pc.hasVagina() ? "cunt" : "anus") + " accepts it and the ring pops in. He wastes no time as he begins to pump himself in and out of you so fast your [pc.vagOrAss]");
	if(isTight) output(" can barely adjust, still extremely tight");
	else output(" starts clenching in response");
	output(". With every thrust you feel him going harder and harder, his flare grinding");
	if (pc.hasCock()) output(" against your prostate, forcing a stream of pre to dribble out of your cock");
	else if (pc.hasVagina()) output(" against your g-spot, forcing a spurt of girlcum to spurt out of your [pc.vagina]"); 
	else output(" inside your [pc.anus]");
	output(". Eventually Busky’s assault on your");
	if (pc.hasCock()) output(" prostate");
	else if (pc.hasVagina()) output(" g-spot");
	else output(" ass");
	output(" starts to take effect on you");
	if (pc.hasGenitals()) output("r genitalia");
	output(".");
	
	//randomly pick a scene if both cock + pussy present
	var doCockScene:Boolean = true;
	if(pc.hasCock() && pc.hasVagina()) {
		var random:int = rand(1);
		if (random == 1) doCockScene = false;
	}
	
	//has cock or cock scene picked
	if(pc.hasCock() || (pc.hasCock() && pc.hasVagina() && doCockScene)) {
		output("\n\nYour [pc.cocks] start to throb, preparing for your release. Ropes of [pc.cum] jet out of your [pc.cocks], only to be blocked by the jockstrap. After your seed overflows the jockstrap a");
		if (pc.cumQ() < 300) output(" thin stream");
		else if (pc.cumQ() >= 300 && pc.cumQ() < 3000) output(" river");
		else if (pc.cumQ() >= 3000) output(" flood");
		output(" of cum pours onto Buskys crotch and legs. Busky pulls out, scoops some of your cum onto his hand, rubs it onto his cock, and plunges it back into your [pc.asshole].");
		output("\n\n<i>“Extra lube,”</i> smirks Busky. You wrap your arms around his neck, pulling yourself to his ear.");
		
	//has pussy or cock scene not picked
	} else if (pc.hasVagina() || (pc.hasCock() && pc.hasVagina() && !doCockScene)) {
		output("\n\nYour cunt starts to dribble, your walls clenching around his thick shaft. Eyes shut, you slip your hands into your crotch, rubbing your [pc.vagina], shlicking away at your glistening slit. You give out a deep groan as you spray your vaginal fluids onto Buskys crotch. Busky slicks his finger in your girl-cum and samples a taste before resuming pounding you dry.");
		output("\n\n<i>“Delicious,”</i> smirks Busky. You wrap your arms around his neck, pulling yourself to his ear.");
	
	//neither cock nor pussy
	} else {
		output("\n\nYour ass starts to clench around his throbbing member, preparing to receive his load. Your [pc.asshole] clenches down tight, as a dry, intense orgasm runs through your body, leaving you shivering on Busky’s member, who is still pounding away at your ass.");
		output("\n\n<i>“Hold on to something, you’re not done yet,”</i> smirks Busky. You wrap your arms around his neck, pulling yourself to his ear.");
	}
	
	if (pc.isBro()) output("\n\n<i>“Ugh, yeah. Fuck my ass raw you little wimp! You got 4 balls, use ‘em!”</i>");
	else if (pc.isBimbo()) output("\n\n<i>“Oh my god, you’re fucking me raw. Cum, c’mon, I like, need it.”</i>");
	else output("\n\n<i>“I can’t take it anymore, just finish already.”</i>");
	
	output("\n\nBusky speeds up his love making and grips your ass tight as he forces you up and down his long mast. With your tongue lolling out you enjoy the moment the hot water beating down your face as you hold on for dear life as the manly bull rams home.");
	
	output("\n\nNeither you or the breeding bull can hold out much longer. Busky bites down on his lip as he suppresses a loud, lustful moan. As his cum shoots up into your [pc.vagOrAss], slightly expanding your belly with its force, your eyes roll back as another orgasm surges through your body. With your");
	if (pc.hasVagina()) output(" womb");
	else output(" belly");
	output(" filled to the brim with his thick seed, you start to lose consciousness. Busky catches you as he sits down on the shower floor");
	if (pc.hasGenitals()) output(", your collective fluids being washed away");
	output(". Now in his lap, resting your head on his shoulder, you lie there for a moment, recovering from the romp within the comforting grip of the lovable bull.");
	
	clearMenu()
	addButton(0, "Next", buskySexMotivationFollowUpFollowUp);
}

//and the third screen of sexMotivation
public function buskySexMotivationFollowUpFollowUp():void {
	clearOutput();
	showBusky();
	
	output("After you’ve fully rested, you get out of his lap and stretch. Busky follows you back to the bench where your romp started, only to find it entirely wiped down. The only proof of your sexual escapade being Busky’s jockstrap, hanging from the weight with a note tacked to it.");
	output("\n\n<i>“I took the liberty of moving your clothes back to Straps for you, Busky.”</i> ~Q");
	output("\n\n<i>“...Dammit Quenton,”</i> Busky chuckles.");
	output("\n\nAfter a brief goodbye, you and Busky part ways. The massive bull, wearing nothing but his jockstrap, walks back to his shop, attracting the eyes of more than a few cows.");
	
	processTime(80 + rand(15));
	pc.orgasm();
	
	if (pc.hasVagina()) pc.loadInCunt(chars["BUSKY"], 0);
	else pc.loadInAss(chars["BUSKY"]);
	
	if (flags["BUSKY_SEXED_SEXUALLY_MOTIVATED"] == undefined) buskyAdjustAffection(1);
	flags["BUSKY_SEXED_SEXUALLY_MOTIVATED"] = true;
	
	buskySexed(1);
	
	clearMenu();
	addButton(14, "Back", mainGameMenu);
}

//one of busky's ten ton gym sex scenes
public function buskySexBenchAnal():void {
	clearOutput();
	showBusky();
	
	output("You tell Busky that the bench that he’s sitting on has... other uses. Busky smirks at you.");
	output("\n\n<i>“Whatcha got in mind?”</i>");
	output("\n\nBoth you and the bull strip in unison, with Busky leaving on only his brown leather jockstrap. He slowly pulls out his long flared cock as it quickly springs to life, leaving his quartet of balls in the jock. You slide it against your cheek, bringing it up to your lips, almost slipping it into your mouth, before the flare passes your lips, you go back down to his sheath. sliding your tongue up and down his length, not giving him the full satisfaction of a blowjob, only the taste.");
	output("\n\n<i>“Ey, [pc.name] you don’t have to pace yourself. I’m ready at any time,”</i> Busky chides. Briefly taking his statement into account, it’s clear he’s in the mood for anything, so you take the opportunity to take the lead.");
	
	output("\n\nGetting off your knees you slowly position yourself over Busky’s throbbing member, slowly lowering yourself onto the flared shaft. The impatient bull can’t seem to wait as he thrusts his hips upward, quickly pushing his cock against your ass, his blunt flare slips past your anus, leaving a smear of precum. After a second thrust, he successfully rams his blunt head into your ass.");
	if (pc.ass.looseness() <= 2) output(" A loud gasp escapes your mouth while you try to adjust.");
	//do away with potential virginity 
	pc.buttChange(chars["BUSKY"].cockVolume(0), true, true, false);
	
	output(" As he tries to sit up you swiftly pin his heaving chest down, telling him that <i>you’re</i> leading. You lift yourself off of his turgid member, leaving just the tip inside your [pc.ass], and began gyrating your [pc.hips] while ascending and descending on his cock. Busky keeps trying to move to his pace, placing his hands on your hips, trying to bring you deeper. But you continuously slap his hands away, stopping him from taking the handlebar on the bike that is your ass. Eventually he relents, and instead raises his hand up and caresses your [pc.cock] with his callused hands.");
	output("\n\n<i>“Oh, fuck. [pc.name] I’m close. Speed it up will ya?”</i> Busky begs. With a smirk you slide off of his cock and straddle his chest. He looks up at you with pleading eyes, place a hand on his cheek and slide it into his nest of brown hair. Slowly, you lean in and whisper.");
	output("\n\n<i>“I cum first,”</i> With that you shove your [pc.cock] into his mouth and begin facefucking him. His lips seal around your cock as his tongue works in a flurry. Soon you’re dribbling a few drops of precum into Busky’s mouth, just barely able to hold in your load. You lean in and whisper, <i>“Drink all of it you muscleslut. I don’t want one drop spilled got it?”</i> Busky submits to your will as he drink every last drop of your pre and licks your shaft clean.");
	output("\n\n<i>“Get your ass off the bench and come to your new seat,”</i> you command, rubbing your cock. Busky obliges, totally overwhelmed by your dominance. He takes a moment, positioning his anus above your [pc.biggestCock] before slowly stuffing himself full of your cock, as he happily bounces his musclebutt up and down.");
	if (pc.longestCockLength() > 20) {
		output(" You notice Busky’s body break out into a cold sweat, clearly he is struggling to accommodate your mammoth length.");
		output("\n\n<i>“Hey”</i> you hear him gasp, desperately trying to catch his breath <i>“Gi...gimmie a sec to... oh god... too... big.”</i>");
		output("\n\nYou hold his hips firmly as you try to swallow back your raging lust, feeling the hot, wet, vice-like grip of Busky’s manhole around your eager rod, slowly you feel Busky’s hips move and buck trying to adjust to the throbbing tool invading his trembling body.");
	}
	output("\n\nFor a moment he tries to reach for his own cock but swiftly you slap his hand away.");
	output("\n\n<i>“This is a hands free ride,”</i> you quip.");
	output("\n\nBusky opens his mouth in protest, but you quickly jam your cock into his prostate, forcing a dollop of precum to spurt out of his cock. The only thing that exits his mouth is a loud moan which attracts the attention of gym-goes that weren’t already watching your romp.");
	
	output("\n\nSoon you’re ready to spill your load, you tell Busky to lie on the bench and lift his legs. He does as told and soon is ready for his reward. Lifting his legs up over his head, his cock is dangling above his face, a perfect position for a self facial. You once again thrust into Busky’s ass, ramming down harder and faster onto his prostate.");
	if(pc.hasKnot()) output(" You can feel familiar swelling in your cock, the telltale feeling of your [pc.knot], which pushes against Busky’s rectum. Curious to see Busky’s reaction, you look down at him, but he doesn’t seem to notice, he’s just happily enjoying the assfucking.");
	output("\n\nAs Busky’s hot, wet ass begins to clench down on your cock, in preparation for his orgasm, you begin to jerk his throbbing horsemeat off, aiming his cock at his face as you ram your [pc.cock] into his prostate. Both of your cocks finally burst in unison, you try to aim Busky’s load into his open mouth but his throbbing member fully coats his face with ropes of cum, as you fill his ass with yours. The needy bull’s tongue lolling out as he attempts to swallow his load, licking up any strands that land near his lips, and eagerly swallowing the spurts he manages to shoot into his mouth.");
	
	if(pc.hasKnot()) {
		output("\n\nExhausted, yet satisfied, you attempt to pull out. Only to find yourself logged inside of him, your [pc.knot] preventing you from pulling out.");
		output("\n\n<i>“What’s the hold up... oh,”</i> Busky blushes and turns his face away from you. You smile to yourself, knowing the bull expects you to wait to deflate before pulling out. But you’re not going to make it that easy for him.");
		output("\n\nYou start lightly, nothing too much, only enough to get Busky to notice.");
		output("\n\n<i>“You’re going to have to wait, it ain’t comin’ out.”</i>");
		output("\n\nYour only response is to smirk at Busky, and to give his ass a hard spank, showing that you’re still in control here. His eye’s widen as he realizes what’s going on, but before he can protest further, you start pulling out harder.");
		output("\n\nThe bull moans in a mix of pleasure and pain as his hole is stretched by your knot. His hands clench the bench tightly as he holds on for dear life.");
		output("\n\n<i>“Stop... oh god... please,”</i> he pleads. But you only continue to pull out, harder, but slower. He grows so loud that he bites down on his knuckle, in a feeble attempt to muffle his moaning.");
		output("\n\nSoon, you start making progress, your knot slowly working it’s way out of the bull, until you reach the widest part of your knot, one light tug would free you. But before you fully pull out, a devious idea pops into your mind. You plant your hands on his ass cheeks, and pretend to push him away, but instead of actually pulling out, you thrust back into his well abused rump.");
		output("\n\n<i>“Sorry Busky,”</i> you say in faux guilt. <i>“I must have slipped... here... I’ll try again.”</i>");
		output("\n\n<i>“Nononon-OH!”</i>");
		output("\n\nYou resume pulling out of his anus, but instead of one long continuous motion, you pull back a little, then move back in, then pull back, then in, slamming your knot against his anus.");
		output("\n\nBusky’s moans are now screams of pleasure, and he no longer bothers to cover his mouth, letting the whole gym hear him cry out in pleasure. Three minutes of this go by, before you finally reach the largest part of your knot again, and Busky feels it.");
		output("\n\n<i>“Pl-please,”</i> he pants <i>“n-no more...”</i>");
		output("\n\nFor a moment, you consider going once more, but you fear Busky will just get up and walk away with you still knotted inside him. So out of mercy, or comical fear, you decide to pull out.");
		output("\n\nWhile it wasn’t too hard, compared to the first time, it was still quite audible. The loud, wet, sloppy popping sound emanated in the weight room, as a small river of semen flows out with your cock. Busky unfolds and simply lays there, staring at the ceiling as he tries to catch his breath. You walk on over to him, and simply pat his head, his face red, flustered, and sweating.");
		output("\n\n<i>“Good boy,”</i> you commend, as you wait for Busky to get up.");
	} else {
		output("\n\nExhausted, you pull out, your now flaccid [pc.cockShort] flopping down. As Busky unfolds, he wipes away the mask of cum from his face.");
	}
	
	output("\n\n<i>“Fuck [pc.name], that was great,”</i> mutters Busky as he gets up to stretch. Your only reply is a swift smack to his ass as you take him by the arm and lead him into the showers, leaving the cum coated benchpress behind.");

	processTime(25 + rand(10));
	pc.orgasm();
	
	chars["BUSKY"].loadInAss(pc);
	
	if (flags["BUSKY_SEXED_BENCH_ANAL"] == undefined){
		buskyAdjustAffection(1);
		if(pc.hasKnot()) buskyAdjustAffection(0.5);
	} 
	flags["BUSKY_SEXED_BENCH_ANAL"] = true;
	
	buskySexed(1);
	
	clearMenu();
	addButton(14, "Back", mainGameMenu);
}

//one of busky's ten ton gym sex scenes
public function buskySexHotTubFuck():void {
	clearOutput();
	showBusky();
	
	moveTo("574");
	showLocationName();
	
	output("Instead of working out with Busky, you ask him about doing something a tad more, relaxing.");
	output("\n\n<i>“Like the spa?”</i> he asks, a knowing grin creeping across his face. In the Ten Ton Gym, if you want to relax, you go the spa alone. However a spa trip with another person is another matter.");
	
	output("\n\nThe bull brushes his brown hair back as he gets off the bench, walking beside you as you both head over to the aquatic section of the gym. His hand planted on your [pc.ass]");
	if (pc.hasArmor()) output(" gripping it though your [pc.armor]");
	else output(" gripping it, and occasionally giving it a nice slap");
	output(".");
	
	output("\n\nEventually you reach the aquatic section, the air slowly getting more humid as you make your way over to the hot tubs. You choose to lead Busky into the most populated hot tub, which has tall, transparent walls to keep all the steam and heat in.");
	if(!pc.isNude()) output("\n\nRight before you enter the tub, you and Busky both strip off your clothes. After you’re fully nude, you notice Busky’s still wearing his jockstrap, blushing slightly.");
	else output("\n\nAlready naked, you start taking off Busky’s undershirt. After you neatly fold it up, you reach for his jockstrap, but he brushes your hand to the side, blushing slightly.");

	output("\n\n<i>“C’mon, let the boys breathe,”</i> you softly whisper into Busky’s ear as you slip your hand into his jockstrap, fondling his quartet of cum churning balls, so large you can only cup one at a time.");
	output("\n\nYour hand slips out of the jockstrap, marked with Busky’s ball scent. You take a deep whiff of the deep, masculine, almost addicting smell. After satisfying your musk cravings, you guide Busky’s hands, still tense and restrained for some reason. Still, his hands follow yours and he slips off his jockstrap. Tossing it onto his folded up undershirt.");
	
	if(silly) output("\n\nHis balls, now free from their support, bounce with each step he takes, his legs uncomfortably knocking against them. Busky winced in discomfort, as any normal person with these balls would experience great pain. You dutifully take them into your hands, carefully holding them as you both step past the sliding door, into the hot tub. Once Busky’s crotch submerges, you let go of his balls, and");
	else output("\n\nOnce you and Busky are both the tub, you");
	output(" lead him over to a wall, and sit down aside each other. With your arm wrapped around his shoulder, you look around the large hot tub, gazing at the other gym-goers.");
	
	output("\n\nIn the corner you find a group of 5 or so bulls, joking around and drinking beer as they cat call any cow that catches their eye. Along the walls you spot a few couples, some discussing life, other’s in each other’s laps, creating it. There is the occasional lone spa-goer, sitting with their head back, enjoying the atmosphere.");
	
	output("\n\nYou decide to follow their example.");
	if (pc.tallness > 97) output(" You rest your head back, letting Busky rest his head on your shoulder.");
	else output(" You rest your head on Busky’s shoulder, his arm sneaks it’s way over yours, as you rest under the embrace of Busky’s pique physical condition.");
	
	output("\n\nWith your eyes closed, you can finally enjoy the water, once a tad too hot, now perfect. The conversations of the other people in the hot tub fade into soft murmurs, accompanying the light splashed of the small waves hitting the walls. The waves, probably coming from a mixture of water jets and bovine fervor. A smile crawls across your face as you finally find peace, in a hot tub, away from all the hassle from the probes, your cousin, and Steele Co.");
	output("\n\nYou stay in a state of relaxation for an hour or so, you might have come here for a romp with Busky, but it seems like both of you are content with relaxing. Not that you’re not already painfully aroused right now, but, you’re okay with it. That is until a giddy voice breaks your mediation.");
	output("\n\n<i>“Hey there cutie! Wanna have a good time?”</i> the voice giggled with the glee only a Treated cow could have.");
	output("\n\nYou look around for the voice, still in a haze of relaxation, but it’s quickly broken as you’re shoved to the side, away from Busky. You reflexively look to who pushed you, only to find an extremely busty cowgirl swimming onto Busky’s lap, shoving her bosom into his face.");
	output("\n\nHe clearly isn’t enjoying it, but the cow can’t tell. She reaches for his now flaccid cock, trying to rub it to life.");
	output("\n\n<i>“Aww, what’s wrong cutie? Having trouble getting it up? Well, don’t worry you’ll be ready in a minute tops.”</i>");
	output("\n\nA pained expression crosses Busky’s face as she plays with his balls.");
	output("\n\n<i>“Uh, actually, I’m not looking to-</i>” Busky started, cut off by the cow.");
	output("\n\n<i>“Mmm, you smell real nice, like a real man! I can’t wait to have your flare scraping my womb, and with these babies,”</i> she gives his balls a squeeze. <i>“You’re guaranteed to be a daddy!”</i>");
	output("\n\n<i>“Uh, well I donate to the barn, if you want I can tell you my info so you can get it, I can even tell them to give it to you for free-</i>”");
	output("\n\n<i>“Why would I go for frozen bull cream, when I can get it straight from the tap!”</i> the cow giggles, oblivious to the obvious hints as she licks her scarlet lips, staring dreamily at his balls.");
	output("\n\nBusky gives you a last ditch effort look of despair. You realize he can’t diffuse the situation by himself so you quickly rush over and push the cow off of Busky.");

	if(pc.isBro()) {
		output("\n\n<i>“Hey! Step off bimbo! Can’t you stop thinking about cock for long enough to realize that maybe there’s a reason he came here with me?”</i>");
		output("\n\n<i>“...HEY!”</i> the cowgirl whines, <i>“I don’t care, I saw him first. And he’s probably just shy. C’mon, ya big lug,”</i> she turns back to Busky, tugging at his arm. <i>“Let’s get out of here!”</i>");
		output("\n\n<i>“He’s gay you cockguzzling cowslut! You’d realize that if you’d stop begging for dick for half a second!”</i>");

	} else {
		output("\n\n<i>“Hey, girlie! Pst, guess what? He came with me for a reason!”</i>");
		output("\n\n<i>“To pick up girls, duh!”</i> she says cheerfully. <i>“If you want, you can join in too!”</i>");
		output("\n\n<i>“He’s gay, he likes guys, he doesn’t like tits. Catch any of that?”</i>");
	}
	
	processTime(20 + rand(10));
	
	clearMenu()
	addButton(0, "Next", buskySexHotTubFuckFollowUp);
}

//Hot tub second screen
public function buskySexHotTubFuckFollowUp():void {
	clearOutput();
	showBusky(true);
	
	showLocationName();
	
	output("The cow pouts her lips, brushes her wet, brown hair out of her face, and heads on over to one of the other guys in the tub.");
	output("\n\n<i>“Thank fuck man. You saved my hide-</i>” Busky was quickly interrupted by you, reaching down and grabbing his quartet of balls.");
	output("\n\n<i>“You’re my fuck, not hers,”</i> you joke, as you get into position, working your way into his lap as his hands work their way to your [pc.ass].");
	output("\n\nYou rub Busky’s length between your ass cheeks, feeling it throb with anticipation. You move a hand and grab onto one of his horns, using your free hand to position the large, pulsating member under your [pc.vagOrAss].");
	output("\n\nAfter steadying yourself for a moment you lower yourself onto his turgid horsecock, his flare spreading your hole wide.");
	//do away with potential virginity
	if (pc.hasVagina()) pc.cuntChange(0, chars["BUSKY"].cockVolume(0), true, true, false);
	else pc.buttChange(chars["BUSKY"].cockVolume(0), true, true, false);
	
	output("\n\nThe cockmeat in your [pc.vagOrAss] proves too much for you as you push your face into Busky’s collar bone and groan in agonizing pleasure.");
	output("\n\nBusky’s hands sink into your [pc.ass] as he assists in your ride, adding a bit of extra force every time you bob on his cock. Eventually you hilt yourself, your walls hugging his length, able to feel every throb and pulse.");
	
	output("\n\nSlowly you lift yourself up, legs quivering and hands noodly, before letting gravity force you back down");
	if (pc.isBimbo()) output(" a whorish moan echoing around you");
	else if(pc.isBro()) output(" a grunt of raw sexual power erupting from your lungs");
	else output(" a pleasurable groan coming out of your mouth");
	output(", as a splash of water ripples through the hot tub, alerting the other patrons of your current activity. They give you passing glances, before resuming their previous conversations/coitus.");
	
	if(pc.hasCock() && pc.hasVagina()) {
		output("\n\nYou can feel your [pc.cocks] dribbling small spurts of precum as your cunt produces much needed lubricant. With every pump inside your quivering cunt, it becomes more and more of a challenge not to start");
		if(pc.isTreated()) output(" mooing like a cow.");
		else output(" moaning like a whore.");
	} else if (pc.hasCock()) {
		output("\n\nYou can feel your [pc.cocks] dribbling small spurts of precum as you try your hardest to keep from");
		if(pc.isTreated()) output(" mooing like a cow.");
		else output(" moaning like a whore.");
	} else if (pc.hasVagina()){
		output("\n\nYou feel you your cunt dribbling your fem-cum around his length, adding much needed lubrication. With every thrust he punches his flare against your cervix, evoking a mixture of pleasure and pain.");
	}
	
	output("\n\nYou continue like that for a while, adding to the waves of the pool. Looking over to the corner of the pool where the young bulls were, you see the brunette cow getting gangbanged by the group. Your eyes linger for a while, until Busky turns your head back to face him. He leans up to your ear and whispers.");
	
	output("\n\n<i>“You’re my fuck, not hers,”</i> he says");
	if (pc.hasCock()) output(" as his hand slips to your [pc.biggestCock], playing with it");
	output(" as he begins to thrust in time with your bounces. The numb pleasure of having your");
	if (pc.hasCock()) output(" prostate");
	else if (pc.hasVagina()) output(" [pc.vagina]");
	else output(" [pc.ass]");
	output(" pounded flooding through your body, you feel your legs grow weak.");

	if(pc.hasCock()) {
		output("\n\nYour breathing becomes more and more shallow, your heart races, and your cock throbs. The inevitable occurs, and a small rope of cum flies out of your cock, and lands on Busky’s chest. Followed by another, more powerful rope, and another, and another. Your [pc.vagOrAss] clenches down hard on his length as he continuously pounds your");
		if (!pc.hasVagina()) output(" prostate");
		else output(" quivering cunt");
		output(".");
	} else if(pc.hasVagina()) {
		output("\n\nYour breathing becomes more and more shallow, your heart races. The inevitable occurs and you reflexively clench your [pc.thighs] as multiple spurts of [pc.girlCum] fly down Busky’s length.");
	}
	output("\n\nYou melt in his lap, falling limply into his arms");
	if (pc.hasCock())
	{
		output(" as the last of your cum dribbles out of your length");
		if (pc.cocks.length > 1) output("s");
	}
	output(", the warm water thrashing around you as Busky ruts into your [pc.vagOrAss]. The musclebound bull is close to orgasm himself, as he thrusts slower, and harder.");

	output("\n\nBusky eventually bottoms out in your [pc.vagOrAss], thrusting his full length inside. You can practically feel his cock distend with the first rope, flooding your [pc.vagOrAss] to the brim, leaving the rest of his cum with nowhere to go. But he doesn’t pull out. The next jet of bull cream stretches your belly, distending it a bit.");
	output("\n\nYou let out a groan as the pain of belly expansion is mixed with the still fading pleasure of your orgasm. If anything it feels amazing, being breed like a cow, your belly swelling with Busky’s seed. Load after load fills your");
	if (pc.hasVagina()) output(" womb");
	else output(" ass");
	output(", and your belly grows and grows, until you look 9 months pregnant.");
	
	processTime(40 + rand(10));
	
	clearMenu()
	addButton(0, "Next", buskySexHotTubFuckEnd);
}

//Hot tub final screen
public function buskySexHotTubFuckEnd():void {
	clearOutput();
	showBusky(true);
	
	moveTo("571");
	showLocationName();
	
	output("Busky lifts you off of his length, as your hole clenches down on reflex. You float in the tub, patting your belly in satisfaction of a good fuck. Time passes while your mind is fogged with pure bliss, that is until you notice a strong arm wrap around you. Opening your eyes you see Busky pulling you out of the hot tub, wearing a towel around his waist. He slings you over his shoulder before retrieving both of your items.");
	output("\n\nHe sets you down in the shower room and turns on ice cold water at full blast, which snaps you out of your daze. Eventually you loosen your holes enough to clean yourself out, an unpleasant emptiness now filling your belly. Once you’re fully clean, in and out, you collect your belongings from Busky, and head on out, after a quick goodbye.");
	
	processTime(15 + rand(10));
	pc.orgasm();
	pc.shower();
	
	chars["BUSKY"].createPerk("Fixed CumQ",50000,0,0,0);
	if (pc.hasVagina()) pc.loadInCunt(chars["BUSKY"], 0);
	else pc.loadInAss(chars["BUSKY"]);
	chars["BUSKY"].removePerk("Fixed CumQ");
	
	if (flags["BUSKY_SEXED_HOTTUBFUCK"] == undefined) buskyAdjustAffection(1.5);
	flags["BUSKY_SEXED_HOTTUBFUCK"] = true;
	
	buskySexed(1);
	
	clearMenu();
	addButton(14, "Back", move, "507");
}