/**** Flags ****
MET_BEA_HUBBY		1 when ya meet 'im
BEA_GIFT			bea_gift
BEA_PANTIES			bea_panties
BEA_TITLE is set to the selected name.
BEA_RELATIONSHIP	0, 1, or 2. It’s 0 by default
	0 is Strangers: the PC didn’t talk to her or interact or anything
	1 is Friends: the PC has talk and interacted with her
	2 is Lovers: the PC has engaged in sexual activity with her

BEATRICE_HERSELF_TALKED		1 when talked about herself. 
BEATRICE_FAMILY_TALKED 		1 when talked about her family;
BEATRICE_SHIP_TALKED		1 when talked about her family
BEA_QUEST					Set to one when PC agrees to help
	1 is quest started
	2 is gift given
	3 is QUEST OVER, SHE LEFT!
BEA_SAVCOUNT				Counts amount of Savicite collected.

A number of [bea.xYZ] parser calls referencing some of the stats below
*/

//Beatrice Reasner
//a milfy wife who wants to spoil you
//Written by Tacit
//Edited by Nik_van_Rijn

//Art by Caffeccino

/*Outline

Beatrice Marchelle Reasner is a normal human woman, space captain, and fellow planet rusher who’s currently in Irestead negotiating a contract with Steele Tech for a new supply of savicite. She can be found in the Freezer during her downtime from 16:00-24:00.

She’s a happily married wife and doting mother. Her personality is warm, kind, gentle, loving and motherly, as well as sometimes being playful or a bit strict. She almost always wears a soft smile and is someone who’s easy to approach. She’s got a nice body, yet doesn’t intentionally display her assets; she is married, after all.

She had a successful career in the Terran Space Coalition Navy until she screwed up big time. Afterwards she was a teacher for a while and now works as an independent contractor, freelance and (now recently) planet rusher doing jobs that allow her and her crew to explore the new frontier. She’s a mother to her crew.

At first, she just wants to innocently spend some time with the PC between meetings. But if the PC chooses, they can push her into more lascivious acts after spending some time with her.

She’s heterosexual but won’t turn away a fully female PC lest she make them feel undesired.

She buys savicite (and pays an extra 25% for it), but only a certain amount before she leaves. Halfway through, she’ll give the PC a gift and at the end the PC will get a choice between rewards. The amount may change depending on how rare savicite is, but I’m thinking around 40 pieces
After selling half of the pieces, she gives the PC a gift.
After selling all the pieces, she leaves*/

/*Stats - FEN NOTE: Unused since she doesn't TF AT ALLLL

short: Beatrice Reasner
originalRace: human

level = 15

femininity = 100
hairType = GLOBAL.HAIR_TYPE_HAIR
hairColor = "brown"
hairLength = 16
tallness = 70

tone = 30
thickness = 60

eyeColor = "brown"
skinTone = "fair"
skinFlags = [GLOBAL.FLAG_SMOOTH]
skinType = GLOBAL.SKIN_TYPE_SKIN
earType = GLOBAL.TYPE_HUMAN
eyeType = GLOBAL.TYPE_HUMAN
lipMod = 1
lipColor = "red"
tongueType = GLOBAL.TYPE_HUMAN
armType = GLOBAL.TYPE_HUMAN
faceType = GLOBAL.TYPE_HUMAN
faceFlags = [GLOBAL.FLAG_SMOOTH]
legType = GLOBAL.TYPE_HUMAN
legFlags = [GLOBAL.FLAG_PLANTIGRADE]

breastRows = [new BreastRowClass()]
(breastRows[0] as BreastRowClass).breastRatingRaw = 12
(breastRows[0] as BreastRowClass).nippleType = GLOBAL.NIPPLE_TYPE_INVERTED
nipplesPerBreast = 1
nippleColor = "brown"

milkMultiplier = 15
milkRate = 10
milkFullness = 100
milkType = GLOBAL.FLUID_TYPE_MILK
girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM

vaginas = [new VaginaClass()]
(vaginas[0] as VaginaClass).vaginaColor = "pink"
(vaginas[0] as VaginaClass).clits = 1
(vaginas[0] as VaginaClass).type = GLOBAL.TYPE_HUMAN
(vaginas[0] as VaginaClass).loosenessRaw = 3
(vaginas[0] as VaginaClass).wetnessRaw = 2
clitLength = 0.8
vaginalVirgin = false

hipRatingRaw = 12
buttRatingRaw = 8
*/

public function showBeatrice(nude:Boolean = false):void
{
	if(flags["BEA_TITLE"] == undefined) showName("\nWOMAN");
	else showName("\n" + flags["BEA_TITLE"].toUpperCase());
	if(nude) showBust("BEATRICE_NUDE");
	else showBust("BEATRICE");
}

//Add to the Freezer
//room descriptions
public function beatriceBonusButts(button:int = 0):void
{
	//before approaching:
	if(flags["BEA_RELATIONSHIP"] == undefined)
	{
		output("\n\nAt one of the smaller tables, you spot an attractive looking woman in a uniform. She seems to be by herself, glancing through her Codex and drinking amber colored liquor from a snifter. Looking up, the lovely lady meets your gaze with warm, chocolate-colored eyes and shoots you an inviting smile.");
		//[Woman]
		addButton(button,"Woman",approachBeatrice,undefined,"Woman","Visit the friendly lady in uniform.");
	}
	//Repeat
	else if(flags["BEA_TITLE"] != undefined)
	{
		output("\n\n" + flags["BEA_TITLE"] + " is here again, sipping her amber colored drink and enjoying the warm fire. She gives you a friendly smile.");
		addButton(button,flags["BEA_TITLE"],approachBeatrice,undefined,flags["BEA_TITLE"],"Head to her table.");
	}
	//addButton(button+1,"Savicite",quickLoot,new Savicite());
	return;
}
public function beatriceLeavesBonus():Boolean
{
	//Quest is over! BOOSH!
	if(flags["BEA_QUEST"] == 3 && !pc.hasStatusEffect("Bea Leave Delay"))
	{
		beatriceLeavesYOUFORANOTHERMANOHSHIT();
		return true;
	}
	return false;
}

//Approach
public function approachBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	if(flags["BEA_RESTS"] != undefined && flags["MET_BEA_HUBBY"] == undefined && rand(4) == 0)
	{
		encounterMisterTrentReasner();
		return;
	}
	//first time:
	if(flags["BEA_RELATIONSHIP"] == undefined)
	{
		//set BEA_RELATIONSHIP to 1
		flags["BEA_RELATIONSHIP"] = 1;
		output("She seems friendly enough, and you could use some company, so you make your way over to her table. As you draw closer, you can see she’s human - seemingly unmodded, you note - with a captivating set of curves, from wide hips and a narrow waist, to a hefty bust; unfortunately her jacket tries to conceal a lot of it. What might have been some epic cleavage is covered by a well-fitted dress shirt buttoned all the way up with a necktie hanging from the top. She’s dressed quite professionally - the only skin showing are her face and hands.");
		output("\n\nHer face is what many would call beautiful; with full, red lips and high cheekbones complementing a pair of russet eyes with thick lashes, all framed by a head of voluminous chestnut hair tied into a loose braid. A few lines by her eyes and mouth hint that she’s well older than you, at least old enough to be your mother.");
		output("\n\nShe motions to the chair across from her, <i>“Please, sit with me.”</i> Her voice is smooth as silk and warm as the nearby fire.");
		output("\n\nYou oblige by ");
		if(pc.isTaur()) output("moving the chair and sitting down in its place");
		else output("taking the seat");
		output(", but you feel like you need to ask: <i>“");
		if(pc.isNice()) output("Do you know me");
		else if(pc.isMischievous()) output("Have we met before");
		else output("Do you need me for something");
		output("?”</i>");
		output("\n\n<i>“No, sweetie, but I thought you might want some company, since you were standing there all by yourself.”</i> She sits very ladylike in her chair and extends a fair skinned hand. <i>“My name’s Beatrice Reasner, Captain of </i>Inexorable<i>,”</i> her tone is cordial, <i>“but you may call me Mrs. Reasner... or Beatrice if you want.”</i>");
		output("\n\nSounds like she’s giving you the choice, so how do you want to address her from now on?");
		processTime(5);
		clearMenu();
		//[Mrs. Reasner] [Beatrice]
		addButton(0,"Mrs. Reasner",setBeatriceName,"Mrs. Reasner");
		addButton(1,"Beatrice",setBeatriceName,"Beatrice");
	}
	//repeat:
	else
	{
		output("You make your way over to her table again. <i>“");
		if(pc.isAss() || pc.isBro()) output("I’m sitting here.");
		else output("Mind if I sit?");
		output("”</i>");
		output("\n\n<i>“");
		if(pc.isAss() || pc.isBro()) output("Please, go ahead");
		else output("You needn’t even ask");
		output(".”</i>");
		output("\n\nYou seat yourself. Again, it’s quiet, but not in a bad way. " + flags["BEA_TITLE"] + " seems happy with the companionable silence, but what do you want?");
		//[Appearance] [Talk] [Sell] [Rest] [Make Love] [Leave]
		reasnerMenu();
	}
}

public function reasnerMenu():void
{
	clearMenu();
	addButton(0,"Appearance",reasnerAppearance);
	addButton(1,"Talk",talkToMrsReasner);
	
	if(flags["BEA_QUEST"] != undefined) addButton(2,"Sell",sellSaviciteToBeatrice);
	else addDisabledButton(2,"Sell","Sell","You have no idea what you would even sell to this sweet woman.");
	
	if(flags["BEATRICE_HERSELF_TALKED"] != undefined && flags["BEATRICE_FAMILY_TALKED"] != undefined && flags["BEATRICE_SHIP_TALKED"] != undefined && flags["BEA_QUEST"] != undefined) addButton(3,"Rest",restWithMommaBeatrice);
	else addDisabledButton(3,"Rest","Rest","You don’t know her well enough for this.");

	if(flags["BEA_RESTS"] == undefined) addDisabledButton(4,"Make Love","Make Love","You definitely don’t know her well enough for that.");
	else if((flags["BEA_RELATIONSHIP"] != 2 && pc.lust() >= 66) || (flags["BEA_RELATIONSHIP"] == 2 && pc.lust() >= 50)) addButton(4,"Make Love",makeLoveToBeatrice);
	else addDisabledButton(4,"Make Love","Make Love","You aren’t turned on enough for that.");
	addButton(14,"Leave",leaveAfterBeatrice);
}

public function setBeatriceName(arg:String):void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	// sets " + flags["BEA_TITLE"] + " to the selected title
	flags["BEA_TITLE"] = arg;
	output("<i>“[pc.name] Steele,”</i> you introduce yourself.");
	if(pc.isNice()) output(" <i>“Nice to meet you, " + flags["BEA_TITLE"] + ".”</i>");
	else if(pc.isMischievous()) output(" <i>“A pleasure to meet such a beauty.”</i>");

	output("\n\n");
	// if chose Mrs. Reasner:
	if(arg == "Mrs. Reasner") output("<i>“My, how nice to meet such a polite young [pc.manWoman].”</i> ");
	output("She shakes your hand. Her skin is cool to the touch, and her grip is gentle, yet firm.");

	output("\n\nBut <i>Mrs.</i>? She’s married? A quick glance confirms a simple gold ring on her finger. Well then.");
	output("\n\nShe chuckles. <i>“It’s nice to finally have someone to sit with after a long day.”</i> A second later, she realizes something. <i>“Dear me, where are my manners. Would you also like a drink, my treat?”</i>");
	output("\n\nYou thank her for the offer and order your drink of choice, which arrives shortly.");
	output("\n\n<i>“So, sweetie,”</i> she sets her snifter down and laces her fingers together, <i>“why don’t you tell me a bit about yourself. I’m sure you have many interesting stories to share.”</i>");
	output("\n\nYou indulge her, recounting for her the details of your current quest and of your late father’s wish, leaving out certain need-to-know information. She hangs on your every word.");
	output("\n\n<i>“That’s quite impressive,”</i> she says, <i>“I hope you don’t mind if I congratulate you early, since I know you’ll succeed.”</i>");
	output("\n\nIt becomes quiet, and the two of you enjoy the fire. It seems that " + flags["BEA_TITLE"] + " is the type of woman who simply likes the company of others, even if there isn’t anything to talk about at the moment.");
	output("\n\nBut what do you want?");
	processTime(6);
	//[Appearance] [Talk] [Leave]
	clearMenu();
	addButton(0,"Appearance",reasnerAppearance);
	addButton(1,"Talk",talkToMrsReasner);
	addButton(14,"Leave",leaveAfterBeatrice);
}

//Appearance
public function reasnerAppearance():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("Captain Beatrice Reasner is a kind, gentle-mannered terran woman and happily married. With 2\" heels, she stands six feet tall and carries herself with ladylike composure. Her face is very feminine; with fair skin, high cheekbones, long lashes and a loving smile upon her full, rosy lips. Voluminous chestnut hair cascades down her back in a loose braid and sweet, vanilla-scented perfume tickles your nose. The way she welcomes you with her warm, russet eyes makes you feel wanted and important, like you’re the only one in the room.");
	output("\n\nOn her left hand she wears a simple gold wedding ring - the sign of a loving wife and a doting mother. It’d be rude to ask a lady for her age, but the few lines by her eyes and mouth hint that she’s well older than you, at least old enough to be your mother. Her complexion is fair but a little pale, reflecting a lifestyle spent mostly indoors or out in space.");
	output("\n\nHer attire is enticingly modest and professional: a suit-like uniform hugs her narrow waist and large breasts just right, yet leaves plenty to the imagination. You can almost make out a black bra behind her prim dress shirt and necktie. Four gold stripes adorn her shoulder boards. A long business skirt wraps around her wide hips and smooth, stocking-clad legs that go all the way up, elongated even further by a pair of high heels. The slit running up the side gives a nice glimpse of thigh and garter strap as she slowly crosses and uncrosses her legs every now and then. Her shapely derriere fills out the back nicely, jiggling whenever she moves.");
	if(flags["BEA_RELATIONSHIP"] == 2) output("\n\nUnderneath that conservative outer layer, she’s wearing some sexy panties and matching bra, along with sheer stockings and garter belt; all of it black and lacy with floral patterns, which you find quite ostentatious for a married woman.");
	output("\n\nDespite her clothing, her voluptuous curves are evident: wide, child-bearing hips, a full hourglass figure, pillowy ass and a pair of ");
	if(flags["BEA_RELATIONSHIP"] == 2) output("milky F-cup breasts, each capped with a large, brown, inverted nipple");
	else output("F-cup breasts");
	output(". She clearly has a body made for baby-making.");
	processTime(1);
	reasnerMenu();
}

//Talk
//only <i>“Herself”</i> and <i>“Uveto”</i> are available at first
public function talkToMrsReasner():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("<i>“Do you mind if we talk for a bit?”</i>");
	output("\n\nA warm, motherly smile spreads across her scarlet lips. She sets her drink down and gives you her full, undivided attention. <i>“Of course, sweetie, you can talk to me about anything.”</i>");

	processTime(1);
	//[Herself] [Family] [Ship & Crew] [Uveto]
	beatriceTalkMenu(talkToMrsReasner);
}

public function beatriceTalkMenu(arg:*):void
{
	clearMenu();
	//[Herself] [Family] [Ship & Crew] [Uveto]
	if(arg != talkToBeatriceAboutHerself) addButton(0,"Herself",talkToBeatriceAboutHerself);
	else addDisabledButton(0,"Herself","Herself","You just talked about this.");

	if(flags["BEATRICE_HERSELF_TALKED"] == undefined) addDisabledButton(1,"Family","Family","You don’t know her well enough to ask this.");
	else if(arg != talkToBeatriceAboutFamiry) addButton(1,"Family",talkToBeatriceAboutFamiry);
	else addDisabledButton(1,"Family","Family","You just talked about this.");

	if(flags["BEATRICE_HERSELF_TALKED"] == undefined) addDisabledButton(2,"Ship & Crew","Ship & Crew","You don’t know her well enough to ask this.");
	else if(arg != beatriceShipAndCrewTalk) addButton(2,"Ship & Crew",beatriceShipAndCrewTalk);
	else addDisabledButton(2,"Ship & Crew","Ship & Crew","You just talked about this.");

	if(arg != uvetoTalkWithBeatrice) addButton(3,"Uveto",uvetoTalkWithBeatrice);
	else addDisabledButton(3,"Uveto","Uveto","You just talked about this.");

	addButton(14,"Back",backToBeatriceMain);
}

public function backToBeatriceMain():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("Instead of talking, what did you want to do?");
	reasnerMenu();
}

//Herself
//unlocks <i>“Family”</i> and <i>“Ship & Crew”</i>
public function talkToBeatriceAboutHerself():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("You ask " + flags["BEA_TITLE"] + " to tell you about herself. She takes a sip from her snifter, leaving a red lipstick mark that draws your attention.");
	output("\n\n<i>“Well,”</i> she starts, <i>“I’m the younger of two, born on the fourth planet in the Sol system to a respected Admiral and a successful businesswoman. And for the last seven years, my husband and I have been operating a starship in order to explore the new frontier. Previously I was a teacher back on Earth and before that I was in the Navy.”</i> She finishes her statement, content that she covered all the basics.");
	output("\n\nYou raise an eyebrow, admitting that you wouldn’t have thought of her as a military woman. She seems far too kind and compassionate for such a career.");
	output("\n\n<i>“And you’d be correct,”</i> she takes another sip of the sweet smelling liquor with a smile. <i>“I abhor violence, you see, and joined during a time of peace in order to see the galaxy. Now I can do just that with my own ship, and share the experience with my own crew.”</i>");
	flags["BEATRICE_HERSELF_TALKED"] = 1;
	processTime(5);
	beatriceTalkMenu(talkToBeatriceAboutHerself);
}

//Family
public function talkToBeatriceAboutFamiry():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("You ask " + flags["BEA_TITLE"] + " to tell you about the family she’s made for herself and about her husband and daughter.");
	output("\n\nHer expression lightens. She brushes a lock of chestnut hair away from her face, unintentionally drawing your attention to her wedding ring. <i>“My best friend introduced us to each other on Ausaril, back when I was a junior officer. We settled down on Earth to live a simple life and raise a family. For the next couple of years I taught at the College while Hubby took care of the house and homeschooled our daughter.”</i>");
	output("\n\n<i>“He’s a wonderful man: handsome, reliable, hardworking, faithful, strong and...so manly,”</i> she bites her lip, <i>“with those broad shoulders, chiseled pecs, and his soft beard that tickles just right... mmm, those times when he’d suddenly pick me up and carry me to the bedroom...”</i> " + flags["BEA_TITLE"] + " stops herself, realizing where she was going with that. A blush spreads across her cheeks and she covers her mouth with a hand, like a proper lady. <i>“Oh my, I must have gotten a little distracted there.”</i>");
	if(pc.isNice()) output("\n\nYou tell her that it’s no problem and she can continue.");
	else if(pc.isMischievous()) output("\n\n<i>“No, please,”</i> you smirk, <i>“do tell me about your sex life.”</i>");
	else output("\n\n<i>“Go on.”</i>");

	output("\n\n" + flags["BEA_TITLE"] + " clears her throat and takes a swig of brandy. <i>“He’s challenging and I think he brings out the best in me. He’s also a great father to the cutest girl in the whole galaxy! Our little angel has her father’s eyes and ears along with her mother’s smile and bottom.”</i>");
	output("\n\n<i>“I have some pictures I can show you, if you’d like.”</i> She activates her Codex, pulls up a gallery of images and lets you see a few. The one you focus on looks like a happy family outing by a lake. " + flags["BEA_TITLE"] + " you recognize easily; with her is a handsome half-ausar man with white hair and a short beard along with a little girl with bright blue eyes sitting between her parents. You’re thinking the girl looks quite young - perhaps eight years old - until you see the picture is dated to over ten years ago, most likely when they were still living on Earth.");
	output("\n\n<i>“It’d be wonderful if you could meet ");
	flags["BEATRICE_FAMILY_TALKED"] = 1;
	//has met husband: 
	if(flags["MET_BEA_HUBBY"] != undefined) output("my daughter, too");
	else output("them");
	output(". Right now ");
	if(flags["MET_BEA_HUBBY"] != undefined) output("she’s");
	else output("they’re");
	output(" up at the station in orbit, running errands for me, so maybe you’ll come across ");
	if(flags["MET_BEA_HUBBY"] != undefined) output("her");
	else output("them");
	output(" when you’re up there.”</i>");
	processTime(5);
	beatriceTalkMenu(talkToBeatriceAboutFamiry);
}


//Ship & Crew
public function beatriceShipAndCrewTalk():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("You ask " + flags["BEA_TITLE"] + " to tell you about her ship");
	if(pc.characterClass == GLOBAL.CLASS_ENGINEER || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM) output(" - you always love hearing about starships -");
	output(" as well as her crew, and her job as skipper of her own ship.");
	output("\n\n<i>“Her name is </i>Inexorable<i>. She’s an old girl, but still a magnificent example of a starship,”</i> she states proudly. <i>“We rescued her from the shipbreakers about ten years ago. In fact, when I started restoring her I didn’t even intend to make her space worthy again, merely to refurbish her and perhaps turn her into a museum ship. Eight hundred thousand tonnes of hulk is a lot to repair, after all.”</i>");
	output("\n\nWhat changed, you ask.");
	output("\n\n<i>“My husband,”</i> a fond smile spreads across her scarlet lips as she caresses her wedding ring, <i>“he knew how important this was to me, so he went out of his way to gather more people to join and more credits to fund it all - far more than I could have hoped for. It still took two years and millions of man-hours to get her flying again.”</i>");
	output("\n\n<i>“When we first started, I used my contacts and pulled favors to get a mostly former Navy crew; today it’s almost entirely civilian. Back then, I needed competent and trustworthy people who already knew what to do. At first, we were understaffed, overworked and taking every job we could get just to pay off the bank loans.”</i>");
	output("\n\n<i>“I was already recruiting new members since the beginning - almost a thousand a year - but it took time to train them. These people usually aren’t permanent as well, they stay for a couple years. New children join the family and the older ones move out; I don’t expect anyone to remain forever, however a few choose to stay. Though whether they decide to leave or not, I love every single one just as much.”</i>");
	output("\n\nHow many people, you ask, does she have on her ship right now.");
	output("\n\n<i>“Over three thousand two hundred officers and crew,”</i> she says with obvious pride.");
	output("\n\nYou blink. <i>“Why so many?”</i>");
	output("\n\nShe chuckles at your reaction. <i>“Because I choose to employ minimal automation on </i>Inexorable<i>. I want those onboard to truly feel responsible for the ship’s wellbeing, and it allows more people to join in on our adventure. All are welcome aboard my ship as long as they’re willing to learn.”</i>");
	output("\n\nWhen she says minimal automation, you ask, does that mean she has them do everything by hand?");
	output("\n\n<i>“Yes, it does. Almost everything from mopping the deck, food preparation, shoe repair and tailoring to carrying laundry from their berths to the laundromat. I think highly of my crew so I know they can handle it.”</i> She smiles dotingly. <i>“Like most children, they tend to complain about the chores. But when VIPs come aboard, and they put on their dress uniforms and stand at attention to welcome them, knowing that the ship is in pristine condition due to their own hard work, the pride they feel is indescribable.”</i>");
	flags["BEATRICE_SHIP_TALKED"] = 1;
	processTime(10);
	beatriceTalkMenu(beatriceShipAndCrewTalk);
}

//Uveto
//unlocks <i>“Sell”</i> and <i>“Rush”</i>
//tooltip: Ask what she’s doing on this cold, little moon
public function uvetoTalkWithBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("You lean over, resting your elbows on the table, and ask her why she’s on this backwater ice ball.");
	output("\n\nShe sets her drink down and smiles, appreciative of your interest. <i>“This is where we replenish our savicite every few months of travel. Actually, this is the first time we’ve been back since we set out on the Planet Rush.”</i>");
	output("\n\nYou chime in, asking why come all the way here when she could refuel at most other stations.");
	output("\n\n<i>“My ship has a very high operating cost, so if we can save a few million credits by skipping the distributor and buying straight from the refinery, we’ll do so. But this time we ran into a problem.”</i> You raise an eyebrow. <i>“You see, our arrival here was... unexpected, so there weren’t any shipments of savicite reserved for us, and it would be unwise to leave orbit until we get something. Burning deuterium and helium-3 alone might not be enough, so I’m down here right now with a legal team to negotiate with Steele Industries for an emergency resupply. We need just enough to make it to Tavros Station.”</i>");
	processTime(3);
	//[Volunteer to Help] [Say Nothing]
	clearMenu();
	if(flags["BEA_QUEST"] == undefined)
	{
		addButton(0,"Volunteer",volunteerToHelpbeatrice, undefined, "Volunteer to Help", "Help her get some savicite.");
		addButton(1,"Say Nothing",backToBeatriceMain, undefined, "Say Nothing", "Maybe do something else.");
	}
	else beatriceTalkMenu(uvetoTalkWithBeatrice);
}

//these options go away after choosing <i>“Volunteer”</i>
public function volunteerToHelpbeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	//[Volunteer to Help]
	//once off talk unlocks <i>“Sell”</i>
	output(flags["BEA_TITLE"] + " mentioning the name of your company catches your attention. <i>“Anything I can do?”</i>");
	output("\n\n<i>“Oh, I appreciate the thought, sweetie, I really do, but I don’t think there’s any way you can help.”</i> She gives you an apologetic look, not enjoying having to turn you down. <i>“Our new contract is being drafted right now. It should be enough to get us to Tavros for repairs and a complete refueling, after which we’ll head back into the Rush.”</i>");
	output("\n\nBut you tell her there is something you can do. You volunteer to be that alternate supply by gathering savicite for her out in the frozen wilderness.");
	output("\n\n<i>“Oh, I could never ask that of you! It’s too dangerous out there and whatever deposits are on the surface might not be enough, especially for one person to carry.”</i>");
	output("\n\nDiplomatically, you tell her that you’re already going out into the wilds and that you’ll probably pick up any savicite you’ll find anyway, so why not give it to her if she needs it.");
	output("\n\n<i>“I’m sorry, sweetie, I just didn’t want you to get hurt on account of me. But if that’s what you want to do, then I’ll accept your offer. If you bring me any savicite you find, I’ll pay extra for your services.”</i>");
	flags["BEA_QUEST"] = 1;
	processTime(6);
	beatriceTalkMenu(uvetoTalkWithBeatrice);
}

//Sell
//only buys savicite
public function sellSaviciteToBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("You tell " + flags["BEA_TITLE"] + " that you’ve got some ");
	//repeat:
	if(flags["BEA_SAVCOUNT"] != undefined) output("more ");
	output("savicite for her, just like she asked.");
	output("\n\nHer face lights up. <i>“Oh, that’s wonderful. How much are you willing to part with?”</i>");
	processTime(1);
	//[1] [5] [10] [Nevermind]
	clearMenu();
	if(pc.hasItemByClass(Savicite)) addButton(0,"1",actuallySellSaviciteToBeatrice,1);
	else addDisabledButton(0,"1","1","You don’t have that much savicite.");
	if(pc.hasItemByClass(Savicite,5)) addButton(1,"5",actuallySellSaviciteToBeatrice,5);
	else addDisabledButton(1,"5","5","You don’t have that much savicite.");
	if(pc.hasItemByClass(Savicite,10)) addButton(2,"10",actuallySellSaviciteToBeatrice,10);
	else addDisabledButton(2,"10","10","You don’t have that much savicite.");
	addButton(14,"Never Mind",nevermindSaviciteBeatrice);
}

//Any Amount
public function actuallySellSaviciteToBeatrice(quantity:int):void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("She smiles and taps on her Codex. Soon, one of her crewmen shows up to take the savicite back to her ship.");
	output("\n\n<i>“Thank you for your help");
	if(silly) output(". You’re a really useful engine");
	output(".”</i> She works her Codex again and sends ");
	var savicite:ItemSlotClass = new Savicite();
	output(quantity * savicite.basePrice + " credits to your account.");
	pc.credits += quantity * savicite.basePrice;
	//after selling, automatically goes back to her main menu
	processTime(3);
	pc.destroyItemByClass(Savicite,quantity);
	clearMenu();
	while(quantity > 0)
	{
		IncrementFlag("BEA_SAVCOUNT");
		quantity--;
	}
	//If sold enough to finish the quest, start the countdown till she leaves.
	if(flags["BEA_SAVCOUNT"] >= 30 && !pc.hasStatusEffect("Bea Leave Delay") && flags["BEA_QUEST"] != 3)
	{
		pc.createStatusEffect("Bea Leave Delay");
		flags["BEA_QUEST"] = 3;
		pc.setStatusMinutes("Bea Leave Delay",720);
	}
	//After half is sold, proc dis shit
	if(flags["BEA_SAVCOUNT"] >= 15 && flags["BEA_QUEST"] == 1) addButton(0,"Next",giftFromSkankMom);
	else reasnerMenu();

}

//Nevermind
public function nevermindSaviciteBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	if(!pc.hasItemByClass(Savicite)) output("Actually, you tell her you don’t have any on you at the moment.");
	else output("On second thought, you plan on holding on to what you’ve got, for now.");
	output("\n\n<i>“It’s quite alright, sweetie,”</i> she says honestly, <i>“take your time. I just don’t want you to get hurt.”</i>");
	//goes back to her main menu
	processTime(1);
	reasnerMenu();
}

//Gift
//triggered after half the total amount of savicite is sold
//one time only
public function giftFromSkankMom():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("After the credits are secure in your account, you’re about to leave but " + flags["BEA_TITLE"] + " stops you.");
	output("\n\n<i>“Could you wait for a moment, sweetie? I have something for you.”</i> You turn to face her. In her hands is a folded piece of cloth that she quickly wraps around your neck before you can react. Made of wool, it’s soft and warm like a hug, with decorative embroidery and tassels. Though good, the weave isn’t as professional as you’d find from a store or a replicator, as if...");
	output("\n\n<i>“Did you make this yourself?”</i>");
	output("\n\n<i>“Yes, I did,”</i> " + flags["BEA_TITLE"] + " beams, adjusting the scarf to better fit you, <i>“I think my knitting skills have gotten better over the years.”</i>");
	output("\n\nYou thank her for the scarf, but it’s a little too warm in here for it right now, so you put it in your inventory.\n\n");
	processTime(4);
	flags["BEA_QUEST"] = 2;
	quickLoot(new BeatricesScarf());
}

//Leave
public function leaveAfterBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("You look at the time and tell " + flags["BEA_TITLE"] + " that you’d better be on your way.");
	output("\n\n<i>“Thank you for your company, sweetie,”</i> she gives you a little wave, <i>“clear space and safe landings to you.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Events
//Rest
//unlocked after reading all talk options, repeatable, available from her main menu
public function restWithMommaBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("After such a long day, you can’t help but let out a yawn.");
	output("\n\n<i>“My, are you feeling tired?”</i> " + flags["BEA_TITLE"] + " asks, <i>“Do you want to lie down?”</i>");
	output("\n\nNow that you think about it, your eyelids do feel quite heavy. Another yawn escapes your mouth and she smiles.");
	output("\n\nShe types something into her Codex before standing up, rising to her full high-heeled height");
	if(pc.tallness < 66 || pc.tallness > 78)
	{
		output("; you have to look ");
		if(pc.tallness < 66) output("up");
		else output("down");
		output(" at her, but she doesn’t seem to mind");
	}
	output(". You give her a questioning look. <i>“I just booked us a room,”</i> she says and takes your hand, leading you. <i>“Don’t worry, it’ll be just the two of us.”</i>");
	output("\n\nStill, you can’t help feeling a little anxious with a married woman taking you to a private back room.");
	output("\n\nOnce inside the rustic hotel room, she removes her jacket, loosens her hair, and sits on the edge of the bed after dimming the lights.");
	output("\n\n<i>“Come,”</i> she pats her lap, <i>“lie down; you must be tired.”</i>");
	output("\n\nYou do feel exhausted after all you’ve been through in your travels, but still ask why she’s letting you do this.");
	output("\n\n<i>“Because I want to give you a safe place to rest. Somewhere you can take off your armor and let someone spoil you.”</i>");
	output("\n\nYou do as " + flags["BEA_TITLE"] + " asks, finding it satisfying to follow her instructions. You sit down and put your [pc.legs] on the bed as she guides your head onto her soft, inviting lap. You can feel the warmth of her thighs even through her skirt and stockings.");
	output("\n\nYou see her beautiful visage above you, russet eyes gazing down into yours, a loving smile upon her full, rosy lips. Long chestnut hair cascades over her shoulders onto her white blouse. " + flags["BEA_TITLE"] + " slowly pets your head as she starts to hum. You ");
	//background Bookworm or Pampered: 
	if(flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_BOOKWORM || flags["PC_UPBRINGING"] == GLOBAL.UPBRINGING_PAMPERED) output("recognize the tune as an old lullaby back on Earth;");
	else output("don’t recognize the tune, but");
	output(" its soft and sweet melody melts away all your stress, taking you back to simpler times in your life when you didn’t have any worries and could indulge in being spoiled. Your eyes become so heavy that you can’t think of anything besides closing them and drifting off to sleep, her gentle caress encouraging you even more.");
	output("\n\nYour breathing and heartbeat slow down, your muscles relax, and your lust subsides as you bask in the glow of her maternal affection. All you can see is black as your consciousness fades to peaceful slumber, with her lyrical hum guiding your pleasant dreams.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",missReasnerRest2);
}
public function missReasnerRest2():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("Eventually you awake, slowly, to an unfamiliar ceiling and a beautiful woman. " + flags["BEA_TITLE"] + " is still humming her tune, but when she sees your eyelids ajar, she stops.");
	output("\n\n<i>“My,”</i> she whispers affectionately, <i>“are you awake now?”</i> Her fingers run lightly ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("across your scalp");
	if(InCollection(pc.earType,[GLOBAL.TYPE_CANINE,GLOBAL.TYPE_KUITAN,GLOBAL.TYPE_LAPINE,GLOBAL.TYPE_FELINE,GLOBAL.TYPE_LEITHAN])) output(" and scratch behind your ear");
	output(".");
	output("\n\nGroggily, you ask her how long it’s been.");
	output("\n\n<i>“About three hours.”</i> She doesn’t seem to mind the time. <i>“Are you all rested, sweetie?”</i>");
	output("\n\nYou are. With all the fatigue gone, a sense of total relaxation fills your body. You really like the way she strokes your head and rests her other hand on your [pc.belly]. Even if you don’t need to, you ask " + flags["BEA_TITLE"] + " if you could stay like this with her for a while longer.");
	output("\n\nHer continued humming is the only answer you need. You nuzzle up against her nearby belly, letting " + flags["BEA_TITLE"] + "’s [bea.breasts] rest on your head. Surrounded on four sides by her soft flesh, you can really appreciate her warmth and fragrance.");
	output("\n\nAbout an hour later, you think it’s time to go. Part of you wants to stay like this even longer, finding it so hard to withdraw from " + flags["BEA_TITLE"] + "’s tender embrace.");
	output("\n\n<i>“Must you leave so soon?”</i> she asks.");
	output("\n\nUnfortunately, you have to.");
	IncrementFlag("BEA_RESTS");
	// +4 hour / - all lust / + all energy / - 2 Libido (FEN NOTE: NOOOOOPE)
	processTime(60*4+rand(20));
	pc.changeLust(-150);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Encounter with Husband
//one time only event that has a chance to proc during Approach after doing Rest at least once, ends up at her main menu
public function encounterMisterTrentReasner():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	showName("MR. & MRS.\nREASNER");
	output("You make your way over to her table again. <i>“");
	if(pc.isAss() || pc.isBro()) output("I’m sitting here.");
	else output("Mind if I sit?");
	output("”</i>");
	output("\n\n<i>“");
	if(pc.isAss() || pc.isBro()) output("Please, go ahead");
	else output("You needn’t even ask");
	output(".”</i>");
	output("\n\nYou seat yourself. It’s quiet, but not in a bad way... until someone suddenly appears from behind.");
	output("\n\n<i>“Care if I join you two?”</i> a half-ausar man asks and gives your shoulder a friendly squeeze. He’s ruggedly handsome, standing just over six feet with broad shoulders, lightly tanned skin and toned musculature. Short grey hair with a matching close-cropped beard frame his masculine face and sharp blue eyes. A noticeable dueling scar adorns his left cheek. <i>“I see the two of you have already met.”</i>");
	output("\n\nYou’re sitting at just the right height to take a gander at the sizable bulge in his trousers; that is if you felt like looking away from his friendly, good-natured grin.");
	output("\n\nHe wears a suit-like uniform that looks good on him but clashes with his roguish charm. You imagine he’d look more natural in a leather jacket and jeans. Three gold stripes decorate his shoulder boards, compared to " + flags["BEA_TITLE"] + "’s four.");
	output("\n\n<i>“Please,”</i> " + flags["BEA_TITLE"] + " responds. You nod.");
	output("\n\n<i>“I should probably introduce myself,”</i> he says to you and offers his hand; only now do you notice a simple gold ring on his finger.");
	output("\n\n<i>“Sweetie,”</i> " + flags["BEA_TITLE"] + " politely says, <i>“I’d like you to meet my husband...”</i>");
	output("\n\n<i>“Traven Reasner,”</i> you shake his hand and get a strong grip and a reassuring pat on the shoulder, <i>“glad to meet you, " + pc.mf("son","miss") + "! The missus had some nice things to say about a splendid young [pc.manWoman] she met here.”</i>");

	if(flags["BEA_RELATIONSHIP"] == 2) output("\n\nYou don’t know what to say. You weren’t expecting to ever meet him, especially since you’re, well, sleeping with his wife.");
	output("\n\nWith a finger, he lifts " + flags["BEA_TITLE"] + "’s chin up and plants a chaste kiss on her lips before seating himself next to his wife. Right away the husband asks, <i>“So, tell me about yourself, " + pc.mf("son","miss") + ".”</i>");
	output("\n\n<i>“Didn’t you say your wife mentioned me?”</i>");
	output("\n\n<i>“Well, yeah. She said you were Victor Steele’s kid, [pc.name], on a quest for your inheritance, but I also wanted to hear it from you, too. Just trying to start a conversation here, you know.”</i> He pulls out a wooden pipe from his jacket, packs it, lights it, and takes a few puffs.");
	output("\n\n<i>“Since you already know about me,”</i> you say, <i>“why don’t you tell me about yourself, instead.”</i>");
	output("\n\n<i>“Can do.”</i> He causally relaxes into his chair, rocking it back so it’s balanced on the two rear legs, in stark contrast to his wife’s formal, ladylike posture. <i>“The name’s Traven Reasner, as you’ve heard, but you can just call me Traven. I’m not really one for titles, so no need to call me ‘Sir’ or ‘Commander’.”</i>");
	output("\n\n<i>“You should take pride in your titles, dear.”</i> " + flags["BEA_TITLE"] + " chimes in.");
	output("\n\n<i>“You earned yours. I didn’t.”</i>");
	output("\n\n<i>“What about ‘Mr. Reasner’?”</i> you add.");
	output("\n\nTraven grins, <i>“Ah, now there’s a title I’ve been more than happy to have since joining the Reasner family. Still, it’s a bit more than I’m used to.”</i>");
	output("\n\nYou ask him what he does for a living.");
	output("\n\n<i>“Oh, right now I’m a simple carpenter and the XO on </i>Inexorable<i>.”</i> He sets his pipe down. <i>“But before that I was an adventurer, much like yourself. That is,”</i> he lifts his wife’s hand up and puts a gentlemanly kiss atop it, <i>“until I put a ring on this finger.”</i>");
	output("\n\nA slight blush spreads across " + flags["BEA_TITLE"] + "’s cheeks. <i>“Oh, hush, dear.”</i> She withdraws her hand and caresses it for a moment. <i>“How about I go get us something to drink.”</i>");
	output("\n\n<i>“Whiskey for me. How about you, " + pc.mf("son","miss") + "?”</i> Traven and you tell her what you both want. " + flags["BEA_TITLE"] + " leaves the two of you alone and makes her way to the bar, with her husband blatantly ogling the sensual sway of her wide hips and shapely derriere. The spectacle also catches the attention of others in the tavern; you can clearly see the desire in their eyes.");
	output("\n\n<i>“So,”</i> you speak up before it gets awkward, <i>“I heard you’re here for savicite.”</i>");
	output("\n\nTraven has to wrest his eyes away from his wife’s backside before responding. <i>“Yeah, shit happens.”</i> He start smoking his pipe again. <i>“We just got our asses handed to us in the Rush, burnt through the rest of our fuel getting the hell out of there.”</i> There’s a bitterness to his voice; you get the impression that Traven’s not the kind of man who runs away easily. <i>“We’ve already got a good amount of D and H-3, but still need some savicite to make it to Tavros. Our machine shops can only repair the ship so much.”</i>");
	output("\n\nYou mention how " + flags["BEA_TITLE"] + " knows who you are, even though she never brings it up, and about their ongoing problem with Steele Tech; so why didn’t she ask for you to do anything to help?");
	output("\n\n<i>“You aren’t in charge of your company yet, right? So there’s nothing you could’ve done anyway, I assume.”</i> You don’t contest what he says since it’s pretty much true. <i>“Besides, she’s not the type of woman to ask for special favors or treat people differently based on their wealth or connections. She loves everyone equally, whether they be beggars or billionaire play" + pc.mf("boys","girls") + ".”</i>");
	output("\n\n<i>“And she’s not only capable but also fiercely independent, so it’s hard for her to ask for help. That doesn’t mean she’ll refuse any; she’d simply prefer others to depend on her rather than the other way around.”</i> He looks around to make sure his wife’s not right behind him. <i>“I know I really shouldn’t be saying this - so don’t tell her I did - but she can also hold her own in a fight.”</i>");
	output("\n\n<i>“Really?”</i>");
	output("\n\nTraven taps the scar on his cheek. <i>“Really. Before we married, believe it or not, the missus was quite the hardass.”</i> He pauses and strokes his beard thoughtfully. <i>“Nah, that’s a bit too harsh. She was always a nice person, just way too serious and career focused. That made her a great officer, but she didn’t know how to relax.”</i> He crosses his arms as a fond expression spreads across his face. <i>“Just some of the many reasons I fell in love with her.”</i>");
	output("\n\n" + flags["BEA_TITLE"] + " returns a minute later, glasses in hand. <i>“I have a sneaking suspicion that you were talking about me.”</i> She sets them down on the table: whiskey - neat - for her husband, brandy for herself, and whatever you ordered. <i>“I hope it was something pleasant, at least.”</i>");
	output("\n\nThe three of you drink and shoot the breeze for the better part of an hour, talking adventures until Traven’s Codex starts beeping. He takes it out and checks.");
	output("\n\n<i>“Looks like our little princess needs me.”</i> He puts it away.");
	output("\n\n<i>“My,”</i> " + flags["BEA_TITLE"] + " says, concerned, <i>“is everything alright?”</i>");
	output("\n\n<i>“Yeah, I think she just wants me to read her report. I swear, that girl takes after you a little too much.”</i> He stands up and pushes his chair back in. <i>“She needs to get out and play more.”</i>");
	output("\n\n<i>“I thinks she’s doing quite well.”</i>");
	output("\n\n<i>“What she really needs is to get herself a lover.”</i> Traven looks towards you with a mischievous grin. <i>“Maybe our new friend would like to ask for her hand.”</i>");
	output("\n\n<i>“Oh, she’s still too young for that!”</i>");
	output("\n\n<i>“She has to leave the nest sooner or later.”</i> Traven gives his wife a parting kiss. <i>“I’ll see you later tonight.”</i> He adjusts his tie and leaves the tavern.");
	output("\n\nAfter a moment, " + flags["BEA_TITLE"] + " speaks up. <i>“You can ignore that last part, he says things like that when he drinks.”</i> She looks off into the distance. <i>“It’s already been decided that our daughter will inherit the ship when we’re gone.”</i>");
	output("\n\nAgain, it’s quiet, but not in a bad way. " + flags["BEA_TITLE"] + " seems happy with the companionable silence, but what do you want?");
	flags["MET_BEA_HUBBY"] = 1;
	processTime(90);
	// + 1.5 hours
	//[Appearance] [Talk] [Sell] [Rest] [Make Love] [Leave]
	reasnerMenu();
}

//Make Love
//lust needs to be > 60 (repeat only 50. Goddamnit, bobby)
//requires having done Rest at least once
//sets BEA_RELATIONSHIP to 2

public function makeLoveToBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	//first time:
	if(flags["BEA_RELATIONSHIP"] < 2)
	{
		output("While sitting there in comfortable silence, a warm feeling slowly spreads throughout your body, starting at your nose and ending in your loins. And you have an idea why.");
		output("\n\nAs the hot air from the fire rises, it draws cool air from around the room, and sitting downwind from " + flags["BEA_TITLE"] + ", you are in the direct path of her scent. It isn’t just her sweet, vanilla-scented perfume you smell, it’s something more primal. A small bead of sweat rolls down her pale neck and you notice a tinge of crimson upon her cheeks; the alcohol must be making her feel warmer. That light amount of sweat, you think, must be where this subtle fragrance is coming from. It’s " + flags["BEA_TITLE"] + "’s very own scent: the pheromones of a fertile woman.");
		output("\n\nYour heart quickens, your senses sharpen, and your desire for " + flags["BEA_TITLE"] + " increases despite the fact that she’s married. You want her.");
		output("\n\n<i>“[pc.name], sweetie,”</i> she asks, concerned, <i>“you look ferverish, do you need ");
		if(silly) output("more cowbell");
		else output("to lie down");
		output("?”</i> You nod, and after making a quick reservation, she takes you by the hand, leading you to a back room like before.");
		output("\n\nOnce there, she slips off her coat and sets it aside. Through her white blouse, you can make out her black bra underneath. You can’t help yourself any longer; before " + flags["BEA_TITLE"] + " can react, you pull her in close against you, overwhelmed with a desire to touch her. You can feel the firm cups of her large bra pressed against you.");
		output("\n\nSurprised, she looks into your eyes; her pouty, kissable lips are so close and alluring - glossy and scarlet, like the color of arousal.");
		if(pc.isNice()) output("\n\n<i>But she’s married</i>, you tell yourself, <i>you can’t do this to someone’s wife</i>.");
		else if(pc.isMischievous()) 
		{
			output("\n\nYou’ve ");
			if(pc.cockVirgin) output("spent a lot of time thinking about");
			else output("gotten used to");
			output(" wooing women in the past, but to have a chance with someone’s beautiful wife is a rare treat.");
		}
		else output("\n\nYou know it’s wrong to desire someone else’s wife; but you don’t care, you want this woman <i>now</i>!");

		output("\n\nYou start to lean in, slowly enough to give her the opportunity to resist. Closer and closer you edge toward " + flags["BEA_TITLE"] + "’s mouth, closing your eyes in anticipation. Just before they shut, you see her do the same. Luscious full lips meet yours and linger for a while in a chaste kiss." + pc.mf(""," Even though she’s married to a man, and is attracted to men, she’s apparently ok with kissing a woman.") + " Locked together at the lips, she doesn’t seem to mind your hand sliding down her back to fondle her delectable butt, feeling her panties under her skirt. But this isn’t enough; you need more.");

		output("\n\nIn your ");
		if(pc.hasCock()) output("rutting");
		else output("feverish");
		output(" desire, you suddenly thrust your tongue into her mouth. Squeezing her squishy ass, you try to shove your other hand into her blouse to grope a breast under its firm, lacy confines.");
		if(pc.hasCock()) 
		{
			output(" You’re sure she can feel [pc.eachCock] swelling against ");
			if(pc.tallness >= 77) output("her belly");
			else if(pc.tallness >= 65) output("the delta hidden behind her skirt");
			else output("her thighs");
			output(".");
		}
		output("\n\nA sharp gasp escapes her lips before she pushes you off. <i>“[pc.name]!”</i> You release your grip, ");
		if(pc.isNice()) output("feeling guilty about forcing yourself on her");
		else output("momentarily taken aback");
		output(". She gently holds on to you and looks you in the eye with a conciliatory smile. <i>“It’s all right,”</i> she says in a soothing voice, <i>“I’m not mad at you, just surprised. Why don’t you tell me what’s going on.”</i>");
		output("\n\nYou find it hard to explain this well; how you feel when you’re with her, or when she touches you; the way you desire to touch her. " + flags["BEA_TITLE"] + " listens to your every word with understanding.");
		output("\n\nInstead of being turned off by your earnest feelings, she wraps her arms around your waist and brings you into her warm embrace. <i>“I see. You want me to take care of your </i>needs<i>.”</i> she says, to which you nod. <i>“I’d love to, sweetie, you’re a very special person to me, but I’m married.”</i>");
		output("\n\nDisappointment wells up inside you.");
		output("\n\n<i>“But,”</i> she adds with a coy smile, <i>“as long as this remains between just you and me...”</i>");
		output("\n\nYour heart skips a beat. Did she really just say what you think she said; what about her husband? You ask if she’s really willing to do this just to fulfill your selfish desire?");
		output("\n\n<i>“Mm-hmm, I am if you are,”</i> she says in an unusually sensual tone. <i>“So, how do you want me to spoil you?”</i> she’s so close that you can smell her fragrance, along with a bit of alcohol on her breath. <i>“Do you want me to use my hands,”</i> she whispers");
		if(pc.tallness < 72) output(" into your ear");
		output(", <i>“my mouth, my feet, ");
		if(!pc.hasCock()) output("or maybe ");
		output("my breasts");
		if(pc.hasCock()) 
		{
			output(",”</i> her fingers trace around your growing excitement, <i>“or maybe you want to sheath yourself deep inside me");
			//PC has not done anal:
			//if(THIS ISNT EVEN A THING?) output(", perhaps somewhere even my husband hasn’t");
		}
		output("?”</i>");
		output("\n\nIt seems that despite her regal appearance, her maternal demeanor or even the fact that she’s married, deep down " + flags["BEA_TITLE"] + " is still a woman filled with desire.");
		output("\n\nNow, what do you want to do with her?");
		flags["BEA_RELATIONSHIP"] = 2;
		processTime(12);
		pc.changeLust(40);
	}		
	//repeat:
	//lust needs to be >50
	else
	{
		output("Your eyes drift down to roam over her voluptuous body, unfortunately hidden underneath her modest clothing. She’s looking off into the crackling fire and doesn’t notice your wandering gaze.");
		output("\n\nGetting " + flags["BEA_TITLE"] + "’s attention, you give her a knowing grin and ask if you could make love to her. A blush spreads across her face, along with a warm smile. <i>“My, [pc.name], do you want me to spoil you again?”</i> Seeing your positive reaction, she adds, <i>“How about we go somewhere more private for that.”</i>");
		output("\n\nStanding up, " + flags["BEA_TITLE"] + " leads you by the hand to one of the back rooms. Your heart beats faster and harder as you think about what you’re going to do with her.");
		output("\n\nOnce there, the curvy wife sashays up and takes you in her arms, pulling you in close. <i>“So, how do you want me to spoil you?”</i> She’s so close that you can smell her fragrance, along with a bit of alcohol on her breath. <i>“Do you want me to use my hands,”</i> she whispers");

		if(pc.tallness < 72) output(" into your ear");
		output(", <i>“my mouth, my feet, ");
		if(!pc.hasCock()) output("or maybe ");
		output("my breasts");
		if(pc.hasCock()) 
		{
			output(",”</i> her fingers trace around your growing excitement, <i>“or maybe you want to sheath yourself deep inside me");
			//PC has not done anal:
			//if(THIS ISNT EVEN A THING?) output(", perhaps somewhere even my husband hasn’t");
		}
		output("?”</i>");
		output("\n\nIt seems that despite her regal appearance, her maternal demeanor or even the fact that she’s married, deep down " + flags["BEA_TITLE"] + " is still a woman filled with desire.");
		output("\n\nNow, what do you want to do with her?");
		processTime(6);
		pc.changeLust(40);
	}
	clearMenu();
	//[Cowgirl] [Suckle] [Reach-Around] [Nevermind]
	if(pc.hasCock() && pc.cockThatFits(bea.vaginalCapacity(0)) >= 0) addButton(0,"Cowgirl",cowgirlMissReasner,undefined,"Cowgirl","Let " + flags["BEA_TITLE"] + " sit on your lap and ride you");
	else addDisabledButton(0,"Cowgirl","Cowgirl","You need a penis that would fit inside her in order to do this.");
	//Suckle
	addButton(1,"Suckle",suckleBeatriceTitttttaaaaaays,undefined,"Suckle","Drink from her bosom.");
	//Reach-Around
	if(pc.hasGenitals()) 
	{
		if(!pc.hasCock() && pc.blockedVaginas() > 0) addDisabledButton(2,"Reach Around","Reach Around","With something obstructing your feminine sex, this would be a poor activity.");
		else addButton(2,"Reach Around",reachAroooooooooogalaBeatrice,undefined,"Reach Around","Let " + flags["BEA_TITLE"] + " pleasure you with her hands.");
	}
	else addDisabledButton(2,"Reach Around","Reach Around","You need a penis or a vagina for this.");
	addButton(14,"Never Mind",nevermindLetsNotFuckBecauseImTerrible);
}

//Cowgirl
//tooltip: Let " + flags["BEA_TITLE"] + " sit on your lap and ride you
//requires penis =<3”</i>
public function cowgirlMissReasner():void
{
	clearOutput();
	showBeatrice(true);
	author("Tacit");
	var virgin:Boolean = pc.cockVirgin;
	output(flags["BEA_TITLE"] + " takes you in her arms, slowly bringing her beautiful visage closer to your [pc.face] and lightly kissing you, tenderly catching your upper [pc.lipChaste] between hers. You eagerly return her ministrations while exploring her body and lifting her hefty bust, feeling the firm cups of her bra through her blouse. Her tongue traces the outline of your lips before slipping deeper into your mouth.");
	output("\n\nYour [pc.tongue] swirls around hers, moaning into each other’s mouth and inhaling her smoky breath until you get a little dizzy. [pc.SkinFurScalesColor] hands unbutton the front of " + flags["BEA_TITLE"] + "’s blouse, slip inside around her narrow waist and unhook her bra. She sucks your bottom [pc.lipChaste] into her mouth and pulls on it until the kiss breaks, leaving only a trail of spit connecting your mouths.");
	output("\n\n" + flags["BEA_TITLE"] + " pulls away and slowly starts to undress, giving you a little show by pushing out her chest as she removes her blouse and lacy bra, letting her milky F-cups hang free; circling and squeezing her brown areola makes her inverted nipples pop out. " + flags["BEA_TITLE"] + " shows off her body to you, leisurely stroking her limbs and down her midriff to finally undo her belt, letting her long skirt fall to the floor, leaving only her panties, sheer stockings and garter belt; all of it black and lacy with floral patterns. She hooks her thumbs around the sides of her panties and pulls them down her long legs, revealing her [bea.vagina], topped with a soft bush of brown pubic hair.");
	output("\n\nYou ");
	if(!pc.isCrotchExposed()) output("join her in stripping off your [pc.lowerGarments], and ");
	output("eagerly climb onto the bed; " + flags["BEA_TITLE"] + " isn’t far behind, naked save her stockings. You appraise her voluptuous figure");
	if(pc.hasCock()) output(", [pc.eachCock] already half erect in anticipation");
	output(".");
	if(pc.femininity < 30 && pc.tone >= 65 && pc.biggestTitSize() < 1) output(" She sucks in a sharp breath at the sight of your well-defined chest, splaying her hands across its toned surface, clearly turned on by your muscular pecs.");
	var x:int = pc.cockThatFits(bea.vaginalCapacity(0));
	output("\n\nA slender hand grasps [pc.oneCock], stroking and pumping it from tip to base with just the right amount of force. Without being asked, " + flags["BEA_TITLE"] + "’s [bea.lips] envelop your [pc.cockHead " + x + "] before");
	//cock > 5”
	if(pc.cocks[x].cLength() < 5) output(" sliding it down her throat with practiced ease");
	else output(" taking it deep inside her mouth");
	if(pc.cocks[x].cLength() <= 10) output(" until she reaches your [pc.sheath " + x + "]");
	output(", fellating you to full mast.");

	output("\n\nAfter pulling your cock out of her hollowed cheeks with a wet ‘pop’, she gently pushes you into a seated position against the bed’s backboard before straddling your [pc.legs]. She reaches between her legs, stroking her [bea.vagina] and [bea.clit], ensuring that she’s wet enough to accept you inside. You take the opportunity to tug and flick her [bea.nipples] until they’re as stiff as can be and leaking milk.");

	output("\n\nWith her other hand, she strokes your fully erect [pc.cock " + x + "] against her belly, the soft pubes on her mons tickling the underside of your prick. You can see just how deep it’s going to go inside her. Pre leaks from your tip as she lifts her [bea.hips] up, just above your waiting member, and teases you by sliding only your [pc.cockHead " + x + "] inside her warm, wet opening.");

	//is a virgin:
	if(virgin)
	{
		output("\n\nYou let out a sharp gasp and she stops for a moment. <i>“Is this your first time, sweetie?”</i>");
		output("\n\nYou hesitantly nod, embarrassed to admit it.");
		output("\n\n<i>“There’s nothing to be ashamed of, I’m glad to be your first,”</i> her confident, kind tone melts away your doubts and anxiety, <i>“Knowing that won’t change how I love you; you’re still precious to me, no matter how experienced you are.”</i>");
	}
	output("\n\nShe slowly lowers her hips, spearing herself ");
	if(pc.cocks[x].cLength() >= 10) output("on almost a foot of your [pc.cockNounComplex " + x + "] until her deepest parts come to rest against your tip");
	// cock =< 10”</i>:
	else 
	{
		output("as far as she can on your [pc.cockNounComplex " + x + "] until her nether-lips come to rest against your [pc.sheath " + x + "]");
		if(pc.cocks[x].cLength() >= 8) output(", your tip kissing her deepest parts");
	}
	output(". A wave of sinful ecstasy runs up your spine from having sheathed yourself inside a married woman.");
	pc.cockChange();

	output("\n\n" + flags["BEA_TITLE"] + "’s body shudders in bliss at being penetrated");
	if(pc.cocks[x].cLength() >= 8) output(" so deeply");
	if(pc.cocks[x].thickness() >= 3) output(" by such a girthy [pc.cockNounSimple " + x + "]");
	output(". Her soft inner walls envelop and caress every inch of your [pc.cock " + x + "] like a hot, wet blanket. Strands of love-juice leak from her sodden box onto your groin as delicious moans escape her lips.");

	output("\n\nAfter bottoming out, she wraps her arms around you in a loving embrace. The closeness of her warm, soft flesh wrapped around your ");
	if(pc.thickness < 40) output("lithe");
	else output("thick");
	output(" body draws out a sense of happiness from deep within; her tender hug makes you feel safe and secure and loved. You call out her name in a sweet moan, nuzzling her ");
	if(pc.tallness < bea.tallness) output("bosom");
	else if(pc.tallness == bea.tallness) output("cheek");
	else output("hair");
	output(". Her [bea.vagina] tightens when she hears your voice.");

	output("\n\n<i>“Me too,”</i> " + flags["BEA_TITLE"] + " whispers, cradling you; through her flushed skin you feel her heart palpitate, <i>“I’m only thinking of you, [pc.name].”</i>");
	output("\n\nShe starts rocking her [bea.hips] back and forth, squeezing your dick rhythmically. You find your hands ");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("and [pc.tails] ");
	output("gripping her back, sliding her up and down your pussy-slicked shaft while your hips match her sensual gyrations. The only noise in the room is the sound of lewd moaning and wet grinding.");

	output("\n\nScarlet painted fingernails rake ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("across your scalp");
	output(" and guide you into a deep kiss, her tender wet lips sucking on yours as her tongue slides in as far as it can. " + flags["BEA_TITLE"] + " moans into your mouth as she increases the tempo of her ministrations. Her [bea.breasts] jiggle and bounce so tantalizingly that you can’t help but to grope and knead them, squeezing out streams of milk from her erect nipples that run down your");
	if(pc.tallness < bea.tallness) output(" [pc.fullChest] and");
	output(" [pc.belly]");
	if(pc.canMilkSquirt()) output(", along with your own [pc.milk]");
	output(".");

	output("\n\n" + flags["BEA_TITLE"] + " breaks the kiss as uncontrolled gasps of pleasure force her to take deep breaths. Beads of sweat run down her flushed skin, releasing sweet pheromones that make your mind go hazy; her eyes are glazed and unfocused. Your [pc.cock " + x + "] starts twitching and throbbing as you near the verge of orgasm. <i>“Don’t hold back,”</i> " + flags["BEA_TITLE"] + " moans, <i>“cum inside me whenever you want.”</i> She plants kisses down your face and neck, gently biting your jaw");
	if(!pc.hasScales() && !pc.hasChitin()) output(" and sucking the [pc.skinFurScales] of your neck into her mouth, leaving hickies and ");
	else output(", leaving ");
	output("lipstick marks behind. She’s clearly in charge, yet she selflessly devotes herself to your pleasure.");

	output("\n\n" + flags["BEA_TITLE"] + " wraps her long, stocking-clad legs around your ");
	if(pc.thickness < 35) output("lithe ");
	else if(pc.thickness > 66) output("thick ");
	output("waist, pulling your [pc.cockNounComplex " + x + "] deep inside as the noisy slaps of her bouncing hips are replaced by fast, piston-like grinding");
	if(pc.hasKnot(x)) output(", letting your [pc.knot " + x + "] swell inside her entrance and tying her to you");
	output(". <i>“Ah, yes");
	if(pc.hasKnot(x)) output(", I love being knotted");
	output("!”</i> she cries, giving your ego a massive boost as you drive a married woman into the throes of ecstasy.");

	output("\n\nReaching your peak, you grab her [bea.ass] and pull her down on your length, shoving it in as far as you can with " + pc.mf("a primal roar","an impassioned scream") + ", throwing your head back into the headboard. Your [pc.cock " + x + "] convulses, stimulated by her spasming walls, as ");
	if(pc.balls > 0) output("your [pc.balls]");
	else output("you");
	output(" begin pumping her ");
	if(pc.cocks[x].cLength() >= 6) output("fertile womb");
	else output("[bea.vagina]");
	output(" full of virile [pc.cumNoun].");
	
	var cumQ:Number = pc.cumQ();
	
	output("\n\nGirl-cum squirts over your [pc.crotch] as " + flags["BEA_TITLE"] + " gasps in pleasure, her back arched, from having her ");
	if(pc.cocks[x].cLength() > 6) output("womb");
	else output("depths");
	output(" filled");
	if(cumQ >= 4000) 
	{
		output(" to the brim. Her belly swells more and more with every jet of [pc.cum] you can pump into her depths");
		//has knot and cum volume not too high: 
		if(pc.hasKnot(x) && cumQ < 30000) output(", especially with your [pc.knot] making sure none of your [pc.cumNoun] spills back out");
	}
	// else: {has knot:
	else if(pc.hasKnot(x)) output(" and knotted");
	else output(" by someone other than her husband");
	output(".");
	
	if(cumQ >= 30000) 
	{
		output(" But it’s too much for her womb to handle and the excess comes pouring out of her pussy and onto your groin");
		if(pc.hasKnot(x)) output(", despite your knot being firmly in place");
		output(".");
	}
	if(pc.cockTotal() > 1) output(" The rest of your [pc.cocks] unload on the disheveled bedsheets.");

	output("\n\nIn your orgasmic bliss, you both forget just how hard you two are holding onto each other; " + flags["BEA_TITLE"] + "’s polished fingernails dig into the [pc.skinFurScales] of your back");
	if(pc.wingCount > 1 || (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)))
	{
		output(", and your");
		if(pc.wingCount > 1) output(" [pc.wings]");
		if(pc.wingCount > 1 && (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG))) output(" and");
		if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" [pc.tails]");
		var plural:Boolean = (pc.wingCount > 1 || (pc.tailCount > 1 && pc.hasTailFlag(GLOBAL.FLAG_LONG)));
		if(plural) output(" are");
		else output(" is");
		output(" tightly wrapped around her");
	}
	output(". It takes a conscious effort to relax your muscles enough to separate. " + flags["BEA_TITLE"] + ", still on your [pc.cock " + x + "], flushed and sweaty, with thoroughly mussed hair, looks radiant after such a strong orgasm");
	if(cumQ >= 4000) output(" and with a tummy so stuffed with [pc.cumVisc] [pc.cumNoun] that she looks positively pregnant");
	output(".");
	output("\n\nShe cradles her ");
	if(cumQ >= 4000) output("inflated ");
	output("belly and meets your gaze. <i>“I wonder if this will make my little girl into a big sister,”</i> she says with a maternal smile, resplendent in her fecundity. [pc.EachCock] twitches at the thought of impregnating " + flags["BEA_TITLE"] + ". Her thumb massages your cheekbone as soft hand cups your cheek and pulls you in for a long, wet kiss. She uses her internal muscle control to stroke your [pc.cock " + x + "] and draw every last drop of spunk out of you; it feels like you’re slowly sliding in and out of her even though neither of you are moving.");
	output("\n\nEventually, your ");
	if(pc.hasKnot(x)) output("[pc.knot] deflates, and your ");
	output("[pc.cock " + x + "] softens and falls free from " + flags["BEA_TITLE"] + "’s now [pc.cumColor]-colored love-tunnel, a ");
	//low cum volume: 
	if(cumQ < 25) output("trickle");
	// large cum volume:
	else output("stream");
	output(" of [pc.cumVisc] [pc.cumNoun] leaks from her red, swollen pussy-lips. Quite spent from your lovemaking, " + flags["BEA_TITLE"] + " sinks down on your [pc.chest] and smiles");
	if(virgin) output(", <i>“You did so well for your first time, sweetie.”</i> Her praise warms your heart");
	output(" as you doze off in her warm embrace.");

	// each have a random chance to proc
	if(rand(3) == 0)
	{
		output("\n\nSome time later you awake, cleaned up and tucked into bed, to find " + flags["BEA_TITLE"] + " already showered and putting her clothes back on. She looks at the time. <i>“I wish I could stay longer, sweetie,”</i> she says, tucking her blouse into her skirt, <i>“but I have to give a speech at a meeting soon.”</i> The thought of her standing in front of a crowd, maybe even her husband, with ");
		if(cumQ >= 3000) output("some of ");
		output("your cum still sloshing inside her womb almost turns you on enough for another round. She blows you a kiss before she leaves.");
		processTime(27);
		pc.orgasm();
		processTime(60);
	}
	else if(rand(2) == 0)
	{
		output("\n\nSome time later, you wake up to find yourself all alone, cleaned up and tucked into bed. On the nightstand you spot a piece of paper with ");
		if(pc.isBimbo()) output("fancy curvy letters");
		else output("handwritten cursive");
		output(" on it; evidently " + flags["BEA_TITLE"] + " wrote it.");
		output("\n\nIt says that she apologizes for leaving without saying goodbye, but she couldn’t bring herself to disturb your cute sleeping face. She says that she’ll see you again and how she’s glad that the kitchen here let her cook you up something nice, so please enjoy your breakfast. Oddly enough, you only now notice that the note was lying on top of a plate of eggs, bacon and potatoes. She ends the note with her signature and a lipstick mark.");
		//set time to 10:00 - FEN NOTE: DONT DO THIS.
		processTime(27);
		pc.orgasm();
		processTime(260);
		restHeal();
	}
	else
	{
		output("\n\nSome time later, you awake to find yourself being cradled tenderly in " + flags["BEA_TITLE"] + "’s arms, cleaned up and tucked into bed with her. Her naked body is pressed against yours, holding your face against her cleavage and nuzzling your [pc.hair]; ");
		if(pc.legCount == 1) output("one of her legs is hiked over your [pc.leg]");
		else output("her legs are laced with yours, forming an even more intimate bond between your naked bodies");
		output(". She’s still asleep. You lie there for a while longer, listening to her rhythmic heartbeat and feeling her breath tickle your [pc.ear], slowly becoming aware of her [bea.nipples] and soft pubic bush pressed against you.");
		output("\n\nFeeling hungry, you wrap your [pc.lipsChaste] around one of her teats and drink your fill of breast milk for breakfast. Before you end up further molesting this married woman in her sleep, you carefully separate from her, making sure not to wake her up.");
		//set time to 6:00 - FEN NOTE: NOPE.
		processTime(27);
		pc.orgasm();
		processTime(160);
		restHeal();
	}
	//merge
	output("\n\nYou get up and gather your things, more than refreshed and ready for the day ahead.");
	IncrementFlag("BEA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Suckle
//tooltip: Drink from her bosom
public function suckleBeatriceTitttttaaaaaays():void
{
	clearOutput();
	showBeatrice(true);
	author("Tacit");
	output("Now that you think about it, you can almost smell the sweet scent of milk coming from " + flags["BEA_TITLE"] + "’s bosom. Your stomach rumbles and, instinctively, your hands grope her [bea.breasts], driven by a certain hunger for her.");
	output("\n\n" + flags["BEA_TITLE"] + " smiles. <i>“Oh, do you want me to feed you, like my daughter?”</i>");
	output("\n\nYou nod and she removes her jacket and sits on the edge of the bed. <i>“Come here,”</i> she pats her lap like she does when it’s time for a nap, <i>“lay down.”</i> You do as she says, laying your head upon her soft, inviting thighs. Their warmth can be felt through her skirt and stockings.");
	output("\n\nWith a practiced motion, " + flags["BEA_TITLE"] + " unbraids her hair, letting it cascade down her shoulders and unbuttons her shirt. Slowly, she starts at the top and works down until a black, full cup bra reveals itself. The dress shirt falls off her shoulder and she slides one of the lacy confines up over her breast, letting a [bea.breast] hang freely just above your face, capped with a brown, inverted nipple. It’s an interesting experience, seeing the breasts of a married woman you haven’t even known for long. Her hand gently cradles your head from underneath and pulls you in closer until your lips touch her [bea.milkyNipple].");
	output("\n\nThe scent of her milk fills your nostrils. As if on instinct, your [pc.lipsChaste] latch onto the pebbly [bea.nippleColor] disk of her areola, sucking and licking the center to draw out her hidden teat. " + flags["BEA_TITLE"] + " moans as her stiffening inch-long nipple pops out and is greeted by your skillful [pc.tongue]. Soon, your ministrations are rewarded as the first drops of her [bea.milk] meet your palate. Shivers run up her back as more is drawn out of her bountiful bosom. " + flags["BEA_TITLE"] + " smiles down at you as you share this intimate experience.");
	output("\n\nThe taste is unique, and very much like the loving mother who offers it: warm and creamy, sweet and rich in flavor. You suckle eagerly, nursing on the warm nourishment produced by her own body until those few drops turn into a steady stream. " + flags["BEA_TITLE"] + " holds you closer, leaning in slightly, as her [bea.milk] is greedily drunk. Sometimes you drink it right away, other times you suckle until your mouth is full and gulp it down all at once. She starts to hum and stoke your [pc.belly], taking you back to simpler times in your life where you didn’t have any worries and could indulge in being spoiled.");
	output("\n\nHeat radiates from your belly, spreading throughout your body, and you find your breathing and heart beat slowing and your muscles relaxing as you bask in the glow of her maternal affection. Soon, her breast is empty enough to be noticeably lighter, and without missing a beat, you burry your [pc.face] in her other love-pillow, still clothed but with the nipple tenting through her bra and shirt.");
	output("\n\nShe can see the desire in your eyes and takes off the rest of her shirt and undoes her bra all the way, leaving her topless. The other nipple is already dribbling [bea.milk] on its own and you waste no time latching your [pc.lipsChaste] around it. " + flags["BEA_TITLE"] + "’s soothing hum is gradually replaced by moaning.");
	output("\n\nEvery powerful suck or lick of her nipple sends a shudder rippling through her body. Doing your best to enhance her pleasure, you massage her hefty breasts as you continue to drink. You can tell you’re nearing the end, and with a final nibble on her hard teat, her eyes shut tight, her thighs tremble, and she bites her lip to stifle a moan as a rush of milk fills your mouth, some of it running down your cheek.");
	output("\n\nAfterward, with a belly full of breastmilk, you give each thick, inch-long brown nipple a parting kiss. " + flags["BEA_TITLE"] + " whispers softly, <i>“Did you drink your fill?”</i>");
	output("\n\nYou nod, but even though you’ve finished, you ask if you could just stay like this for a while longer. Her smile is the only answer you need.");
	processTime(30);
	pc.milkInMouth(bea);
	pc.changeLust(4);
	IncrementFlag("BEA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Reach-Around
//Let " + flags["BEA_TITLE"] + " pleasure you with her hands
//Reqs cock or pusssssssss
public function reachAroooooooooogalaBeatrice():void
{
	clearOutput();
	showBeatrice(true);
	author("Tacit");
	output(flags["BEA_TITLE"] + " takes off her jacket and high heels and sits on the side of the bed, pushing herself back until only her lower legs hang off the edge. She coquettishly lifts her skirt all the way up her long, stocking-clad legs and spreads them, giving you a full view of her inner thighs and daring black panties that hide her sex. A wide band of floral patterned lace hugs her thighs with garter straps going up further. <i>“");
	//PC wears clothes: 
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("Why don’t you take that off and come");
	else output("Come");
	output(" here.”</i> She pats the spot between her legs.");

	output("\n\n");
	if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("You strip off your [pc.lowerGarments], ");
	else output("You’re ");
	output("keenly aware that you’re naked and she’s not. " + flags["BEA_TITLE"] + " holds out her hand, beckoning you to come closer. With each step you become more ");
	if(pc.exhibitionism() >= 66) output("excited");
	else output("embarrassed");
	output(" by her fully clothed gaze upon your bare [pc.skinFurScales]. " + flags["BEA_TITLE"] + " turns you around and draws you into her lap, putting your ");
	if(pc.tallness >= 65) output("back against her [bea.breasts].");
	else output("head against the soft pillows of her [bea.breasts].");

	output("\n\n<i>“Just relax, sweetie,”</i> she whispers into your ear, <i>“I’ll make you feel good.”</i>");

	output("\n\nThe tips of her fingers touch your shoulders ever so slightly, as if barely there, and trace down your arms. Over your biceps and past your elbows, the phantom fingertips leave goosebumps in their wake. Along your sides, to your [pc.hips] and up your back to the shoulder blades they travel, slowly caressing you.");
	output("\n\nWhat started out feeling ticklish becomes more and more pleasurable. An unexpected waft of warm breath blown into your ear sends an involuntary shiver running down your spine.");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) 
	{
		output(" Your [pc.tails] curl");
		if(pc.tailCount == 1) output("s");
		output(" around " + flags["BEA_TITLE"] + "’s narrow waist, connecting your bodies even further.");
	}
	output("\n\nHer hands make their way up your front, scarlet painted nails splaying across your [pc.breasts], gently applying pressure with her fingers while drawing circles around them. She doesn’t touch your [pc.nipples] directly, teasing out as much sensitivity as possible until they’re ");
	if(pc.hasDickNipples()) output("fully erect");
	else if(pc.hasFuckableNipples()) output("puffy and moist");
	else output("rock hard");
	if(pc.isLactating()) output(" and leaking [pc.milk]");
	output(". Your breathing becomes heavier and a light sweat dots your brow.");

	if(pc.hasCock()) output("\n\n[pc.EachCock] has been at full mast ");
	else if(pc.hasVagina()) output("\n\n[pc.EachVagina] has been dripping love juice ");
	output("for a while now, neglected in favor of other foreplay. " + flags["BEA_TITLE"] + "’s soft palms slide down your [pc.belly] until they reach your groin. <i>“Open your legs,”</i> she instructs, <i>“rest your back on me.”</i> You practically melt under her touch, relaxing submissively into her arms.");

	if(pc.hasCock())
	{
		output("\n\nShe starts stroking your [pc.cockBiggest] as soon as her hands reach it");
		if(pc.biggestCockThickness() >= 2.5) output(", even though she can’t completely wrap her fingers all the way around");
		output(", spreading copious amounts of your pre along the shaft. Nearly every muscle in your body goes slack as her lubed palms stroke and tease your whole length, occasionally slipping a hand down");
		if(pc.balls > 0 && pc.ballDiameter() < 4)
		{
			output(" to massage your [pc.balls] like");
			// has 1 ball or balls 3-4" across: 
			if(pc.balls == 1 || pc.ballDiameter() >= 3) output(" a Ben Wa ball");
			// has 2 balls both <3" across :
			else if(pc.balls == 2 && pc.ballDiameter() < 3) output(" a pair of Ben Wa balls");
			output(", applying just enough pressure to straddle the line between pleasure and pain");
		}
		// PC has no (or >4" across) balls:
		else if(pc.balls == 0 || pc.ballDiameter() >= 4)
		{
			//balls >4" across:
			if(pc.balls > 0 && pc.ballDiameter() >= 4) output(" and around your [pc.balls]");
			output(" to slide her long fingers into your [pc.asshole], curling them inward to stimulate your prostate");
		}
		output(". ");
		//PC balls <4" across: 
		if(pc.ballDiameter() < 4 && pc.balls > 0) 
		{
			output("She thoroughly kneads your cum churning [pc.sack], squeezing it harder almost until you can’t take it then relaxes her grip. It’s a good pain, though; her skillful technique only serves to stoke the fire within your loins. " + flags["BEA_TITLE"] + " certainly knows how to handle ");
			if(pc.balls == 1) output("a testicle");
			else
			{
				if(pc.balls == 2) output("a pair of ");
				output("testes");
			}
			output(".");
		}
		output(" She lavishes your [pc.cockBiggest] and [pc.balls] with skill that could have only been gained from years of pleasuring her husband.");

		output("\n\nYou can feel her hardened nipples press against your back even through her bra and blouse; she must be getting pretty turned on. She pays extra attention to the delicate spots, especially your ");
		if(pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_HUMAN) output("frenulum and ");
		output("[pc.cockHeadBiggest], even going as far as probing your urethra with a fingertip. The other hand pumps vigorously.");

		output("\n\n<i>“Go ahead,</i> she says, her voice low and sultry, <i>“cum for me.”</i> A wave of ecstasy washes over you; your hips buck forward, seeking a fertile pussy to sheath ");
		if(pc.cockTotal() > 1) output("at least one of your [pc.cocks]");
		else output("your [pc.cockBiggest]");
		output(" into, but only finding " + flags["BEA_TITLE"] + "’s tight grip.");
		if(pc.balls > 1) output(" Your sore [pc.balls] contract as a ");
		else output(" A ");
		//high cum volume:
		if(pc.cumQ() >= 200) output("fountain");
		else output("stream");
		output(" of [pc.cum] surges through your [pc.cocks], soaking " + flags["BEA_TITLE"] + "’s hands and splattering all over the floor in front of the bed.");
	}
	//PC has no cock but has vagina:
	else
	{
		var selVag:Number = rand(pc.totalVaginas());
		output("\n\nHer long fingers explore your [pc.vagina " + selVag + "], stroking and spreading your pussylips to arouse and expose [pc.eachClit]. While one set of fingertips starts massaging your sensitive pleasure-buzzer");
		if(pc.totalClits() > 1) output("s");
		output(", the other one slips inside your depths, curling inward to stimulate your g-spot. Unfortunately, her nails are a bit longer than is comfortable for this.");
		output("\n\nDeeper in she pushes, adding another digit as you loosen up. Your hips jerk forward, seeking something larger and girthier than just fingers to fill you up. " + flags["BEA_TITLE"] + " gives your [pc.vagina " + selVag + "] the attention it desires, plumbing and massaging your deepest parts. You can feel tightness building, your inner walls contracting in rhythm with your jerking hips. <i>“It’s ok,”</i> " + flags["BEA_TITLE"] + " whispers, <i>“come whenever you want.”</i>");
		output("\n\nYou ");
		if(flags["BEA_FINGERED_U"] == undefined) output("get the feeling");
		else output("know");
		output(" that she’s trying to get you off quickly, and it’s working. You guess she’s ");
		//repeat: 
		if(flags["BEA_FINGERED_U"] != undefined) output("still ");
		output("not the most comfortable jilling " + pc.mf("someone else’s","another woman’s") + " vagina, so she’s doing it swiftly. " + flags["BEA_TITLE"] + " is pretty much straight from what you’ve gathered - y’know, having a husband and all that. The way she’s stimulating you is probably just her doing the same as when she masturbates. Even so, it warms your heart that " + flags["BEA_TITLE"] + " cares about you so much that she’s willing to do this for you despite her reservations. The pressure mounts as she vigorously fingers [pc.vagina " + selVag + "] until your muscles clamp down on her digits and [pc.girlCum] soaks her palm.");
		IncrementFlag("BEA_FINGERED_U");
	}
	output("\n\nAfter such an intense orgasm, strength leaves your body; still, " + flags["BEA_TITLE"] + " continues to gently pump her drenched ");
	//has cock:
	if(pc.hasCock()) output("hands up and down your spasming shaft");
	else output("fingers in and out your spasming tunnel");
	output(", trying to coax out as much as she can. Several smaller orgasms surge through you like aftershocks. By the end of it you’re panting in exhaustion, lying limply in " + flags["BEA_TITLE"] + "’s arms while she lifts her ");
	if(pc.hasCock()) output("[pc.cum]");
	else output("[pc.girlCum]");
	output(" covered hands to her mouth, cleaning each off with her tongue. She drinks it down a bit more enthusiastically than necessary; perhaps this lovely wife has herself a cum fetish.");

	output("\n\nYou close your eyes and rest your head against " + flags["BEA_TITLE"] + "’s ");
	if(pc.tallness >= 65) output("shoulder");
	else output("[bea.chest]");
	output(" as shocks run up your spine. <i>“Good [pc.girlBoy],”</i> " + flags["BEA_TITLE"] + " coos, holding your spent body against herself until you recover, <i>“you let out so much.”</i> All you can do is look into her eyes with a smile. She really seems to enjoy seeing the happiness and satisfaction on your face.");
	output("\n\nAfterwards, you get cleaned up and gather your gear. You volunteer to help your graceful hostess clean up the mess on the floor, but she insists that she can do it herself.");
	processTime(20);
	pc.orgasm();
	IncrementFlag("BEA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nevermind
public function nevermindLetsNotFuckBecauseImTerrible():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("Even though you were the one who asked for this, you’ve suddenly changed your mind.");
	output("\n\n" + flags["BEA_TITLE"] + " doesn’t seem to be upset by your declination. <i>“It’s alright if you’re not in the mood right now,”</i> she holds your hands, <i>“maybe next time, when you’re ready.”</i>");
	output("\n\nTogether you head back out and go your separate ways, but not before " + flags["BEA_TITLE"] + " gives you a light parting kiss on the cheek.");
	//send PC back to the Freezer
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Beatrice Leaves
//after selling the last piece of savicite, automatically exit to the Freezer and when approaching again, triggers this:
public function beatriceLeavesYOUFORANOTHERMANOHSHIT():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	output("When you come back, you notice someone else sitting at the table with " + flags["BEA_TITLE"] + ": a kui-tan male. As you approach, both of them stand up.");
	output("\n\n<i>“[pc.name],”</i> " + flags["BEA_TITLE"] + " says, <i>“I’d like to introduce you to my Chief Supply Officer.”</i> The kui-tan nods to you; he’s wearing a uniform very similar to " + flags["BEA_TITLE"] + "’s, except his shoulder boards only have three stripes compared to her four.");
	output("\n\nThe two of you exchange pleasantries and " + flags["BEA_TITLE"] + " has you both sit down. <i>“It’s thanks to you,”</i> she says, <i>“that our new contract with Steele Technologies was successful; we managed to received about four hundred tonnes of savicite");
	//has finished Deck 13 and got the grey goo: 
	if(flags["DECK13_GRAY_PRIME_DECISION"] == 1 || flags["DECK13_GRAY_PRIME_DECISION"] == 2) output(" and some of their newest grey goo products as a bonus");
	output(".”</i> You notice a data slate on the table that has your company’s name on it");
	if(pc.isBimbo()) output(" along with a lot of, uh... um, hard words");
	output(".");
	output("\n\nThe kui-tan smirks. <i>“Seeing their potential CEO picking savicite by hand while they couldn’t even ratify a piece of paper really got them working. So my Captain isn’t wrong in saying our success is thanks to you. Hopefully, it’ll be enough to get us to Tavros Station for repairs and a proper refueling, but I’ll have to talk to the Engineering Department about that.”</i>");
	output("\n\n" + flags["BEA_TITLE"] + " puts her hand on yours, <i>“You’ve been a great help to me and my crew, sweetie. How can I repay you before I go?”</i>");
	processTime(4);
	//[A Kiss] [Your Panties] [Credits]
	clearMenu();
	addButton(0,"A Kiss",kissForARewardBeatrice, undefined, "A Kiss", "Ask her for a kiss.");
	addButton(1,"Your Panties",getDatMilfsPANTIESYOOOO, undefined, "Her Panties", "Ask her for her panties.");
	addButton(2,"Credits",beatriceCredsReward, undefined, "Credits", "Ask her for monetary compensation.");
	addButton(14,"Nothing",beatriceNoReward, undefined, "Nothing", "Refuse any rewards.");
}

//[Kiss]:
public function kissForARewardBeatrice():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	// + Kind
	pc.addNice(6);
	output("You tell her that you wouldn’t mind a kiss from such a beautiful lady.");
	output("\n\n<i>“Oh, I’m flattered,");
	if(flags["BEA_RELATIONSHIP"] == 1) output(" but what would my husband think?");
	output("”</i> she smiles");
	if(flags["BEA_RELATIONSHIP"] == 2) output(", licking her [bea.lips]");
	output(", <i>“");
	if(flags["BEA_RELATIONSHIP"] == 1) output("yet");
	else output("and");
	output(" it’s the least I can do for your hard work.”</i>");
	output("\n\n" + flags["BEA_TITLE"] + " ");
	if(!pc.isTaur()) 
	{
		output("puts her knee ");
		if(pc.legCount == 1) output("on your seat");
		else output("between your thighs");
		output(", ");
	}
	output("leans in, wrapping her arms around your head and slowly brings her beautiful visage closer to your [pc.face] until her [bea.lipsChaste] are firmly pressed against yours. They’re soft and warm, with the slightest bit of moisture.");

	if(flags["BEA_RELATIONSHIP"] == 2) 
	{
		output("\n\nYour breath catches when what you thought would remain a simple peck suddenly turns into a passionate open mouthed kiss, keenly aware that her ministrations have caught the attention of others in the tavern.");
		output("\n\nThe tip of her tongue probingly traces the outline of your [pc.lips]. When you don’t object, she slides the wet muscle deep inside your mouth, tasting you and swirling it around your [pc.tongue]. She sucks your bottom lip into her mouth and pulls on it until the kiss breaks, leaving only a trail of spit connecting you two.");
		pc.changeLust(50);
	}
	//BEA_RELATIONSHIP=1:
	else
	{
		output("\n\nYou know this is what you asked for, but didn’t think she’d actually do it. Your heart palpitates; feeling her pouty, full lips against yours really hammers in the fact that you’re kissing someone’s wife.");
		pc.changeLust(25);
	}
	output("\n\n<i>“Did you enjoy that, sweetie?”</i>");
	output("\n\nThe kui-tan officer looks stunned.");
	
	beatriceLeaves2();
}

//[Panties]:
// + Mischievous
public function getDatMilfsPANTIESYOOOO():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	pc.addMischievous(6);
	output("You flash her a ");
	//bea_realation=2:
	if(flags["BEA_RELATIONSHIP"] == 2) output("knowing");
	else output("flirty");
	output(" grin");
	if(silly) output(". <i>“Bro, gimme your undies!”</i>");
	else
	{
		output(", telling the milfy wife that ");
		if(pc.isMischievous()) output("what you want can be found betwixt her magnificent legs.");
		else output("what you want is her panties.");
	}

	output("\n\n<i>“Oh, my!”</i> She covers her mouth with her hands, unintentionally displaying her wedding ring. The kui-tan officer looks shocked. Her hand can’t hide the rising corners of her cheeks; she’s smiling. <i>“That’s quite a bold request to make of a married woman");
	if(flags["BEA_RELATIONSHIP"] == 2) output(", but I should have known you’d want something like that");
	output(".”</i>");

	output("\n\nShe slides her chair back and teasingly lifts her skirt all the way up to her wide hips, giving you a full view of her long, stocking-clad legs. Atop the sheer, black fabric, a thick band of floral patterned lace hugs her thighs with garter straps going up further.");
	output("\n\nWithout missing a beat, " + flags["BEA_TITLE"] + " hooks her thumbs under the waistband of her lacy black panties and slowly slides them down, giving you a quick peek of her brown bush and slightly parted lips before her skirt covers it up.");
	output("\n\nThe kui-tan officer looks away with a tent in his pants as his captain slips her unmentionables over her knees and past each high-heeled foot before pulling her skirt back down.");
	output("\n\nSatisfied, you add them to your inventory.");

	//acquire Mrs. Reasner’s panties
	//tooltip: Silky, black panties with floral-patterned lace
	output("\n\n<b>You’ve acquired Beatrice’s panties!</b>");
	pc.createKeyItem("Panties - Beatrice's - Silky, black panties with floral-patterned lace.");
	// + 20 lust
	pc.changeLust(20);

	beatriceLeaves2();
}

//[Credits]:
// + Hard
public function beatriceCredsReward():void
{
	clearOutput();
	showBeatrice();
	author("Tacit");
	pc.addHard(6);
	output("You tell her that you’re not interested in anything but cold, hard credits.");
	output("\n\n<i>“I see, a true professional,”</i> she says, <i>“");
	if(flags["BEA_RELATIONSHIP"] == 1) output("very respectable.”</i>");
	else output("though you could have asked for more.”</i> She punctuates that last word with a wink.");
	output("\n\nShe whips out her Codex and punches in some data, readying the transaction. The kui-tan officer sees what she’s typing in and lean over to her. <i>“Captain,”</i> he tries to whisper, but you’re close enough to hear it anyway, <i>“remember, we’re still on a tight budget.”</i>");
	output("\n\n" + flags["BEA_TITLE"] + " sighs and makes an adjustment. <b>Your codex beeps and informs you that eight thousand credits have been transferred to your account.</b>");
	// + 8000 credits
	pc.credits += 8000;

	beatriceLeaves2();
}

//[Nothing]:
public function beatriceNoReward():void
{
	clearOutput();
	showBeatrice();
	author("Jacques00");
	pc.addHard(6);
	output("Taking the neutral route, you tell her that you’re not interested in compensation at all.");
	output("\n\n<i>“Ah, I see,”</i> she says with disappointed look, <i>“All good deeds must be rewarded, but if that is how you feel...”</i>");
	output("\n\nYou assure her to not take it personally and that you " + (pc.isNice() ? "are just happy you could help" : "don’t require anything she has to offer at all") + ".");
	output("\n\nWithout warning, she leans in and pulls you toward her for a deep, maternal hug which sends a warm, comforting feeling up your spine. She holds the hug for a good few seconds before letting go.");
	output("\n\nThe kui-tan officer gives a light smile of approval.");
	
	pc.changeLust(5);
	
	beatriceLeaves2();
}

public function beatriceLeaves2():void
{
	output("\n\n<i>“That’s only a small token of my appreciation.”</i> She and her officer stand up and you join them. <i>“I wish we could spend more time together, but I’m afraid we’ve been delayed too long already.”</i>");
	output("\n\nYou sympathize with her. ");
	if(pc.isNice()) output("You feel like you have a special connection, it’s");
	else output("It’s");
	output(" a shame you have to part ways.");
	output("\n\n<i>“I may be late in saying this, but,”</i> she pauses to get your attention, an unusually serious expression on her face, <i>“would you consider joining my crew?”</i>");
	output("\n\nFor a moment it tempts you, but you can’t. You ");
	if(pc.isNice()) output("politely ");
	output("decline her offer, saying that you still have an inheritance to claim.");

	output("\n\n<i>“I see.”</i> " + flags["BEA_TITLE"] + "’s expression softens. <i>“When we first met, I could tell you were the type of person who’s independent");
	if(!pc.isBimbo() && pc.WQ() >= 50) output(", strong willed,");
	output(" and in control of your fate - the ultimate agent of your destiny. In this way we are the same, you and I.”</i>");
	output("\n\nThe kui-tan stands a respectful distance behind his captain, observing.");
	output("\n\n<i>“To give up your adventure in order to serve aboard my vessel would be a demotion for you. Even knowing that you wouldn’t accept, I still wanted to at least present the opportunity before we part ways.”</i> She ");
	if(flags["BEA_RELATIONSHIP"] == 2)
	{
		if(pc.tallness < 65) output("bends down");
		else if(pc.tallness < 72) output("leans in");
		else if(pc.tallness < 77) output("stands on her tiptoes");
		else output("hops up");
		output(" to put a chaste kiss on your cheek, leaving behind a red lipstick mark.");
	}
	else output("extends her hand and you shake it.");

	output("\n\nYou feel something cold being slipped into your hand. <i>“Take this with you. Hopefully our paths will cross again.”</i> A small, gleaming medallion rests in you palm, emblazoned with a coat of arms along with the name <i>S.S. Inexorable</i>. <i>“Until then, I’ll have to say goodbye.”</i>");
	output("\n\nShe turns and leaves with her subordinate, head held high and with a confident sway of her [bea.hips]");
	if(pc.hasKeyItem("Panties - Beatrice's - Silky, black panties with floral-patterned lace.")) output(", despite going commando");
	output(". Just like she said, you hope to see her again.");

	//acquire key item: Inexorable Challenge Coin
	//removes Beatrice from the Freezer
	pc.createKeyItem("Inexorable Challenge Coin", 0, 0, 0, 0, "A small coin emblazoned with the name <i>S.S. Inexorable</i>.");
	output("\n\n<b>Key Item Acquired: Inexorable Challenge Coin - A small coin emblazoned with the name <i>S.S. Inexorable</i>.</b>");
	flags["BEA_QUEST"] = 4;
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}