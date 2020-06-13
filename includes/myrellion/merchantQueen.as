//By Magic_Ted
//Full of magic.

public function showMerchantQueen():void
{
	showName("MERCHANT\nQUEEN");
	showBust("FUZZLEBOTTOM");
	author("Magic_Ted");
}

//Room Description
public function merchantQueenRoomBonus():Boolean
{
	//Dug out space, round and relatively open. Tons of alcoves dug into the walls for storage with the merchandise set inside the earthen shelves. Platform in the middle for more, with Queen at the other side of the room.
	output("The bowl shaped room is wide and inviting despite its deceptively small size, giving plenty of space to mill around the store floor. The only break in the roof is also what keeps it cool: a circle cut out of the ceiling that vents all the hot air outside, with the only source of lighting installed in a ring around it. The store’s merchandise is set along dug-in shelves in the dome’s wall, with a lofty island in the center of the room offering up more space for any of the bigger items.");
	if(flags["MET_MERCHANT_QUEEN"] == undefined) 
	{
		introductionToMerchantQueenSloot();
		return true;
	}
	else 
	{
		output("\n\nThe merchant queen is enjoying herself as ever, perched up on a little sled with her lower half being tended to behind a porthole and closed curtain. A pair of guards rest at either side of the doorway with rifles slumped over their shoulders in a ceremonial stance.");
		addButton(0,"Approach",introductionToMerchantQueenSloot,undefined,"Approach","Approach the queenly shopkeeper.");
	}
	return false;
}


//Introduction
//Plays the moment you enter the room.
public function introductionToMerchantQueenSloot():void
{	
	if(flags["MET_MERCHANT_QUEEN"] == undefined)
	{
		showMerchantQueen();
		flags["MET_MERCHANT_QUEEN"] = 1;
		
		output("\n\nYour eyes get a scant moment of reprieve to adjust to the shop’s interior before you’re forcefully stopped in your tracks. A pair of metallic clinks ring in your ears as the way in front of you is barred. After a brief stint of bewilderment, you figure out the cause: a pair of lengthy bayonets are uncomfortably close to your face, coming from two rifles held by soldiers at either side of the doorway, covered in a lot more of that blackened chitinous plate than the average myr. Both of the bulky women give you a sidelong stare, a curt scowl on either of their lips. Their symmetry is rather impressive.");
		output("\n\n<i>“Ladies!”</i> A pair of haughty sounding claps brings your attention away from the two guards, both of whom reluctantly shift their weapons away from your person. <i>“I apologize profusely for my guards! They’re rather... mm,");
		if(silly) output(" antsy");
		else output(" hair-triggered");
		output(" at times. At least around new customers, that is. Come, come!”</i> The figure on the other side gestures wildly toward you, though anything done with four hands might come off a little hyperactive.");
		output("\n\nTaking the invitation - and not wanting to provoke the eager guards any further - you stride into the room, taking a look along the walls at the wide variety of knick-knacks offered. You recognize some, actually; things from the core, like a few firearms or recreational goods. Not exactly something you’d expect to see on a <i>“backwards”</i> world torn apart by war. You don’t get a lot of time to look at the goods before another, more pleasing set of goods appears before you. The myr woman who summoned you in is completely topless, and she’s not bashful about drawing your attention to that fact. You spare a lingering glance at assets which ‘bounteous’ would be an understatement in describing, netting a knowing smirk from your host. Well. That’s a welcoming.");
		output("\n\nPast her nudity, the woman is rather proper-looking. She’s wearing a slight amount of makeup to accentuate her already fair appearance. Her hair is cut up in a proper bob with not a single strand of those blackened locks out of place on her bronze forehead. The woman is a little eccentrically posed, however; she is settled on a propped-up bench or sled, resting against it on her abdomen with the rest of her lower half disappearing through a comfortably sized porthole. The padded bed ends just at those full, hearty breasts, conveniently supporting the juicy - though reasonable - globes. There’s something entirely off with her, though, and it takes you a long moment to figure it out: her bronze skin is somewhat flushed, a faint sheen of exertion highlighting portions of her body while you hear a faint wet thumping coming from the cloth-closed porthole. The last hint is the subtle, occasional quake in her body, usually causing her to press those firm, natural plates into the padded seat and make her considerable bust jiggle faintly.");
		output("\n\n... Is she getting railed? If she is, her demeanor is absolutely perfect");
		//If Flahne unf’d;
		if(flags["FLAHNE_EXHIBITIONISM_UNLOCKED"] != undefined) output(" unlike a certain rahn you know");
		output(". Despite your creepy, silent sleuthing, she’s still all smiles. <i>“The answer is yes. Don’t worry, I get it a lot. I’m a Myr Queen, off-worlder, one of the precious few chosen by fate to give birth to our people. I apparently also happen to be pretty bad at getting the thread through the hook, so to speak, so I keep trying. Mm, it’s surprisingly good for business... and it entertains our </i>glorious<i> Red overlords. A lot of you off-worlders spend your time gawking instead of haggling for a better deal - not that I would take </i>advantage<i> of that, of course.”</i> The merchant queen’s lips curl up in a coy, teasing little smile as she gives you a once-over yourself");
		if(!pc.isCrotchGarbed()) output(", not so much as batting an eyelash at your own nudity");
		output(". <i>“Welcome to my shop, traveler. Feel free to browse </i>any<i> of my wares,”</i> she purrs.");
		if(silly) output(" Briefly, you muse that at least the currently-fucking woman has a good reason to lay it on thick.");
	}
	else
	{
		clearOutput();
		showMerchantQueen();
		output("Still resting on her probably less-than-comfortable padded perch, the queen glances up from her simple reading material before immediately tossing it aside haphazardly and putting on a big, golden smile. You’re not really sure if she was actually reading or just putting on a show for effect. <i>“Valuable customer! Welcome. I hope our gracious Red hosts didn’t accost you too much today. Now then, how may I help you? My stock is, as always, on display and available. If it’s not on a shelf then I’m afraid it’s not prepared for purchase, for whatever reason - don’t ask about backroom things. As much as I enjoy conversation, I </i>am<i> running a business.”</i>");
		output("\n\nThe mercantile queen goes through her nearly mechanical, though lively rhetoric while you distract yourself, all too aware of the woman’s illicit multitasking in the other <i>“room.”</i> Her body sways gently, pressing hardened body-plates into the firm padding with faint squeaks of pleather upon each unknown thrust into her. That and the delicious, subtle bounce of those all-too-motorboatable tits are the");
		if(silly) output(" only signs of her doggy-style sex for the sole purpose of recreation.");
		else output(" only signs of her active, literally-backroom sex.");
		output("\n\nThe woman patiently waits for you to snap back to attention, probably enjoying your distracted staring.");
	}
	processTime(2);
	merchantQueenMenu();
}

public function merchantQueenMenu():void
{
	showMerchantQueen();
	clearMenu();
	addButton(0,"Shop",antFuckinShopShit);
	addButton(1,"Talk",talkToAntQueenButt);
	if(flags["MERCHANT_QUEEN_SEX_UNLOCKED"]!= undefined)
	{
		if(pc.lust() >= 33 && (pc.hasCock() || pc.hasVagina())) addButton(2,"Flirt",flirtSexWithAnAntQueenMerchantButt,undefined,"Flirt","If she’s spending that much time fucking, maybe you can get in on the fun...");
		else if(pc.lust() >= 33) addDisabledButton(2,"Flirt","Flirt","You don’t have any parts that the queen could interact with.");
		else addDisabledButton(2,"Flirt","Flirt","Your libido is far too sated for you to be interested in flirting at the moment.");
	}
	else addDisabledButton(2,"Flirt","Flirt","You don’t know her well enough for that!");
	addButton(14,"Leave",mainGameMenu);
}

//Shop
public function antFuckinShopShit():void
{
	clearOutput();
	showMerchantQueen();
	var buffer:String = "";
	buffer += "You announce your intention to trade, and the ant-woman is all too happy to gesture toward the many shelves dug out from the domed room with her just as many arms, smiling politely as she strikes up her best saleswoman demeanor.";
	if(silly) buffer += " She really <i>is</i> business up front, party in the rear.";
	buffer += "\n\nHer dulcet drone continues on as you look from shelf to shelf, with her explaining each thing in turn as you go. It’s subtle, but you can feel the pressure to actually purchase some of the items simply because of how much attention she’s giving you.";
	buffer += "\n\nThe woman’s inventory is surprisingly varied, although the front of the room is dedicated to more domestically-minded goods and luxuries which are modestly priced considering the occupied nature of Kressia: humble items like tasty delights to pawned-off art, enough to keep any worker-bee’s mind off the stomping soldiers outside their home window. It is nothing for <i>you</i>, however - no, not even the art. Fancy portraits and figurines don’t last too well under bumpy turbulence or fits of combat onboard a spaceship.";
	buffer += "\n\nThe other side of the room, on the other hand, surprises you; weapons and armor are kept in stock as well as various goods to appeal to travelers such as yourself. Every time you so much as reach out to touch one of the weapons the guards are the door noisily tense, although the queen is swift to calm and chastise them each time, to her growing irritation. The several racks of armor don’t get the same treatment, at least - maybe they don’t mind that you’d basically be wearing their skin. Grody.";
	buffer += "\n\nAfter you finish your lap around the room, the merchant merely smiles. Each of her hands fold up together in front of her as her body continues to subtly jerk and jostle. Her charisma and mask hadn’t broken for even a single syllable throughout the entire affair. Whatta gal.";
	shopkeep = chars["MERCHANT QUEEN"];
	chars["MERCHANT QUEEN"].keeperBuy = buffer + "\n";
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	buyItem();
}

/*Items
Honeypot Draft
The thick, congealed substance most certainly didn’t come from anyone’s <i>“honeypot”</i>; instead, it seems to be a brand based on a Myr’s lactated nectar. It advertises a feeling of biologically-induced euphoria that cleanses the body of its evils and promotes a healthy being - and it’s tasty, too!
It’s a health potion. Without side effects, either, perish the thought. Not overly expensive.

Rudimentary Revolver
Six shots. More than enough to kill anything that moves - a thousand years ago, if you were some sort of militant savant. These days all this weapon has going for it is a sense of style and modest reliability. It’s hard not to be robust with less than ten parts!

TRASH. Barely an upgrade from starter stuff, but has a sexiness bonus - hey there, cowboy! Tease players might be shooting space-Lethice with it in the end.

Bolt-Action Rifle
An ancient relic of a far-gone age, this rifle actually packs a surprising wallop. Built by myr and designed to kill the tank-ish, resilient troopers, too, this weapon is a bit terrifying - to use. Using rounds designed for heavy steel guns to poke holes in battleships, each shot threatens the possibility of practically exploding the weapon every time you fire it - and take your arm off with each volley, too. A redneck’s delight.

Possibly breaks whatever tradition we had going for rifles; high piercing damage, but incredibly shitty accuracy. A gimmick gun.

Cavalry Saber
Lengthy and slender, with an auspicious arch designed to not get caught in your target. However, it’s just a hunk of sharpened metal these days and not very effective when you aren’t on some expedient mount. The hilt and pommel are both very ornamental, though, and the image of this mounted on someone’s mantle is an alluring one. At least you could rattle it when you’re raring for a scrap.

Shitty sword that isn’t much better than basic knifes and other starting junk. It’s a gimmick weapon. Slashing, obviously!

Military Pick
Easy to swing, not very easy to get back out. It’s little more than a axe with a sinister, slightly curved pointy bit at the end instead of a blade, meant to find its way into little crevices in armor and punch right through. It’s unwieldy, however, and only as good as you are strong.

Piercing weapon.

Trench Shotgun
It took you this long to find a goddamn shotgun? It’s pretty rudimentary in design, just a quick and easy breech that you can thumb a pair of shells into. The real quality is what you want to load into it - with a thick gauge, as long as you have enough time to prepare, this’ll put the hurt on anything. Just... do it slowly, sausagefingers.

No damage type - not weak to anything! Not strong to anything, either. Nothing special stats wise.

Honeyizer Treatment
An experimental Xenogen treatment trial that can mod your lactating to sticky and congealed but oh-so-sweet nectar, like a myr. Strangely, the box has a picture of a busty bee-girl instead of an ant or something. Has this even been legally tested? Only way to find out is to put it in your mouth!

There you have your titty juice treatment, vagrants. No red/gold/spidu TFs, tho, that can go somewhere else. Or charms, either, because it’s a war zone and everyone has gasmasks anyway, that doesn’t even make sense geez.
*/

//Talk options
//What’s your name?
//What’s it like, all dat fukkin’?
//Where’s all this stuff from?
//A queen? Exposition me, baby, cuz I am a stupid shit who can’t read a codex.
//Also occupation theatre! Because she’s in WW2 Paris and stuff. Lots of words here, I fukken love words.

public function talkToAntQueenButt(arg:Function = undefined):void
{
	clearMenu();
	showMerchantQueen();
	//Name?
	//She never mentioned her name.
	if(arg == askDisMyrQueenAbootHerName) addDisabledButton(0,"Name?","Name?","You just finished that discussion");
	else addButton(0,"Name?",askDisMyrQueenAbootHerName,undefined,"Name?","She never mentioned her name.");

	//Merchandise
	//What’s with all this stuff?
	if(arg == whatsWithAllThisStuffGuvnah) addDisabledButton(1,"Merchandise","Merchandise","You just finished that discussion");
	else addButton(1,"Merchandise",whatsWithAllThisStuffGuvnah,undefined,"Merchandise","What’s with all this stuff?");

	//Queen?
	//She mentioned she was a queen? As in royalty?
	if(arg == sozYouzAQueen) addDisabledButton(2,"Queen?","Queen?","You just finished that discussion");
	else addButton(2,"Queen?",sozYouzAQueen,undefined,"Queen?","She mentioned she was a queen? As in royalty?");

	//Sex-life
	//Is she constantly having sex? Even now...
	// Unlocks flirt/sex
	if(arg == OiIsDatBitchHavingSexAllDay) addDisabledButton(3,"Sex-Life","Sex-Life","You just finished that discussion");
	else addButton(3,"Sex-Life",OiIsDatBitchHavingSexAllDay,undefined,"Sex-Life","Is she constantly having sex? Even now...");

	//Lifestyle
	//The place is occupied by Reds and the military is everywhere...
	if(arg == soWhatsTheDealWithAllTheseCommies) addDisabledButton(4,"Lifestyle","Lifestyle","You just finished that discussion");
	else addButton(4,"Lifestyle",soWhatsTheDealWithAllTheseCommies,undefined,"Lifestyle","The place is occupied by Reds and the military is everywhere...");

	//Influence?
	//What do you mean by influence?
	if(arg == whatYouMeanAboutInfluenceEh) addDisabledButton(5,"Influence?`","Influence?","You just finished that discussion");
	else addButton(5,"Influence?",whatYouMeanAboutInfluenceEh,undefined,"Influence?","What do you mean by influence?");

	addButton(14,"Back",introductionToMerchantQueenSloot);
}


//Name?
//She never mentioned her name.
public function askDisMyrQueenAbootHerName():void
{
	clearOutput();
	showMerchantQueen();
	output("You casually mention that you have yet to get the merchant queen’s name.");
	output("\n\n<i>“I realize. I never gave it to you on purpose. Don’t be offended, but you don’t really need to know.”</i> The woman’s response is a level one, though you try to dig into it a little. Why? <i>“I do business with all </i>sorts<i> of clientele. If I started to make a bit of a name for myself, things could start to collide. I have an awful lot of influence in things here and there... It might be all ruined if it was found out that the queen Fuzzlebottom was making great strides with our Red overlords or your precious Confederation. Among other things.”</i>");
	output("\n\nOther things?");
	output("\n\n<i>“Inquisitive thing, aren’t you? Well. We’re in a time of constant war with quite a few new players making their debut. I am no small-time woman. People associating my name with certain other people could ruin me; worse, it may make them think I’m an enemy. Which I am anything but! I’m simply a merchant. It also allows me to... </i>wander<i> around more freely with my money. After all, if someone were to say ‘That Merchant Queen did something,’ well, they’d have to go through some forty other Gold queens who do much the same, named or otherwise.”</i>");
	output("\n\nSo, she does have a name?");
	output("\n\n<i>“Of course. It’s not like we’re born with a number stamped to our head. However, only a special few are privy to that... And I can tell you this much: you’ll never be one of those special few.”</i>");
	processTime(3);
	talkToAntQueenButt(askDisMyrQueenAbootHerName);
}

//Merchandise
//What’s with all this stuff?
public function whatsWithAllThisStuffGuvnah():void
{
	clearOutput();
	showMerchantQueen();
	output("<i>“Stuff? This is high-quality merchandise, I’ll tell you!”</i> Despite her attempts at mock-outrage, the woman still holds a cheeky grin, betraying herself immediately. <i>“I do business in all sorts of places, for all sorts of clients. I am one of the only people who jumped at the chance to do business with off-worlders, and among the first besides. Much of the material is probably stuff you’re familiar with, though I carry stock for people such as yourself, too, of course. Things native to Myrellion, that is.”</i>");
	output("\n\nShe pauses a moment, looking thoughtful. <i>“Really, it’s not too hard to sell. Most off-worlders that come through here are adventurers - like yourself - that are taking part in your ‘planet rush.’ Less novelty tourists and more people who need weapons and armor... With a people practically devoted to war-like industry, that isn’t a hard goal to meet.”</i>");
	processTime(2);
	talkToAntQueenButt(whatsWithAllThisStuffGuvnah);
}

//Queen?
//She mentioned she was a queen? As in royalty?
public function sozYouzAQueen():void
{
	clearOutput();
	showMerchantQueen();
	output("<i>“Royalty? Not... quite, no. It’s radically different from the term you’re used to. A queen is a member of our species - that is, the gold myr - who can give birth freely. And rather productively, too, in most circumstances. Though I do hold quite a bit of influence because of it... we’re rather well-revered creatures, I’ll have you know. Individual dynasties coming from a single queen-mother could be considered a ‘kingdom,’ or clan, in your sense of the word. Though we’re still part of the greater whole and it comes up rarely.”</i>");
	output("\n\nSo less ruler and more of a ‘breeder,’ then?");
	output("\n\n<i>“Mm... something like that, I suppose. The title of queen is a massive one, second only to the empresses themselves. It comes at a cost of practically being imprisoned, toiling away in constant labor to ensure our species thrives. That is, unless you’re like me. You see, I’m not exactly fertile; my ‘needle’ is a lot harder to thread, even if I have all the makings to. So instead I get all the authority, influence and so on without having to drag myself along the ground. It’s quite nice! But I have to keep up appearances and make up for... eh, inefficiency. All day long.”</i>");
	processTime(2);
	talkToAntQueenButt(sozYouzAQueen);
}

//Sex-life
//Is she constantly having sex? Even now...
// Unlocks flirt/sex
public function OiIsDatBitchHavingSexAllDay():void
{
	clearOutput();
	showMerchantQueen();
	output("<i>“Yes.”</i> Well, that was rather abrupt. <i>“Though no, I’m not literally ‘constantly going at it.’ Sometimes I sleep, after all. Or have to walk somewhere. Then my precious keepers sit on their dicks for a moment and settle down and I myself get a lovely break. Hmph. Some people envy me, you know, especially you off-worlders. It’s not great. When you have some upstart drone thrusting away at you day in and out you grow numb to it all. Honestly, it feels more like someone poking me at this point than </i>sex<i>, which is a pity, and the price of my position.”</i>");
	output("\n\nMaybe it’s because the sex is boring?");
	output("\n\n<i>“Of course it’s boring,”</i> the queen rather immediately snaps. It sounds like she’s had this conversation in the past and has grown a bit weary of it. <i>“If you find someone with the ability to ‘keep it fresh in the bedroom’ with the sole purpose of procreation after a week straight I’ll be </i>rather<i> surprised. That’s not to say I don’t have my individual pleasures here and there, but my sex-life isn’t the purview of some random off-worlder. Well. Save when they’re a part of it, anyway.”</i>");
	output("\n\nOh? There’s an interesting thought. The merchant responds to your mild surprise with a knowing grin of her own. <b>Maybe there’s something you could do there...</b>");
	processTime(3);
	// Unlocks flirt
	flags["MERCHANT_QUEEN_SEX_UNLOCKED"] = 1;
	talkToAntQueenButt(OiIsDatBitchHavingSexAllDay);
}

//Lifestyle
//The place is occupied by Reds and the military is everywhere...
public function soWhatsTheDealWithAllTheseCommies():void
{
	clearOutput();
	showMerchantQueen();
	output("The merchant nods solemnly, pausing in thought for a moment before simply shrugging her four arms lazily. <i>“Every off-worlder asks about this. The curiosity is fair, I suppose... yes, there is a mess outside. It’s practically ruined Kressia, though it’s not like the war was for our benefit. Kressia was taken a while ago, so there’s been plenty of time to settle in with the occupation. For both sides. The threat and paranoia of military remnants hiding out in the ruins has gone away, and so have the constant searches and soldiers breathing down our necks. It’s still far from comfortable, though, just less... invasive. Which, for an invasion, is pretty good!”</i> The queen cracks a quick grin at her own joke before continuing. <i>“It’s all pretty heavy-handed, more like a police state. Aggressive curfews, nervous soldiers, random interrogations... I mean, it’s all a given. I can’t honestly blame their paranoia. A single fit gold myr could probably tear this building down in a few minutes with her bare hands! Domestic disputes are a bitch; we aren’t some squishy people like you off-worlders are. Firearms just let us kill each other slightly farther away.”</i>");
	output("\n\n<i>“Food is probably a more pressing thing than trigger-happy guards, though. The Reds have to ship it through a war-torn hellhole to get here, so delays are pretty frequent. Rationing spurs up unrest much more than some strict rules backed by bullets... it’s all about food. Now, of course, </i>I<i> have people in my pocket. I’m practically exempt! That fact has allowed me to keep running things despite the occupation - that and you off-worlders, of course. The military cabinet is rather terrified of you. Like I said, though, the difference between a myr with and without a pistol is just a few meters, so it’s not worth the effort to police.”</i>");
	output("\n\nHm. Aren’t the queens pretty important, though? No one keeping an eye on her is pretty weird.");
	output("\n\n<i>“We are! Glad you noticed. We’re so important that if the army so much as touched us inappropriately the entire city would be up in arms in bloody rebellion. If much of anyone, let alone a soldier, started to give me trouble... even myr that aren’t my children would go into a frenzy about it... they’re all rather protective.”</i> She chuckles darkly. <i>“If anything, the Reds are stuck holding massive hand-fans and waiting on our every need. Not that I abuse such a thing, of </i>course<i>! It’s far too much of a bother.”</i>");
	output("\n\n<i>“Although. They </i>do<i> steal away the drones. No one cares as much about them; it’s not like they’re getting mistreated. Just bred. It is pretty amusing to see an oh-so-holier-than-thou Red book it with some flailing sap over her shoulder while being chased by some half naked Gold, though.”</i>");
	output("\n\nRude.");
	output("\n\n<i>“Quite.”</i>");
	processTime(6);
	talkToAntQueenButt(soWhatsTheDealWithAllTheseCommies);
}

//Influence?
//What do you mean by influence?
public function whatYouMeanAboutInfluenceEh():void
{
	clearOutput();
	showMerchantQueen();
	output("<i>“I hold a lot of power on Myrellion, traveler. Many queens have a middling amount, enough to be the movers and shakers when they’re not practically crawling on the ground, fat with kids. But I’m a queen with </i>money<i>. I have more than just this hole in the wall, I assure you. I’m more proactive, shake hands. That sort of thing. Get to know people, Golds, off-worlders, and Reds alike. It’s enough to do things, change things. If I do too much I mess up the perfect balance I’ve got going, but soon... well. Soon I could own Kressia as a whole. Soon I could do a <i>lot</i> of things, even within the greater Confederacy. Business doesn’t change too much.”</i>");
	output("\n\nYou’re not sure whether or not the woman is just talking out of her ass, but she’s rocking a smug little grin like no other. Maybe she’s onto something, but why would she blather this all to <i>you</i>?");
	processTime(2);
	talkToAntQueenButt(whatYouMeanAboutInfluenceEh);
}

//Rebels
// For now, if coded leave this as a greyed out/locked button just for placeholder’s sake. It will be further done in the partisani party quest in that doc.
//9999


//Flirt {Sex}
// Unlocked with Sex? dialog
public function flirtSexWithAnAntQueenMerchantButt():void
{
	clearOutput();
	showMerchantQueen();
	if(!pc.hasCock()) output("You have a sexpot of a woman in front of you getting nailed by some unseen guy behind closed doors. This is one of those incredibly easy marks that come up in myth and legend.");
	else output("There is a sexpot of a woman in front of you getting nailed by some unseen guy behind closed doors while she chats you up like nothing was happening. It’s hard <i>not</i> to <i>“get it up.”</i> Your eyes start to wander down her exposed form as you try to drum up how you’re going to approach her, scoping out that wonderful body. Tantalizingly smooth, bronze flesh with just a hint of exertion from her constant, <i>“hidden”</i> activity, giving it an oil-like shine when the light hits her <i>just</i> the right way. Which, to your chagrin, it always does. Those fat tits had the lion’s share of that glamour, looking delightfully squeezable in your palm and oh-so firm and upright, with so little sag outside of that constant eye-catching bounce.");
	output("\n\nThe woman snaps you out of your eye-fucking reprieve after taking notice, bringing a set of biceps against the sides of those pillowy tits to mash them together. Startled, you find her merely grinning, giving her chest a purposeful saunter to sway those motherly bags to and fro. The question of how receptive she’d be just went out the window.");
	output("\n\nThe actual puzzler is how do you want to approach her. You could take the suave approach, flirting and enticing her interests until she <i>asks</i> for it, as tradition dictates. On the flipside, she is certainly acting welcoming. Those two stick-up-their-asses guards wouldn’t mind if you just jumped in, would they?");
	//if not bipedal, fuck you horses and sadly fuck you sneks;
	if(pc.isNaga() || pc.isTaur()) output(" ...Though working out the logistics of the scenario would be an issue. Better make another mark on the ‘cannot bang’ list. Ugh, is this non-conformist body even really worth it?");
	processTime(4);
	// flirt, assert, back
	clearMenu();
	addButton(0,"Flirt",flirtUpAStormWithAntQueen,undefined,"Flirt","Try your damnedest to be suave.");
	addButton(1,"Assert",assertYourselfLikeThisIsCoC,undefined,"Assert","fuk words just gonna grab a tit");
	addButton(14,"Back",merchantQueenMenu);
}

//Flirt
//hay good lookin’ got room for one more awh yeah
public function flirtUpAStormWithAntQueen():void
{
	clearOutput();
	showMerchantQueen();
	output("With a hammy expression and trademark Steele smirk, you lean down to the coy woman and set suave to eleven. <i>“You look like you’re packing quite the ‘buzz’, but you don’t quite have that glow of someone enjoying themselves... need a hand?”</i> The suave dial might be a little rusty. Still, it looked like it worked!");
	output("\n\nThe queen responds with a soft purr, responding with a smirk of her own as she looks up to you with half-closed, smoldering eyes. Two can play the flirting game. <i>“My-oh-me-oh-my, traveler. It’s almost as if you’re propositioning me for </i>sex<i>. How incredibly brazen, that can’t possibly be the case. After all, you certainly aren’t some Myr drone to </i>stuff<i> me full and make my womb and tits simply </i>swell<i>.”</i> As her low, playful tone carried on her hands wandered her body for emphasis, cradling her woefully slim, unbred abdomen while her hands squeezed up into those equally untapped pillows.");
	output("\n\nWatching her digits squeeze into those luscious, bronze globes is enough of a distraction prevent you from speculating that you’ve been rejected and, instead, for her to continue; <i>“Of course, there is something </i>else<i> you can offer if you’re such a kind soul.”</i> Interested piqued, your eyes wander right back up to that pretty thing’s smiling face, cheeks throbbing as her tongue shifts around in her mouth. <i>“I find myself awfully... </i>thirsty<i>.”</i> Finishing with a flourish, you are simply stunned as she leans her self-molested body forward, opening her mouth fully and letting that tongue loll near her chin - showcasing the sticky, messy hole completely for you, thick wads of salvia worked up and making a stringy cage along her teeth and rolling around on her slender tongue. At this angle you could even see her quivering uvula, not even pretending to be able to block the entrance to her gleaming throat.");
	output("\n\nFuck.");
	// Dickers and Hardlight havers go to cocklust, those lacking go to femlust. No choices. TDM will sue. :<
	processTime(7);
	pc.changeLust(45+rand(5));
	mercQueenSexRouter();
}

//Assert
//fuk words just gonna grab a tit
public function assertYourselfLikeThisIsCoC():void
{
	clearOutput();
	showMerchantQueen();
	output("Actions speak louder than words, and every ounce of this mid-coitus woman’s body language practically screams that she would accommodate you - why break the mold? You make your move without a second of hesitation, taking a few quick steps closer to the shopkeep and making for the goods. A hushed gasp follows as your palms roll and knead into that exposed, barely bouncing bosom and you can’t help but grin as the woman squirms in her <i>“seat.”</i>");
	output("\n\nEach squeeze of those taut breasts has <i>just</i> the right amount of give, the plush flesh pushing back into your fingers while your palms graze along the pair of pointed teats ticklishly. Just as you expected, even this simple act gets a low, receptive coo from the queen while she quivers titillatingly and casually leans those hefty weights into your wandering fingers.");
	output("\n\nThe bronze breeder doesn’t leave you entirely unchallenged, however, as twin pairs of hands grab you in turn. They start squeezing possessively upon both your buttocks and thighs while yanking you toward her, your pelvis pressing into her breasts");
	if(pc.isNude()) output(", bared genetlia and all");
	if(pc.hasCock()) output(", just how you wanted it");
	output(". Her grip is tight, aggressively so; it’s not something you could merely squirm yourself out of. Despite trapping you, there isn’t any scorn on the woman’s face - simply an amused smirk. You aren’t too worried yet.");
	output("\n\n<i>“Now now, traveler. I’m not sure how it is where you come from, but you can’t simply get your grubby hands all over the ‘merchandise’ wantonly. It’s polite to ask.”</i> Her fingers knead in along your body, forcing you to sway and hump into her pressed chest. <i>“I could have you arrested for this, placed in the stockade and mocked as some perverse warning... so! You had best not disappoint.”</i>");
	output("\n\nNot leaving you any time to argue, those hands ");
	if(pc.isCrotchGarbed()) output("begin to pinch and tug at your waist, unwrapping her unpromised payment without delay.");
	else output("yank your exposed self over, just how she wanted you!");
	//Once again, dickers and hardlight haves get that cocklust, no choices.
	processTime(7);
	pc.changeLust(45+rand(5));
	mercQueenSexRouter();
}

public function mercQueenSexRouter():void
{
	clearMenu();
	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0)) addButton(0,"Next",cocklustWivAntsGuv);
	else addButton(0,"Next",femlustWithQueen);
}

//Cocklust
public function cocklustWivAntsGuv():void
{
	clearOutput();
	showMerchantQueen();
	output("Mere moments later and [pc.oneCock] is wedged within the cleft of the queen’s bodacious bosom, the comfortable, pillowy bronze flesh practically drowning out your girth as its all swallowed within her warm confines. At first the woman doesn’t even move the puppies on her own accord, simply looking up to you with those ashen-coal eyes with a knowing smile as the subtle lurches and bucks of her backroom activity became all too apparent around your sensitive member. Despite the raw sexuality of her actions, she kept her humble merchant facade, plainly ignoring the trembling quakes of her body or even the fact that you were wedged within her to begin with.");
	output("\n\nYou’re half surprised she didn’t strike up whitenoise conversation just to tease you.");
	output("\n\nImpatience rapidly gets the best of you however; while her titflesh is heavenly, each little motion is just a cruel taunt for you, not something you can actually get off on. Bucking your waist forward, you drive yourself into the awaiting cushions until your [pc.cockHead]");
	if(pc.cockTotal() > 2) output(" and more");
	else if(pc.cockTotal() == 2) output(" and [pc.cockHead 1]");
	output(" emerge");
	if(pc.cockTotal() == 1) output("s");
	output(" from her bounty, eliciting a short, theatrical gasp before she finishes in a lowly chuckle.");

	output("\n\n<i>“My, aren’t we impatient? Don’t push me, traveler, you might not survive exciting me...”</i> As she speaks her playful warning her head lowers, the warm breath of her words washing over the exposed tip and making your thighs tremble from the ticklish stimuli. The queen caps it off with a short kiss, shoving her puffed up lips on the tip grandly and absently smearing the dollop of pre like a balm. Her lengthy feelers dancing across your exposed abdomen is enough to briefly distract you from pushing even further into that awaiting mouth, giving her plenty of time to prop her head up again with a knowing grin. <i>“Now. Let’s get started, shall we?”</i>");

	output("\n\nAn eager nod is cut short as two sets of hands clasp onto your waist and thighs, fingers squeezing into you possessively. While you might have had a passing whimsy to rut into this fine rack and making a delightful mess out of her, it is plain to see that despite her relatively tied down position that <i>she</i> would be taking charge today, thank you very much - as expected from a queen. With disturbing ease, you’re yanked from the ground, helplessly squirming as your legs merely sway beneath you. As much as your natural antics amuse the queen, a swift, somewhat painful squeeze is enough for you to clam up and go rigid.");

	output("\n\nWell, you’re trapped. Damn.");

	output("\n\nThe grin stays as those dark eyes take in your resigned apprehension. Evidently she rather enjoys your little plight. It must be a pretty fun game for her - and with your dick");
	if(pc.cockTotal() > 1) output("s");
	output(" still wedged between her breasts, you really can’t complain <i>that</i> much. Being turned into a practical sex-doll while the guards silently watch from behind you, let alone whoever walks in, is a little grating to your pride, though.");

	output("\n\nAs a small blessing, either the queen can’t get off on your minute humiliation alone or she doesn’t intend to, shifting your waist in her palms and starting to rock your body into her chest, slowly. It probably would’ve taken a lot less energy to simply bounce her tits in her hands, but why not get mildly sea-sick, too? Stifling a grunt, you quickly realize the queen is still simply teasing you, that fat grin etched on her face betraying her minor delight in tormenting an alleged customer.");

	output("\n\nMaybe this is all she gets to do for fun around here? Bitter thoughts are cast aside as her forceful motions pick up rapidly, thrusting your [pc.cocks] against her and ringing out sloppy, wet slaps as your cock");
	if(pc.cockTotal() > 1) output("s");
	output(" drool lines the insides of her chest, giving you an admirable hole to ream, if shallower than the real thing, anyway. The movements are steady and quick, yanking you forward and back while her still jostling body deals with the vertical, sending either side of that suffocating titflesh around your hidden shaft");
	if(pc.cockTotal() > 1) output("s");
	output(". The startling lack of agency and practically being thrown around makes it difficult to keep steady and control, causing you to moan out openly and loudly as the room jerks and spins around you. Ugh!");
	output("\n\nThe treatment ends just as suddenly as it began, your body swaying forward after the queen yanks the most of your length from her now lubed up breasts. At least she’s polite enough for you to get your bearings straight. <i>“Is this all? As hard as you can be?”</i>");
	output("\n\nWhat a bitch! The humiliation stings again, though before you can come up with a retort she continues again; <i>“Well. I suppose it’s prepared enough, so I can </i>finally<i> move on. It’s nice to have to get someone ready to go once in a while...”</i>");
	output("\n\nLady, you need to watch a porno.");
	output("\n\nEvidently your tormenter didn’t want to risk you going soft, swiftly plucking ");
	if(pc.cockTotal() == 1) output("that");
	else output("those");
	output(" cock-drool smeared prick");
	if(pc.cockTotal() > 1) output("s");
	output(" from her chest. Instead, she begins hoisting you upwards until your knees weakly press into her shoulders and you could just barely feel the top of her bosom on your bottom. While she is still in complete control, looking down on her, you get the picture of otherwise, your [pc.cocks] splayed across her upturned face, hooking around the slim contours of her expression while her wide open mouth breaths heavily along the underside, tongue wiggling just shy of touching it. It’s easy to see she is doing this just to tease a surprised reaction out of you - and succeeding. Huffing irritably, you break the pose by gyrating your hips, weakly thrusting across her face.");
	output("\n\nThat was a mistake.");
	output("\n\nStill dizzy, you didn’t even have a chance of bracing yourself for the sudden movement as you’re gobbled up like a fish to a worm. Now sitting fully on her exposed chest, you yelp out a lewd squeak as your [pc.biggestCock] is immediately burrowed into the sweet confines of her throat, bulging it out without even a hint of discomfort. Her jaw is slack, tongue splayed out and flat while acting as a comforting, wiggling blanket for your sensitive member, counterbalancing the tight, squeezing vice of her throat. The rush hits you like a punch to the gut, wheezing out an unrestrained moan as you could only helplessly quiver within the woman’s gullet and arms. Fuck! The erotic delight is only further bolstered by a cacophony of dreamy moans emanating from the queen’s throat as if she were reveling in the taste of the finest chocolate in the land - except it was your dick.");
	output("\n\n<i>“Enjoying yourself?”</i> Also a mistake.");
	output("\n\nYour perceived slight on her is immediately paid back in full; her head cranes to the side, pivoting your near-swallowed shaft in the deep confines of her messy, slick mouth before her head reels back - just enough so that your crown teases at the cusp of her throat, never truly slipping out - and pummeling into your pelvis once again, another punch to the gut. Hunching over, you shudder at the touch of her feelers smack into your chest again and again as she takes this rather rough, though amazing pace, gleefully facefucking you with wild abandon and savoring every moment of it. The room becomes a chorus of slurps and gulps, likely noisier than <i>“normal”</i> sex and only intensified by the echoing, dome nature of the room.");
	output("\n\nAs your ‘torment’ continues, she gradually gets sloppier and sloppier, though not how you’d expect; her feverish movements would pull your shaft further and further with each bob of her head, while she surprised you by loosening her grip around you, shaking you in her grasp and making the self-administered facefucking a rather bumpy ride. Occasionally, she simply jams <i>you</i> into her mouth as opposed to the other way around, leaving you no time to get comfortable as you resign to just be sore all over after - and moan like a forty " + (isAprilFools() ? "dogecoin" : "credit") + " whore. Constantly short of breath, a feeling of euphoria washes over your addled mind, and you can no longer compose yourself whatsoever. With an eager, pummeling throat and constant swallowing, gulping and just untempered <i>desire</i>, you blow your load in short order, much to your own surprise.");
	output("\n\nAnd continuing your surprise, a [pc.cumVisc] mess doesn’t even give her pause. The next ten minutes become a blur, the fight truly forced out of you by the over-zealous cocksucker, and you’re left merely weakly groaning, part in pain, part in... well, you really can’t think straight.");
	processTime(20+rand(3));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",getAntSuckedPart2);
}

public function getAntSuckedPart2():void
{
	clearOutput();
	output("Somewhere in that mess you know you ");
	if(pc.maxCum() < 3000) output("managed to orgasm a few times");
	else output("filled up the queen’s tank again and again");
	if(pc.cumQ() < 3 && pc.balls > 1) 
	{
		output(", to the point your [pc.balls] feel");
		if(pc.balls == 1) output("s");
		output(" like ");
		if(pc.balls == 1) output("it has");
		else output("they’ve shrunk");
		output(":, needling you in pain from being overused");
	}
	output(". You know that she got off, too, trembling violently in her seat and squealing around your shaft. Cocksucking excites her, probably a huge oral fetish. Frankly, sprawled out in the alley beside the shop and feeling sore <i>all</i> over, you’re a little scared of stepping in there ever again.\n\n...Getting blackout drunk had a better aftermath then this. Kinda worth it, though.");
	// Kicks outside, PC cums, I dunno, eight times. We’ll go with that.
	currentLocation = "812";
	generateMapForLocation(currentLocation);
	showName("\nRECOVERING");
	processTime(3);
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Femlust
public function femlustWithQueen():void
{
	clearOutput();
	showMerchantQueen();
	output("The next few moments pass in a blur, the queen an eager and all-too-experienced partner; she’s already clutching you possessively with her many hands, one pair cradling your thighs while the other squeezes your [pc.butt]. You find yourself facing away from her, half-hoisted up in the air like it was nothing. Ant people, gah! Trying to stifle any embarrassment you feel at the guards’ imperious gazes, you merely look down to the floor and helplessly squirm, feeling the ticklish sensation as her feelers dance and bounce along your bottom and lower back.");
	output("\n\nDespite the practical blur of her putting you in this compromising, somewhat uncomfortable position, the merchant queen isn’t exactly racing to make use of it. Her breath merely washes over your exposed [pc.vaginas]");
	if(pc.hasClit()) output(", occasionally leaning forward to brush her thin lower lip along your [pc.clit]");
	output(", eliciting a short gasp from you and further squirming. Discomfort practically oozes away as the myr’s simple-yet-continuous touches and teases start to make you messy, and it’s not long before you’re quivering and spasming with each little touch. You know your back will be smarting after all this is done and the blood is <i>kinda</i> rushing to your head, but... this isn’t so bad.");
	output("\n\nReally, this must be a natural position for them, what with that big abdomen hanging off their backside. The queen certainly seemed com-");
	output("\n\nA squeal slips out of you into the hollowed-out dome of the room as you jump and go rigid, thoughts completely interrupted by a slender, spit-sloppy tongue spearing into your depths without warning. The surprised reaction nets a low, throaty chuckle from your ‘captor’ while she slowly rocks her head side to side between your exposed thighs, gradually stirring the length of muscle between your folds as the utmost tip curls and tickles within your depths, making your breath catch in your throat constantly. The queen knows full well how to please and you’re left merely writhing in place, constantly whimpering and gasping from the delightful sensation. Already your eyes start rolling into the back of your head as you hear the guards in front of you barely stifle a chuckle at your expense.");
	output("\n\nYou completely underestimated the merchant, so now you’re getting teased and toyed around with, and oh <i>fuck</i> you don’t care! Your ");
	if(pc.hasToes()) output("toes curl");
	else if(pc.legCount > 1) output("[pc.feet] curl");
	else output("[pc.foot] curls")
	output(" up tightly as you start to kick back and forth, clutching your arms close to your chest with a hand clasped firmly to your mouth in some vain attempt to muffle yourself. Your whole body goes honey-sweet at the simple ministrations of the woman’s dexterous tongue intermixed with the electric pangs of her lips");
	if(pc.hasClit()) output(" rolling around your sensitive button");
	else output(" pressing against your aroused labia");
	output(".");

	output("\n\nPressure starts to build within you, your thoughts growing gradually hazy as you feel yourself start to grow <i>close</i>. Your back arches sharply, head yanking backwards up in the air with one final, deep gasp of air and -");

	output("\n\nThe queen stops. Her tongue slips out from your sloppy depths and her lips pulling away from your saliva-coated");
	if(pc.hasClit()) output(" clit");
	else output(" slit");
	output(". The only sensation is the now-cruel feeling of her warm, ragged breath over your dampened labia, which drags a few frigid shivers out of you. <i>“You know, I think I have a few products you might be interested in. Off-worlders such as yourself are always enamored with various firearms, no?”</i> Her words come abruptly as she starts speaking in a casual, conversational tone.");

	output("\n\nWh-what? Another, less-stifled laugh from the otherwise quiet guards brings you out of your near-orgasmic haze, realization finally sinking in. You know what the woman behind you is up to. She’s denying you - edging you!");

	output("\n\nThat -");
	output("\n\nFour hands squeeze your desperate body, fingers caressing you at each point affectionately. <i>“I have some offers not quite on the shelf, too. If you know how to </i>ask<i> for them, anyway.”</i>");
	output("\n\nAh.");
	output("\n\n");
	if(pc.isNice()) output("<i>“H-Hey,”</i> you begin, your mouth rather dry and voice a bit hoarse from your dogged moaning. <i>“C’mon, keep going.”</i> Your feeble plea falls on deaf ears, the queen behind you merely humming in response. It’s not enough; she wants <i>more</i>. Hanging your head, you resign yourself to begging. <i>“Um... please keep going? Don’t just sit there... I need it - I need you to lick me! Please, keep going I’m </i>so<i> close! F-Fuck me already!”</i> Fingers lazily draw circles on your flesh as you debase yourself, though still to no avail. You whimper. <i>“Please, your </i>majesty<i>, make me cum!”</i>");
	//If Mischievous:
	else if(pc.isMischievous()) output("She wants to see you beg - to plead for it like a whimpering, needy nympho. Well, sure! Arching your back further, you do your best in your rather restrictive position to jut your rear end upwards, parting your thighs awkwardly in her grip before gyrating the whole, honey-slick package in her face. <i>“Hey, cashier? I want that fat mouth of yours to shut the hell up and go back to wiggling that amazing tongue so far up my twat that I just squeal and cream. I promise to give you some sugar.”</i> You purr, pushing back one last time to finish. <i>“So go ahead and make me cum.”</i>");
	//If Asshat:
	else output("That uppity bitch thinks she can make you beg! You need far more than a few licks to reach <i>that</i> crescendo. Grunting, you kick your legs back and press your knees tightly into her sides, trying - vainly - to tug her back in. <i>“Hey! If you don’t get back to it I am going to break free of your twiggy little arms, yank you off your precious fucking dicks, throw you on the floor and ride your face until that chatty tongue is swollen, kinky bitch!”</i>");

	output("\n\n<i>“I like a girl who knows what she wants,”</i> coos the queen");
	if(pc.isAss()) output(", despite your attitude");
	output(". The short reprieve is broken as her head barrels into your pelvis again, face muff-diving like the best of them as that flexing-wide tongue spears deep into you once more. You don’t really have a choice in the matter when you let out another yelp, body going blissfully rigid yet again. She hounds you, slapping and squirming about and not giving you a moment to recollect yourself, electing instead to leave you moaning out loud in the domed shopfront.");

	output("\n\nThe fact that you last through a single minute of this heaven is a testament to your willpower, really.");
	if(silly && pc.WQ() >= 50) output(" Turns out you made the right choice by not making that your dump stat!");

	output("\n\nMere moments later, you’re on your hands and knees, settled neatly on the floor with heaving, blissful breaths escaping from your trembling body. The queen coos above you, smacking her lips as she wipes a bit of excess drool, pussy and otherwise, off her chin with a slow, regal swipe of her thumb. Her breathing is just as ragged as your own, though her expression doesn’t look <i>quite</i> as satisfied as the stupid look you must be sporting.");

	output("\n\nWhen your eyes both meet, both of you immediately break out into big, cheeky grins. <i>“A few years ago I might have gathered you up and ‘invited’ you to my home for the week, traveler. You’re rather cute... and tasty,”</i> the flirty queen finished with a coy lick of her thumb, cleaning off the remaining fluid like it were some candy-sweet treat.");

	output("\n\n<i>“Hmhm, left you breathless? Feel free to come by and ‘buy something’ again... who knows what products might be available.”</i>");
	output("\n\nYou’re pretty sure it’d be more of the same.");
	// Modest time loss, orgasm.
	processTime(30+rand(15));
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.exhibitionism(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
