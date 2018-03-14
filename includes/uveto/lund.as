//Name: Lund
//Personality: Fluffy with a Napoleon complex. Wants to dominantly dick down bigger aliens
//Physical: 5’4”</i>, muscled, ottermode. 10”</i> doggy cock with a fat knot. Fluffy tail. Pale blue fur like the Shoubust. Penis colour like the Shoubust too because it looks like a tasty lolly. Facial expression probably not like the Shoubust; he’s not very friendly to outsiders.

//Sex scenes
//Get doggied
//Dick him
//Ride him
//Bimbo sex (you get forced into this if you’re a bimbo)

public function showLund(nude:Boolean = false):void
{
	showBust("LUND" + (nude ? "_NUDE" : ""));
	showName("\nLUND");
	author("Wsan");
}

public function moveToLundsHouse():void
{
	currentLocation = "KORGII L10";
	if(flags["LUNDS_HOUSE"] == undefined) flags["LUNDS_HOUSE"] = 1;
	generateMap();
}

public function leaveLundsHouse(noMainMenu:Boolean = false):void
{
	currentLocation = "KORGII J10";
	if(!noMainMenu) mainGameMenu();
}

public function lundCumPlaceholder():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_CANINE);
	pp.cocks[0].cLengthRaw = 10;
	pp.createPerk("Fixed CumQ",250,0,0,0);
	
	return pp;
}

public function lundsRoomBonus():Boolean
{
	if(flags["MET_LUND"] != undefined) output("Lund’s room would best be described as basic, though perhaps bare would be a better way to put it. Inside is a neatly-made bed and a chest of drawers and... nothing else. It’s not the biggest place either, but you suppose he doesn’t really need much room. It doesn’t look like he spends much time inside it, leading you to wonder why you’re here instead of elsewhere.");
	else output("This dwelling would best be described as basic, though perhaps bare would be a better way to put it. Inside is a neatly-made bed and a chest of drawers and... nothing else. It’s not the biggest place either, but you suppose the owner doesn’t really need much room. It doesn’t look like he spends much time here, leading you to wonder why you’re bothering to look it over so thoroughly.");
	return false;
}

public function lundHangoutBonus():Boolean
{
	if(flags["MET_LUND"] == undefined)
	{
		meetLund();
		return true;
	}
	//GOODBYE, LUND!
	else if(flags["LUND_FUCKED_OFF"] == 1) {}
	else
	{
		output("\n\nYou see the fluffy male korgonne, Lund, leaning against a wall and observing the hustle and bustle with a watchful eye. His eyes narrow when he sees you looking at him.");
		//Doggied: 
		if(flags["LUND_LAST_SEX"] == "Doggystyle") output(" You give him a friendly smile and he smirks, looking from side to side before crooking a finger to beckon you over.");
		else if(flags["LUND_LAST_SEX"] == "Dicked") output(" You give him a friendly wave and he looks away, turning his gaze to the side. He seems embarrassed about your last meeting.");
		else if(flags["LUND_LAST_SEX"] == "Rode") output(" You give him a casual smile and he looks around warily before settling his gaze back on you. He looks like he wants to talk.");
		addButton(0, "Lund", approachLund, undefined, "Lund", "Lund, a korgonne male, is here if you want to talk to him.");
	}
	return false;
}

//Mechanic: Store the last sex scene done with him so it can be referenced in the hallway blurb. Maybe elsewhere too.
//Meeting Lund
public function meetLund():void
{
	showLund();
	flags["MET_LUND"] = 1;
	output("\n\nWalking through the busy hallway of the Hold, you suddenly hear a voice ");
	if(pc.tallness > 6 * 12) output("from somewhere below you and look down, puzzled");
	else output("from behind you and look around, puzzled");
	output(".");

	output("\n\n<i>“Hey you. Alien. This way, idiot.”</i>");

	output("\n\nTurning around to look at the source of the annoyed voice, you see a male Korgii leaned against the wall glaring at you. Pushing himself off with a quick movement, he walks over and ");
	if(pc.tallness > 5*12+4) output("looks up at you angrily.");
	else output("looks down his snout at you.");

	output("\n\n<i>“You not big deal,”</i> he says, poking you rudely in the chest. <i>“Think you bigshot? No. Prouncing around on your stupid ");
	if(pc.hasHooves()) output("hoof-foots");
	else if (pc.hasLegFlag(GLOBAL.FLAG_PAWS)) output("paws");
	else if(pc.hasToeClaws()) output("clawfoots");
	else if(pc.hasLegFlag(GLOBAL.FLAG_HEELS)) output("heelfoots");
	else output("foots");
	output(". You might be invited, but not think you welcome.”</i>");

	//[Fuck off] [Go away] [Leave]
	processTime(3);
	clearMenu();
	addButton(1,"Fuck Off",tellLundFuckOff);
	addButton(0,"Go Away",goAwayLund);
	addButton(14,"Leave",leaveAwayFromLundo);
}

//[Fuck off]
//only available to hard or mercenary. Locks you out from future interactions.
public function tellLundFuckOff():void
{
	clearOutput();
	showLund();
	output("<i>“Fuck off,");
	if(pc.tallness > 6*12) output(" runt,");
	output("”</i> you grunt roughly, pushing the annoying korgonne back against the ice wall hard enough to make him sharply exhale and slump downwards momentarily. <i>“I don’t have time for this bullshit.”</i>");

	output("\n\n<i>“You regret that, alien,”</i> the korgonne coughs, looking up at you with hatred in his eyes as he gets up from the ground. <i>“Mark words. Lund find you.”</i>");

	output("\n\nWith nothing more to be said, he stalks away without looking back. Well, one less asshole to deal with, at least.");
	//Probably want to set a flag for this in the event of a future combat scenario.
	flags["LUND_FUCKED_OFF"] = 1;
	variableRoomUpdateCheck();
	processTime(2);
	pc.addHard(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Go away]
public function goAwayLund():void
{
	clearOutput();
	showLund();
	output("You take his hand and remove it, letting go when he tries to snatch it back and glaring at him.");
	output("\n\n<i>“Don’t touch me unless I tell you to, ");
	if(pc.tallness > 6*12) output("runt");
	else output("creep");
	output(",”</i> you snarl, brushing your chest off for emphasis. <i>“I might be new here but that doesn’t mean you can just walk all over me.”</i>");
	output("\n\n<i>“Hm,”</i> the korgonne grunts, considering you. <i>“You not like other alien. Just don’t bother Lund and we get along.”</i>");
	output("\n\n<i>“Who’s Lund?”</i> you ask, curiosity getting the better of you.");
	output("\n\n<i>“Me,”</i> he says, jabbing his thumb at his chest. You’re starting to get the feeling he just likes to point at things a lot. <i>“Am Lund.”</i>");
	output("\n\n<i>“I see... well, I won’t bother Lund, then.”</i>");
	output("\n\n<i>“Is good,”</i> he nods, and waves you along.");
	//set a flag for this
	processTime(4);
	flags["LUND_GO_AWAY"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveAwayFromLundo():void
{
	clearOutput();
	showLund();
	output("You don’t really want to anger the korgonne when you’ve just gotten here. You turn to walk away and find he’s holding onto your arm, and you look back at him inquisitively.");
	output("\n\n<i>“Hey! You mute? Not talk?”</i> he gestures at his mouth, watching you with a puzzled expression.");
	output("\n\n<i>“I just don’t want to bother you when you’re clearly already, ah, sensitive,”</i> you reply, looking ");
	if(pc.tallness > 12*5+4) output(" down");
	output(" at the furry creature.");
	output("\n\n<i>“Oh. Now Lund look like dumb asshole,”</i> he says, taking his hand away. <i>“You not like other alien, maybe. </i>Maybe.<i> Most real idiot.”</i>");
	output("\n\n<i>“So... you’re Lund?”</i> you ask.");
	output("\n\n<i>“Am Lund,”</i> he nods, jabbing a thumb at his own chest. You’re starting to get the feeling he likes to point at things a lot. <i>“Biggest and bestest in hold.”</i>");
	output("\n\nLooking around, you’ve already seen evidence he’s clearly not the biggest, but now’s probably not the best time to bring that up. Instead, you nod and point down the hallway.");
	output("\n\n<i>“I’m going to go now,”</i> you say.");
	output("\n\n<i>“Okay, is good. Smart alien,”</i> he says, and waves you along.");
	//set a flag for this too
	flags["LUND_LEFT_FOOLISH"] = 1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function approachLund(back:Boolean = false):void
{
	clearOutput();
	showLund();
	output("You approach Lund, already wondering what the fluffy dog-man will have to say to you.");
	if(back)
	{
		author("Fenoxo");
		output("Is there something else you’d like from Lund?");
		lundMenu();
	}
	//These 2 intro blurbs take priority over the below ones
	//First time you submit:
	if(flags["LUND_MADE_U_SUBMIT"] == 1)
	{
		output("\n\nYour heart is racing, your step light and quick, and your cheeks slightly flushed. It’s not enough to tip a regular person off, but the korgonne are a keenly perceptive folk. By the time you reach him, it feels like half the people you’ve passed have cast you a curious, knowing eye and a smile. That really only makes it worse, and by the time you actually reach Lund you’re breathing harder than you should be. You feel a little like a nervous virgin walking out to meet [pc.hisHer] boyfriend for an illicit rendezvous.");
		output("\n\n<i>“Hey, Lund,”</i> you say, smiling wide. <i>“How are you?”</i>");
		output("\n\n<i>“Oh, alien friend now?”</i> Lund replies, arching a fluffy brow. <i>“The way you scream Lund name make it closer to pet, Lund think.”</i>");
		output("\n\n<i>“I- well,”</i> you say, unsure of how to reply, <i>“I just thought-”</i>");
		output("\n\n<i>“Say it,”</i> Lund says, meeting your gaze. <i>“Say alien Lund’s pet.”</i>");
		output("\n\n<i>“What?”</i> you bristle, somewhat angered by his arrogance. <i>“You listen to me, I’m n-”</i>");
		output("\n\n<i>“Say pet or Lund not fuck alien,”</i> he replies breezily, not breaking eye contact. You gape open-mouthed, not having expected the ultimatum. Given the situation, though, you really only have the one option.");
		output("\n\n<i>“I’m Lund’s pet,”</i> you mutter bitterly, hanging your head. It’s the truth, but you were hoping for something a little more amicable.");
		output("\n\n<i>“Louder,”</i> he commands you, waving his hand. <i>“Whole crowd should know.”</i>");
		output("\n\nYou turn around and, indeed, there’s at least ten korgonnes with their eyes on the curious alien. Some of them are grinning, others wary, some meek, but all of them are waiting to see how you’ll react. You hesitate for a moment, but the way forward is clear. An idea pops into your head then; maybe if you go above and beyond, you’ll be rewarded?");
		output("\n\nI-I’m,”</i> you begin, the audacity of what you’re doing swimming in your mind. You take a deep breath. <i>“I’m [pc.name], Lund’s little bitch pet.”</i>");
		output("\n\nAt first, nothing. Then you hear a snort, and by the time you locate which one of the young women made the sound, she’s doubled over in laughter and the others are breaking into fits of giggles. Soon enough the entire gaggle of girls are surrounding Lund, poking the <i>“alien tamer”</i> and hitting him on the arm for good measure. A couple of them give you some endearing pats before they leave, waving at you as they go.");
		output("\n\nYou feel slightly dumber for having done that. Lund just shrugs.");
		output("\n\n<i>“It not like korgonne horrible people. So? Alien here to get fucked?”</i>");
		processTime(5);
		flags["LUND_MADE_U_SUBMIT"] = 2;
	}
	//First time you dick him
	else if(flags["LUND_DICKED_REACTION"] == undefined && flags["LUND_COVERED_4"] != undefined)
	{
		flags["LUND_DICKED_REACTION"] = 1;
		output("\n\n<i>“Hiya cutie,”</i> you say, smiling wide. <i>“How’re you feeling?”</i>");
		//Bragged:
		if(flags["LUND_COVERED_4"] == -1)
		{
			output("\n\nLund bristles at your greeting, throwing you a baleful glare. <i>“You make fun of Lund to girls.”</i>");
			output("\n\n<i>“Aww, it was just jokes!”</i> you insist, spreading your arms. <i>“I didn’t mean anything by it. You’re not any less of a man for liking my cock up your ass.”</i>");
			output("\n\n<i>“Lund </i>not<i> like it,”</i> he says pointedly, shaking his head. <i>“Not do that again. Ever.”</i>");
			output("\n\nOh, well.");
		}
		//Covered for him:
		else
		{
			output("\n\nLund eyes you hesitantly, then nods. <i>“Lund good. Alien maybe good person.”</i>");
			output("\n\n<i>“Are you talking about how I stuck my neck out for you with those girls?”</i> you snicker, giving him a wink. <i>“So?”</i>");
			output("\n\n<i>“So... thanks,”</i> Lund says, averting his eyes, then looking back at you. <i>“But we not do that again... Lund sore.”</i>");
			output("\n\nOh... maybe you should wait a little while before asking him for another ride.");
		}
	}
	//Defaults
	else
	{
		if(flags["LUND_LAST_SEX"] == "Doggystyle") output("\n\n<i>“Oh? Alien back for more?”</i> Lund asks, watching you with interest. <i>“Not surprised, seem like your thing. Happy to teach alien place.”</i>");
		else if(flags["LUND_LAST_SEX"] == "Dicked") output("\n\n<i>“You,”</i> Lund scowls, looking from side to side. <i>“What you want? Here to rub in Lund’s face?”</i>");
		else if(flags["LUND_LAST_SEX"] == "Rode") output("\n\n<i>“You,”</i> Lund moans, looking from side to side. <i>“What you want? Lund’s hips still sore from last time.”</i>");
		else output("\n\n<i>“What alien want?”</i> Lund asks, neutral at least for the time being. <i>“Lund can talk. Not too much though, alien not </i>that<i> important.”</i>");
	}
	//[Appearance] [Lund] [Outside] [Sex]
	processTime(1);
	lundMenu();
}

public function lundMenu():void
{
	clearMenu();
	addButton(0,"Appearance",lundAppearance);
	addButton(1,"Lund",talkToLundAboutLund);
	if(flags["LUND_LUND_TALK"] == 1) addButton(2,"Outside",askLundAboutOutside);
	else addDisabledButton(2,"Outside","Outside","Maybe talk to him a bit about himself first.");
	if(flags["LUND_OUTSIDE_TALK"] == undefined) addDisabledButton(3,"Sex","Sex","Maybe talk to him a bit more before jumping his bone.");
	else if(pc.lust() >= 33) addButton(3,"Sex",lundSexStarter);
	else addDisabledButton(3,"Sex","Sex","You aren’t quite in the mood right now.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance and Lund available first, then Outside after Lund, then Sex after Outside.
public function lundAppearance():void
{
	clearOutput();
	showLund();
	output("Lund stands at a very proud 5\' 4\", covered in pale blue fur. Though his coat is quite shaggy and thick, you can still see the musculature underneath. He’s not particularly big, but he is a very well-built biped in a compact package. Wearing nothing across his torso, you can see his well-defined pectoral muscles and multiple rows of abdominals. He has a brown cloth belt around his waist with two short hunting swords sheathed there, lustrous and clearly created with some care.");
	output("\n\nAround his wrists, he has some furry armlets that you suppose he wears to stay warm. You wonder how much good it’s doing him what with the bare chest and exposed skin, but he’s evidently managing. He at least has a sort of short, fluffy kilt covering his thighs, and furry anklets to match the ones around his wrists.");
	output("\n\n<i>“Don’t you get cold?”</i> you ask him. He only shrugs.");

	if(flags["SEXED_LUND"] != undefined) output("\n\nYou know from prior experience that though it’s hidden by his clothing and a sheath right now, Lund has a huge 10”</i> cock totally at odds with his relatively tiny frame. No wonder he’s so proud of himself. When he cums, a fat knot forms at the base of it, bulging with virility and ensuring his partner is going to be taking in - or swallowing - every shot of jizz he has to give.");
	//Dicked him:
	if(flags["LUND_DICKED_DOWN"] != undefined) output(" You also know, through intimate discovery, that he has a tight, sensitive asshole between his taut, firm buttcheeks that feels amazing to be inside.");
	clearMenu();
	addButton(0,"Next",approachLund,true);
}

//[Lund]
public function talkToLundAboutLund():void
{
	clearOutput();
	showLund();
	output("<i>“So what’s your story?”</i> you ask, nodding at the korgonne. <i>“Are you a guard?”</i>");
	output("\n\n<i>“Hunter,”</i> Lund corrects you, a hand slipping down to one of his sheathed blades. <i>“Hunt for food.”</i> Unsheathing the sword and expertly flipping it around his wrist to hold it backwards, he inspects blade’s edge. <i>“Sometimes not for food. You?”</i>");
	flags["LUND_LUND_TALK"] = 1;
	if(!pc.isBimbo()) 
	{
		output("\n\n<i>“I guess I’m a hunter too,”</i> you say, shrugging. <i>“Hunting for probes my dad left behind.”</i>");
		output("\n\n<i>“Treasure?”</i> Lund asks, glancing at you curiously.");
		output("\n\n<i>“Something like that,”</i> you reply. <i>“At the very least, they’re worth a lot to me personally.”</i>");
		output("\n\n<i>“Probe... here?”</i> he questions, pointing down. <i>“On planet?”</i>");
		output("\n\n<i>“I don’t think so,”</i> you say, shaking your head. <i>“I’m here for different reasons.”</i>");
		output("\n\n<i>“Hmm,”</i> he says, considering this. <i>“Alien not so different. Sometimes hunt. Sometimes not hunt. Is life.”</i>");
		output("\n\nAbout as profound as a brokenly-translated hunter on a ball of ice is going to get, you suspect.");
		clearMenu();
		addButton(0,"Next",approachLund,true);
	}
	else
	{
		output("\n\n<i>“Um, kinda the same thing?”</i> you say, putting your finger on your lip. <i>“I gotta look for space probes ‘cuz my dad said so.”</i>");
		output("\n\n<i>“Treasure hunting?”</i> Lund asks, eyeing you up and down. <i>“Lund not think alien suited to job.”</i>");
		output("\n\n<i>“Aw, don’t be mean,”</i> you pout. <i>“They’re worth a lot to me, so I gotta find ‘em anyway.”</i>");
		output("\n\n<i>“Probe... here?”</i> he questions, pointing down. <i>“On planet?”</i>");
		output("\n\n<i>“Nuh uh,”</i> you say, shaking your head. <i>“I’m here for fun, I just wish it was a little warmer on this planet!”</i>");
		output("\n\n<i>“Lund think he know what you mean,”</i> he says, looking at your [pc.lipsChaste] intently. <i>“Maybe can help warm alien.”</i>");
		output("\n\n<i>“Oh, you’re so nice! You do look like you’d be warm if I hugged you...”</i> you say, looking at his coat of fur. <i>“Maybe we could get a little closer later...”</i>");
		output("\n\n<i>“Lund cock get a little closer to your lips,”</i> Lund says bluntly, looking you in the eye. <i>“Recognize needy alien when see one.”</i>");
		output("\n\n<i>“Oh gosh, I can’t say no to that,”</i> you giggle, looking from side to side. <i>“Is there somewhere we can..?”</i>");
		output("\n\nLund takes your hand and tugs you down the hallway, leading you through a network of confusing twists and turns until you have no idea where you are. That doesn’t really matter though because you can see a very promising bulge underneath the korgonne’s kilt, the indistinct shape occupying your mind’s limited real estate.");
		output("\n\n<i>“Here,”</i> Lund says abruptly, tearing off his kilt and throwing it at your feet. <i>“For knees.”</i>");
		output("\n\nYou automatically obey, wordlessly opening your mouth and finding it immediately occupied by ten inches of delicious canine cock. What follows is close to thirty minutes of Lund fucking your face however he wants, your head obediently bobbing up and down on his doggy dick as he explores your throat’s limits. When he fiercely thrusts himself to the base it’s completely without warning, leaving your lips planted on his sheath while he holds you there and groans in release.");
		output("\n\n<i>“Good,”</i> Lund grunts with some effort, holding you tightly against his groin. <i>“Tight.”</i>");
		output("\n\nIt <i>is</i> tight, you dimly realize, feeling his cock somehow shift around in your mouth. Oh, he has a knot! It’s waaaay too late to do anything about that, though... especially what with the hypnotizing way his warm seed keeps streaming down your throat. Soon enough your cheeks are hopelessly puffed outwards, his knot pressing your tongue downwards and keeping it immobile while he paints your insides.");
		output("\n\nYou may have just met, but you are <i>really</i> impressed with this studly little korgonne. Lifting a hand and dreamily running it over his flexed abs, you stroke and rub the defined musculature while Lund pumps you full of spunk. You hadn’t expected such a dominant male from such a species, but you were clearly wrong to think so. Feeling him strain against your hand as he cums, you gurgle around his knot while you follow suit.");
		output("\n\nIt’s just too hard to resist. The thought of a dominant man feeling good enough with your body to cum inside it is <i>such</i> a turn-on, and you secretly find yourself hoping this becomes a regular thing. Looking up at him to watch his expression of release, the manly way he grunts in exertion and grits his teeth, you think the Hold is going to be very fun after all.");
		output("\n\nWhen he’s finally finished, he wastes no time popping free of your throat, leaving you coughing momentarily while you become reacquainted with the idea of breathing without a cock in your mouth.");
		output("\n\n<i>“Alien good fuck,”</i> Lund sighs in satisfaction, picking up his kilt. <i>“Even swallow. Good for something. Lund see you again.”</i>");
		output("\n\nAnd just like that, he’s gone. From introduction to being used like a fuckdoll in under thirty minutes, then left panting like a whore with still-warm cum and spit dribbling all down your chin and onto your [pc.chest]. For just a moment, you wonder if this is what love feels like.");
		output("\n\nYou clean yourself off and make yourself as presentable as possible before meandering back into the tunnels. Miraculously, you find your way back to the hold without a hitch. Part of you wants to run straight back to Lund. Maybe he’ll fuck your slutty face again.");
		//Dump player somewhere in the hold. Maybe even a random location?
		pc.loadInMouth(lundCumPlaceholder());
		processTime(30);
		pc.orgasm();
		clearMenu();
		//maybe move somewhere
		currentLocation = "KORGII J10"
		generateMap();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Outside]
public function askLundAboutOutside():void
{
	clearOutput();
	showLund();
	output("<i>“So how do you hunt in such a hostile environment?”</i> you ask, thinking about what lies outside the hold.");
	output("\n\n<i>“Purposeful,”</i> Lund replies, serious. <i>“Know exact where, how long, and safe caves. Need prepare too. Outside no joke. Not place for dumb alien.”</i>");
	output("\n\n<i>“I can handle myself,”</i> you tell him. <i>“I even rescued your princess from outside.”</i>");
	output("\n\n<i>“That </i>you?!<i>”</i> Lund exclaims, eyes widening. <i>“Wait, maybe alien smart? Hmm.”</i>");
	output("\n\nYou roll your eyes, a gesture Lund likely doesn’t understand. <i>“Yeah, thanks for noticing.”</i>");
	flags["LUND_OUTSIDE_TALK"] = 1;
	if(pc.isBimbo() && pc.hasGenitals()) 
	{
		output("\n\n<i>“Whatever,”</i> Lund shrugs, blatantly checking your [pc.tits] out. <i>“You dumbest smart alien Lund met.”</i>");
		output("\n\n<i>“I’m not dumb!”</i> you protest, hands on [pc.hips]. <i>“I went to a good Terran acad-”</i>");
		output("\n\n<i>“Lund let you suck cock if shut up,”</i> he says neutrally, watching your expression.");
		output("\n\nYou freeze with your mouth open mid-sentence and, decidedly unsubtly, look down the hallway to see if anyone’s watching before fixing your gaze on his kilt. <i>“Oh... well...”</i> you trail off.");
		output("\n\n<i>“Maybe smartest dumb alien, then?”</i> Lund considers this, and shrugs before taking your hand. <i>“Come.”</i>");
		output("\n\nIn a private room, Lund has you on your knees and in front of his fat, juicy cock in moments. You’re about to start licking it when he flicks your forehead, and you recoil in confusion, looking up at him.");
		moveToLundsHouse();
		output("\n\n<i>“Beg,”</i> he tells you, pointing at his dick. <i>“Ask to suck.”</i>");
		output("\n\nYou’re way past resistance at this point. Nothing can come between you and your determination to wrap your [pc.lips] around the entirety of his hot, throbbing dog-cock until it spews seed into your throat. And besides - it comes naturally.");
		output("\n\n<i>“Pleeeeaaase let me suck your fat cock,”</i> you moan, wiggling your hips a little. <i>“I need to feel your warm, sticky seed in mmmmfffgbrl-”</i>");
		output("\n\nYour eyes widen then flutter in pleasure as Lund viciously thrusts his entire length into your mouth, pointed tip penetrating straight past your tonsils and into your bulging throat. You can’t help yourself, immediately wetting your ");
		if(!pc.isCrotchExposedByLowerUndergarment()) output("[pc.lowerUndergarments]");
		else if(!pc.isCrotchExposedByArmor()) output("[pc.armor]");
		else output("[pc.thighs]");
		output(" with ");
		if(pc.hasCock()) output("[pc.cum]");
		else output("[pc.girlCum]");
		output(". Your eyes roll back in your head with the thrill while your hips instinctively jerk up and down, not that Lund seems to notice or care.");
		output("\n\n<i>“Nnnngh,”</i> Lund grunts, running his hands through your [pc.hair] before");
		if(pc.horns > 0 && pc.hornLength >= 3) 
		{
			output(" wrapping them around your [pc.horns], smirking. <i>“Lund can guess why alien have these.”</i>");
			output("\n\nWhether or not that’s their primary use, Lund’s definitely figured your body out quick. Using your horns to pull you up and down, he savagely bucks his hips against your face until spit is flying from your lips while you make wet gagging noises around the base of his cock.");
		}
		else if(pc.earType == GLOBAL.TYPE_LEITHAN || pc.earType == GLOBAL.TYPE_LAPINE || (pc.earType == GLOBAL.TYPE_SYLVAN && pc.earLength >= 3) || (pc.earType == GLOBAL.TYPE_DARK_SYLVAN && pc.earLength >= 3))
		{
			output(" wrapping them around your [pc.ears] with a snicker. <i>“Good for handhold.”</i>");
			output("\n\nWhether or not that’s their primary use, Lund’s definitely figured your body out quick. Using your long, sensitive ears to pull you up and down, he savagely bucks his hips against your face until spit is flying from your lips while you make wet gagging noises around the base of his cock. It hurts, but fuck if it isn’t so worth it...");
		}
		else output(" planting his hands on the back of your head with a grin. <i>“Hold tight.”</i>");

		output("\n\nPressing your face into his abs repeatedly, he savagely bucks his hips against your face until spit is flying from your lips while you make wet gagging noises around the base of his cock}.");
		output("\n\n<i>“Glrk-! Gllllrrg,”</i> you gurgle when he holds you flush against the soft fur of his crotch, cock buried in your throat. You find yourself running your hands from his muscular thighs to his firm butt, lightly squeezing his cheeks in admiration while he holds you still.");
		output("\n\n<i>“Good noises,”</i> Lund pants, imbuing you with a sense of pride. <i>“Alien sound best with lips around cock.”</i>");
		output("\n\nWell, duh! Is what you’d say if you could, but you settle for just sucking on his cock particularly hard. The way he shivers in response is just <i>so</i> fucking hot, and you hope he cums soon so you can listen to him groan in ecstasy while he drains his balls down your throat.");
		output("\n\nYou get your wish just a few minutes of facefucking later, obediently holding your throat open with your tongue at his balls as he cums forcefully into your mouth. He’s chosen not to tie you down this time, which makes you a little happy your neck won’t hurt but mostly sad you won’t get to sit there and suck on his fat knot. When he’s done, he pulls free and brusquely drags his cock from your forehead to your chin, wiping it off.");
		output("\n\n<i>“Thank Lund,”</i> he tells you.");
		output("\n\n<i>“Thank y- glk,”</i> you choke, swallowing down some more of his semen while you pat your chest. <i>“Thank you Lund.”</i>");
		output("\n\n<i>“Good,”</i> he nods, scratching you behind the ear. <i>“See again soon.”</i>");
		output("\n\nHe leaves you to your own devices, sitting on your knees with your hands in your lap and swishing your tongue around your mouth just to make you swallowed <i>all</i> of his cum");
		//pc has waggable tail:
		if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", [pc.tails] wagging excitedly");
		output(". In a sort of cum-drunk reverie for a few minutes, you realize with a start that you should clean yourself up. It might actually be really fun to walk around with a shiny streak of Lund’s cum across your face - like being branded, almost - but you don’t think the other korgonnes would approve.");
		output("\n\nYou get yourself done up and head back to the main rooms of the Hold.");
		//Make a flag for this just in case so it can be referred to later.
		flags["LUND_OUTSIDE_BIMBO_BJED"] = 1;
		processTime(30);
		pc.loadInMouth(lundCumPlaceholder());
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",leaveLundsHouse);
	}
	else
	{
		processTime(3);
		clearMenu();
		addButton(0,"Next",approachLund,true);
	}
}

//[Sex]
public function lundSexStarter():void
{
	clearOutput();
	showLund();
	//First time
	if(flags["SEXED_LUND"] == undefined) 
	{
		output("<i>“So what do you do for fun when you’re not people-watching in a hallway, Lund?”</i> you ask, poking fun.");
		if(pc.isBimbo()) 
		{
			output("\n\n<i>“Fuck dumb alien,”</i> he says, the corners of his mouth turning upwards.");
			output("\n\n<i>“But there are no aliens around,”</i> you say, confused.");
			output("\n\nHe stares at you for a moment until it sinks in, and your face brightens. <i>“Ooohhh! You mean me,”</i> you giggle, smiling at him affectionately. <i>“You like me that much, huh? Don’t go falling in love!”</i>");
			output("\n\nHe takes a look at your beaming expression and sighs morosely, shaking his head before raising it to look at you. <i>“Lund wonder how alien make it this far.”</i>");
		}
		else
		{
			output("\n\n<i>“Fuck,”</i> he replies matter-of-factly.");
			output("\n\n<i>“Fuck?”</i> you echo, somewhat torn between amusement and disbelief. <i>“So whenever you’re not here... you’re just fucking all the time?”</i>");
			output("\n\nHe shrugs, then nods. <i>“Almost. Good for warm, good for fun, good for tribe. What not to love? Tribe female can’t get enough.”</i>");
			output("\n\n<i>“Sounds like you have your hands full then,”</i> you say, looking around at the fluffy korgonnes walking by. You have to admit you’re just a little envious of his extremely simple lifestyle.");
			output("\n\n<i>“Could make room for alien too,”</i> Lund says, his eyes narrowing. <i>“You on bottom. Where alien belong.”</i>");
			output("\n\n<i>“Is that so?”</i> you ask, looking ");
			if(pc.tallness > 5*12+4) output("down");
			else output("up");
			output(" at the korgonne.");
		}
	}
	//Repeat:
	else if(pc.isBimbo()) 
	{
		output("<i>“Hey babe, you interested in some fun?”</i> you say, smiling deeply at Lund. <i>“I’ve got a present between my legs I think you’d enjoy...”</i>");
		output("\n\nHe sighs and shakes his head. <i>“Alien not good for tease. Alien good for hard, wet fuck.”</i>");
		output("\n\nHe leans off the wall, looking at your [pc.lips] with a measured expression. <i>“Lund wonder if some way to keep pretty mouth without talk.”</i>");
		output("\n\n<i>“Rude,”</i> you say, pouting. <i>“I could refuse you, you know!”</i>");
		output("\n\n<i>“Lund not think so,”</i> he says, a knowing smile on his face. <i>“Lund think you need his cock more than other way round.”</i>");
		output("\n\nNeed his cock? The nerve! You don’t <i>need</i> anyone’s cock, especially not Lund’s fat, juicy dogdick. That overly large knot of his is only good for shoving in warm assholes and tight, wet cunts to make them juice themselves, anyway. Being bounced up and down on it while you scream in pleasure is definitely at the absolute bottom of your list, yes sir.");
		output("\n\n<i>“You want hard fuck?”</i> Lund says, waking you from your daydream.");
		output("\n\n<i>“Huh?”</i> you say, startled. <i>“Oh, yeah, thanks!”</i>");
		output("\n\nHow did he know?");
	}
	else
	{
		output("<i>“Interested in having some fun, Lund? Good for warmth, I think you mentioned?”</i> you ask, looking ");
		if(pc.tallness > 5*12+4) output("down");
		else output("up");
		output(" at the korgonne intently.");
		output("\n\n<i>“Always interest in fun,”</i> he replies, leaning off the wall. <i>“More interest in fucking alien through floor.”</i>");
	}
	processTime(5);
	pc.lust(4);
	lundSexMenu();
}

public function lundSexMenu():void
{
	clearMenu();
	//[Doggystyle] [DickHimDown] [Ride him] [Leave]
	addButton(0,"Doggystyle",lundDoggyStyle,undefined,"Doggystyle","Get railed by the korgonne the way he knows best.");
	if(pc.hasCock() && pc.cockThatFits(500) >= 0 && !pc.isBimbo() && flags["LUND_MADE_U_SUBMIT"] == undefined && !pc.hasStatusEffect("LUND_DICKED_CD") && flags["LUND_COVERED_4"] != -1) addButton(1,"DickHimDown",penisRouter,[dickLundDown,500,false],"Dick Him Down","Teach the arrogant korgonne a thing or two about where he belongs.");
	else if(pc.isBimbo()) addDisabledButton(1,"DickHimDown","Dick Him Down","He’s wayyy too much of a stud for you to even think about dicking down a notch!");
	else if(flags["LUND_MADE_U_SUBMIT"] != undefined) addDisabledButton(1,"DickHimDown","Dick Him Down","After how he fucked you, you can’t even begin to imagine turning the tables on him!");
	else if(flags["LUND_COVERED_4"] == -1) addDisabledButton(1,"DickHimDown","Dick Him Down","After your bragging, you don’t think he’ll ever agree to this again.");
	else if(!pc.hasCock()) addDisabledButton(1,"DickHimDown","Dick Him Down","You sort of need a penis to dick him with...");
	else if(pc.hasCock() && pc.cockThatFits(500) < 0) addDisabledButton(1,"DickHimDown","Dick Him Down","His fuzzy little frame would rip in half. You’re wayyy too big.");
	else addDisabledButton(1,"DickHimDown","Dick Him Down","The buff little dog-dude is still kind of sore from the last time.");
	//Disabled forever till I get the adjusted scene in:
	if(flags["LUND_DICKED_DOWN"] != undefined) addDisabledButton(1,"DickHimDown","Dick Him Down","The followup scene for this is still pending. Be patient!");
	addButton(2,"Ride Him",vaginaRouter,[rideLundWheeee,lundCumPlaceholder().cockVolume(0),1,0],"Ride Him","Take your pleasure from him yourself.");
	addButton(14,"Leave",leaveLundsSexMenu,undefined,"Leave","You’re not in the mood right now.");
}

//[Doggystyle]
public function lundDoggyStyle():void
{
	clearOutput();
	showLund(true);
	flags["LUND_LAST_SEX"] = "Doggystyle";
	IncrementFlag("SEXED_LUND");
	var x:int = -1;
	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	if(pc.isBimbo()) 
	{
		output("<i>“So like, how do you wanna fuck?”</i> you say, tilting your head and putting some serious thought into it. <i>“I wanna-”</i>");
		output("\n\n<i>“You not get choice,”</i> he tells you, shaking his finger. <i>“You not in charge. Lund know you prefer it. A man tell you where to go, what to do. How wide to spread legs. When to swallow.”</i>");
		output("\n\n<i>“I- Uuuhh,”</i> you mutter, losing yourself in his words. Gosh, he always knows just what to say to you...");
		//Next button -> goes to Bimbo Sex.
		clearMenu();
		addButton(0,"Next",bimboLundSex,x);
		return;
	}
	//If you’ve selected [Submit], you get a different scene the next time you pick Doggystyle:
	else if(flags["LUND_MADE_U_SUBMIT"] != undefined)
	{
		//Just use a generic room with no exits :3
		currentLocation = "MYRNAS CAVE";
		generateMap();
		showName("\nLUND");

		output("<i>“So, uh,”</i> you say, eyeballing Lund’s loincloth. <i>“Any chance you wa-”</i>");
		output("\n\n<i>“Wanna fuck?”</i> Lund says, guessing correctly. <i>“Sure. But we not go to room today. Okay?”</i>");
		output("\n\n<i>“Sure,”</i> you shrug, just grateful you’ll be getting that fat cock. <i>“Where are we going?”</i>");
		output("\n\n<i>“Lund show you,”</i> he says, producing something from behind his back. <i>“But first alien ");
		if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("take off clothes and ");
		output("put this on.”</i>");
		output("\n\nIt’s... a leash. Lund has brought you a leash to wear, attached to a collar. You look at his face then back at the leash, about to say something when you notice the collar has some wording inscribed on it.");
		output("\n\n<i>“What does this say?”</i> you ask, already knowing the answer.");
		output("\n\n<i>“Not think alien have word for it. But close to ‘breeding bitch’,”</i> Lund says, a hint of a grin showing. <i>“Think alien suited to it.”</i>");
		output("\n\nYou know you don’t have a choice. It’s wear this or don’t get your holes filled by Lund’s prick, and, well... that’s not really a decision, is it? You ");
		if(!pc.isExposed()) output("strip down, leaving your clothes in a nearby compartment, and ");
		output("take the leash from his hands, fastening the collar around your neck yourself. You guess you are now, more or less, officially Lund’s Bitch.");
		output("\n\n<i>“Have other gifts for alien too,”</i> Lund says cheerfully, his grin readily apparent now. <i>“But wait until later. Earn them. Now come.”</i>");
		output("\n\nHe tugs the leash just hard enough to make your head bow to him, stumbling along the floor behind him as he merrily walks down a corridor.");
		if(pc.isTaur()) 
		{
			output("\n\nSuddenly he stops and turns back to you, eyeing your tauric form with a new appreciation.");
			output("\n\n<i>“Actually,”</i> he declares proudly, <i>“Lund have new idea.”</i>");
			output("\n\nYou very soon find yourself slowly walking through the Hold, completely naked and bereft of dignity, wearing a collar that calls you little more than a breeding bitch, and with a very proud korgonne on your back. Helpless to resist his advances, you’re forced to put up with it when he reaches forward to roughly grope your [pc.breasts] and pinch your [pc.nipples], trying to at least keep your slutty moans low enough not to be heard.");
			output("\n\nIt doesn’t help that passerbys are already gawking at your nakedness - your nipples as hard as diamonds - but when they pass by your back half you can hear giggles. Your face flushes red as you realize ");
			if(pc.isHerm()) output("your [pc.cock] is fully erect under your tummy, and your [pc.pussy] is slick, wetness dribbling down your hindlegs");
			else if(pc.hasCock()) output("your " + (pc.cockTotal() == 1 ? "[pc.cock] is" : "[pc.cocks] are") + " fully erect under your tummy, dripping pre-cum onto the ground beneath you");
			else if(pc.hasVagina()) output("your " + (pc.totalVaginas() == 2 ? "[pc.pussy] is" : "[pc.vaginas] are") + " slick and winking, [pc.clits] exposed to the world as wetness dribbles down your hindlegs");

			output(". Your only saving grace is that Lund himself can’t see how turned on you are from where he’s sitting.");
		}
		else
		{
			output("\n\nThe journey is embarrassing, to say the least. Walking ahead of him like you’re his fucking trophy wearing his name is enough, but the gawking passerbys really ratchet up the humiliation level until you’re walking with your head down to avoid the gazes. You jerk it back up with a yelp when you feel Lund’s fingers between your legs, fondling your ");
			if(pc.balls > 1) output("[pc.balls]");
			else if(pc.hasCock()) output("[pc.cocks]");
			else if(pc.hasVagina()) output("[pc.pussy]");
			output(" before sticking a finger right in your unprepared [pc.asshole]. You stiffen immediately, stretching your legs upwards before Lund tugs your leash again.");

			output("\n\nYou understand. He’s in charge, and he wants you to play the part. The rest of the walk is more like a guided tour, with Lund pointing out various parts of the Hold as he ‘steers’ you with two fingers up your asshole, holding you at both ends. Completely in his control, you’re helpless to do anything but follow his lead. To make matters worse, your ");
			if(pc.isHerm())
			{
				output("[pc.cocks] ");
				if(pc.cockTotal() == 1) output("is");
				else output("are");
				output(" standing at full attention while your [pc.pussies] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" dripping wet");
			}
			else if(pc.hasCock())
			{
				output("[pc.cocks] ");
				if(pc.cockTotal() == 1) output("is");
				else output("are");
				output(" standing at full attention and dribbling pre-cum");
			}
			else if(pc.hasVagina())
			{
				output("[pc.pussies] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" dripping wet, wetness slickening your [pc.thighs]");
				output(". Thankfully, Lund either doesn’t notice or chooses not to mention it.");
			}
		}
		output("\n\nWhen you finally arrive at your destination, the first thing you notice is the balmy sudden, blessed heat. Whether it’s just this room or it was gradual and you only just noticed it, the end result is that you’re so warm enough that being totally exposed is your only option. Clothes would be a hindrance. The next thing you notice is the... cavorting. Every single being in the room is engaged in a sexual act. Right in front of you, a naked korgonne woman looks you right in the eye and moans in orgasm, her considerable chest heaving as the man whose face her ass is occupying sucks her clit. Everywhere you look, korgonne women are being railed doggystyle, or riding someone’s face, or bouncing atop a man’s lap.");

		output("\n\n<i>“What is this place?”</i> you ask, curiousity overcoming you.");
		output("\n\n<i>“Breeding room,”</i> Lund informs you, spreading an arm. <i>“Like Lund say. For fun, but... also for tribe. More warriors, more hunters, more workers.”</i>");
		output("\n\nThere’s a few gazes on you, but most of the room’s inhabitants are wholly focused on their own business. It’s actually somewhat refreshing to not be a walking curiosity in here for once. Your watching is interrupted by Lund’s decidedly unsubtle advances, bringing you back to the reality of why you were brought here.");
		if(pc.isTaur()) 
		{
			output("\n\nLund tugs your leash, shuffling backwards, and you slowly crane back until your humanoid half is resting on your tauric half’s back, lying right in front of Lund’s rapidly growing member.");
			output("\n\n<i>“Uh... are we going t-”</i> you start.");
			output("\n\nLund’s interruption comes in the form of a sharp exhale from his mouth as he jumps up, shuffling forwards with his hands on your shoulders and landing his ass squarely on your face");
		}
		else 
		{
			output("Spinning you around, Lund gently shoves you backwards against a pillar so you’re facing him and a little dazed. He has you sitting down in front of him before you know what’s happened, his hands lifting your arms above your shoulders and pressing them against the wall.");
			output("\n\n<i>“Ooh, I can see where t-”</i> you start");
		}
		output(". Leaning forward, he immediately shoves his cock right between your [pc.lipsChaste] and sinks himself to the hilt, leaving your eyes and throat bulging.");

		if(pc.isTaur()) output("\n\nWhat the fuck! This might be the most undignified thing a taur could ever do, having a hot, salty shaft sliding across your tongue where everything is out in plain view. He’s lucky you don’t buck him off right now! Reaching up with your arms, you get a good grip on his strong, defined waist and... fuck, this feels amazing. You can feel every little muscular shift, the sexy way his hips move as he needily pushes his big, swollen cock deeper into your throat, his furry balls nestled tightly against your nose... fuck it. His knot not coming into play yet, you have just enough room to squeeze your tongue out as he’s fucking your face and roughly lick his sack.");
		else output("\n\nGod! The way he immediately starts plunging into your throat makes your eyes water and your body shake, and you have nothing to brace yourself with while your arms are being held above your head. You look up at him helplessly and... honestly, the view from down here might be one of the sexiest things you’ve ever seen. Beneath his fur you can see his muscles working, getting a nice closeup of his washboard abs tensing with pleasure every time he thrusts himself to the hilt with your nose shoved into his groin. Even just the way his hips work, watching the motion is hypnotizing. It’s like he’s making passionate love to your face, and as far as you’re concerned you should be meeting him halfway - starting by squeezing your tongue out beneath his cock to roughly lick his prominent sack.");
		if(pc.isTaur()) output("\n\nAffectionately holding him in place");
		else output("\n\nHeld in place");
		output(" while he fucks your gullet, you open your eyes randomly in between tonguing his cum-filled balls and see the two of you have gathered quite a crowd. You can see a row of curious korgonnes encircling you, all watching Lund victoriously subjugate a big, tough alien by fucking [pc.hisHer] throat hard enough to make your eyes water a little. No doubt your ");
		if(pc.isTaur()) output("tauric");
		else output("alien");
		output(" form is a novelty to most, if not all, of them. Your lips curl into as best a devious smile as you can muster with your face being ridden by a korgonne stud, and you stretch your [pc.tongue] as far as it’ll go around Lund’s balls.");

		output("\n\nSome of the korgonne are already back to fucking even as they watch you, women gazing intently at the way your throat shifts and moves with Lund inside it while their men take them from behind. It doesn’t take long for him to start groaning in pre-orgasm pleasure, shuddering ");
		if(pc.isTaur()) output("atop");
		else output("against");
		output(" you, and you do all you can to encourage him to blow his load deep in your stomach. ");
		if(pc.isTaur()) output("Holding his butt while it tenses to perfect firmness");
		else output("Sucking him off as best you can with control out of your hands");
		output(", your eyes roll back in your head as you feel him bust a nut down your throat.");

		output("\n\nThough you can’t see it, you can hear it when he lifts his head and howls loudly in the room, his voice bouncing off the walls as he declares his dominance over you for all to witness. What with the way your throat is rapidly bobbing just to chug down his warm cum, you’re pretty sure it was already obvious, but this is probably more of a primal thing for him and the tribe. For your part, you’re content to ");
		if(pc.isTaur()) output("squeeze those muscular asscheeks");
		else output("just sit there like a good [pc.girlBoy]");
		output(" and let him finish himself off in your stomach.");

		output("\n\nHe graciously withdraws from your well-used mouth before his knot becomes unmanageable, and for his troubles you make sure to give his cock a nice, hard suck to clean it off on its way out, almost like you’re giving it a kiss goodbye. Given the way he shivers all the way down his spine, you think you earned his approval on that one. Shuffling off your face, he looks down at you with an expression approaching awe.");

		output("\n\n<i>“So,”</i> you say, making a show of licking all around your mouth and swallowing down his seed, <i>“do you want to get to the ‘breeding’ bit now?”</i>");
		output("\n\n<i>“Yeah,”</i> Lund breathes, nodding slowly. <i>“Yeah, breeding now.”</i>");

		output("\n\nYour sex is violent, erotic, and so good it makes your fucking eyes cross. There’s just something about having his giant knot plunging in and out of your [pc.vagOrAss " + x + "] that brings you to an explosive orgasm every single time, and that’s not even taking into account his insane stamina. He has you up against a wall grunting, ");
		if(pc.isTaur()) output("pawing at the ground");
		else output("thrusting back against him");
		output(", and screaming his name for everyone to hear. The other couples in the room can only watch in awe at the once-in-a-lifetime sight, an alien ");
		if(pc.isTaur()) output("with " + num2Text(pc.legCount) + " legs");
		output("being forcibly submitted by a ");
		if(pc.tallness >= 6*12) output("much smaller ");
		output("korgonne.");
		if(x >= 0) pc.cuntChange(x,lundipoo.cockVolume(0));
		else pc.buttChange(lundipoo.cockVolume(0));

		output("\n\nBy the time he’s finished with you, you’re practically wilting. Your entire body is covered in sweat and your ");
		//taur: 
		if(pc.isTaur()) output("hind half is");
		else output("ass and lower back are");
		output(" literally coated with warm cum both dry and still dripping, your chest heaves with every breath you take, ");
		if(pc.biggestTitSize() >= 3) output("your [pc.breasts] are swaying as you rest against the wall and pant");
		else output("your " + (pc.legCount > 1 ? "[pc.legs] are" : "[pc.leg] is") + " shaking with the effort of staying standing");
		output(". Lund has you dominated in both mind and body, and everyone in the room knows it, especially you. You can’t help but moan when he spanks you across your [pc.ass] and steps away, looking back at him with unsuppressed lust.");

		output("\n\nYou can’t help but laugh breathlessly when he raises his arm and receives a cheer from the other korgonnes in the room. The foreign alien, conquered! Fuck it, you’ll be his sexy trophy if he wants. He’s more than earned it with his stellar sexual performance and besides, you like him. You realize he’s turned back to face you, and you flash him a beautiful smile before sinking to your knees in front of him and dedicatedly sucking his bulging dick.");
		
		clearMenu();
		addButton(0,"Next",lundDoggyStyleSubmitEnd);
	}
	//Not bimbo:
	else
	{
		x = -1;
		if(pc.hasVagina())
		{
			x = pc.findEmptyPregnancySlot(1);
			if(x <= 0) x = rand(pc.totalVaginas());
		}
		moveToLundsHouse();
		output("<i>“So you wanna take me doggy, then?”</i> you say, smirking ");
		if(pc.tallness > 5*12+4) output("down ");
		output("at Lund. <i>“Try and take this");
		if(pc.tallness > 5*12*4) output("big, ");
		output(" dumb alien down a notch?”</i>");

		output("\n\n<i>“You asking for it,”</i> Lund warns you. <i>“Lund going to fuck alien so hard you forget name.”</i>");

		if(pc.tallness >= 12*6) output("\n\n<i>“Wouldn’t expect anything less from my little man,”</i> you say, bending at the knees to look him in the eyes demeaningly.");
		else output("\n\n<i>“I don’t know if you’ve got the size for that, champ,”</i> you say, smirking at him. <i>“You might be a big boy here, but out among the aliens you come up a little... short.”</i>");

		output("\n\nHis eyes flash with a fiery anger, and you can hardly stifle your laughter. You’ve <i>really</i> riled Lund up now. This is looking like it’ll be one of the hardest fucks you’ve ever had, and you can scarcely bear the waiting. You let him walk you to his room, a playful smile lingering unseen on your face.");

		if(!pc.isExposed()) output("\n\nThe way he strips you off is forceful, lusty, and one of the most erotic things you’ve ever had the pleasure of experiencing. His sheer desire, his raw lust for your body is palpable. " + pc.mf("You grunt in pleasure and slide your hands down his muscular back to his ass while he rubs your nipples with his thumbs, biting your neck and grinding against you","You cry out and wrap your arms around his muscular back when he bites a [pc.nipple] just hard enough to hurt") + ".");
		output("\n\nYou respond in kind, sliding your hands up and down his lower back, fingers creating furrows in his thick fur, roughly pulling the ");
		if(pc.tallness > 5*12+4) output("shorter ");
		else output("canine ");
		output("man");
		output(" against you. He pushes you down on the bed, sealing your lips with a fierce kiss, your [pc.tongue] enveloped by his own");
		if(!pc.isExposed()) output(" while he strips you down");
		output(".");

		output("\n\nYou stay like that on the bed for a moment, clasping his cheeks between your hands and pressing yourself into him until he pulls back, a fire in his eyes. ");
		if(pc.isTaur()) output("He doesn’t hesitate at all, moving to your [pc.ass] and pushing your [pc.tail] out of the way to get his eye on the goods.");
		else output("You don’t hesitate at all to turn around and thrust your [pc.ass] out at him, presenting yourself to your lover.");

		output("\n\nLund takes a fraction of a second to soak the sight of your ");
		if(pc.hasVagina()) output("[pc.pussies]");
		else output("[pc.asshole]");
		output(" in before ");
		if(pc.totalVaginas() > 1) output("picking one and ");
		output("shoving two fingers knuckle deep, then another. He’s measuring you up, you realize with a lusty moan. Testing whether you can take it. Apparently satisfied with the answer, he withdraws his digits from your ");
		if(pc.hasVagina()) output("dripping folds");
		else 
		{
			if(pc.ass.looseness() <= 2) output("tight");
			else output("stretchy");
			output(" hole");
		}
		output(" and immediately has his cock at ");
		if(pc.hasVagina()) output("the glistening entrance");
		else output("your ring");
		output(".");

		output("\n\nYou both cry out when he penetrates you, singing a lewd duet while he spreads your asscheeks and buries himself to the hilt. He doesn’t waste your time by spanking, squeezing or teasing you; all he wants to do is fuck you raw until you scream. Clamping his hands ");
		if(pc.isTaur()) output("around your relaxed hindlegs");
		else output("down around your [pc.hips]");
		output(", he begins to fuck you with heavy, pounding slaps of flesh, the noise resounding in his room.");

		output("\n\nYou grit your teeth and grunt in pleasure, aggressively pushing back into him on every instroke with your hands digging into his sheets, giving and taking in equal measure. You can feel his already expansive base thickening, beginning to stretch your hole to its limits, and bounce on his thighs even harder. There’s no way you’re letting him keep his big, fat knot on the outside. If you’re going to take him, you’re going to take <i>all</i> of him.");

		output("\n\nYour nonverbal message apparently getting through to the panting korgonne loud and clear, Lund responds to your desires the only way he can. ");
		if(pc.hasHorns() && pc.hornLength >= 3 && !pc.isTaur()) 
		{
			output("Grabbing your [pc.horns] from behind, he uses them as handholds to slam your ");
			if(pc.hasVagina()) output("sopping cunt");
			else output("overfull asshole");
			output(" with the force of a man twice his size.");
		}
		else if(pc.hasHair() && pc.hairLength >= 3 && (!pc.isTaur() || pc.hairLength >= 40)) 
		{
			output("Grabbing your hair from behind, he uses it to pull you back while he slams your ");
			if(pc.hasVagina()) output("sopping cunt");
			else output("overfull asshole");
			output(" with the force of a man twice his size.");
		}
		else 
		{
			output("His grip on you tightens threefold, grunting in exertion while he slams your ");
			if(pc.hasVagina()) output("sopping cunt");
			else output("overfull asshole");
			output(" with the force of a man twice his size.");
		}
		if(x >= 0) pc.cuntChange(x,lundipoo.cockVolume(0));
		else pc.buttChange(lundipoo.cockVolume(0));

		output("\n\nYou rut like mindless beasts, minutes passing by while your sweaty forms bounce and grab at each other, wordlessly fighting as the two of you seek to establish dominance over the other. Finally, though, you can feel Lund’s knot getting even bigger as he prepares to cum, his movements getting more frenetic and desperate. Though you’d never admit it out loud, you’re intensely grateful that you’ll be able to cum at the same time he will; in the lust for dominance, you’ve been fighting against the sensation of orgasm almost since he started railing you.");

		output("\n\nHe cums with a mighty roar, pushing down on your back hard enough to put your face in the sheets while he thrusts once, twice, then rams himself to the hilt, knot and all. ");
		if(x >= 0) output("Pussy juices squirt from around his knot again and again, your face scrunched up and teeth grit against the pleasure while you grunt and groan like an animal");
		else output("As taut as your asshole is, you can feel yourself flexing and tightening around him anyway, the intensity of your orgasm inciting your body to react instinctively, your face scrunched up and teeth grit against the pleasure while you grunt and groan like an animal");
		output(". Picturesque you aren’t, but right now you couldn’t possibly care less. The way you’re fucking rippling around his knot feels <i>so</i> goddamn good, and if his loud groans are any indication, he’s feeling it too");
		output("\n\nWhen he finally finishes, he leaves his knot inside you and plops down on your back with a grunt. You both take a deep inhale and groan, the exertion of the past half an hour washing over you in spades. Lund stretches atop you, limbs splaying to either side.");
		output("\n\n<i>“Guess they weren’t kidding it being about the size of fight in the dog,”</i> you mumble, reaching back to rub his neck scruff. <i>“That was... satisfying.”</i>");
		output("\n\n<i>“Satisfying? That it?”</i> he says abruptly, sitting back up and putting his hands on your back. <i>“Lund go again.”</i>");
		output("\n\n<i>“Huh- Oh!”</i> you begin, before Lund cuts you off with a well-placed thrust. <i>“I- nngh! Hhhn!”</i>");
		output("\n\n<i>Fuck it,</i> you think, tongue lolling from your mouth. If he wants to show off his endurance and give you multiple orgasms during the act, he’s welcome to. Besides, the way he’s using that <i>goddamn</i> knot of his to fuck you now, you don’t really want him to stop anyway. Post-orgasm sensitivity betraying you in the worst way in your war for dominance, you’re forcefully brought to a groaning orgasm while Lund fucks your ");
		if(x >= 0) output("[pc.pussy]");
		else output("[pc.asshole]");
		output(" with abandon. ");
		if(pc.hasCock() && x < 0) output("[pc.Cum] spurts from your [pc.cocks], soaking the bedsheets beneath you and leaving a mark of your loss.");
		else if(pc.hasCock()) output("[pc.Cum] spurts from your [pc.cocks] onto the bedsheets even as your [pc.pussy " + x + "] grips and massages Lund’s cock, trying to entice him into cumming inside you to no avail.");
		else if(pc.hasVagina()) output("[pc.GirlCum] drips from your stretched-out entrance even as your [pc.pussy " + x + "] grips and massages Lund’s cock, trying to entice him into cumming inside you to no avail.");
		//Fen added for analbuttbois
		else output("Muscular ass-twitches massage Lund’s cock, trying to entice him into cumming inside you to no avail.");

		output("\n\nBy the time he <i>does</i> cum again, it’s on the heels of your third shuddering, moaning orgasm. The squeezing is just too much for him to hold out against, and he groans loudly as he paints your insides with creamy spunk all over again, adding to the jizz he’s already offloaded in you. Finally, his knot slips free and he sits back on his haunches, panting hard.");
		output("\n\nYou’re left huffing and covered in a sheen of shimmering sweat, heat rising from your bodies with visible steam, and you’ve probably gotten some bruises across your ass. But <i>fuck</i> if that wasn’t one of the most satisfying fucks you’ve ever gotten. The way your [pc.vagOrAss " + x + "] aches is incredibly satisfying, matched only by the warm, slow drool of Lund’s cum running down your backside.");
		output("\n\n<i>“Alright, we can call this a draw,”</i> you moan, pushing yourself up with shaky arms. <i>“I think you’ve proven you fuck as well as you talk shit.”</i>");
		output("\n\n<i>“Some respect for alien,”</i> Lund admits, leaning backwards and stretching. <i>“Could go again, though.”</i>");
		output("\n\nYou turn and eye him. Really, after that, he can keep going? Part of you wants to make him prove it, ");
		if(pc.isAmazon(false) || pc.isTreatedBull() || pc.PQ() >= 70) output("knowing that due to your exceptional strength you should be able to keep up.");
		else output("but you’re really not sure if you can keep up with him and you know for sure that if you show him weakness, he’ll take full advantage of it - and you.");
		pc.orgasm();
		pc.orgasm();
		if(x >= 0)
		{
			pc.loadInCunt(lundipoo,x);
			pc.loadInCunt(lundipoo,x);
		}
		else
		{
			pc.loadInAss(lundipoo);
			pc.loadInAss(lundipoo);
		}
		//[Leave] [Again]
		clearMenu();
		addButton(0,"Leave",leaveLundSex);
		addButton(1,"Again",moreLundSex,x);
	}
	processTime(40);
}

public function lundDoggyStyleSubmitEnd():void
{
	clearOutput();
	showLund(true);
	output("Hours pass in the breeding room, most of which you spend being ridden");
	if(pc.isTaur()) output(", in both the metaphorical and literal sense,");
	output(" by Lund. You’ve noticed the korgonnes switching partners - well, most of them - but the same doesn’t seem to apply to you. You’re just for Lund, apparently. Maybe it’s the collar... ");
	//Already pierced!
	if(9999 == 0) output("and the shiny new nipple piercings. Hanging from each [pc.nipple] is a small golden ring, not unlike the type you might go see through the ear of a cowgirl. Lund said he liked them and, well, you weren’t going to say no to that. Besides... looking down at them now, hanging from your [pc.breasts]");
	else output("Besides, looking down at yourself right now");
	output(", you personally think it’s really hot to be marked so visibly.");
	output("\n\nBy the time the two of you leave, you’re fucked out for the day. Well, you might have one or two sessions with Lund left in you, but you’re okay for now. You give both him and his balls a warm kiss before you leave, heading back to the Hold proper. You’ll have to do this again sometime soon!");
	output("\n\n(<b>Developer Note:</b> Piercings are not yet supported. These will be enabled in a future update! <3 -Fen)");
	processTime(128);
	//9999 add nip piercings!
	//add description for piercings:
	//Your nipples are each pierced with a small golden ring, courtesy of Lund. If you lift them to check, you can see inscriptions along the inside written in korgonne script. Lund only smiled when you asked him what they said, but you’re pretty sure you have a good idea. At least no-one else will know unless you tell them.
	clearMenu();
	addButton(0,"Next",move,"KORGII R43");
}

//[Leave]
public function leaveLundSex():void
{
	clearOutput();
	showLund();
	output("<i>“I’m sure you can, Lund,”</i> you tell him, smiling. <i>“But I have things to do.”</i>");
	output("\n\n<i>“Hmm,”</i> Lund says, measuring you up before nodding. <i>“Lund think you telling truth. We continue some other time maybe.”</i>");
	output("\n\n<i>“Oh, you’d like that, wouldn’t you?”</i> you say, your smile turning into a grin. Well, truth be told, so would you. No reason he needs to know that right now though. You gather your things and leave Lund in his room.");
	processTime(3);
	//main menu, dump in Hold somewhere
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Again]
public function moreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“Prove it then, big boy,”</i> you challenge him, ");
	if(pc.isTaur()) output("reclining your front half");
	else output("reaching back to spread your asscheeks for him");
	output(". You roll your eyes half in pleasure and half in disbelief when you feel his cock at your [pc.vagOrAss " + x + "] - you don’t think you’ve ever done so little work for such a big payoff.");
	output("\n\nAs it turns out, he was telling the truth. Very much so. He has you cumming hard within minutes, one orgasm rolling through your body after another. You can feel your tenuous grasp on this battle slipping, while Lund only seems more and more determined to prove his place in the two-person food chain. It’s becoming less of a fight for dominance and more of a competition of how many times Lund can make you double over in pleasure, groaning as your grip tightens on him.");
	output("\n\nWhen he finally cums for the third time, you’ve lost count of how many times you came all over his cock.");
	if(x >= 0) 
	{
		output(" You don’t even really question it when he shuffles to your front and presents it to you, sucking it clean and licking it all over just because you think he deserves it after such masterful work.");
		output("\n\n<i>“Alien tongue as good as fuck,”</i> he sighs, looking down at you with a pleased expression. <i>“Still seem eager... go again?”</i>");
	}
	else output(" He takes it from your abused asshole with a wet slurp and lays it between the cheeks of your [pc.ass], squeezing your butt to create some cleavage.");
	output("\n\n<i>“Alien has nice body,”</i> he admits, rubbing himself up and down. <i>“Go again?”</i>");

	processTime(20);
	for(var y:int = 0; y < 5; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());

	//[Leave] [Again]
	clearMenu();
	addButton(0,"Leave",leaveMoreLundSex);
	addButton(1,"Again",evenMoreLundSex,x);
}

public function leaveMoreLundSex():void
{
	clearOutput();
	showLund(true);
	output("<i>“No,”</i> you pant, taking a deep breath and trying to hide how out of breath you are. <i>“No, I’m done for now. I have other things to do.”</i>");
	output("\n\n<i>“Sure,”</i> Lund shrugs disinterestedly. <i>“Lund give you more when you come back.”</i>");
	output("\n\nThat’s an arrogant assumption on his part, but... whatever. Thinking better of a repartee, you gather your things and leave Lund in his room.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

public function evenMoreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("You can see now Lund wasn’t lying at all about how much time he spends fucking. He’s like a well-oiled machine, built to break and breed you. You can only imagine how voracious the korgonne women of this tribe must be to create such a product, but you have firsthand evidence of how they must fuck");
	if(pc.isTaur()) output(": incredibly hard.");
	else output(". Lund has his hands firmly on your upper back, holding you down while he brings you to yet another orgasm.");

	output("\n\nYou scream into his pillow, your muffled outburst only further spurring the hyperdominant korgonne into fucking you into the bed. You’ve never experienced this kind of challenge before, your body overwhelming your mind with sensations brought on by Lund’s sexual appetite. Even after he cums again, you don’t truly believe he’s done. And sure enough...");

	output("\n\n<i>“Alien want more?”</i> he asks, eyeing you.");
	output("\n\n<i>“You’re fucking unbelievable,”</i> you pant, still lying on your stomach clutching his pillow.");
	processTime(20);
	for(var y:int = 0; y < 5; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());

	clearMenu();
	addButton(0,"Leave",leaveEvenMoreLundSex);
	addButton(1,"Again",evenEvenMoreLundSex,x);
}

//[Leave]
public function leaveEvenMoreLundSex():void
{
	clearOutput();
	showLund(true);
	output("Still, mustering the last bits of resistance you have towards just letting this stud bang your brains out, you have things to do. Or should be doing, anyway.");
	output("\n\n<i>“I have to leave,”</i> you groan, getting up from the bed.");
	output("\n\n<i>“Running away?”</i> Lund asks, moving aside to let you get up. <i>“Lund think he see alien again real soon.”</i>");
	output("\n\n<i>“Yeah, well... maybe,”</i> you admit, gathering your stuff. You leave Lund in his room.");

	processTime(4);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

public function evenEvenMoreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“Ffffuh-uuuuuck!”</i> you cry out, almost as much frustration as pleasure in your voice. Why can’t you fight this?! Have you just been deluding yourself the whole time, thinking you had a chance?");
	output("\n\nMid-thought, you feel Lund suddenly grab you from behind and, ");
	if(pc.isTaur()) output("exhibiting incredible strength, flip your entire tauric body over so you’re lying helpless and exposed, legs splayed to the side.");
	else output("showing off that he still has untold amounts of strength and endurance in reserve, flips you over onto your back.");

	output("\n\nLying there, eyes wide in half-shock and half-admiration, you realize the truth of the situation: he was never fighting you for dominance. He’s been breaking you in the entire time, easing you into being an unresisting fuck for him to enjoy. And as your fatigued hips begin to wildly buck once more, you realize you don’t care.");

	if(pc.isTaur()) output("\n\nYour legs thrash about so wildly Lund seizes your rearmost two, holding them wide open so he can plow your [pc.vagOrAss " + x + "] all throughout your orgasm");
	else output("\n\nLund leans forward and lifts your legs, holding your thighs and pressing down until your knees are besides your head, pounding the fuck out of your [pc.vagOrAss " + x + "] all the while");
	output(". Your voice comes out in a shaky, lilting scream of lust as ");
	if(pc.hasVagina()) output("juices spray from your squelching cunt");
	else output("your asshole squeezes down on Lund so tightly that for a moment he can’t move");
	output(", the overwhelming ecstasy just too much to resist.");

	output("\n\nYou look up at him, at your masculine stud, and see that despite his harsh breathing, sweat dripping from his body, and what must no doubt be aching muscles... he’s wearing a smile. He knows, you realize. He knows what you’re feeling, what you’re thinking. And as he forcefully ");
	if(pc.isTaur()) output("slams your [pc.vagOrAss " + x + "]");
	else output("contorts your legs to put them behind your head");
	output(", you can’t help but bite your lower lip and hope he fucks you even harder.");

	output("\n\nYou get your wish. In the small room, the noise of you being pounded out echoes off the walls and leaks under the door, the situation blatantly obvious for anyone walking by. You can’t stop your moans either, your voice climbing an octave with every thrust until it breaks and you’re left wordlessly gasping for air. When he cums, all you can muster is a breathless whine.");

	output("\n\n<i>“Hnnnnh,”</i> Lund yawns, stretching his arms out while still inside you, as if this is nothing more to him than a game. <i>“Alien decent fuck. Go last round?”</i>");

	output("\n\nYou could still leave with your dignity intact...");
	processTime(30);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());

	//[Leave] [Submit] [AmazonFuck]
	clearMenu();
	addButton(0,"Leave",leaveEvenEvenMoreLundSex);
	addButton(1,"Submit",evenEvenEvenMoreLundSex,x);
	if(pc.isAmazon(false)) addButton(2,"AmazonFuck",amazonFuckLundsShitUp,x,"Amazon Fuck","Show him how amazons do it.");
	else addDisabledButton(2,"AmazonFuck","Amazon Fuck","You’d need to be some kind of amazon for this.");
}
//[Leave]
public function leaveEvenEvenMoreLundSex():void
{
	clearOutput();
	showLund(true);
	output("You may have lost the battle, but you won’t let yourself lose the war. Slowly relaxing your limbs and groaning as you lift yourself off Lund’s bulging cock, you turn away and gather your things to leave. Lund reclines on his bed and waves you off, smirking all the while.");
	output("\n\n<i>“Lund probably see you again real soon, huh?”</i>");
	output("\n\nYou think better of trying to reply, and instead slowly make your way back through the hold. Maybe next time you’ll take him down a notch or two... yeah, next time.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Submit]
public function evenEvenEvenMoreLundSex(x:int):void
{
	clearOutput();
	showLund(true);
	output("Finally, you just give up. After what feels like hours of being fucked you’re on your back, having willingly subjected yourself to ");
	if(!pc.isTaur()) 
	{
		output("tying your [pc.legs] behind your head with a waistcloth so Lund has easier access to your ");
		if(x >= 0) output("pussy");
		else output("asshole");
	}
	else output("having Lund coat your entire body in his jizz, marking you body and mind");
	output(". He beat you soundly hours ago, but you’ve been pretending otherwise until now. Now, as his hot, sticky spunk drips between your legs and he pulls himself free from your gaping ");
	if(x >= 0) output("pussy");
	else output("asshole");
	output(", you acknowledge he’s gotten the best of you. The evidence is all over your aching body.");

	output("\n\n<i>“More,”</i> you gasp, lying on your back while cum spurts from your ");
	if(x >= 0) output("spasming pussy");
	else output("puckering asshole");
	output(". <i>“Just keep fucking me!”</i>");
	output("\n\nNo response. You look up from the bed desperately and find Lund dispassionately inspecting his fingernails. After a few seconds of listening to your fevered panting, he looks at you with something approaching boredom and says a single word.");
	output("\n\n<i>“Beg.”</i>");
	output("\n\nYou’re incredulous. <i>Beg?</i> This arrogant little... little... your eyes fall from his face to his cock, still standing proud. It’s utterly soaked in his and your juices alike, practically shining with a thin sheen of lubricant. His knot is swollen, inflated to its maximum size, and you’d swear it’s fucking throbbing in time with the desirous ache in your ");
	if(x >= 0) output("pussy");
	else output("ass");
	output(". God fucking damnit, you need that back inside you.");
	output("\n\n<i>“Please?”</i> you try, pleading with him. <i>“Fuck me some more, Lund. I need it.”</i>");
	output("\n\n<i>“Not inspiring,”</i> Lund complains, looking at his other hand.");

	if(!pc.isTaur()) 
	{
		output("\n\n<i>“Fine!”</i> you cry, raising your [pc.hips] and reaching down. You pull ");
		if(pc.hasVagina()) output("the lips of your [pc.pussy] apart, exposing your glistening wet and still-dripping sex");
		else output("your asscheeks apart, exposing your still-flexing and dripping wet pucker");
		output(" and submissively present yourself to him. <i>“Put your god damn cock back in my slutty ");
		if(x >= 0) output("cunt");
		else output("asshole");
		output(" and give me more,”</i> you moan needily, shaking your hips at him. <i>“Fuck my stupid alien brains out!”</i>");
	}
	else 
	{
		output("\n\n<i>“Nnnnrgh,”</i> you pant angrily, your ");
		if(x >= 0) output("[pc.pussy]");
		else output("[pc.asshole]");
		output(" winking at Lund every second, glistening and still fucked full of spunk. <i>“Do you know what your cock is doing to me?! The fucking animal instincts- the breeding instincts that come with being a ‘taur? All I can think about, all I want right now is for you to shove that fat fucking cock of yours as deep as you can get-”</i>");
	}
	output("\n\nYou scream out in sudden ecstasy when Lund rams himself back home, falling back on the sheets as he holds one of your legs in place while he begins slamming you out all over again. You can scarcely believe the luck you’ve had finding such a virile stud, and protectively curl ");
	if(pc.isTaur()) output("one of ");
	output("your ");
	if(pc.legCount > 1) output("other ");
	if(pc.legCount <= 2) output("[pc.leg]");
	if(pc.legCount > 2) output("[pc.legs]");
	output(" around his back, bringing him closer and keeping him from getting away.");

	output("\n\n<i>“Lund,”</i> you whisper, grabbing the sheets as your back slowly begins to arch higher upwards in awkward, jerking motions with each thrust. <i>“Ohhh, Lund! Yes!”</i>");

	output("\n\nBy the time he cums inside you, you look like you’re in love with him. ");
	if(!pc.isTaur() && pc.hasToes()) output(" Toes curling, [pc.thighs] wrapped around his lower back and arms around his muscular shoulders, you gaze deeply into his eyes while you cum explosively, whimpering his name in desire.");
	else output("\n\n[pc.LegOrLegs] bucking while you try to keep them wrapped around his back, you look into his eyes and, shaking, cum explosively while whimpering his name in desire.");

	output("\n\nTo finish himself off, he breaks free of your grip and pulls himself out, jacking himself off all over your [pc.chest] and your face. Cum lands in your mouth, all over your chest and some of it gets in your eye, prompting you to wince in pain and keep it closed even as you gasp in pleasure. Fuck it, you can’t lie: it feels incredibly empowering to have a strong, studly man groaning while he blows his load all over your body.");

	output("\n\nHnnnnn-nngh,”</i> Lund grunts at length, stretching out and looking down at you after he’s finished. <i>“Alien fuck not bad. Got to go, though.”</i>");

	output("\n\n<i>“Oh... oh!”</i> you exclaim, suddenly realizing how long you’ve been in his room. Shit, you’ve spent half the day with your brains leaking out your ears in here! <i>“I’ll see you later, okay?”</i>");
	output("\n\n<i>“Nngh,”</i> Lund grumbles, scratching his ear.");
	output("\n\nYou gather up your things after wiping yourself down and head out. Though, honestly, now that you’re out here you have half a mind to march right back in and bend over in the doorway.");
	processTime(30);
	pc.libido(1);
	processTime(30);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());
	pc.applyCumSoaked();

	//set flag for having submitted
	flags["LUND_MADE_U_SUBMIT"] = 1;
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[AmazonFuck]
public function amazonFuckLundsShitUp(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“Fuuuck,”</i> you groan, letting your limbs return to a relaxed, splayed position. You really got carried away there... hard not to when the fucking’s so good, though. You have to give him that, he’s more than earned your respect. It’d be really fun to just let him keep going, hammering your cunt until you’re passing out deliriously, but it might be even more fun if you got to bounce on that giant cock yourself.");
	output("\n\n<i>“If it’s the last round, let’s try something different, then,”</i> you say, idly getting up from the bed, careful to keep your dripping cunt in contact with his throbbing cock. It just feels so nice to have it rubbing against your lips. In a single swift movement, you have his fingers entwined in yours and use that to push the surprised korgonne down onto his back.");
	output("\n\n<i>“Wh-”</i> Lund starts before grunting in confusion, suddenly buried underneath a couple hundred pounds or more of amazon muscle. <i>“Ungh!”</i>");
	output("\n\n<i>“Like I said, something different,”</i> you say, smiling down at him. <i>“Just lie back and enjoy, okay? Think of it as repayment for being such a great fuck.”</i>");
	output("\n\nLifting your [pc.hips], you don’t hesitate to get right into the full swing of things. You both groan loudly when you slam them down onto his groin, your [pc.ass] resting comfortably atop his muscular thighs. Repeating the motion so emphatically it sounds like you’re being spanked, you can’t help but grin enthusiastically.");
	output("\n\n<i>“Pretty good, right?”</i> you pant loudly, watching Lund twist and grunt under you. <i>“C’mon, gimme that last load of yours.”</i>");
	output("\n\nAs durable as the korgonne is, you have to <i>work</i> for it. By the time he does cum, swearing loudly and bucking, both of you are dripping sweat and exhaling steam while gripping each other tightly enough to bruise. Shuddering and biting your lip as he blows his load inside you, you finally achieve release on top of him as you feel his knot stretching your walls wide. Tensing your thighs is all you need to keep him inside you and cumming, leaving you free to recline and enjoy the sensation.");
	output("\n\n<i>“Oh, fuck, that was </i>good<i>,”</i> you moan, head tilted back to look at the ceiling. <i>“Thanks, Lund.”</i>");
	output("\n\n<i>“Right,”</i> he mutters. <i>“Alien getting off?”</i>");
	output("\n\n<i>“Fuck yea- oh, right,”</i> you realize, lifting yourself off his squeezed-dry cock. It comes free with a wet slurp, both of you wincing in pleasure at the stimulation. <i>“Okay, I’m gonna get outta here. See you soon, maybe!”</i>");
	output("\n\nGathering your things, you bend down to give the tired korgonne a quick kiss on his snout before leaving. He’s still lying there panting by the time you close the door. Poor guy, maybe you should have gone a little easier... but where’s the fun in that?");

	processTime(30);
	for(var y:int = 0; y < 3; y++) { pc.orgasm(); }
	if(x >= 0) pc.loadInCunt(lundCumPlaceholder(),x);
	else pc.loadInAss(lundCumPlaceholder());
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[DickHimDown]
//Need dick, can’t be bimbo. Can’t have submitted. When you dick him for the first time, apply a one-time 72 hour timer to taking the scene again to simulate him sulking. If you brag after doing it the first time, just lock it permanently.
//Fen note: pass through cock selection scene :3
public function dickLundDown(x:int):void
{
	clearOutput();
	showLund(true);
	output("<i>“I’ve got a problem I think you can... help me out with, Lund,”</i> you whisper, sliding your hand down your stomach to rest atop your groin.");
	if(pc.cocks[x].cLength() > 10) output(" <i>“It’s a big problem, but I think you can handle it");
	else output(" <i>“You should be able to handle it, big guy like you");
	output(".”</i>");

	if(flags["LUND_DICKED_DOWN"] == undefined) 
	{
		output("\n\n<i>“You want Lund to-”</i> he starts, looking at you incredulously then shaking his head. <i>“Not think alien understand. Lund not do that.”</i>");
		output("\n\n<i>“Aw, c’mon,”</i> you cajole him, rubbing his chest fluff. <i>“Big guy like you, I bet you’ve never even thought about how good it can feel. I bet I can make you cum like a frostwyrm.”</i>");
		output("\n\nLund fights an internal battle for a little while, but eventually loses to his curiosity.");
		output("\n\n<i>“Fine,”</i> he mutters, turning away. <i>“But if Lund not like, punishment for alien.”</i>");
		output("\n\n<i>“No need to worry about that,”</i> you tell him, smirking as you watch him start towards his room. You can hardly wait.");
		output("\n\nOnce you’re in Lund’s room, he’s refreshingly straightforward about it. Unclothed and on all fours upon his bed within a few seconds, he looks back at you with apprehension writ large on his face.");
		output("\n\n<i>“Well? Alien start?”</i>");
		moveToLundsHouse();
		output("\n\n<i>“What?”</i> you say, confused. <i>“No, no - you need to be lubed up, first. Here, relax.”</i>");
		output("\n\nPlanting a hand on his right buttock, you take a second to admire Lund’s ass. He has the build of an athlete, and the muscle back here has just enough heft to support the tight, bubble-butt shape. It’s enough to make your mouth water.");
		output("\n\n<i>“Did you think I was just going to go in raw?”</i> you ask, shaking your head as you drool on your fingers. <i>“That’s real brave of you, but jeez. You’re not enough of an asshole for that.”</i>");
		output("\n\n<i>“Not know alien rit- yawp!”</i> Lund squeaks when you slip a lubed-up finger into his butt, immediately squeezing down on you so hard you can’t move it.");
		output("\n\n<i>“Relaaax,”</i> you reassure him, rubbing his ass with your free hand. <i>“Just getting you warmed up.”</i>");
		output("\n\n<i>“Not f-feel nice,”</i> Lund moans from up front.");
		output("\n\n<i>“Just wait,”</i> you tell him, snaking an arm around his hips to rub his balls slowly.");
		output("\n\nHe responds to <i>that</i> pretty well, at least. You make comforting noises while you slip another finger inside the moaning korgonne, surprised at how well his tight little butt is taking this. He’s still working past the constant flexing, but once he manages to relax you think he’ll be in for a really, really good time. Angling your fingers downward, you start to gently rub along his walls until you locate what you’re looking for - the slight, sensitive protrusion of his prostate gland.");
		output("\n\nNnn-?!”</i> he groans, his erect cock suddenly flagging. <i>“What alien doing?”</i>");
		output("\n\n<i>“Just a little massage,”</i> you murmur sensually, gliding your fingers over the spot again and again. <i>“Don’t worry about it too much, big boy.”</i>");
		output("\n\nIf his moans are anything to judge by, he won’t. Gradually, he relaxes his arms more and more, until finally he crosses them on the bed and lays his head atop them, keeping his ass high in the air for you to slowly fingerfuck. You can feel his cock drooling messily all over the hand you’re still rubbing his balls with, making a mess between his matted fur and ");
		if(pc.hasFur()) output("yours.");
		else output("your [pc.skinFurScales].");

		output("\n\nFor an anal ");
		if(flags["LUND_DICKED_DOWN"] == undefined) output("virgin");
		else output("amateur");
		output(", Lund is extremely sensitive. Every single touch of his prostate sets him shuddering, and it doesn’t take long for you to have him on the very precipice of orgasm, despite him getting in his own way.");
		output("\n\n<i>“Fuck!”</i> he gasps, trying to thrust himself back at you. <i>“So close!”</i>");
		output("\n\n<i>“No!”</i> you command him, spanking the korgonne lightly across his curvy asscheek. <i>“Be patient and let it come to you.”</i>");
		output("\n\nSurprisingly, or perhaps not given he must want to cum so badly after having your fingers pushing him ever-closer for several minutes, he acquiesces almost immediately with a forlorn moan. Wanting to reward his incredible obedience, you gently massage the spot you just spanked and murmur encouraging words to him.");
		output("\n\n<i>“What a good boy you are, Lund,”</i> you tell him seductively, a wide smile on your face. <i>“</i>Such<i> a good boy.”</i>");

		output("\n\nWhether by your praise or your unrelenting motions in his tight little asshole, Lund suddenly cries out in a high-pitched voice, shooting up back onto all fours in a flash and squeezing down on your fingers so hard you can only just barely move the tips. With a devilish grin, you do exactly that, rubbing his prostate as fast as you can between them as he moans his heart out.");

		output("\n\n<i>“Oh! Ohhh!”</i> Lund pants, tongue lolling from his mouth as he flexes his asshole around you multiple times a second. <i>“Gods!”</i>");

		output("\n\n<i>“Ooooh, yeah,”</i> you murmur, enjoying it almost as much as he is. Your hand cupping his warm, furry balls is suddenly soaked with slippery cum, an ever-increasing amount spurting from his limp, pulsating cock. <i>“You are just a sexy little bitch, aren’t you?”</i>");

		output("\n\nIf Lund hears you, he doesn’t give any sign of it. His back arches again and again as a truly impressive amount of hot cum splashes across your hand, his heaving balls summoning impossibly immense amounts of seed from such a small frame. He must be <i>really</i> turned on, you guess. The novelty of taking his <i>“first time”</i> has you pretty fucking hot yourself, you have to admit. Your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" raging hard at the sight and feel of such a willing, virile stud subjecting himself to this treatment. Painfully hard, even. The easiest way to assuage that would be...");
		output("\n\n<i>“Hey cutie,”</i> you murmur in the gasping korgonne’s ear, <i>“time for the main event.”</i>");
		output("\n\nWithout even waiting for him to finish cumming, you withdraw your fingers, align your [pc.cock], and slide yourself in to a cacophony of moans and garbled, unintelligible cries of confusion and lust from Lund.");
		output("\n\n<i>“Oh, fuck!”</i> you exclaim, getting a good grip on his asscheeks. <i>“Your asshole feels fucking </i>amazing!<i>”</i>");
		pc.cockChange();
		output("\n\nIt’s true, too - maybe it’s because he’s a strong, athletic male with a penchant for fucking and hunting, but this is somehow both the tightest and the most pliable ass you’ve ever fucked. Every thrust is like he’s gripping you tightly with his hands, enclosed in his fingers and being stroked up and down from head to base. Panting in fevered excitement, you push down on his upper back and get him in the position.");
		output("\n\nThe moment he’s down, keeping his perfect ass up in the air either by instinct or coincidence, you grip his jelly-like asscheeks hard enough to make him groan and begin fucking him as hard as you can. Any semblance of trying to gently guide him through the experience goes out the fucking window - even if you only get one shot to cum inside his ass, it’ll be worth it.");
		output("\n\n<i>“Oohhhh, god,”</i> you groan in ecstasy, eyes squeezed shut so tightly you can see stars bursting in your vision. <i>“Lund! Oh fuck, Luuund!”</i>");
		output("\n\nYou hammer his asshole with frenzied desperation, the slap of flesh on flesh resounding in Lund’s cramped room multiple times a second. Your voices reach a fever-pitch of lust when, after what can’t be any more than a couple of minutes of hard, sweaty fucking, you cum explosively deep inside Lund’s asshole.");
		output("\n\n<i>“Ho fuck,”</i> you gasp, pleasure radiating from your groin as you pour jizz into Lund’s guts. <i>“Nnnnnngggghh...”</i>");
		output("\n\nAfter taking a second to enjoy the sensation, you harden your resolve and start fucking him again - he’s so close to cumming on his own, you can feel it. Sure enough, he begins to tighten around you even as you orgasm, all but squeezing your spurting cock to ensure your jizz marks him as deep as possible.");
		output("\n\n<i>“Hhh- hnnnggggrrrr-! Hhhh</i>awooooo<i>!”</i> he suddenly cries, howling his lungs out. <i>“Nnnngh! Huhhnnn!”</i>");
		output("\n\n<i>“Awwww, theeeere you go!”</i> you exclaim, grabbing his chest fluff and rubbing it from above even as he grabs a pillow and stuffs it in his jaw to bite down on. <i>“What a good boy!”</i>");
		output("\n\n<i>“Ooooo,”</i> he whines through the pillow while you cum deep in his ass, <i>“Ooo... hhhhh...”</i>");
		output("\n\nTired and weak, he lets the pillow drop from his mouth, drooling onto his chest even as you pull him gently backwards into a hug. You ruffle the smooth fluff under his neck as he moans and slowly pull out from his asshole, letting your thick jizz slowly leak from his ass. Deciding to spend the next few minutes until Lund regains his senses taking care of him, you deign to lick and kiss the back of his neck, rubbing him all over.");
		output("\n\nSure enough, when he finally recovers from the intensity of your fucking, he flops forward onto the bed with a tired grunt and waves you away. Not wanting to impose, you quickly plant a kiss and a rub between his shoulder blades and quietly gather your things, leaving the probably-sulky korgonne to himself.");
		output("\n\nOut in the hallway, you pass by a little gaggle of fluffy korgonne girls milling about and give them a friendly wave. They reciprocate the gesture and, perhaps out of curiosity, eye you closer.");
		output("\n\n<i>“Lund howl?”</i> one of the korgonne women asks, peering at you. <i>“What alien do?”</i>");
		processTime(20);
		pc.orgasm();
		clearMenu();
		//[CoverForHim] [Brag]
		addButton(0,"CoverForHim",coverForHim);
		addButton(1,"Brag",dontCoverForLund);
	}
	IncrementFlag("LUND_DICKED_DOWN");
	pc.createStatusEffect("LUND_DICKED_CD");
	//3 day CD.
	pc.setStatusMinutes("LUND_DICKED_CD",60*24*3);
	flags["LUND_LAST_SEX"] = "Dicked";
}

//[CoverForHim]
public function coverForHim():void
{
	clearOutput();
	leaveLundsHouse(true);
	generateMap();
	showName("\nCOVERING!");
	output("<i>“Oh, uh... he was just surprised my throat is ribbed,”</i> you say, making something up on the spot. <i>“You know how primal it can be when a guy cums really hard.”</i>");
	output("\n\n<i>“Oh, uh huh, uh huh,”</i> the women nod, looking knowingly at each other. Based on what your codex says about korgonne mating habits, you’re not surprised. They probably make their men howl on a regular basis. Curiosity assuaged, they bid you goodbye and disappear around the corner.");
	output("\n\nThe korgonnes might think you’re slightly more peculiar now, but at least Lund’s dignity is mostly intact. Hopefully that’ll make him more receptive to doing this again in the future!");
	//flag this
	flags["LUND_COVERED_4"] = 1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Brag]
public function dontCoverForLund():void
{
	clearOutput();
	leaveLundsHouse(true);
	generateMap();
	showName("\nBRAGGING!");
	output("<i>“He </i>really<i> likes a fat cock up his ass,”</i> you tell them, making a lewd sign with two of your fingers and a tight hole formed with your other hand. <i>“I made him cum his brains out with a reacharound, it was super hot.”</i>");
	output("\n\n<i>“Wow!”</i> exclaims the one who asked you, turning to her friends. <i>“Maybe next fuck I sneak finger in to make howl. Bye alien!”</i>");
	output("\n\nHmm. Not exactly the reception you were hoping for, but it could get interesting later when word gets around.");
	processTime(4);
	//flag this
	flags["LUND_COVERED_4"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Ride him]
//Fen - do female hole select?
public function rideLundWheeee(x:int):void
{
	clearOutput();
	showLund(true);
	if(pc.isBimbo()) 
	{
		output("<i>“So like, how do you wanna fuck?”</i> you say, tilting your head and putting some serious thought into it. <i>“I wanna-”</i>");
		output("\n\n<i>“You not get choice,”</i> he tells you, shaking his finger. <i>“You not in charge. Lund know you prefer it. A man tell you where to go, what to do. How wide to spread legs. When to swallow.”</i>");
		output("\n\n<i>“I- Uuuhh,”</i> you mutter, losing yourself in his words. Gosh, he always knows just what to say to you...");
		//Added here since OTHER bimbo scene increments this before the bimbo check.
		IncrementFlag("SEXED_LUND");
		//Next button -> goes to Bimbo Sex.
		clearMenu();
		addButton(0,"Next",bimboLundSex,x);
		return;
	}
	//Not bimbo, first time
	else if(flags["LUND_RIDE_HIMMED"] == undefined)
	{
		output("<i>“How about I take you for the ride of your life, and we can figure out afterwards if I belong ‘on the bottom’, hm?”</i> You murmur in his ear. <i>“Just one try.”</i>");
		output("\n\n<i>“Ha,”</i> Lund snorts, then shrugs. <i>“Okay, one shot. Don’t blame Lund when alien get fucked through floor.”</i>");
	}
	//Not bimbo, repeat
	else
	{
		output("<i>“So?”</i> you ask, leaning in to murmur in his ear. <i>“Have I earned another chance to argue for my position?”</i>");
		output("\n\n<i>“Pretty convincing,”</i> Lund grunts, acknowledging your prowess. <i>“Alien can try again. See if good.”</i>");
	}
	output("\n\nIn Lund’s room, you have ");
	if(!pc.isCrotchExposed()) output("yourself and ");
	output("the korgonne undressed and ready in moments, pressing against his fur and reaching down between his legs to coax his oversized length from its sheath. Kissing Lund as you bear him to the bed, you lay him down and straddle him with a wide smile.");
	output("\n\n<i>“Hope you’re ready for this, Lund,”</i> you tell him, feeling his cock swell and harden against your [pc.ass]. <i>“I dunno if you’re man enough to take it.”</i>");
	output("\n\n<i>“Hmph,”</i> Lund grunts, reaching up to spread his hands across your [pc.chest]. <i>“You not bait Lund to do all work.”</i>");
	output("\n\nSatisfied you’ve convinced him to let you take the lead, you settle back and let the thought of teasing him fade from your mind. You really just want for the both of you to have a good time, and assuaging Lund’s machismo tendencies is probably the easiest way. Reaching back, you lightly take ahold of his canine prick and align it with your [pc.vagOrAss " + x + "]. You groan in pleasure as you slowly slide backwards onto it, using your hips to take it inside. Lund grunts, chewing his lip while the crown of his dick spreads you apart.");
	
	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	
	if(x >= 0) pc.cuntChange(x,lundipoo.cockVolume(0));
	else pc.buttChange(lundipoo.cockVolume(0));

	output("\n\n<i>“Awww fuck, that’s good,”</i> you moan, rocking back and forth in Lund’s lap just to feel him rub along your insides. Taking it deep is great, but there’s something to be said for quick, light movements that just tease the tip...");

	output("\n\nIf Lund’s reaction is any indication, he’s in full agreement. A low rumble escapes his mouth in a growl of approval, and the smile reappears on your face. When you’re in control, there’s just so much room to do whatever you want... like suddenly slam yourself knot-deep on his cock.");

	output("\n\n<i>“Fuuuck!”</i> you groan loudly, shuddering atop Lund for a second. You came pretty close to cumming right there, but if Lund doesn’t know that already he doesn’t need to be told. After taking a moment to readjust, you begin rocking atop him again, this time sliding half of his bloated length in and out of your ");
	if(x >= 0) output("lubed-up pussy");
	else output("pre-cum-slick asshole");
	output(", enjoying the sensation of being filled up.");

	if(x >= 0 && pc.totalVaginas() > 1)
	{
		output("\n\nAn idea comes to you then, and you slide off Lund’s cock to a groan of disappointment only to elicit a gasp of surprise when you slide him right back into another tight, wet cunt. You look down at Lund’s expression and can’t resist a sultry laugh at his shock, gyrating your [pc.hips] atop his lap just to remind him who’s in charge. Bouncing up and down on his groin, you alternate between two of your slickened pussies while Lund grunts in helpless pleasure.");
		
		var unusedVags:Array = [];
		for(var v:int = 0; v < pc.totalVaginas(); v++)
		{
			if(v != x) unusedVags.push(v);
		}
		if(unusedVags.length > 0) x = unusedVags[rand(unusedVags.length)];
		
		pc.cuntChange(x,lundipoo.cockVolume(0));
	}

	output("\n\nShaking your hips in preparation, you place your hands on Lund’s chest and begin slamming down on him, taking as much pleasure as you want from the powerless korgonne. You can feel his knot beginning to swell at the base of his cock but don’t slow your pace at all, groaning deeply every time you take him to the hilt. You can tell he’s fighting it, trying his hardest not to cum with the rough stimulation, his entire body tensed with the effort. You can’t help but rub his nipples just to tease him, but you never stop fucking as hard as you can.");

	output("\n\nSoon enough, you force an orgasm out of him. Grunting, he instinctively bucks his hips upwards to meet your bouncing ass with a loud slap of flesh, grabbing your forearms tightly. You croon in satisfaction as warmth blossoms in your [pc.vagOrAss " + x + "], spurting from his tip and repainting your insides even as you meet his thrusts in midair at full force.");
	output("\n\n<i>“Ugh!”</i> Lund grunts, the stimulation clearly getting to him. <i>“Ag-again!”</i>");
	output("\n\n<i>“Come on baby, give it all to me,”</i> you pant, face flushed and sweaty even as you smile the way only a person in charge can. <i>“Are you gonna cum twice? Gonna cum? Go on. I give you permission.”</i>");
	output("\n\nBefore the flow of his cum has even subsided, it’s renewed; he curses and bucks even harder under you to the point you don’t even need to move yourself, his thrusts coming so hard and fast you’re practically floating. Your smile only widens, your [pc.lips] parting as you pant in both glee and pleasure. He’s so enthralled with the sensation of cumming inside you, he doesn’t even care you have him doing all the work from below.");
	output("\n\n<i>“What a good boy,”</i> you moan, seductively lidding your eyes at him. <i>“Keep that up for me, Lund, I’m about to cum.”</i>");
	output("\n\nIf he’s aware of how demeaning that might be, it doesn’t register on his face. It’s twisted in a permanent snarl of aggressive pleasure, his teeth grit even as he fucks your ");
	if(x >= 0) output("sopping cunt");
	else output("sodden asshole");
	output(" balls-deep. Much like his, your orgasm isn’t slow or gradual at all; you feel it coming and then it’s upon you, drawing your voice out in a loud, halting groan of satisfaction while you tighten around Lund’s knot.");

	if(pc.hasCock()) 
	{
		output("\n\nYour [pc.cocks] strain");
		if(pc.cockTotal() == 1) output("s, flexes, and spurts");
		else output(", flex, and spurt");
		output(" wildly, spraying [pc.cum] all over Lund’s chest and face even as your ");
		if(x >= 0) output("pussy");
		else output("asshole");
		output(" tightens around him so much his next thrust is almost halted in midair. Every loud, slapping thrust from below just spurs you further onward, groaning and grunting while you blow your load into Lund’s luxurious fur. He doesn’t seem to mind at all, focused entirely on his own orgasm.");
	}
	else if(pc.hasVagina()) output("\n\nYour [pc.pussy] flexes, tightens and spurts all over Lund’s throbbing canid cock, almost trapping his fat knot inside you before he overpowers your instinctive squeezing. The sensation of him forcing himself in and out as you cum explosively only spurs you further onwards, driving you higher until you’re crying out in ecstasy with your head back.");
	else output("\n\nYour [pc.asshole] flexes and tightens over Lund’s throbbing canid cock, almost trapping his fat knot inside you before he overpowers your instinctive squeezing. The sensation of him forcing himself in and out as you cum explosively only spurs you further onwards, driving you higher until you’re crying out in ecstasy with your head back.")

	output("\n\n<i>“Oh, fuck!”</i> you scream in pleasure, watching Lund nail you as hard as he can from underneath you all throughout your orgasm. <i>“Keep going, keep going!”</i>");

	output("\n\nFilled with a renewed determination, you can see him employ his shaking muscles to keep you going, fucking you hard enough that the impacts on your thighs begin to hurt. You don’t care at all about the pain, though - if anything, it’s just icing. Eyes squeezed shut tightly, you can feel yourself forcefully mounting the threshold of pleasure, climbing back to the peak before you’ve even properly come down.");

	output("\n\nSure enough, you come to another massive orgasm atop Lund, this one even harder than the last. You tense so hard you can scarcely inhale, forgoing air in favor of the breathless ecstasy of cumming your brains out. Your eyelids flutter several times a second as you shake and shudder, Lund finally grabbing your hips and pulling you down on top of his huge knot to let his third and final orgasm explode inside you.");

	output("\n\nBiting your lip hard enough that it bleeds, you watch him grunt and flex in pleasure as a sideshow to your main event. Watching him writhe underneath you, his knot spreading you apart as he cums inside, your own orgasm leaving you content... yes, you could <i>definitely</i> get used to this.");

	output("\n\nAfter you’re both finished, you lie on top of him with a hand scratching his chest fluff for a job well done. Extricating yourself from the tangle, you clean yourself off and get your things.");
	output("\n\n<i>“Wow, you are </i>quite<i> the catch,”</i> you sigh at length, wiping off your forehead. <i>“Good work, cutie. I’ll be expecting the same performance next time.”</i>");
	output("\n\nHis ears perk up slightly at the words ‘next time’, but he doesn’t say anything, just pants. You bend down to kiss him on the snout and take your leave with a predatory grin.");

	processTime(30);
	if(x >= 0) pc.loadInCunt(lundipoo,x);
	else pc.loadInAss(lundipoo);
	pc.orgasm();
	IncrementFlag("SEXED_LUND");
	IncrementFlag("LUND_RIDE_HIMMED");
	flags["LUND_LAST_SEX"] = "Rode";
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Bimbo Sex]
//This is not a selectable scene, it’s just what bimbos get sent off to do after picking their sex scene of choice.
public function bimboLundSex(x:int = -2):void
{
	clearOutput();
	showLund(true);
	output("<i>“It okay,”</i> Lund nods, spreading his arms. <i>“Lund can give alien what want. Alien just need shut up and sit down.”</i>");
	output("\n\n<i>“Not here!”</i> he hisses immediately, looking around and pulling his groin back from your outstretched hand.");
	output("\n\n<i>“Oh, sorry,”</i> you say confusedly, standing back up. Following orders is hard sometimes.");
	output("\n\n<i>“No, it Lund fault,”</i> he sighs. <i>“Need remember alien follow simple instructions. Come.”</i>");
	output("\n\n<i>“All over your cock!”</i> you happily agree, attracting a couple of grins from passing korgonne. Lund doesn’t even say anything, just tugging you along.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",bimboLundSexNext,x);
}
public function bimboLundSexNext(x:int):void
{
	clearOutput();
	moveToLundsHouse();
	showLund(true);
	output("<i>“Ooh, your room! Oh my gosh, I feel so special,”</i> you titter, looking around at the mostly-bare living space while he shuts the door. <i>“I actually don’t get to do this often! Usually it’s just wherever th-”</i>");
	output("\n\n<i>“Hold this in mouth a second,”</i> Lund says, handing you his waistcloth. Obliging the furry man, you put it in your mouth and chomp down on it.");
	output("\n\n<i>“Rlike dish?”</i> you slur through the cloth.");
	output("\n\n<i>“Hmm,”</i> Lund hums, considering. <i>“This and this too.”</i>");
	output("\n\nNow you have three waistcloths in your mouth. You ask Lund what they’re for and he listens to your question intently, the words coming out mostly as muffled, indistinct mumblings.");
	output("\n\n<i>“Perfect,”</i> he sighs, looking relieved. You’re not sure why, but you have a few seconds to mull it over before the telltale rustling of cloth draws your attention. Presented with the sight of Lund’s magnificent canine cock, you almost drop the waistcloths before remembering he told you to hold them. Instead you make a quiet whine of need that makes one of his ears twitch.");
	output("\n\n<i>“On bed,”</i> he points, motioning that you should turn around. <i>“Get on hands and knees.”</i>");
	output("\n\nYou guess an alien that looks like a doggy probably wants to bone like one too, and for a moment you giggle at your own clever pun. Getting on the bed and wiggling your butt, you arch your back sensually and turn back to look at him with a smug face. Forgetting your speech is all but unintelligible right now, you start to say something only to be shocked into silence when Lund slides his entire fucking cock into your ");
	
	if(x < -1)
	{
		x = -1;
		if(pc.hasVagina()) x = rand(pc.totalVaginas());
	}
	if(x >= 0) output("[pc.pussy " + x + "]");
	else output("[pc.asshole]");
	output(".");

	output("\n\nThe waistcloths hang from your open mouth, drool soaking them thoroughly while your mind catches up with your body and you begin to buck in Lund’s grip. A dull, muted groan of ecstasy escapes your mouth while your ");
	if(x >= 0) output("pussy");
	else output("asshole");
	output(" desperately clamps down on the fat dick inside it, guaranteeing the pleasure of the one inside you.");

	output("\n\n<i>“Fuuuck,”</i> Lund moans, jerking his hips. <i>“Alien worth it.”</i>");
	output("\n\nA mindless, breathless giggle of joy escapes your mouth unbidden, your eyes rolling upwards as pleasure bubbles to the forefront of your mind, obscuring everything but the most important sensation: the need to please. Being a fun, slutty bimbo for the boys to enjoy... it’s nice to be so <i>solidly</i> reminded of your place every so often. Forcefully, even.");

	output("\n\nArching your back like the good playtoy you are, you moan like a bitch as Lund begins to fuck you in earnest, spreading your legs with his hands dominantly wrapped around your [pc.hips] to keep you in place. ");
	if(pc.hasCock())
	{
		output("Your [pc.cocks] dribble");
		if(pc.cockTotal() == 1) output("s and spurts");
		else output(" and spurt");
		output(" with each penetration, pooling below you. ");
	}
	output("He starts off slowly, experimentally, but it only takes him a few strokes to figure out you’re good for getting it hard.");

	output("\n\nThen you’re having ");
	if(pc.hasHair() && pc.hairLength >= 2) output("your [pc.hairNoun] pulled");
	else output("a [pc.breast] groped");
	output(" while he slams your tight, warm ");
	if(x >= 0) output("cunt");
	else output("asshole");
	output(" with all the force he can muster. Holding yourself up on two shaky arms, you ");
	if(pc.bovineScore() >= 3) output("can’t help but moo");
	else output("scream in pleasure");
	output(" as loud and long as you can, earning yourself two swift swats across your bouncing asscheeks that leave a nice warm stinging sensation courtesy of your master. It’s so nice to have someone pay your <i>whole</i> sexy body attention!");

	output("\n\nEventually your arms give out under the relentless pounding of your [pc.vagOrAss " + x + "], the combination of physical pleasure and mental fulfillment just too much to bear. Your face lolls against the mattress, mouth wide open and loudly, repeatedly expressing just how much you love to have Lund’s cock buried deep in your ");
	if(x >= 0) output("cunt");
	else output("asshole");
	output(".");

	output("\n\nWith a fierce movement, Lund grabs the sheet and rips it in two. You hardly even notice, so lost in pleasure are you, until he whips it around your face and catches it back in his hand, effectively gagging you once more. Like you’re no more than an animal, he yanks back on it cruelly to lift your head from the bed and keep you suspended while he works your ");
	if(x >= 0) output("sopping cunt");
	else output("flexible asshole");
	output(" over with the force of a ");
	if(flags["LANDED_ON_TEXAS"] != undefined) output("New Texan ");
	output("bull.");

	output("\n\nAny other person less-suited to the task of being pounded through the bed would be embarrassed to be treated in such a fashion, but not you. Your eyes roll back in your head while you drool through your gag, a guttural groan escaping your throat as you cum explosively around Lund’s dick. He hisses in satisfaction when he feels your walls rippling, all but massaging his cock in the hope of earning his cum, but it’s not to be. He’s still going at you hard enough to shake the bed against the wall by the time you finish cumming, his overwhelming studliness enough to drive you to another submissive orgasm. He <i>really</i> deserves this!");

	output("\n\nThough the process is gradual, you don’t even realize you’ve slowly been losing your position on the bed until you’re pushed right up against the headboard, [pc.breasts] squished against the pillows as the sound of furred thighs clapping against the [pc.skinFurScales] of your ass resounds through the tiny room. Pressed against the wall with no room for movement at all, Lund holds you there while he aggressively fucks your ");
	if(x >= 0) output("spasming pussy, droplets of femcum running down his thickening shaft.");
	else output("tightening asshole, his own pre-cum running back out and down his thickening shaft.");

	output("\n\nWithdrawing his knotted cock from your well-used cunt, he moves aside and tosses you back down on the bed, immediately straddling your [pc.chest] and tugging the gag from your mouth. You get one deep breath before his fat, sex-slick prick is shoved in your throat, driving your hips so far off off the ground in submissive pleasure he has to put his hands down above your head just to keep from falling off.");

	output("\n\nHe doesn’t wait for you to finish cumming or moaning around his cock to start fucking your face with abandon, knot slapping wetly against your [pc.lips] while he savagely bucks his sexy hips above you. God, this is amazing! You have a front row seat to Lund’s washboard abs, getting a nice, hot closeup every time he gets his full ten inches deep in your throat, the knot getting tantalizingly close. If you could just get your jaw a liiiittle wider...");

	output("\n\nLund’s gasp is masked by a wet, lurid pop, and he looks down to find your eyes rolling back while you gurgle happily around his knot. Shrugging his shoulders, he gets back to the task at hand: breaking you in properly. You’re so proud you managed to get all of it in, and now your master is rewarding you by getting even deeper inside! Your nose is all squished up against his furry groin, and his fantastic male scent permeates your very mind, driving you wild with need. You haven’t even done anything yet, but you find yourself cumming anyway. Lund doesn’t even notice, too busy fucking your face with frenetic vigor to feel your shaking hips.");

	output("\n\nYou reach up to embrace his lower half and just touch him, stroking his muscular back and feeling his taut buttcheeks whenever he thrusts into your throat, running a hand up and down his spine and occasionally holding his sexy hips while he bucks against your mouth. God, this is almost as good as the sex itself... you could spend all day under him like this just feeling his tight body. The only way the touching could be better is if he was touching your insides with his cock, and, well, he is! Life is grand.");

	output("\n\nYour day reaches a new peak when you realize, instinctively, he’s going to cum. You can <i>feel</i> it, in the way he’s moving his hips and the way those abs of his are tensing up, and the best place for him to blow a huge load is right down your throat. Putting both your hands on his ass and pulling him towards you while you snake your tongue along his knot as best you can, it only takes a few scant seconds with your expert technique for him to groan in pleasure.");

	output("\n\nOh god, you weren’t expecting there to be so <i>much</i>. Rather than swallowing you have to just open your throat and let him have full control otherwise you’d gag, his knot throbbing against your cheeks while he dumps what feels like his bodyweight in hot jizz into your stomach. What with the way he’s moaning, you think you’ve done a very good job!");

	output("\n\nWhen he finishes he just sits there on all fours groaning while his breath comes back, looking down at your fucked-silly face. You’d be smiling if you were capable of it. Placing his hands around your face, he gingerly pulls his knot free of your lips with another wet pop and a groan, leaving you feeling a bit like your throat has been hollowed out. You spend a few seconds swallowing before you can even take a breath, and the first thing out of your mouth is a light giggle.");

	output("\n\n<i>“Did you like it?”</i> you ask, fluttering your eyelashes.");

	output("\n\n<i>“Could get used to it,”</i> Lund says, looking down at you from atop your chest. <i>“Maybe try that out again.”</i>");

	output("\n\nYou smile before opening your mouth wide, exposing your pearly-white teeth and throat. Lund doesn’t bother resisting the sight.");

	processTime(65);
	var lundipoo:PregnancyPlaceholder = lundCumPlaceholder();
	pc.buttChange(lundipoo.cockVolume(0));
	pc.loadInMouth(lundipoo);
	pc.loadInMouth(lundipoo);
	pc.loadInAss(lundipoo);
	pc.loadInAss(lundipoo);
	//Two loads in EVERY hole.
	for(var y:int = 0; y < pc.totalVaginas(); y++)
	{
		pc.loadInCunt(lundipoo,y);
		pc.loadInCunt(lundipoo,y);
	}
	//Cunt tails are weird, but not too weird to fuck
	if(pc.hasCuntTail()) pc.loadInCuntTail(lundipoo);

	for(y = 0; y < 10; y++) { pc.orgasm(); }
	flags["LUND_LAST_SEX"] = "Doggystyle";
	clearMenu();
	addButton(0,"Next",bimboLundSexEnd,x);
}
public function bimboLundSexEnd(x:int):void
{
	clearOutput();
	showLund(true);
	output("By the time you stagger out of Lund’s bedroom, your mind and body in complete disarray, you have spunk leaking from every orifice and a healthy amount splashed across your tits, face, and back. Luckily, he directed you to a spring bath you intend to make full use of, but that doesn’t stop the curious stares from passerbys in the halls to get there. Let them look, you think with a dopey smile. The more people see how proud you are of getting fucked like a whore, the better! Maybe they’ll even take you for themselves. Once you wash up, you head back to the Hold proper.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",leaveLundsHouse);
}

//[Leave]
public function leaveLundsSexMenu():void
{
	clearOutput();
	showLund();
	output("You shake your head after a second of consideration. <i>“Nah.”</i>");
	if(pc.isBimbo()) 
	{
		output("\n\nLund shrugs. <i>“Lund not fuck you this time. You come running soon enough.”</i>");
		output("\n\nAs if! Well... maybe. You cast a longing look down at his kilt before stepping away.");
	}
	else output("\n\n<i>“What, alien scare?”</i> Lund jeers, smiling smugly. <i>“Scare to lose to Lund. It okay, Lund understand. Come back when alien feel brave. Ha!”</i>");
	lundMenu();
}