//The Milodan Breeding Solstice
//By QuestyRobo
//Summary
//A short event that triggers when wandering Uveto during the Christmas season. Two options; one for dick havers, one for pussies, with a final scene with the legendary milodan, Saint Dick.

//Intro
//Small chance of triggering any time the player is in a hostile area on Uveto.
//No neuters.
//Won’t trigger if the PC is pregnant in all their vaginas and they don’t also have a dick. Basically the vaginal scenes are locked off if you don’t have a free vagina, and you need some way to trigger at least one scene.
//Being under the effects of sterilex will stop the event from triggering. Being sterile will not.
//Pregnancy from this event gives the max number of kids.
public function milodanBreedingProc():Boolean
{
	if(flags["BREEDING_SOLSTICED"] == undefined)
	{
		if(isChristmas() && (pc.hasCock() || (pc.hasVagina() && !pc.isFullyWombPregnant())))
		{
			if(rand(100) <= 3)
			{
				flags["BREEDING_SOLSTICED"] = 1;
				showBust("MILODANMALE","MILODANFEM","MILODANMALE","MILODANFEM");
				showName("MILODAN\nMOB");
				author("QuestyRobo");
				output("\n\nA storm kicks up as you wander the hostile, frigid wastes. It becomes hard to see even just a foot in front of your face. You try and work your way through, but eventually you give up the ghost and retreat into a nearby cave. All you can do is sit on a rock, warming yourself however you can as you watch the storm rage on outside.");
				output("\n\nAbout half an hour passes before the storm subsides enough that you can go out again. As you do, you see a mass of figures moving in the distance. Your body shakes as they get closer and you can finally make out the dozens-strong horde of milodans. Males and females of highly varying sizes; ranging from fairly normal to absolutely massive.");
				output("\n\nYour first instinct is to run away at a very high speed, but then you notice their demeanor. Instead of the laser focus and aggression you normally see in milodan hunting parties, they seem jovial, laughing, drinking and groping as they move across the tundra. You have to admit, the sight of one of the larger males beastially groping the over-sized tits of two of the women is very enticing, assuming they won’t just beat you into soup if they spot you.");
				output("\n\nCelebrating milodans is a rare sight. Then again, milodans trying to beat the crap out of you is a pretty common sight. Do you risk it?");
				//[Risk It] The risk of blunt trauma is worth the risk of blunt fuckings!
				//[Wimp out] Too {Silly:spoopy/scary}, time to peace out.
				clearMenu();
				addButton(0,"Risk It",riskItForTheBiscuit,undefined,"Risk It","The risk of blunt trauma is worth the risk of blunt fuckings!");
				addButton(1,"Wimp Out",wimpOutFromSolstice,undefined,"Wimp Out","Too scary. Time to peace out!");
				return true;
			}
		}
	}
	return false;
}

//Wimp out
public function wimpOutFromSolstice():void
{
	clearOutput();
	showName("\nHIDING");
	author("QuestyRobo");
	output("You retreat back into the cave, not wanting to know what it feels like to be a pile of cold, beef stew. The group quickly passes, the sounds of laughing and merry making going with them. You step back out of the cave and get back on your way.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Risk it
//Removes PC sterility for the event.
public function riskItForTheBiscuit():void
{
	clearOutput();
	showName("MILODAN\nMOB");
	showBust("MILODANMALE","MILODANFEM","MILODANMALE","MILODANFEM");
	author("QuestyRobo");

	output("You take a deep breath and step out into the open. It takes a second for the group to snap out of their merry making and see you. When they do, they become eerily quiet. You’re starting to feel like this might have been a bad idea. That feeling gets stronger when one of the larger men steps forward.");
	output("\n\n<i>“What is your business, offworlder?”</i> The massive milodan man looms ");
	if(pc.tallness < 7*12) output("over");
	else output("in front of");
	output(" you, scowling and seemingly ready to attack. You start reaching for your [pc.weapon] until one of the females steps in.");

	output("\n\n<i>“Now, now, darling, there’s no need to be hostile, especially on this blessed day. All are welcome to partake in the Breeding Solstice. That is why you approached us, isn’t it?”</i> She gropes her breast with one hand and strokes the already hard dick of the big brute, causing his aggressive demeanor to melt into a docile, purring lump of fur and muscle.");
	output("\n\nYou’re so distracted by the two in front of you that you don’t see the rest of the group catch up. In an instant you’re surrounded by huge, furry bodies, all cheering and groping as they swarm you. Any protest you could put up at this point would be drown out by the excitement of the crowd; their myriad cheers, their lusty moans as they manhandle each other, and the clangs of mugs as they toast each other with the strange brew that the larger males are carrying in massive sacks.");
	output("\n\nA mug of it is shoved into your arms by a young, overzealous milodan girl.");
	output("\n\n<i>“Pleeeeeeeeeeashe drink it, it’s sho good!");
	if(pc.isPregnant()) output(" Don’t worry about it hurting your baby, it’s speshal made.");
	output("”</i> Her eyes are wide as dinner plates, and she’s purring so heavily that you can almost see her vibrating. She’s obviously drunk, but still charming enough to get you to take a sip; couldn’t hurt, right? As soon as it hits your lips you taste a surge of flavor, not to mention the surge of blood to your [pc.crotch]. Before any restraint could possibly kick in, you’ve downed the whole thing, much to the excitement of the fluffy girl in front of you.");
	output("\n\n<i>“Hehe, you outshiders are sho cuuute...”</i> She stumbles forward and falls into your arms, eyes lidded, purring heavily. The rest of the crowd closes in around you, offering you more drinks as they lead you off to parts unknown.");
	output("\n\nYou’d be more concerned, but the combination of tipsiness, and the stark relief of being suddenly surrounded by hundreds of pounds of warm fur, including a scruffy little cutie who seems smitten with you, dulls your instincts. You decide that you’re just gonna roll with whatever happens, as you take another gulp of your refilled stein.");
	pc.changeLust(20);
	pc.imbibeAlcohol(50);
	processTime(30);
	clearMenu();
	addButton(0,"Next",moreMilodanSolstice);
}

public function moreMilodanSolstice():void
{
	clearOutput();
	showName("MILODAN\nCELEBRATION");
	showBust("MILODAN_PRIESTESS","MILODANFEM","MILODANMALE","MILODANFEM");
	author("QuestyRobo");

	output("Your journey to wherever they’re taking you is largely a blur of drinks and groping hands all over your body, and especially on your ");
	if(pc.isHerm()) output("[pc.cocks] and [pc.vaginas]");
	else if(pc.hasCock()) output("[pc.cocks]");
	else output("[pc.vaginas]");
	output(". Time loses meaning as you wander through the sexual miasma, and before you know it, it’s the dead of night and you find yourself at the foot of a massive tent.");
	//move location somewhur cheaty - store OG location for movement back?
	currentLocation = "UVETO WILDERNESS";
	generateMap();
	output("\n\n<i>“Ah, the gathering has just begun!”</i> One of the more venerated-looking women yells. The rest of the group cheers and rushes inside, dragging you along with them.");

	output("\n\nThe inside of the tent is very cozy. The walls and ceiling are thick, keeping the harshness of the Uvetan tundra far away. Torches light and warm the space, while furs and pelts cover the cold ground, letting the ongoing orgy happen anywhere without discomfort. And orgy is the perfect word for it. Piles of writhing bodies litter the tent in uneven clumps. Some are only a few people large, while others must be dozens strong. When she said breeding solstice, she really meant <i>breeding</i>.");
	output("\n\nThe group around you largely scatters, leaving you to mostly your own whims. You’re still pretty tipsy from drinking so much. So tipsy, in fact, that you don’t even notice when the older milodan who lead your group in comes up behind you. You’re nearly blinded as a pair of huge, fluffy tits engulfs your head from behind, a husky voice chuckling as you struggle in confusion.");
	pc.changeLust(100);
	output("\n\n<i>“Are you enjoying the brew, offworlder?”</i> She moves a hand down and strokes your ");
	if(pc.hasCock()) output("achingly erect [pc.cockNounSimple]");
	else if(pc.hasVagina()) output("soaking wet [pc.vaginaNounSimple]");
	output(" for emphasis. <i>“It’s special, the ingredients prepared and fermented throughout the year for this occasion. It’s enhanced to arouse the senses, allowing the celebration to go on for as long as possible.”</i>");

	output("\n\nFrom the looks of it, she’s the leader of that particular tribe, definitely a priestess of some kind. You sloggily dig your way out of her titflesh and finally ask just what you’re celebrating here.");
	output("\n\n<i>“The solstice, dear outsider. Every year the spirits bless us with a night longer than any other. At first, our ancestors took it for a curse, a night when evil reigned. They set aside their differences and banded together to stay safe. But when they finally went out one fateful solstice night to fight the evil, they found nothing. They were confused, but then they realized that this was what the spirits had wanted; a night where all tribes set aside their differences and share in celebration, and breeding, of course. It even lines up perfectly with our heat cycle.”</i>");
	output("\n\nShe digs a few fingers into her swollen, soaked snatch to emphasize that. Lots of drinking and lots of fucking. Nice.");
	output("\n\n<i>“Oh, and I cannot forget to tell you of the Old Saint of Dickarus, or Ol’ Saint Dick, as she is colloquially known. A legendary figure who is said to have appeared during the first true solstice celebration. A hermaphrodite, almost unheard of before you spacers arrived, with immaculate fertility and virility. They say she impregnated, and beared the offspring of an entire tribe, and that her children were by far the strongest born of that gathering.”</i>");
	output("\n\n<i>“Sounds like a fun girl.”</i> You say as you get your mug refilled by a passing, younger looking man.");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output(" You take a sip as the priestess puts her arms around you, slowly removing any obstructions between her and your heated loins. Not that you mind, it’s pretty warm in here, and you’d be taking your clothes off pretty quick anyway.");

	output("\n\n<i>“I’ve heard as such. Alas, the true Saint Dick has not appeared since, only pretenders. We have been hopeful of her return, however. For it is prophesied that she will return when our people have reached the stars and starwalkers are worthy to count among us. It has been many long cycles since our kin went beyond the sky, perhaps she will return to us soon. But I have droned on long enough. You’ve had many eyes on you since you came in, I’d imagine you want to capitalize on them.”</i>");

	output("\n\nShe points you towards ");
	if(pc.isHerm()) output("two people");
	else output("someone");
	output(" who seem");
	if(!pc.isHerm()) output("s");
	output(" to be vying for your attention. ");
	if(pc.isHerm()) output("One is the drunk girl who fell into your arms earlier, surrounded by a gaggle of other girls who also seem to pining for some dick. The other is the man who tried to intimidate you when you first approached the group. He’s casually sitting along with several other men, all fully erect and looking at you like a piece of meat.");
	else if(pc.hasVagina()) output("It’s the man who tried to intimidate you when you first approached the group. He’s casually sitting along with several other men, all fully erect and looking at you like a piece of meat.");
	else output("It’s the drunk girl who fell into your arms earlier, surrounded by a gaggle of other girls who also seem to pining for some dick.");

	//PC is Sterile:
	/* FEN NOTE: Cut this. Partially due to it being annoying to code in. Partially because it doesn't quite make sense.
	if()
	{
		output("\n\nBefore she lets you loose though, she takes a big, suspicious sniff at the air. She quickly starts whiffing at you, a suspicious look is on her face but that quickly turns to surprise.");
		output("\n\n<i>“Oh you poor thing. You’re sterile, aren’t you? We can’t have that!”</i> Before you can say anything she pulls a vial out of a small pouch on her thigh and pours it down your throat. <i>“There, dear. It’s not as potent as your space medicines, but it should allow you to overcome your deficiency for the night, at least.”</i>");
		output("\n\nThe brew burns its way down your throat, setting your whole body ablaze in pleasure. Any protest you could have had is thrown out of your mind like old garbage when you look back to the group");
		if(pc.isHerm()) output("s");
		output(" she pointed out.");
		//TEMP DISABLE STERILITY
	}*/
	//Only herms get to choose, if they’re not pregnant. Otherwise they go to the dick scene.
	//Herm choices go into respective dialogues (Girls goes into Vag, Guys into Peno.)
	if(pc.isHerm()) output("\n\nThanks to your multiple endowments, you have some options here.");

	else if(pc.hasVagina()) 
	{
		output("\n\nYou can smell their collective musk, even over the sheer volume of the stuff permeating the air. It’s almost like it’s calling to you specifically, and with how intoxicated and horny you already are, it’s impossible to say no. You drunkenly wander over to them, returning their big grins with a huge, dopey one of your own as your [pc.vaginas] drool");
		if(pc.totalVaginas() == 1) output("s");
		output(" in anticipation.");
	}
	else
	{
		output("\n\nYour [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" hard as ");
		if(pc.cockTotal() == 1) output("an iron bar");
		else output("iron bars");
		output(" right now. Something about this whole situation is filling you with a kind of primal, powerful lust. Every muscle in your body, <i>especially</i> the ones in your crotch, tingle with power and desire. If this is how milodan men feel all the time, you can understand why they’re so aggressive about getting sex; you feel like you’re going to explode if you don’t breed something right now! You practically leap at the ladies, much to their squealing joy.");
	}
	processTime(30);
	pc.imbibeAlcohol(80);
	clearMenu();
	//[Girls] Go over and bone some bitches.
	//[Guys] Get breed like a bitch in heat.
	if(pc.hasCock()) addButton(0,"Girls",celebrateSeasonsBreedings,undefined,"Girls","Go over and breed some bitches.");
	else addDisabledButton(0,"Girls","Girls","You’d need a dick to breed those sabertooth kitty-bitches.");
	if(pc.hasVagina())
	{
		if(!pc.isFullyWombPregnant()) addButton(1,"Guys",guysBreedingSolstice,undefined,"Guys","Get bred like a bitch in heat.");
		else addDisabledButton(1,"Guys","Guys","You’re already completely pregnant. Maybe you should go knock up some other girls and share the holiday spirit?");
	}
	else addDisabledButton(1,"Guys","Guys","Something tells you that without a vagina, you aren’t going to get much attention from them. They’re out to share the season’s breedings!");
}

//Girls
//PC gets a big cum production and virility boost.
public function celebrateSeasonsBreedings():void
{
	clearOutput();
	showName("\nLADIES...");
	showBust("MILODANFEM","MILODANFEM");
	author("QuestyRobo");

	//pick dick?
	var x:int = pc.cockThatFits(600);
	if(x < 0) x = pc.smallestCockIndex();

	pc.cumQualityRaw += .5;
	pc.boostCum(30);

	output("You pounce on the girl from before. She isn’t the hottest out of the bunch, hell she’s skinny as a twig compared to a lot of women here, but she’s been stoking your lusts since you met her outside, and you’ll be damned if you’re not going to give her exactly what she wants!");
	output("\n\n<i>“A-are you going to give me a big litter, " + pc.mf("mishter","missh") + "? I’ve never had one, sho you’d be my firsht!”</i> Oh, that does it, this bitch isn’t getting out of here until you’ve emptied every drop into her! You line your [pc.cockNounSimple " + x + "] with her soaking pussy, rear up and slam in.");

	if(pc.cocks[x].cLength() < 12) 
	{
		output("\n\nYou glide in without any issue. It’s a perfectly hot, soaking hole for you to sheathe your breeding tool in!");
		output("\n\n<i>“O-oooh! T-the real thing is so much better than my toys... even if you’re not as big...”</i> The comment flies right over your head. You’re far too busy burying your bulging bone in the begging bitch.");
	}
	else if(pc.cocks[x].cLength() < 17) 
	{
		output("\n\nYou ram your way into her with minimal effort. Her tunnel clings to you like an experienced whore, but you know she’s only a virgin! She reverently puts her hand on the slight bulge your cock has created in her stomach.");
		output("\n\n<i>“Oh spirits! T-the toys could have never prepared me for this. So hot and bulgy an-and real!”</i>");
	}
	else
	{
		output("\n\nYou cram as many of your inches into her as you possibly can, marvelling at the way her stomach distends at your sheer size, and at the way her eyes cross in pleasure. It’s incredibly tight, and you struggle to even move now that she’s started squeezing down. Thankfully, one of the other women gives your [pc.cock " + x + "] a loving, hands on lube application, and in a few more thrusts, you’re gliding inside of her.");
		output("\n\n<i>“S-s-shpirits guide my pussy through thish ordeal! O-oooooh. The ancestors must truly wish to tesht me if they have sent you, offworlder.”</i>");
	}
	pc.cockChange();
	output("\n\nYou press your hands against her tiny tits, feeling just how diamond hard her nipples are. She yelps as you tweak and tease them in time with your thrusts. She puts her hands on top of yours as she stares longingly into your eyes.");
	output("\n\n<i>“They’ll get sho big and milky after I have your litter, sp-spahcer... G-give me cum!”</i> Her slurred attempts to egg you on are amateurish, but effective, and you redouble your thrusts.");
	output("\n\nThe other girls crowd around you, lavishing you in sensual massage, sloppy kisses, and big, fluffy tits. The bustiest of them even guides your head onto one of her swollen nipples, whispering sweet nothings as you drink down her rich, lactic bounty.");
	output("\n\n<i>“You’re doing great, little Valla is absolutely entranced by you. You’ll give her strong pups won’t you? She’s such a good girl, she deserves a good litter. Speaking of which...”</i>");
	output("\n\nYou barely pay attention to what she’s saying, other than the part about knocking her up. You’re way too busy plowing the breed-crazed virgin, reveling in her tight, spasming body as the tempo of your brutal fucking absolutely wrecks her. She’s a babbling, drooling mess by this point, barely able to do anything more than groan and twitch. It’s absolutely intoxicating to know that you’re able to do this to someone, Void, just the atmosphere of this place makes you feel like a beast!");
	output("\n\nThat feeling grows even more intense as you start to taste something mixing in with the curvaceous MILF’s milk. It doesn’t even register until you feel a sudden shock in your [pc.balls]. Your jaw goes slack as it reverberates throughout your body. Your [pc.cock " + x + "] goes almost painfully rigid, and alien weight surges into your balls as you cum on the spot.");

	var cumQ:Number = pc.cumQ();
	if(cumQ < 8000) 
	{
		output("\n\nYou erupt inside her, pumping out far more than you ever thought you could. [pc.Cum] spills out of you in waves that make your previous orgasms look like trickles. By the time you’re done she has a noticeable cum belly that she rubs with reverence.");
		output("\n\n<i>“T-thank y-you...”</i> She stammers before passing out.");
	}
	else if(cumQ < 40000)
	{
		output("\n\nYour vision almost whites over as you violently erupt inside of her. The first shot bulges out her stomach, the second makes her look nine months pregnant. She does a damn good job keeping it all in up to that point, but your subsequent loads fill her beyond capacity and start to leak out. Her lusty stupor finally breaks as she looks down at her swelling stomach.");
		output("\n\n<i>“S-shpirits! A-am I pregnant already?”</i> The girls around you laugh at her delirious statement as you continue to unload inside her. Your orgasm is longer and much messier than usual, and that’s saying something! By the time you’re done, you’re kneeling in a small pool of your own [pc.cumColor] fluids, the girl having long since passed out from exhaustion.");
	}
	else
	{
		output("\n\nIt feels less like you’re orgasming, and more like someone just busted a dam inside you. Within seconds the poor girl’s belly is bloated beyond belief. In a few more seconds it starts to overflow, and then pool below you. It comes out in a single, continuous stream; if there are any breaks in your biblical flood, they’re far too small and far too weak to even notice.");
		output("\n\nThe girls around you coo and awe as you pump out barrels of fertile cum, without any sign of slowing down.");
		output("\n\n<i>“Sister, you gave [pc.himHer] far too much! Now there won’t be any for the rest of us.”</i> The woman whose breast you were sucking chides.");
		output("\n\n<i>“Nonsense! What we have here is obviously a <b>very</b> potent individual. With a little coaxing, I’m sure tonight will be very fruitful for all of us.”</i>");
		output("\n\nFruitful is quite the understatement! In the time it’s taken these two to talk, you’ve probably pumped out enough to fill both of them. When you finally stop you’re sitting in a pool of your own [pc.cumColor] fluids, a pool that’s spread quite a few feet around you. The girl has already passed out, understandably.");
	}
	if(pc.hasKnot(x)) output("\n\nYou <i>want</i> to knot this bitch, to plug her full so there’s absolutely no doubt that you knocked her up! But you’ve got a lot of pussy to get through, so you force yourself back.");

	output("\n\nThe ladies around you cry out in joy as you pull out of the well used girl. A few of them awww at your flagging erection, but the one you were suckling from quickly gets to work on that. Her mammaries are easily larger than her head, covering a good bit of her torso. They absolutely engulf your [pc.cock " + x + "] in such sublime warmth that it almost feels like you never pulled out of Valla!");

	if(!pc.isTreated()) output("\n\nOf course, biology is a cruel mistress, and your refractory period is still kicking your butt. And with how many of them there are, you’re not sure how long you’ll hold out!");
	else output("\n\nOf course, you’re hard again in seconds, thanks to your Treated libido. But with how many of them there are, and how riled up they seem to be, even you’re not sure how long you’ll last.");

	output("\n\n<i>“I think our spacer might be feeling a little overwhelmed. Cybris, grab the Babymaker!”</i> The furry slut titfucking you yells out, causing the room to go suddenly quiet. Looking around, you see quite a few men looking around with a hint of fear, while others seem quite excited, and the women, at least the ones who aren’t insensate, are <i>very</i> excited. You’re confused, until Cybris comes back with the biggest chunk of Savicite you’ve ever seen!");
	//Done Anno and Friends Foursome:
	if(flags["UVETO_HUSKAR_FOURSOME"] != undefined) output(" Even bigger than the one Marina and Galina had.");
	output(" It’s shaped like a big, green, milodan cock, and is absolutely dripping in some kind of lubrication.");

	output("\n\nThe men breathe mixed sighs of relief and disappointment as Cybris brings the dildo passed them and over to you. You squirm in place, unable to get up due to the weight of the other miloslut’s massive tits on your legs, and the strength-robbing pleasure that ripples through your [pc.cock " + x + "].");

	output("\n\nA circle of fluffy onlookers gather around you, hollering and cheering as Cybris struts up to your rear. She slaps your [pc.ass],");
	//Normal: 
	if(!pc.hasPerk("Buttslut")) output(" making you yelp in protest. Protest as you might, though, you’re not getting out of this.");
	else output(" making you moan out in pleasure. Your hole is absolutely aching to take that big beauty, and it looks like you won’t have to wait long.");
	output(" She spreads your cheeks and taps the tip up against your [pc.asshole]. Just that small amount of contact sends shocks up your spine.");
	//Anno and friends:
	if(flags["UVETO_HUSKAR_FOURSOME"] != undefined) output(" It’s even stronger than the twin’s dildo!");

	output("\n\n<i>“This treasure has been in our tribe for decades. A piece of savicite so large and pure as to be the envy of our neighbors. Said to contain the spirit of a mighty warrior chief, whose building lusts must be sated on each Solstice. Every year one lucky male");
	if(pc.mf("","f") == "f") output(", or suitably equipped woman in your case,");
	output(" is selected to receive its gifts. You are the first outsider that’s been given the honor.”</i> She presses it harder. <i>“Lucky.”</i> You can feel the tip breaking through your pucker. <i>“You!”</i> She rams it in with all her might.");

	pc.buttChange(900);

	output("\n\nYour mouth opens, but nothing comes out. Your body’s gone completely numb, the world around you is unfocused. You feel distant, like you’re being forced out of your body with each inch the eager matron pushes into you. It’s almost like it’s pushing into your brain as much as it is your ass. You can almost see all the thoughts being pushed out of your mind. Manners, restraint, language, the fourth grade, everything keeping you civil.");
	output("\n\nYou feel something bubbling up from inside you. All the primal urges, the pure instinct, it’s all rushing to fill the hole left by your bored out humanity. It’s coming closer with every push she makes. She’s almost bottomed out, and you’ve almost lost it.");
	output("\n\nYou roughly grab the busty bitch on your cock, toss her on her back, and line up your [pc.cock " + x + "] with her soaked breeding hole. It’s unconscious, like your body knows what’s happening and is preparing. Meanwhile, Cybris is just about finished inserting the delightful hunk of rock.");
	output("\n\n<i>“Are you ready, sisters?”</i> A cheer rings out. <i>“Then let it begin!”</i> She slams the last few inches into you.");
	output("\n\nYou let out a loud, bestial roar as every bit of numbed out pleasure surges back into you like a bolt of lightning. You slam into the busty breeding hole with enough force to push her forward. Your senses are laser focused; you can hear her heartbeat rise, her moans rise in octave, smell her need, fuck, you think you can even hear her ovulate.");
	output("\n\nYou manhandle her obscene tits, becoming transfixed with the sprays of milk that come out. You can just imagine how much bigger and milkier they’re going to get after she bears your children! You stand up, hoisting her up with you, by her hips. You jackhammer the eager slut into the ground, grinning as you feel watch her tits bounce into her face, and feel her juices coat your crotch. The bitch is so wet that every thrust creates another small puddle on the ground under you.");
	output("\n\nShe tries to squeeze down, to take back control, but you won’t be denied! You own this cunt, you own her! You redouble your thrusts, going faster than you ever thought you were capable of. She tries to keep her composure, trying to steady herself, but eventually succumbs to you, laying limp, drooling into her own oversized tits as they nearly smother her. The sight of her so utterly ruined drives you over the edge, and you unload inside her.");
	output("\n\nShe moans and gurgles as you cum, absolutely overwhelmed as you fill her womb to the brim and then some. Whatever this thing is doing to you is absolutely overcharging your production, not to mention completely destroying your refractory period. You don’t slow down, even when her womb becomes so pressurized that every thrust sends a jet of [pc.cum] flying out into the crowd.");
	output("\n\nBy the time your orgasm subsides, her eyes have rolled up into her skull, her hands are absent-mindedly rubbing her swollen stomach, and you’re damn sure she’s completely gone. Seeing that you’re done with her, a male comes over, slings her over his shoulder and walks off to a small group of excited men.");
	output("\n\nBefore you can get too disappointed by that, you turn and see Cybris with wide eyes and four fingers dug into her gushing cunt. Your eyes lock for just a split second before you’re on her. You waste no time on foreplay, you turn the bitch around, yank her obstructing fingers out of her snatch, and ram yourself in.");
	output("\n\nYou don’t even feel tired or drained. If anything you feel fuller, even more ready to go. The massive obelisk in your rear feels like some kind of pump, funneling in pure lust by the gallons, straight into your brain. You can almost feel it throbbing against your prostate, its alien influence driving your production to almost painful levels. Your [pc.balls] are supersaturated in swimmers, eager to breed every bitch in here, and then maybe go out and seed any fertile hole that you come across. Damn, maybe she wasn’t blowing smoke up your ass when she said it had the spirit of a warrior in it!");
	output("\n\nOf course she’s not saying much of anything now. You’re thrusting so hard into her that she nearly lifts off the ground. She’s struggling to even keep her footing! After she nearly falls forward, forcing you to take attention away from her sex to catch her, you decide enough is enough. She yelps as you hook your arms under her thighs and hoist her up.");
	output("\n\nYou let out a bestial snort in effort as you lift the snouted skank up to your chest. You growl into her ear as you adjust. It takes only a few seconds before you get back up to speed, slamming into her slippery snatch in full view of the rest of the tent.");
	output("\n\nCheers erupt as the crowd watches you violate the matron. A gaggle of women gather around you, eagerly egging you on to cum so they can fill their empty wombs. You gladly comply, already barreling toward the edge as it was. You unload like a firehose, filling her baby maker with a belly full of fresh fuel. You don’t spend all of your orgasm in her, though, you’ve got much more work to do! You yank your still-spurting [pc.cock " + x + "] out, grab a nearby slut, bend her over, and jam it in. She catches the tail end of your orgasm, but that’s still enough to give her a belly-bulging preview of what’s to come.");
	output("\n\nWomen flock around you, waiting for their turn, while men step up the pace, determined not to be outdone by an offworlder. The next few hours turn into a blur of breeding. Hole after hole taken and gloriously filled. You think you even catch one of the men by mistake at one point, but you’re far too deep into it to care.");
	output("\n\nAlas, the spirit is willing, but the body is weak and spongy, and eventually you give out in a pile of well-used fluffers.");
	processTime(60);
	for(var y:int = 0; y < 20;y++) { pc.orgasm(); }
	pc.imbibeAlcohol(40);
	pc.clearRut();
	
	clearMenu();
	if(silly) addButton(0,"Next",sillyMilodanEpilogue,true);
	else addButton(0,"Next",randomBullshitBreedingSolsticeEnd);
}

//Guys
//PC gets significant fertility boost
public function guysBreedingSolstice():void
{
	clearOutput();
	showName("HELLO\nBOYS...");
	showBust("MILODANMALE","MILODANMALE","MILODANMALE");
	author("QuestyRobo");
	
	output("The six-pack of milodaddies is surprisingly calm as you walk up to them. They form a tight circle around you, making sure their big, juicy cocks are just a hair from touching you. The implication is loud and clear, and you eagerly put your body to work.");
	output("\n\nYou start by grabbing two cocks at random. Big, fat pieces of meat that you can barely even get your hands around! Before you can decide how to put your mouth to use, however, that trademark milodan roughness kicks in, and you feel yourself wrenched down, mouth impaled on another massive cock. You almost choke as you take over six inches of cock in one go. Thankfully he’s not intent of leaving you there, and you’re pulled off, left to gasp and sputter against his throbbing maleness.");
	output("\n\n<i>“Nice mouth, I’ll be claiming it for a few rounds.”</i> It’s not like you’re in a position to debate that, so it looks like you’re going to get divvied up like food at a buffet. Speaking of that, you feel a pair of rough hands on your [pc.ass].");

	output("\n\n<i>“Fine, I’m taking this.”</i> The young man behind you proclaims as he jams two fingers in your [pc.pussy]. ");
	if(pc.vaginas[0].wetness() <= 2) output("<i>“Hmm, might need some help for this.”</i> He pulls his fingers out of you, and you hear him snap his fingers, signaling the patter of footsteps coming towards you and then leaving just a quick. A second later, squelching noises ring out from him, and your suspicion about what he’s doing is confirmed when he jams his now lube-soaked fingers back into you.");
	else output("<i>“Very nice, meat. You’re just aching for this aren’t you?”</i> You nod softly against the spit-slick dick in your face.");

	output("\n\n<i>“HEY, SAYS WHO!”</i> A gruff, older milodan yells as he pushes the younger man away.");
	output("\n\n<i>“Excuse me if you’re decrepit old hide is too slow to call first dibs!”</i>");
	output("\n\n<i>“YOU SMUG LITTLE-”</i> The older one almost throws a punch before the woman from earlier interrupts.");
	output("\n\n<i>“Now, now, do you think this is the day for your petty squabbles?”</i> He grunts, freezing with his arm flexed, ready to strike.");
	output("\n\n<i>“Always the peacenik, aren’t you Elona? Just stay out of... AGH!”</i> He falls to his knees as Elona strikes the back of his leg with her staff.");
	output("\n\n<i>“I warned you about this sort of behavior last year. If you believe I’m so passive that I would allow it to continue then you are sadly mistaken!”</i>");
	output("\n\nThe younger man laughs, but quickly straightens out as Elona gives him a piercing stare. The older man struggles to his feet, huffing in annoyance. <i>“Fine. Brat, you can go first, and after [pc.heShe] gets sick of your little pencil dick, I can show [pc.himHer] what a real man is like.”</i>");
	output("\n\nThe display certainly distracted quite a few of your gang-bang partners, at least enough to keep your mouth clear. The one’s you had your hands on still kept you busy though, and in short order they cum. They huff out as they hose you in thick, fragrant cum. It gets all over your back and [pc.hair], so pervasive that you probably look like some kind of slimy ghost.");
	if(silly) output(" But this isn’t a Halloween event, so that’s obviously not the case.");
	output(" Their climax returns full attention to you as the young milodan steps back into position.");
	pc.applyCumSoaked();
	output("\n\n<i>“I see you’ve started already. You there, a round of drinks for the fine men here. They’ll be quite busy.”</i> A man with a drink tray and a very spent looking cock nods and brings over his tray. Each of the men grabs and starts chugging down a large mug of the ceremonial brew, that is, except for the men directly in front of and behind you. They take a big sip, but then raise up their mugs in a toast.");
	output("\n\n<i>“Drink up, spacer, you’ll be down there a while.”</i> The one in front of you says as he pours the drink onto his dick.");
	output("\n\n<i>“And we won’t hold back just because you’re not one of us.”</i> The milodan about to fuck you says as he too pours out his drink onto your [pc.ass]. He claps his hands down on your rear while the one in front of you grabs you by your [pc.hair]. In one synchronized movement they both impale you on their cocks.");
	output("\n\nThe other men aren’t idle either. The two who haven’t gotten anything out of you yet grab your hands and plant them on their dicks. The pair who just got off are still hard, and decide to use whatever parts of your body are available. One seems content with simply slapping his dick against your ass cheeks, while the other gets creative. He lifts your leg up, bends it inward, and then thrusts his dick between your thigh and calf. Points for being resourceful.");
	output("\n\nThe old man must be nuts if he thinks this guy has a pencil dick. If you didn’t know any better you’d think he shoved his arm up there! He doesn’t really care about any discomfort, and frankly neither do you. The inebriating and arousing effects of the brew are making you feel <i>loose</i>, like you could fit a watermelon up your snatch and it would be nothing but pure bliss.");
	pc.cuntChange(0,600);

	output("\n\nThe same goes for your mouth. You could barely get him down the first few tries, but the taste and smell of the alcohol combined with his own musk left a trail that your mouth was eager to follow. ");
	if(pc.canDeepthroat()) output("Good thing your gag reflex is long gone!");
	else output("Good thing this stuff seems to suppress your gag reflex.");
	output(" Your world flashes in and out as you seesaw between bottoming him out in your throat and his friend in your [pc.pussy].");

	output("\n\nThe only reprieve you get is when the man you’re deepthroating stops to give his meat another delicious, boozy coating. The other is relentless though, treating you like a personal onahole until you feel ready to lose it. And lose it you do. You feel your whole body seize up as it overloads, not helped by the relentless pace of the furry predators around you. Your whole body twitches as your tunnel tries and fails to squeeze down on the rutting male behind you.");

	output("\n\n<i>“You want it bad, don’t you?”</i> You moan around the other milodan’s cock. <i>“THEN TAKE IT!”</i> He rams in again, just shy of the knot, and you feel him throb powerfully. His orgasm seems to reverberate through the rest of them, and you feel their manhoods swell against your body and in your throat.");

	if(!pc.isPregnant(0)) output("\n\nYour [pc.belly] swells from both ends as the pair dump what feels like a combined gallons of warm, delicious, fertile cum into your gut and aching womb.");
	else output("\n\nYour [pc.belly] swells from the amount of cum the man at your throat is dumping into you. Unfortunately you’re already The others do their best to encase you in cum. They unload gloriously, all over your back, hair, [pc.ass], and even manage to get your [pc.chest].");

	output("\n\nYou feel sinfully warm from the inside-out, content enough that you feel like you could pass out right now. Of course, they have other plans, and as soon as they pull out of you, you feel a pair of hands immediately grab you and drag you back on top of him. You feel his hot breath on the nape of your neck, and his big, furry hands almost mauling your rear. You can tell it’s the same man who just finished in you, still hard and raring to go.");
	output("\n\n<i>“Alright you old shit, show the new meat how a ‘real man’ does it. I’ll be taking this hole now.”</i> He moves to press his tapered tip against your [pc.asshole], pushing just shy of breaking in.");
	output("\n\nThe older man just grunts as he steps up to plate, pressing his mighty cock against your pussy lips. Okay, maybe he wasn’t entirely crazy when he called the other guy pencil dick. His manhood is a massive, angry looking thing; pitch black, corded in thick veins, and pulsing heavily. It’s easily the size of one of your calves, and if his demeanor is any indication, he’s not going to wait for you to get used to it.");

	output("\n\nYour mouth gapes open in awe, and a thought is breaking through the fog of your inebriated mind that this might not be the best idea. One of the men decides to take advantage of you state, however, and pours some kind of herbal tea down your throat. You barely get it all down before he gives you something else to choke on. He facefucks you in ernest, slamming his balls against your chin as he jackhammers you.");
	output("\n\n<i>“That should <b>really</b> help the swimmers take to you. Just a little reward for being so accommodating.”</i>");
	output("\n\nThe other two take that as the signal to start. They ram into you at the same time, hilting themselves as deep as your body will allow. It should feel at least weird to have this much meat in you, but you’re in heaven! Whatever he gave you has turned you numb to just about every sensation other than raw pleasure. That doesn’t stop your hands from working two of the other men though, that’s just instinct. That still leaves one man out in the cold though.");
	output("\n\nYou feel your insides stirring too. Your womb feels like it’s on fire, unnaturally hungry to be constantly full, and raring to go when it’s not. <b>Your fertility has been super-charged!</b>");
	
	var numVag:int = pc.totalVaginas();
	//multi-puss:
	if(numVag > 1)
	{
		output("\n\n<i>“Hey, [pc.heShe]’s got " + (numVag == 2 ? "two" : "more") + " of these you know.”</i> The venerated man in [pc.oneVagina] points out, pointing out " + (numVag == 2 ? "your empty slot" : "one of your empty slots") + ". His tail wags in glee as he jams himself alongside the other milodan, shoving himself into your vacant cunt, making sure each of your holes is getting bred.");
		if(numVag == 3) 
		{
			output(" That leaves one still empty though, and not much room for anyone else to squeeze in. Thankfully they seem to realize that too.");
			output("\n\n<i>“Youngling!”</i> The older man yells, summoning a quite small looking milodan to his side. <i>“Squeeze in here, we’ve got a special offworlder here.”</i> The young man nods and squeezes between the two larger men, lining up his exceedingly impressive cock with your remaining cunt and ramming it in.");
		}
		pc.cuntsChange(600);
	}
	//cunt-tail:
	if(pc.hasCuntTail())
	{
		output("\n\nHe notices your [pc.tails] wriggling around under you. He picks " + (pc.tailCount == 1 ? "it" : "one of them") + " up and inspects it for a bit, you doubt he’s ever seen one, after all. He digs into the slit with his fingers just to make sure it is what he thinks it is. After he confirms the nature of your strange appendage, he jams it on his cock without any hesitation.");
	}
	//Boring dork:
	if(numVag == 1 && !pc.hasCuntTail()) 
	{
		output("\n\nHe seems quite frustrated with his inability to get in on you. That frustration seems to boil over when he pushes in next to the man fucking your pussy.");
		output("\n\n<i>“Move over, I ain’t sittin around and waiting for you to finish! The offworlder can take both of us, can’t you?”</i> He shoots you and the man next to him a huge grin. Despite his annoyed expression, he allows it. He pulls out and repositions, pressing his tip against the other man’s, in front of your entrance. He thrusts in to the hilt and quickly pulls out, only to be replaced by the other man. They quickly form a rhythm around this, creatively sharing your [pc.pussy].");
		pc.cuntChange(0,1500);
	}
	output("\n\nIt doesn’t take the boys long to cum again. Another hot, heaping filling and coating makes you feel more like a galotian than a solid person.");
	if(pc.isGoo()) output(" Wait, you basically are a galotian. Really starting to lose it now!");
	output(" In typically milodan fashion, they don’t stop at that. They give you about a minute to recover while they switch around, but as soon as they get into place they’re off again.");
	output("\n\nTime loses meaning as you’re overloaded on sensation.");
	if(pc.hasCock()) output(" Eventually they even start jerking off your [pc.cocks] as they fuck you, largely ignoring it up til now. Your eyes cross, and your vision blurs to a thick, smutty soup. Consciousness fades as they dump another round in you, this time knotting every hole they can.");

	processTime(50);
	//BOOST DAT FERT!
	pc.fertility(1.5);
	for(var y:int = 0; y < 20; y++) pc.orgasm();
	for(var x:int = 0; x < numVag;x++)
	{
		//3 loads per puss!
		pc.loadInCunt(chars["MILODAN_MALE"],x);
		pc.loadInCunt(chars["MILODAN_MALE"],x);
		pc.loadInCunt(chars["MILODAN_MALE"],x);
	}
	//Bonus loads for single pussies
	if(numVag == 1)
	{
		pc.loadInCunt(chars["MILODAN_MALE"],0);
		pc.loadInCunt(chars["MILODAN_MALE"],0);
	}
	//Load in cunt tail
	if(pc.hasCuntTail()) pc.loadInCuntTail(chars["MILODAN_MALE"]);
	pc.loadInMouth(chars["MILODAN_MALE"]);
	pc.loadInMouth(chars["MILODAN_MALE"]);
	pc.applyCumSoaked();

	clearMenu();
	if(silly) addButton(0,"Next",sillyMilodanEpilogue,false);
	else addButton(0,"Next",randomBullshitBreedingSolsticeEnd);
}

//Finale
//This section could be silly mode only, if it’s too much.
public function sillyMilodanEpilogue(girls:Boolean = false):void
{
	clearOutput();
	showName("MUCH\nLATER");
	showBust("SAINT_DICK");
	author("QuestyRobo");
	
	output("You wake up, who even knows how many hours later. It’s still dark out, but it’s the Solstice so that doesn’t tell you much. ");
	if(girls) output("The women that piled up around you have scattered, either moving on to other men, or settling into one of the big piles of sleeping milodans. The dildo is gone, probably reclaimed by one of the priestesses. You still feel <i>loose</i> though, in a good way.");
	else output("You still have plenty of thick cum rolling out of you, though you’ve drained out substantially; and it seems like one of the men or, more likely, one of the priestesses. The men have largely moved on; you can still see some of them fucking other women.");
	output(" Despite the continuing activity, things have taken a lull. You can even see some <i>very</i> well bred girls serving food");
	if(girls) output(", including the young woman whose virginity you took");
	output(". One of them comes up to you and offers you a leg of strange-looking meat.");

	if(!girls) 
	{
		output("\n\nWell, cum isn’t really a balanced meal");
		if(pc.isBimbo()) output(", no matter how delicious it is");
		output(".");
	}
	else output("\n\nYou realize you haven’t really had anything to eat since you got here.");
	output(" You take the meal and tentatively sample it. The taste is a little gamey, but not unpleasant. It falls right off the bone and practically melts in your mouth. Say what you want about the milodans, they know how to cook.");
	output("\n\nThere’s been this faint jingling in your ears ever since you woke up. You thought it was just your burned out brain playing tricks on you, but it’s getting louder, and seems to be coming from outside. The others notice it as well, and some even grab their weapons. The jingling gets closer and closer until it’s right at the entrance of the tent.");
	output("\n\nSuddenly, the entrance blows open, and a figure steps inside. It, well, she is a milodan, and a massive one at that. Around nine feet tall and <i>big</i> in just about every other way; thick, fluffy fur coats a wide frame that rides the line between chubby and muscular, massive, drooling tits hang on her chest, defying gravity with their immense, voluptuous size, wide hips and thick thighs, and a heavily distended white fur-lined red sack around where her genitals are.");
	output("\n\nAside from the sack, the only other thing she wears is a small, red stocking cap with a white poof ball at the end, and a red poncho that’s far too small to even begin obscuring her tits.");
	output("\n\nShe says nothing, just stands there observing the confused crowd in front of her. They whisper among themselves as they decide how to react to the strange outsider, until the priestess from earlier steps toward her. She pulls a strangle little idol out of a pouch on her side and presents it to the strange woman. She grows excited when she looks at it, grabs it and hooks it onto a necklace where it starts glowing.");
	output("\n\nThe older woman almost jumps for joy when this happens, turning back to the crowd and cheering <i>“IT’S TRULY HER! THE OLD SAINT HAS RETURNED TO US.”</i> The crowd lay down their weapons and start cheering, crowding around the apparent Saint. But she doesn’t pay attention to them, she’s looking straight at you. She parts the crowd and approaches you, much to their disappointment. The priestess backs you up, however.");
	output("\n\n<i>“Remember the legend, the Saint wishes to test the outsider.”</i>");
	output("\n\nFrom the way she’s looking at your [pc.crotch], ‘test’ probably means exactly what you think it means. She stops only about two feet in front of you, staring, waiting for you to do something, and you know exactly what.");

	//Herms get a choice, otherwise appropriate scene starts here.
	clearMenu();
	if(pc.isHerm()) 
	{
		output("\n\nWhat do you do?");
		//[Dick] Grab your [pc.cock]
		//[Pussy] Bend over and show her your [pc.pussy]
		addButton(0,"UseYourDick",milodanMassDickAchu,girls,"Use Your Dick","Grab your [pc.cock].");
		addButton(1,"UseYourPussy",saintDickulousInYerPuss,girls,"Use Your Pussy","Bend over and show her your [pc.vaginas].");
	}
	else if(pc.hasCock()) addButton(0,"Next",milodanMassDickAchu,girls);
	else addButton(0,"Next",saintDickulousInYerPuss,girls);
}

//Dick
//PC gets another big cum production and virility boost.
public function milodanMassDickAchu(girls:Boolean = false):void
{
	clearOutput();
	showName("SAINT\nDICK");
	showBust("SAINT_DICK");
	author("QuestyRobo");
	pc.cumQualityRaw += 1;
	pc.boostCum(40);
	output("You grab your hardening [pc.cock] and present it to the silent, fluffy giant. She smiles and bends over, showing you her puffy, soaking cunt. Admittedly you were a bit worn out from earlier, but something about the sight and smell of her makes you feel like you haven’t fucked in days!");
	output("\n\nYou shoot to full hardness and can’t help yourself from jumping her. ");
	if(pc.tallness < 7*12) output("You need to scale her a bit to make up for the height difference, but it’s well worth it, and you have <i>plenty</i> to hang onto.");
	else output("Thankfully you’re almost equally as massive as she is, so mounting her proves to be no trouble.");
	output(" She moans, the first sound you’ve heard out of her, and her walls start squeezing down on you. Her pussy muscles are so perfectly in sync with your thrusts that it’s unreal! It’s like a firm hand guiding your " + pc.mf("male","herm") + "hood in and out of her.");

	output("\n\nIt’s heaven, absolute heaven. You feel every fold go over your dickskin, like a million tiny mouths kissing your length on its journey. It’s addictive, and you need more! You up your pace and shorten your strokes in order to stay inside her as long as possible.");
	pc.cockChange();

	output("\n\nAs perfect as that is, it’s just one part of the sexual temple that is her body. Her fur is sinfully soft, every strand almost massaging your [pc.skin] as you feel up her body. And what a body! Everywhere you grab has just the right amount of delightful softness and she radiates a kind of warmth that reminds you of blissful summer days; and there’s so much to grab. From her gigantic, milk-laden tits, jiggling and drooling their lactic bounty, to her massive hips and thighs that could only be on someone who’s birthed many litters of children. The idea that you’re going to father the next one drives you even further into her.");
	output("\n\nYour thrusts have grown so frantic that the poor girl is starting to lose her balance. You don’t care though, all you’re interested in is finishing inside her. One more push sends her tumbling forward onto tits with a yelp. Instead of worrying, you take advantage, grounding yourself and diving in even harder.");
	output("\n\nWhere before she was quietly observing you fuck her, now she’s <i>enjoying</i> it, possibly even more than you are. She moans out like a show whore, making sure everyone in the room hears just how much you’re pleasuring her. Cheers ring out from the crowd as you run their mythical figure into the ground, make her yours!");
	output("\n\nHer ass jiggles like a bowl of jelly, so perfectly supple that you can’t help but yank her big, fluffy tail for leverage, and bring your hand down on it. You attack her rear, tenderizing it like an overzealous cook with anger issues who just had his car impounded tenderizes a steak. She doesn’t mind, on the contrary she loves it! Her tunnel goes wild around you, and her whole body starts twitching like crazy.");
	output("\n\nAll this time, her male organs have been locked away in the decorative sack that holds them. Even when she’s plainly erect, and pitching an almost two foot tent, it still holds. It isn’t until she cums powerfully that it starts to give. Her honeypot grinds down on your [pc.cock], not halting your movement, but loudly demanding that you give her what she wants. The sack fills like a water balloon, to the point where it breaks the seal around the top and leaks out the sides. It doesn’t take long for it to become so heavy that it gives out, exposing her giant, milodan cock, and heavy balls.");
	output("\n\nYou’ve bought this legendary figure so low, it’s time to finish her off. You lean forward, putting your head near hers, and wrapping your hands around her squirting buds. You can feel your [pc.cum] desperately welling up, like your swimmers are being drawn to her. Before you can release on your own, however, she turns her head to yours and finally speaks in an almost ethereal tone.");
	output("\n\n<i>“You are worthy, space " + pc.mf("","wo") + "man, breed me.”</i>");

	output("\n\nHer otherwise mundane words have an immense effect on you. Your eyes screw up into your head, and your [pc.balls] feel like lead weights as you unload.");
	output("\n\n[pc.Cum] surges out of you in unprecedented amounts. It’s so intense that it almost feels like each burst is its own orgasm, stacking on top of each other as they grow closer and closer, until it’s just one, long stream. Her belly swells out, and you feel like you’re putting out gallons, but not a drop of it leaks out. It’s unnatural, <b>like your virility just got a big boost</b>.");
	output("\n\nAfter a minute, you finally empty, falling back out of her. ");
	if(pc.hasKnot(0)) output("Your knot tries to hold you in, but something keeps it from fully taking root. ");
	output("You lay on the floor, panting and exhausted as she rises back up. Even with nothing blocking the way, no cum leaks from her pussy, and her stomach has a solidness that your mind tells you can’t just be cum. She can’t be pregnant already, can she?");
	output("\n\nA strange sense of serenity falls over you as the crowd dogpiles her, taking everything she has to offer and then some. You’ve done enough, your mind tells you, it’s time to rest.");

	processTime(80);
	pc.orgasm();
	pc.clearRut();
	
	clearMenu();
	addButton(0,"Next",randomBullshitBreedingSolsticeEnd);
}

//Pussy
//PC gets another big fertility boost, and a wetness boost.
public function saintDickulousInYerPuss(girls:Boolean = false):void
{
	clearOutput();
	showBust("SAINT_DICK");
	showName("SAINT\nDICK");
	author("QuestyRobo");
	output("You bend over and present your [pc.pussy] to the big beasty, spreading your lips wide to show off everything. The sack around her crotch immediately tents, the sound of seams tearing becoming audible throughout the room. She doesn’t take it off though, instead she simply approaches you and presents it. You know <i>exactly</i> what that means, and turn right back around.");
	output("\n\nIt’s on surprisingly tight, and it’s a bit of a struggle to get it off. Your impatience grows as her scent wafts up into your nose. It’s strong and heady, even among the collective fragrance of the rest of the males. Your honeypot juices up and clenches in instinct, readying itself for the thorough breeding that’s to come. Your unraveling pulls turn into frustrated tugs and tears. You hope she doesn’t mind, but you need some dick!");
	output("\n\nShe seems amused by your desperation, if the small chuckle she makes is any indication. She reaches down and pulls a string that you hadn’t noticed. The sack loosens and her dick is released, jutting up so fast that it smacks you on the tip of your nose, and tosses the bag several feet into the air. The momentary sting from the impact is quickly forgotten when you see her hermhood.");
	if(flags["KIRO_BAR_MET"] != undefined) output("\n\nIt’s roughly the same size as Kiro’s, with huge balls that easily outclass the nuki’s, unless she’s <i>really</i> backed-up.");
	else output("\n\nIt’s just shy of two feet, with balls easily bigger than a smaller person’s head.");
	output(" It takes a second for the smell of it to hit you, but when it does you nearly fall to your knees. She must have been marinating her dick and balls in there for hours, the pheromone soup is so thick that you can see it steaming up in the cold air. The monstrous, milodan cock is already drooling a stream of heady pre that might as well be liquid ambrosia for you.");
	output("\n\nYou dive onto her length, sucking her delicious juices straight from the tap before moving down to gather more of her sweet musk. Her whole shaft is like a pheromone lollipop, and you’re damned and determined to figure out how many licks it takes to get to the center!");
	output("\n\nYour [pc.pussy] is going absolutely insane! It’s spasming and drooling out [pc.girlCum] at an unatural rate, <b>like you’ve suddenly become far wetter</b>. It’s so soaked that you’re sure you could take her right now; but her juices are so delicious that you can’t bring yourself to waste a drop.");
	output("\n\nYou wrap your arms around her sack, able to put them in a full body hug, with their sheer size. She yelps a bit in reaction, your attentions causing her to spurt a big glob of pre-seed onto your back. You hate missing out on delicious pre, but the way it runs down your back, through the crack of your [pc.ass] and over your already desperate pussy lips is even better.");
	output("\n\nThe teasing drop of cum on your [pc.pussy] is just too much. You drag yourself off her mouth-watering cock, lay down on your back, and present yourself. You dig into your folds, making sure to scoop up any lingering pre before you dive four fingers in. You can’t help but give yourself constant stimulation, just the short wait before she fucks you is agonizing!");
	output("\n\nThe Saint watches you roll around and moan like a whore, enraptured with just how lost in lust you are. Her cock twitches and spurts another glob of pre onto you, making you squirm even harder. You feel like your body is going to overheat, you’re about to yell out and beg, but your cries are silenced as she finally makes her move.");
	output("\n\nYour gut bulges as over ten inches of milo-cock gets crammed inside you in an instant. Your breath catches in your throat as she doesn’t even give you a chance to adjust. That ten inches quickly goes back to about three, than up to twelve, then fourteen, and it keeps going until she’s buried as many inches as your body can possibly take.");
	pc.cuntChange(0,chars["KIRO"].cockVolume(0));
	output("\n\nShe looms over you with a cheery smirk as her hips become a blur, diving in and out of you with animalistic fury. Thankfully the numbing effect from all the alcohol is still well in effect, and all you get out of the constant bulging of your [pc.belly] is pure pleasure.");
	output("\n\nShe doesn’t seem satisfied, though. Her smirk turns into a frown as the rutting continues. She leans into you, not even missing a beat as she shifts position. She plants one of her drooling nips in your mouth, squirting a big helping of it into you. Your eyes go wide when you swallow it, it’s like pure, concentrated energy shooting down your throat and into the rest of your body.");
	pc.milkInMouth();
	output("\n\nHer head is right next to your ear, and for the first time, you hear her speak. <i>“Prove yourself, spacer, you cannot carry our people’s children being this weak. Rise, and take what you want.”</i>");
	output("\n\nEnergy surges through your limbs as some unknown force compels you to take charge. You stop her thrusting, grab her hard, and shove her off you, onto her back. You spring up, quickly taking advantage of her prone state, and planting your [pc.pussy] on her tip. She beams up at you as you finally take charge.");

	output("\n\nYou scream out in joy as you impale yourself on her cock. There’s an obscene bulge in your gut as you take her to the knot. It’s a struggle, but your body is demanding everything she can give. ");
	if(!girls) output("Your womb is already swimming in cum, but it’s still throbbing for more!");
	else output("Your womb has been lying empty this whole time, and it’s hungry damn it!");
	output(" You babble out inarticulate praises and demands for cum, demands for her to knock you up with her legendary babies.");

	output("\n\nYou reach behind yourself and grab her sack as you bounce. You can <i>feel</i> them swelling, throbbing, dredging up the biggest load they can for you. The thought of her impending climax, of your impending impregnation, drives you over the deep end. You slam down, taking every inch of her giant shaft as you cum uncontrollably.");

	output("\n\n<i>“B-b-br-breed meeeeeeeeeee!”</i> You scream out as your eyes screw up into your head. At that moment, her knot inflates, trapping you on her. Her whole shaft throbs and thickens as it prepares to unload in you. Your [pc.belly] explodes out in seconds, spreading blissful warmth throughout your body. She keeps going long after that, a testament to the mighty virility of the mythical figure.");

	output("\n\nThe ground becomes a soupy mess as your muscles start failing you. You fall forward onto her, resting your slack muscles in her warm embrace. Your womb throbs in excitement, and a crowd forms around you two. Despite being knotted, the Saint takes you off her dick, still pumping out thick cum into the cheering crowd. She gets up and brings you over to a pile of thick furs, setting you down and giving you a deep kiss.");

	output("\n\n<i>“You are worthy, space " + pc.mf("","wo") + "man, bear your children with strength.”</i> Your eyelids grow heavy, and you pass out as the Saint gets dogpiled and taken by the assembled crowd.");

	processTime(120);
	pc.fertility(2);
	//Basically 6 dudes worth of jizz sounds about right...
	pc.loadInCunt(chars["MILODAN_MALE"],0);
	pc.loadInCunt(chars["MILODAN_MALE"],0);
	pc.loadInCunt(chars["MILODAN_MALE"],0);
	pc.loadInCunt(chars["MILODAN_MALE"],0);
	pc.loadInCunt(chars["MILODAN_MALE"],0);
	pc.loadInCunt(chars["MILODAN_MALE"],0);
	for(var x:int = 0; x < pc.totalVaginas(); x++)
	{
		if(pc.vaginas[x].wetness() < 5) pc.vaginas[x].wetness(1);
		if(pc.vaginas[x].wetness() < 5) pc.vaginas[x].wetness(1);
	}
	pc.boostGirlCum(10);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",randomBullshitBreedingSolsticeEnd);
}

public function randomBullshitBreedingSolsticeEnd():void
{
	clearOutput();
	showName("IT’S\nOVER");
	moveTo("UVI R32");
	author("QuestyRobo");
	output("You wake up some time later. Instead of being in the tent, however, you’re resting in the back room of The Freezer. You’re very confused for a moment before ");
	if(flags["MET_HANA"] == undefined) output("the barkeeper");
	else output("Hana");
	output(" comes in.");

	output("\n\n<i>“Good, you’re awake. What were you thinking going off to that damn solstice thing? You’re lucky you didn’t come back with broken legs, like the last guy they dragged back!”</i> You shrug, not really knowing how to respond.");
	output("\n\nShe sighs. <i>“Well, at least you’re alright. Stay a bit if you need to, yell if you need anything.”</i> With that, she goes back out to the bar, leaving you to sit and reflect on what happened.");
	processTime(45);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*Bridget email
FEN NOTE: Cut this because I really don't feel like dealing with this. Pretty sure there's not support for being a dad to the milopups.
output("\n\n//After a month, you’ll get an email from Bridget if you did the Dick scene with Saint Dick.");

output("\n\nHello, [pc.name].");

output("\n\nI’m sending you this to inform you of a ‘delivery’ that’s been made to the Nursery in your absence. A large hermaphrodite came by and dropped off a fairly large litter of milodan kits. A DNA test confirmed that they are, in fact, yours.");

output("\n\nObviously I don’t mind taking care of the fruits of your adventures, but I would appreciate if they remained through proper channels in the future.");

output("\n\n<i>Attached is a picture of eight mewling milodan kits, wrapped in what looks like a red poncho with a green bow around it.</i>");

output("\n\n<b>You have eight more newborn milodans waiting at the Nursery.</b>");*/