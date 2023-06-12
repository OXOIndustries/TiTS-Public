//Liamme by HugsAlright
//First Coding By Fenoxobutt

public function liammeCapacity():Number
{
	return 800;
}
public function liammeVolume():Number
{
	return 8;
}

public function showLiamme(nude:Boolean = false):void
{
	//Actual display
	showBust(liammeBustString(nude));
	showName("\nLIAMME");
}

public function liammeBustString(nude:Boolean = false):String
{
	var nudeString:String = "";
	var skirtString:String = "";
	//Figure out outfit
	if(!pc.hasStatusEffect("LIAMME_OUTFIT"))
	{
		pc.createStatusEffect("LIAMME_OUTFIT",rand(2),0,0,0);
		pc.setStatusMinutes("LIAMME_OUTFIT",970);
	}
	//Set skirtstring if not nude
	if(pc.statusEffectv1("LIAMME_OUTFIT") == 0 && !nude) skirtString = "_SKIRT";
	//Set nudestring variant
	if(nude) nudeString = "_NUDE";

	return ("LIAMME" + skirtString + nudeString);
}

public function liammeSkirted():Boolean
{
	//Figure out outfit
	if(!pc.hasStatusEffect("LIAMME_OUTFIT"))
	{
		pc.createStatusEffect("LIAMME_OUTFIT",rand(2),0,0,0);
		pc.setStatusMinutes("LIAMME_OUTFIT",970);
	}
	//Set skirtstring if not nude
	return (pc.statusEffectv1("LIAMME_OUTFIT") == 0);
}

//Liamme can be found on the residential deck between 12:00 and 04:00
//Opening Text
public function liammeBonus():void
{
	if(!pc.hasStatusEffect("Liamme Disabled"))
	{
		if(hours >= 12 || hours < 4)
		{
			if(flags["MET_LIAMME"] == undefined)
			{
				output("\n\nWhat appears to be an ausar girl is sitting at a bench, looking down at some sort of mobile device, and giving a girly giggle every few moments before tapping on the screen. The most noticeable thing about her is an unbelievably fluffy, almost golden, rich-blonde mane flowing down to her shoulders.");
				addButton(0,"Fluffy Girl",approachLiamme);
			}
			else
			{
				//Repeatable Opening Text
				output("\n\nSitting at a bench and enjoying a relaxing break between work shifts is Liamme, the ausar boy you met before. He takes notice of you and waves your direction.");
				addButton(0,"Liamme",approachLiamme);
			}
		}
		else if(flags["MET_LIAMME"] != undefined) 
		{
			addDisabledButton(0,"Liamme","Liamme","Liamme must be busy at work.");
			pc.removeStatusEffect("LIAMME_OUTFIT");
		}
	}
	else if(flags["MET_LIAMME"] != undefined) 
	{
		// Remove status hotfix
		if(pc.getStatusMinutes("Liamme Disabled") <= 0)
		{
			pc.removeStatusEffect("Liamme Disabled");
			liammeBonus();
			return;
		}
		
		addDisabledButton(0,"Liamme","Liamme","Once a day is probably enough for the little ausar.");
		pc.removeStatusEffect("LIAMME_OUTFIT");
	}
}

//[Liamme]
public function approachLiamme():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	//Initial Intro
	if(flags["MET_LIAMME"] == undefined)
	{
		if(pc.isBimbo()) output("You smile happily at the sight of another " + pc.mf("cutie-pie","cute girl") + ". Maybe she wants to talk? ");
		else if(pc.isBro()) output("Your lips spread in a slow smile at the sight of a potential bedwarmer. ");
		else if(pc.isNice()) output("You smile as you consider the girl, yet another potential friend just waiting to be made. ");
		if(pc.isMischievous() || pc.isAss()) output("You smirk at the sight of the girl, yet another possible target for your near-irresistible Steele charm. ");
		output("She seems to be distracted enough by whatever she’s looking at, girlish laughs escaping her cushiony lips with every tap of the screen. With a slight spring to your step you walk over to where the blonde-maned beauty is sitting and ");
		if(pc.isTaur()) output("position your tauric-half as close to her as it can get without being intrusive.");
		else output("plop your [pc.ass] down right next to hers.");
		output(" The ausar’s fluffy, pointed ears spring upwards at the realization of your presence, with the rest of her body following suit.");

		output("\n\n<i>“Oh, hey!”</i> she exclaims, putting the small device she’s holding in her pocket and smiling your way, putting bright-white (and pointy) ivory on display, <i>“Need something?”</i>");

		if(pc.isBro() || pc.isAss())
		{
			output("\n\nYou give her a sultry look, running your eyes up her svelte frame past a hoodie that you guess is hiding a pair of B-cups, and right to a pair of big blue eyes. <i>“Not really,”</i> you tell her, leaning in a bit closer, a hand nearing her downy hair. <i>“Just wondering what a pretty ");
			if(pc.isAss()) output("bitch");
			else output("girl");
			output(" is doing all alone on the residential deck.”</i>");
		}
		else
		{
			output("\n\nYou give her a friendly look, trying not to make it obviously that you’re taking in her svelte frame and guessing that she’s hiding B-cups beneath it. At least you can see her big blue eyes. You ");
			if(pc.IQ() < 50) output("fumble for");
			else output("quickly improvise");
			output(" an ice-breaker.");
			if(pc.isBimbo()) output("<i>“Not really. You’re really cute, you know. Like... totally cute. I could just eat you up.”</i>");
			else if(pc.isNice()) output("<i>“I thought you could use some company. It’s not every day I stumble into someone so cute.”</i>");
			else if(pc.isMischievous()) output("<i>“You didn’t break out of jail, did you? Because you’re so cute it’s criminal.”</i>");
		}
		output("\n\nHer soft features flush red at your words as an unexpected laugh greets your ears. <i>“Uhm, hate to break it to you,”</i> she begins, causing you to cock an eyebrow, <i>“but I’m a guy.”</i>");
		output("\n\nYou’re quickly taken aback, a very tangible feeling of embarrassment overtaking your body thanks to your hasty assumption. Luckily, you don’t have to endure this pain for long, as the ausar gi- <b>boy</b> speaks up again, <i>“I’m flattered though, really.”</i>");
		output("\n\nOh, well that softens the blow a bit, helping you to regain your composure and ");
		if(pc.isTaur()) output("straighten yourself");
		else output("sit up straight");
		output(". He smiles at you again, <i>“It’s like a compliment whenever someone makes that, uh, ‘mistake.’”</i>");

		output("\n\nYou grin back at him and decide to say something before all your dignity is lost, <i>“In that case: you’re welcome.”</i> Your eyes dart down for a split second and are able to spot a well-hidden, but visible bulge " + (liammeSkirted() ? "under his skirt" : "in his pants") + ".");
		output("\n\nHis tail starts to wag enough that it becomes visible, appearing on either side of him as it sways, coloured a deep-blonde like the rest of his fur. <i>“I’m Liamme, by the way,”</i> he says, pointing a furry thumb at his own chest, <i>“Most people call me Lia though.”</i>");
		output("\n\nYou introduce yourself as <i>“[pc.name]”</i> in turn.");

		output("\n\nThere’s an awkward silence hanging in the air after your introductions while both of you wait for someone to say something, <i>anything</i>. Finally, the golden-haired ausar says: <i>“Hey, I know you weren’t really expecting, you know, </i>me<i> when you walked over here. I wouldn’t mind if you decided to leave or anything. It’s okay, really.”</i> Liamme gazes at you for a long second, deep-blue eyes looking at you with... lust, more than anything. His feminine features turn to a welcoming smile as a sly, fuzzy hand reaches for ");
		if(pc.isTaur()) output("your flank");
		else output("your [pc.thigh]");
		output(".");
		output("\n\nWell, if you were to guess, he doesn’t really want you to leave. Your eyes dart down once more to see that cleverly hidden bulge growing.");
		output("\n\nJust a guess.");
		processTime(5);
		//[Appearance]
		//[Talk] Have a chat with Liamme.
		//[Sex] There isn’t anything to suggest Lia </i>isn’t<i> down for a good lay.
		//[Exhibition] Try to have a little exhibitionistic fun with this trappy puppy. //PC can’t be a taur, requires Liamme to have been sexed once, all talk scenes to be complete, moderate exhib score, misch/hard. 
		flags["MET_LIAMME"] = 1;
		liammeMenu();
	}
	//Repeatable Intro
	else
	{
		output("You wave back at the ausar boy, flashing him a smile before you start to walk over.");
		output("\n\n<i>“Hey, [pc.name],”</i> he says as you approach him, <i>“Nice to see someone who likes me around here.”</i>");
		output("\n\nAs you take a ");
		if(pc.isTaur()) output("comfortable position");
		else output("seat");
		output(" next to him, Liamme rests an elbow on the back of the bench and leans in closer to you, <i>“So, here for anything specific, or just a friendly chat?”</i> You look down to see the femboy’s bulge becoming more pronounced while his big blue eyes narrow with lust.");
		processTime(2);
		liammeMenu();
	}
}

public function liammeMenu():void
{
	clearMenu();
	//[Appearance]
	addButton(0,"Appearance",liammeAppearance,undefined,"Appearance","Check out the lil’ trap.");
	//[Talk] Have a chat with Liamme.
	addButton(1,"Talk",talkToLiamme,undefined,"Talk","Have a chat with Liamme.");
	//[Sex] There isn’t anything to suggest Lia </i>isn’t<i> down for a good lay.
	if(pc.lust() >= 33) addButton(2,"Sex",fuckLiamme,undefined,"Talk","There isn’t anything to suggest Lia </i>isn’t<i> down for a good lay.");
	else addDisabledButton(2,"Sex","Sex","You aren’t aroused enough for that.");
	//[Exhibition] Try to have a little exhibitionistic fun with this trappy puppy. //PC can’t be a taur, requires Liamme to have been sexed once, all talk scenes to be complete, moderate exhib score, misch/hard.
	if(flags["SEXED_LIAMME"] != undefined && flags["LIAMME_TALK_SELF"] != undefined && flags["LIAMME_TALK_TAVROS"] != undefined && flags["LIAMME_TALK_MODS"] != undefined && pc.exhibitionism() >= 33 && (pc.isAss() || pc.isMischievous())) 
	{
		if(liammeSkirted()) addButton(3,"Exhibition",liammeExhibitionism,undefined,"Exhibition","Try to have a little exhibitionistic fun with this trappy puppy.");
		else addDisabledButton(3,"Exhibition","Exhibition","You meet all the requirements for this scene, but Liamme doesn’t - he needs to be wearing a skirt!\n\nMaybe tomorrow he will wear a more obliging outfit...");
	}
	else addDisabledButton(3,"Exhibition","Exhibition","Requires:\n*Non-‘taur\n*Sexed Liamme\n*Talking to him thoroughly\n*Moderate Exhibition level\n*Mischievous or Hard personality.");
	addButton(14,"Leave",leaveLiamme);
}
public function backToLiammeMain():void
{
	clearOutput();
	showLiamme();
	output("You let Liamme know you’d like to do something else.");
	clearMenu();
	liammeMenu();
}

public function leaveLiamme():void
{
	clearOutput();
	showLiamme();
	output("You tell the femboy you have somewhere else to be. He tells you that’s fine with him and bids you farewell, giving you a smile and a wink as you walk away.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Appearance
public function liammeAppearance():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("Liamme is a ");
	if(silly) output("smol");
	else output("5\' 7\"");
	output(" ausar male. He’s made sure to accentuate his feminine features as much as possible: from the fluffy wolf-ears that part his lengthy, golden hair, past his blue eyes and the soft, welcoming curves of his face, right down to his pillowy, kissable lips. Hell, you’re sure your nose is picking up on the scent of a little perfume on this trappy doggy; he even <i>smells</i> feminine!");
	output("\n\nHis utterly flat chest, fair skin, and svelte body are hidden by a blueish-green hoodie, and ");
	if(liammeSkirted()) output("skirt shows off a fair bit of his squishy, jiggly, and rather impressive looking butt");
	else output("his pants manage to contain a squishy, jiggly, and rather impressive looking butt");
	output(", along with a shapely pair of thighs. His effeminate rear draws attention away from his swiftly swishing, downy tail. The telltale bulge of his cute, knotty ausar cock and tight little sack is well hidden by Lia’s ");
	if(liammeSkirted()) output("skirt");
	else output("pants");
	output(", and opposite his dick rests a plush, supple tailhole, ready to accept any big cocks that come his way.");
	output("\n\nHis arms and legs are partially covered with a similar rich-blonde fluff that covers his head, like most ausar.");

	liammeMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re doing that right now.");
}

//Talk
public function talkToLiamme():void
{
	clearOutput();
	showLiamme();
	output("What will you talk about?");
	
	liammeTalkMenu();
}
public function liammeTalkMenu():void
{
	clearMenu();
	addButton(0,"Him",talkToLiammeAboutHim,undefined,"Him","Ask Liamme about himself.");
	addButton(1,"Tavros",talkToLiammeAboutTavros,undefined,"Tavros","Ask Liamma about Tavros and how he got here.");
	addButton(2,"Mods?",talkToLiammeAboutMods,undefined,"Mods?","Ask him about mods. He’s gotta have used them, right?");
	addButton(14,"Back",backToLiammeMain);
}


//Him
public function talkToLiammeAboutHim():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("You ask Liamme about himself, telling the ausar that you’d like to know a little more about him.");
	output("\n\nHe smiles wide at your words, tail wagging violently, apparently pleased at the fact you’re interested in him.");
	output("\n\n<i>“Well if you couldn’t tell, I live here, on Tavros I mean. I work here too,”</i> he says, rubbing the back of his neck nervously, <i>“but that’s not really interesting, is it?”</i> There’s a long pause after that as Liamme tries to get his thoughts in order. Sighing, he starts to talk again, <i>“I... I like to be </i>pretty<i>, you know? It feels nice looking like this, and all the attention people give me isn’t bad either.”</i>");
	output("\n\n");
	if(pc.isNice() || pc.isMischievous()) output("You tell him he does look very nice. He nods and beams at that before he speaks up once more.");
	else output("Giving him a nod, you encourage him to move on. Liamme lets out an unsure <i>“Right,”</i> before continuing.");
	output("\n\n<i>“I grew up on Ausaril. Most people guess that, though. I mean, it’s either that or some no-name colony in the middle of nowhere. Other than that, there’s not much to tell: I don’t do much besides work and sit around. It gets kind of boring here without someone cool around, but that’s probably my fault.”</i>");
	output("\n\nLia looks at you eagerly for any response after he’s finished, and you thank him for sharing what he could.");
	processTime(4);
	flags["LIAMME_TALK_SELF"] = 1;
	liammeTalkMenu();
	addDisabledButton(0,"Him","Him","You’re talking about that right now.");
}

//Tavros
public function talkToLiammeAboutTavros():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("<i>“Tavros?”</i> Liamme asks with a shrug of his shoulders and a furrow of his brow, <i>“It’s alright. The people here are... exotic to say the least. Have you ever been to the merchant deck? There’s a naked butterfly-lady flying around the store I got my col-”</i> He catches himself in the middle of whatever he was saying, and ultimately decides to move past it, <i>“Anyway, I work here too, at a coffee shop, of all places, morning shifts, and it’s always busy there.”</i>");
	output("\n\nThe ausar boy sighs and rests his chin in his hands.");
	output("\n\n<i>“I honestly thought I’d be out of here by now... and out there.”</i>");
	output("\n\nYou ask Liamme what he means.");
	output("\n\n<i>“Well when I left Ausaril to come here, I thought I was going to find myself a crew to become a part of, or some sort of job on a rush planet. Wasn’t expecting to get weighed down here so fast.”</i>");
	output("\n\nTaking in his words for a moment, you see your ausar friend staring longingly and blankly at the wall opposite the two of you. <i>“You mentioned leaving Ausaril?”</i> you say, making Liamme jump as his trance is broken. ");
	output("\n\n<i>“Yeah,”</i> he begins, <i>“I left as soon as I could and came here, just a lot of bad memories there. I didn’t want to stick around.”</i>");
	output("\n\nThe poor femboy sounds pretty melancholy after that, leading you to think you should change the subject. ");
	processTime(5);
	flags["LIAMME_TALK_TAVROS"] = 1;
	liammeTalkMenu();
	addDisabledButton(1,"Tavros","Tavros","You’re talking about that right now.");
}

//Mods
public function talkToLiammeAboutMods():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("Looking at Liamme’s face, hearing his voice, and seeing the swell and curves of ");
	if(silly) output("dat ass");
	else output("his ass");
	output(", you can find no possible way that someone can <i>naturally</i> be oozing this much femininity. So, you ");
	if(pc.isNice()) output("tentatively");
	else if(pc.isMischievous()) output("half-jokingly");
	else output("bluntly");
	output(" ask him if he’s had any sort of mod work done.");

	output("\n\n<i>“Well...”</i> he starts, grabbing a handful of his own downy mane, <i>“I </i>have<i> taken a dose of Estrobloom. It changed my face and voice a little, but it didn’t do anything crazy like give me tits.”</i> The ausar snickers and shoots a lusty, all-too-knowing grin your way, <i>“I think it gave me a nicer ass though, but I could use someone else’s opinion on that.”</i>");
	output("\n\nYou return his lascivious smirk in kind, <i>“Is that an invitation?”</i>");
	output("\n\nLia’s able to give you a cute little <i>“Maaaaybe”</i> before his voice breaks into a laugh. The laughter quickly becomes contagious, and you find yourself chuckling along with the ausar for a few seconds before things quiet again. Unlike before, the silence is more pleasurable than anything else; the afterglow of your laughter seeming to heal your social wounds.");
	output("\n\nYou let the quiet pass and ask the femboy if he’s ever thought of going all out and transitioning.");
	output("\n\n<i>“Me? A girl? Nah,”</i> he states, <i>“I don’t think I’d ever go full female, even if I could keep my cock.”</i> He pauses and gives you a familiar look, filled with desire, <i>“I like being Liamme, and besides, I can already pick up some nice " + pc.mf("guys","girls") + " looking like this.”</i> As if commanded to by his words, Lia’s fuzzy blonde tail starts to wag a bit faster.");
	processTime(4);
	flags["LIAMME_TALK_MODS"] = 1;
	liammeTalkMenu();
	addDisabledButton(2,"Mods?","Mods?","You’re talking about that right now.");
}

//Exhibition
public function liammeExhibitionism():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	showBust("LIAMME_SKIRT");
	output("Looking down, you can see Liamme’s dressed a bit differently than he usually is, with a skirt replacing his usual pair of jeans. You grin at the sight of all that bare ausar thigh put on display, so smooth and tantalizing, and all within an arm’s reach.");
	output("\n\nYou turn your gaze to meet Liamme’s, making sure to give the femboy a lusty smile to let him know you’re down for a little fun, bringing your hand down to a naked, shapely thigh. He grins right back at you with growing ardor, his big blue eyes narrowing with desire.");
	output("\n\n<i>“Wanna head back to my place?”</i> the trappy boy asks, letting his golden-hued tail wag gaily behind him as he bites down on his lower lip.");
	output("\n\n<i>“No,”</i> you tell him, starting to move your hand further up the femboy’s shapely leg, gliding across his smooth, fair skin until you find your fingertips under his skirt, <i>“I think we should stay right here.”</i>");
	output("\n\nLiamme’s look changes from one of want to one of worry, his once happily wagging tail attempting to tuck itself behind him and his fluffy hands reaching down to grasp at the hem of his skirt. <i>“We can’t out here, people are gonna, you know, </i>see<i> us,”</i> he whispers, frantically looking around to see if anyone is watching.");
	output("\n\n<i>“I know,”</i> you respond, giving him your most wanton smirk and pushing your hand further up his skirt until your fingers make contact with his pantie-clad bulge. Liamme gasps when you grab at his still-clothed cock; you can already sense the heat pouring off his well-contained package, feeling it grow against your palm, pulsing with each beat of the trappy ausar’s heart. You smile at the femboy’s barely restrained arousal, listening to his breath go ragged as your digits finally reach the edge of his panties. With a little yank of his undergarments, Liamme’s cute, knotted doggy-dong pops free, tenting his pretty little skirt.");
	output("\n\nYou keep your [pc.eyes] locked on your lover’s and ever-so slowly wrap your fingers around his prick, one by one until supressed little whimpers start to force their way past the ausar’s cushiony lips, practically begging for more, fair cheeks burning red. For a moment you ponder letting off, and allowing the happy trappy ausar go on his way, but then a fuzzy blonde hand grabs your wrist, keeping your hand where it is.");
	output("\n\nSo much for that.");
	output("\n\nYou smile at Liamme’s newfound eagerness, and promptly lean yourself into him, trapping him in a kiss while you start to move your wrist. The blushing femboy accepts your embrace with fervor, letting his flat, agile tongue slip into your mouth. He moans quietly into your [pc.lipsChaste] as you steadily jerk him off, your palm gently caressing his cockflesh while the heat of his crotch caresses your skin in turn.");

	output("\n\nIt isn’t long before you draw the attention of a few passersby, each one that walks past you and Liamme lying strewn across the bench giving you an odd, curious, or lustful look before moving on. The trappy ausar keeps his eyes closed the whole time in an attempt to stay focused on nothing but your dexterous grip on his knotty dong. You can only imagine the thrill this pent-up pup is feeling right now, with all the public attention and his cock on display for the world to see, pressed down against the bench while you work his pre-leaking tool in your grasp.");

	output("\n\nBefore too long, Liamme gives into the pressure of his public hand-job session, letting loose a suppressed grunt before his cock starts to spasm in your hand. You can feel his knot swell between your fingers as the first few shots of his salty load soil his skirt. He whines and whimpers into your mouth as his orgasm continues, shivering with bliss in your warm embrace. Most of his cum forms a big wet splotch on his cute little outfit while the rest of it manages to coat your hand, still jerking him off until he starts to wind down.");

	output("\n\nLiamme’s left panting after that, quietly, his fluffy tail swinging in an off-beat rhythm, trying to pull himself back together after emptying his tight, trappy sack all over his clothes and your hand. Speaking of which, you quickly retract your digits from the femboy’s cock and out from under his dress, still covered in his potent spunk. ");
	var DEPENDANT_CUM:uint = 2;
	if(pc.isNice() || pc.isBimbo() || pc.isCumSlut()) 
	{
		output("Smiling and keeping eye contact with Liamme as he tries to conceal his softening erection, you bring your fingers to your [pc.lipsChaste] and let your [pc.tongue] trail along your fingers, licking them clean one by one, taking his seed into your mouth.");
		//Syri seems like an appropriate stand-in...
		pc.loadInMouth(chars["SYRI"]);
	}
	else output("Smiling, you lean forwards again and present your seed-slick fingers to the femboy that coated them. Liamme stares at you lustfully for a moment before he tentatively reaches his tongue to the tips of your extended digits, and licks, quickly flicking it across the ends of your fingers. The cum-soaked trap pulls his oral organ back between his lips and his own salty alabaster into his mouth along with it, letting his eyes close shut as he revels in his own flavor for a moment. The ausar’s blue eyes open wide soon after, right before he leans forward and his pouty lips suddenly wrap around you fingers, suckling your sperm-smothered digits until they’re good and clean, excitement written across his face and hungry gaze. Once he’s had his fill, the femboy relents and takes his mouth away from your hand, leaving a little trail of saliva between your fingers and his tongue.");
	output(" The trappy ausar before you tries to form a little smirk despite his beet-red cheeks and burning embarrassment, managing to talk to you between each heave of his flat chest, <i>“I’m... gonna get you good... for this one, [pc.name].”</i> He pauses, sitting himself upright and covering up his cum-soaked skirt, <i>“But for now, I need to go get cleaned up.”</i>");
	output("\n\nYou tell the effeminate ausar that sounds like a good idea as you watch him stand up, still trying to hide the big, wet splotch on his clothes. He manages to give you a little wave goodbye and quickly makes his way back to his appartment, legs still a little wobbly with post-climax.");
	//[Next] //Should take the PC out of his menus, adds lust and exhib.
	IncrementFlag("LIAMME_EXHIB");
	processTime(20);
	pc.changeLust(10);
	pc.exhibitionism(2);
	applyLiamDisable();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function applyLiamDisable():void
{
	pc.createStatusEffect("Liamme Disabled");
	if(hours <= 5) pc.setStatusMinutes("Liamme Disabled",240);
	else if(hours < 20) pc.setStatusMinutes("Liamme Disabled",960);
	else pc.setStatusMinutes("Liamme Disabled",500);
}

//Fuck
//[Sex] //Liamme can only be sexed once a day before he “goes to work” and can’t be found again until 12:00 the next day.
public function fuckLiamme():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("Well, seems like Liamme’s as down for a good fuck as you are, and you decide to tell the ausar you’d like to go to his place if he’s up for a little fun. He most certainly is up for whatever you want to do: his ears perk right up, accentuating the sudden flailing of his fluffy tail as his face turns to a display of sexual ardor, looking right into your [pc.eyes].");
	output("\n\n<i>“Sure,”</i> he says, tail going into overdrive as he stands up, <i>“My place isn’t too far from here.”</i>");
	output("\n\nLiamme extends a hand covered in velvety fuzz, which you happily accept, ");
	if(!pc.isTaur()) output("standing up and ");
	output("taking hold of his faux paw. His grip is gentle: firm enough to lead you to his place, but fair enough to make sure his claws don’t touch your [pc.skinFurScales].");
	output("\n\nAll the way to Lia’s apartment you’re given quite the view of his cushy ass, watching it jiggle with every step he takes, even as his tail sways behind it. Sometimes his fluffy blonde tail brushes against ");
	if(pc.isTaur()) output("you.");
	else 
	{
		output("your ");
		if(pc.hasCock()) output("bulge");
		else output("crotch");
		output(", resulting in increasingly libidinous looks from the ausar.");
	}

	output("\n\nOnce you finally reach his abode, Liamme hastily opens the door, barely giving it time to hiss open before inviting you in. As soon as you’re inside the trappy ausar leads you to his bed.");
	if(flags["SEXED_LIAMME"] == undefined) output(" You manage to get a look at his place as he leads you around: it’s not very neat, but very comfortable looking, or at least by his standards.");
	output(" By the time you’re there Liamme is barraging you with kisses, pressing his plump lips against yours as his arms wrap around the back of your neck. You quickly settle into the embrace, accepting his squirming tongue into your mouth and returning his kiss forcefully. ");
	output("\n\nYou better decide what to do with this lusty femboy, fast.");

	//[Buttfuck] Shove an appropriately sized dong up Liamme’s jiggly butt. //Requires a cock above or equal to 6 inches, can’t be naga or taur.
	//[Get BJ] Receive some oral pleasures from the plump-lipped ausar. //Requires cock.
	//[RideCock] Suck </b>and<b> ride Liamme’s puppy cock! //Can’t be naga or taur.
	liammeSexMenu();
}

public function liammeSexMenu():void
{
	clearMenu();
	if(pc.hasCock() && !pc.isNaga() && !pc.isTaur())
	{
		var x:int = pc.cockThatFits(liammeCapacity())
		if(x >= 0 && pc.cocks[x].cLength() >= 6) addButton(0,"Buttfuck",buttfuckLiamme,undefined,"Buttfuck","Shove an appropriately sized dong up Liamme’s jiggly butt.");
		else addDisabledButton(0,"Buttfuck","Buttfuck","Requires a cock that both fits inside him and isn’t under six inches long. Nagas and centaurs need not apply..");
	}
	else addDisabledButton(0,"Buttfuck","Buttfuck","Requires a cock that both fits inside him and isn’t under six inches long. Nagas and centaurs need not apply..");

	if(pc.hasCock()) addButton(1,"Get BJ",getLiammeBlown,undefined,"Get BJ","Receive some oral pleasures from the plump-lipped ausar.");
	else addDisabledButton(1,"Get BJ","Get BJ","You need a penis for this!");

	if(!pc.isTaur() && !pc.isNaga()) addButton(2,"Ride Cock",rideLiammesSuperGayCock,undefined,"Ride Cock","Suck </b>and<b> ride Liamme’s puppy cock!");
	else addDisabledButton(2,"Ride Cock","Ride Cock","This scene does not support nagas or tauric creatures.");

	if(pc.hasHardLightEquipped()) addButton(3,"PitchStrapon",straponLiammipoo,undefined,"PitchStrapon","Give Liamme a good ol' fashioned pegging with your hardlight strapon!");
	else addDisabledButton(3,"PitchStrapon","PitchStrapon","Requires hardlight strapon.");

	addButton(14,"Back",backToLiammeMain);
}

//Buttfuck
//[Buttfuck]
public function buttfuckLiamme():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	var x:int = pc.cockThatFits(liammeCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	if(!pc.isCrotchExposed()) output("Before you can make a move, Liamme starts grabbing at your [pc.crotchCover], steadily pulling all your clothing off until you’re good and bare before him. ");
	output("Your ausar lover runs his downy furred hands all over your body as your kiss continues: up and down your sides, ");
	if(pc.biggestTitSize() >= 1) output("squeezing at your [pc.chest], and ");
	else output("his hands");
	output(" caressing your hips. Then Liamme reaches what he’s <i>really</i> after. His furred fingers wrap around your slowly-stiffening shaft");
	if(pc.cockTotal() > 1) output("s");
	output(" one by one, getting a firm grip on");
	if(pc.cockTotal() > 1) output(" one of");
	output(" your love-muscle");
	if(pc.cockTotal() > 1) output("s");
	output(" before he starts to move his wrist, slowly jerking you off. The motions of the ausar’s fluffy hand have you whimpering and moaning quietly into the femboy’s mouth, your [pc.cockNoun " + x + "] fully erect before too long.");
	output("\n\nBetween tongue-filled kisses, Liamme manages to moan out his desires. <i>“I want this in my ass,”</i> he whispers lustfully, tightening his grip on your cock. You manage to form a smirk amidst the flurry of the trappy ausar’s plump lips after hearing that.");

	output("\n\nDeciding it best to be as straightforward as he was, you grab Liamme’s slim waist, turn him around, and send him tumbling face-first onto the mattress. He yelps with surprise when he hits the bed, reeling from the sudden change of scenery. Once he regains his composure and realizes he’s going to get exactly what he asked for, he turns his head, looking back at you with a lewd smile, nothing but lust in his eyes. You return his grin and kneel down on the mattress, straddling his shins. Knowing what’s going to happen next, Liamme reaches down, getting a good grip on the hem of his ");
	if(liammeSkirted()) output("skirt");
	else output("pants");
	output(" while you grasp at his shapely thighs. With your combined efforts, the femboy’s ");
	if(liammeSkirted()) output("skirt");
	else output("jeans");
	output(" come off easily, along with the pair of panties beneath ");
	if(liammeSkirted()) output("it");
	else output("them");
	output(", to reveal Liamme’s squishy, jiggly butt.");
	output("\n\nThe trappy ausar looks back at you with the same ardor-filled smile he was giving you before, licking his lips as his gaze meets your stiffening cock");
	if(pc.cockTotal() > 1) output("s");
	output(", golden-hued tail swaying lazily. You can already feel your thoughts becoming hazy as lust fills your mind, [pc.eyes] locked on Liamme’s oh-so gropable ass. Your hands dart down, your fingers digging into ausar booty until you force a shuddering moan out of your lover’s mouth. You take a few moments to knead the ausar’s squeezable behind in your dexterous grip, stopping every once in awhile to give his lower cheeks a firm slap, watching his assflesh jiggle as his moans and gasps fill the air. Before you know it, your [pc.cocks]");
	if(pc.cockTotal() == 1) output(" is");
	else output(" are");
	output(" as hard as diamonds, ready to sink into Liamme’s tailhole, and that’s just what you’re going to do.");

	output("\n\nYou shift your hands from your lover’s ass to his girly hips, getting a firm grip before you yank his shapely butt upwards, level with your [pc.cock " + x + "]. Liamme looks back at you once more, the same lascivious grin on his face. <i>“C’mon,”</i> he says softly, reaching a fluffy blonde hand back to spread his ass for you, giving you a good view of his plush, supple asshole, <i>“Give it to me.”</i> He brushes his tail along your chin as if to taunt you, and you quickly take hold of the fluffy blonde appendage, stroking it until its owner starts to whimper.");
	output("\n\nNot one to deny such a pretty, pretty ausar his wishes, you take hold of your [pc.cock " + x + "] and drop it into the crack of Liamme’s ass. You rock your hips back, dragging your tool through the embrace of the femboy’s cheeks right until your [pc.cockHead " + x + "] meets his pucker. The trappy ausar squirms with anticipation when your cockhead brushes against his tailhole, eager to get things started. Tightening your grip on his spacious hips, you give Liamme what he wants and start to push your [pc.hips] forward.");
	
	output("\n\nIt barely takes any pressure to penetrate the femboy’s supple entrance, your [pc.cockhead " + x + "] easily slipping into Liamme’s pucker with a groan of pleasure from the puppy. Looks like this trappy ausar’s a real buttslut, at least to the point where he can relax enough to let cock slip into him this easily. You don’t let up and start to rock your hips forward, shoving more and more of your [pc.cock " + x + "] into your lover’s butt, making him cry out with delight, furry fists clenching with each inch you work into him. <i>“Fuck yeah,”</i> he moans as you finally bottom out inside him, ");
	if(pc.hasKnot(x)) output("[pc.knot " + x + "] teasing his plush pucker, ");
	pc.cockChange();

	output("<i>“That’s goooooood.”</i> You smile at his words of approval and give the ausar a firm slap on the ass. He yelps as your palm reddens his jiggly butt, his tailhole clamping down on your [pc.cock " + x + "], loosing a lewd groan from your lips. Turning to face you again, Liamme flashes you a grin, <i>“You’re not gonna leave my poor ass waiting, are you?”</i>");
	if(pc.isNice()) output("\n\n<i>“Of course not,”</i> you reassure the femboy, giving his recently-spanked bottom an affectionate rub.");
	else output("\n\nYou give his already punished bottom another rough slap, returning his smirk, <i>“I’ll get to it when I get to it.”</i>");

	output("\n\nStarting to pull your [pc.hips] back, you drag your [pc.cock " + x + "] along Liamme’s inner walls, setting him moaning and whimpering as he’s emptied. By the time your glans reach the femboy’s asshole again, he’s already panting, whining needily, his pucker convulsing like it’s trying to draw your [pc.cock " + x + "] back into him. The ausar starts to push his hips backwards, attempting to spear himself on your turgid rod, grunting and moaning with each wiggle of his girly sides. You help the femboy along and begin to thrust your cock back into him, finding yourself groaning with bliss as Liamme’s ");
	if(silly) output("boi pussi");
	else output("bootyhole");
	output(" squeezes at your [pc.cock " + x + "]. Your lover’s own knotty doggy-dong jumps in attention, dispensing a warm glob of white pre on his sheets when your [pc.cockHead " + x + "] passes over the little ball of his prostate.");

	output("\n\nOnce your shaft is well sheathed inside of Liamme’s ass again, you start to roll your hips, dragging your dong in and out of the trappy ausar’s ");
	if(silly) output("yaoi-hole");
	else output("supple tailhole");
	output(" at an increasingly vigorous pace until you’re both moaning.");
	if(pc.balls > 0) 
	{
		output(" Liamme’s balls slap against your own rhythmically with each inward thrust.");
		if(silly) 
		{
			output(" Wow, your balls are touching; that’s pretty gay.");
			if(pc.isBro()) output(" Luckily, you remember to say, <i>“No homo.”</i>");
		}
	}
	output(" Your body struggles to keep up with your lust-hazed mind, your [pc.hips] moving at a blinding pace, pounding cushy ausar-ass with a desire-driven fervor, able to hear nothing but Liamme’s ceaseless cries of <i>“Yeeeees, yeeeeees!”</i> So lost in your own craving for ausar booty, you’re caught by surprise when the femboy’s asshole clamps down around your cock with near-orgasmic tightness, causing you to groan loudly. Your [pc.ears] are greeted by an ear-pleasing cry of pleasure as Liamme’s climax ensues, his tight little sack emptying, knotty cock painting his sheets alabaster.");

	//hasKnot:
	if(pc.hasKnot(x))
	{
		output("\n\nWith your lover’s inner walls clamping so snugly around your [pc.cockNoun " + x + "], you can already feel your [pc.cum] start to pool in your urethra. Before all is lost, you slam your hips forward, your turgid knot forcing Liamme’s already gaping tailhole wide open, drawing a renewed chorus of pleasured cries from the femboy as he’s stretched to his limits. With another good jerk of your hips, your [pc.knot " + x + "] slips into his pucker, leaving the trappy ausar to whine and whimper at the sheer size of your breeder’s knob. It was too late to stop your orgasm before, and it’s certainly too late now: your [pc.hips] buck into Liamme’s jiggling ass, [pc.cocks] spasming as you blow your load inside that lusty femboy’s freshly-knotted hole.");
		if(pc.cumQ() >= 1500) output(" You paint the pretty boy puppy’s pucker [pc.cumColor], leaving the ausar to whimper at the sensation of your hot [pc.cumNoun] filling him. Under the tremendous pressure of your equally tremendous bounty of [pc.cumNoun], Liamme’s flat tummy starts to distend, swelling until it’s well rounded and full of your seed.");
		else output("You paint the pretty boy puppy’s pucker [pc.cumColor], leaving the ausar to whimper at the sensation of your hot [pc.cumNoun] filling him. [pc.Cum] pools in his tailhole as your orgasm continues, the trappy boy lying there panting while you empty your seed into him.");
	}
	//noKnot:
	else
	{
		output("\n\nWith your lover’s inner walls clamping so snugly around your [pc.cockNoun " + x + "], you can already feel your [pc.cum] start to pool in your urethra. Before all is lost, you slam your hips forward, sending your turgid cock as far into Liamme’s tailhole as it will go, drawing a renewed chorus of pleasured cries from the femboy as he’s stretched to his limits and leaving the trappy ausar to whine and whimper at the sheer girth of your tool. It was too late to stop your orgasm before, and it’s certainly too late now: your [pc.hips] buck into Liamme’s jiggling ass, [pc.cocks] spasming as you blow your load inside that lusty femboy’s sodden hole.");
		if(pc.cumQ() >= 1500) output(" You paint the pretty boy puppy’s pucker [pc.cumColor], leaving the ausar to whimper at the sensation of your hot [pc.cumNoun] filling him. Under the tremendous pressure of your equally tremendous bounty of [pc.cumNoun], Liamme’s flat tummy starts to distend, swelling until it’s well rounded and full of your seed.");
		else output(" You paint the pretty boy puppy’s pucker [pc.cumColor], leaving the ausar to whimper at the sensation of your hot [pc.cumNoun] filling him. [pc.Cum] dribbles from his tailhole as your orgasm continues, the trappy boy lying there panting while you empty your seed into him.");
	}
	output("\n\nLiamme’s barely able to talk after all that, with only senseless babbling making its way past his pouty lips. You assume most of it is pleased, or thankful, at the very least. Smiling down at your ");
	if(pc.hasKnot(x)) output("well knotted");
	else output("cum-filled");
	output(" lover, you give his ass cheek an affectionate little rub, drawing forth a shuddering breath from the tired, trappy puppy. You bend yourself over him, delivering a little kiss to the back of his neck and wrapping your arms around his ");
	if(pc.cumQ() >= 1500) output("swollen ");
	output("tummy. Liamme quickly settles into your embrace, giving you a smirk over his shoulder before blue eyes flutter shut, ready to sleep ");
	if(pc.hasKnot(x)) output("off your knot");
	else output("off the afterglow of his orgasms");
	output(", and you feel ready to do the same.");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",afterLiammeButtsmex);
}

public function afterLiammeButtsmex():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("When you wake, you’re sprawled out across Liamme’s bed, a fuzzy feeling of pleasure still tingling in your loins. Turning your stiff neck in a few different directions, you see a familiar, happy blonde ausar pulling on his panties. You groan and stretch, and the commotion you make gets Lia’s attention, the femboy quickly turning towards you as he reaches for the rest of his clothes.");
	output("\n\n<i>“Oh, you’re awake!”</i> He exclaims before leaning down and planting his lips right on your cheek. You smile at the little display of affection and sit yourself upright, yawning as you do so. <i>“Hey, uh, I gotta start getting ready for work soon,”</i> Liamme tells you, a look of disappointment on his face, <i>“But this was really fun, we should do it again sometime.”</i>");
	output("\n\nLiamme’s face quickly returns to a grin, though less lascivious this time and more pleased, <i>“Mind walking me back to the plaza?”</i>");
	output("\n\n");
	if(pc.isMischievous()) output("You tell him you think you have the time, your voice thick with sarcasm.");
	else if(pc.isAss()) output("You groan at the prospect of having to get up already, but oblige.");
	else output("You happily accept his proposition.");
	processTime(80+rand(30));
	IncrementFlag("SEXED_LIAMME");
	applyLiamDisable();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Blown
//[Get BJ]
public function getLiammeBlown():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("You reach down, grabbing for the hem of Liamme’s hoodie and the t-shirt beneath it before you start to pull up. Your kiss is interrupted for a moment as the sweatshirt is pulled over his head, popped over his blonde-furred ears, and quickly tossed aside. The ausar smiles as his completely flat chest is bared before you and returns to the kiss, though this time Liamme’s hands grasp at his own ");
	if(!liammeSkirted()) output("pants");
	else output("skirt");
	output(". He manages to pull ");
	if(!liammeSkirted()) output("them");
	else output("it");
	output(" down while your tongue-tying embrace continues, revealing a frilly pair of blue panties that are removed along with the rest of his clothes, allowing his tail to wag that much faster.");
	output("\n\nAfter his cute, knotty cock pops free, Lia presses himself into you, said knotty dong squeezed between your [pc.belly] and his flat tummy as a pair of furred hands start to work their way along your body.");
	if(!pc.isCrotchExposed()) output(" The canine femboy does the same thing you did to him and reaches for your [pc.crotchCover] to pull it away until you’re just as naked as he is.");
	else output(" Already as naked as the canine femboy before you is, Liamme grasps at all your curves and mounds.");
	output(" You move your arms to wrap around the small of his back, pulling him just a bit closer.");

	output("\n\nSuddenly, the trappy little ausar leaps up in your arms, wrapping his legs around your back, depressing the supple flesh of his pillowy thighs against your [pc.hips]. ");
	if(!pc.isTaur())
	{
		output("You find yourself falling onto the edge of the nearby bed as you lose your balance, and end up with Liamme straddling your lap, his arms wrapped around your nape once more. Your rapidly stiffening [pc.cocks] rub");
		if(pc.cockTotal() == 1) output("s");
		output(" against the ausar’s in an accidental act of frottage, heat blossoming between your bodies.");
		if(silly) output(" It crosses your mind that this might be less gay if your dicks weren’t touching.");
	}
	else output("With your larger frame, it's easy for you to hold Liamme against your body where you stand.");
	output(" He’s kissing you more forcefully now, working his tongue all around your mouth while your lips smack together, again and again. You slide your [pc.hands] downward until they’re resting on Liamme’s soft, gropable butt. Time to get to work: you knead and squeeze ausar assflesh in your hands, occasionally giving it a double-pronged slap, making its owner mewl into your mouth and his ass jiggle.");

	output("\n\nFeeling Liamme’s tongue make its way through your mouth, feeling his plush lips pressed against yours only makes you wonder how good this little puppy’s mouth would feel around your [pc.cockNounBiggest]. Well, only one way to find out: you break the kiss, revealing Lia’s lust-filled and hungry gaze. You smile at the femboy and give his ass an affectionate squeeze.");
	output("\n\n<i>“How does putting that pretty mouth of yours to use somewhere else sound?”</i> you ask");
	if(!pc.isTaur()) output(", rocking your [pc.hips] to get your [pc.cocks] rubbing against his deep-red doggy-dong");
	output(".");

	output("\n\nLiamme’s breath shudders ");
	if(!pc.isTaur()) output("at the sensation of your cockflesh on his before he licks his perfect, dick-sucking lips");
	else output("as you knead his ass");
	output(" and answers, <i>“Sounds like a lot of fun.”</i>");
	output("\n\nThe eager ausar slips from your grasp, pulling himself from your lap to kneel on the floor");
	if(pc.isTaur()) output(" under your tauric half");
	output(". He waits there for a moment, staring up at you with a smile as his tail swishes back and forth behind him. The puppy-like display manages to draw a smirk from you. ");
	if(!pc.isTaur()) output("You spread your legs for Liamme, and he’s");
	else output("Liamme's");
	output(" quite eager to crawl in between them and take hold of you half-hard member. Your [pc.thighs] hug at the trappy boy’s shoulders as he strokes your cock with the oh-so soft fur on his hands, licking his lips while he eyes your [pc.cockNounBiggest]. He delivers a long kiss to the base of you dick, letting his tongue loll out to wet your ");
	var x:int = pc.biggestCockIndex();
	if(pc.hasKnot(x)) output("[pc.knot " + x + "]");
	else if(pc.hasSheath(x)) output("[pc.sheath " + x + "]");
	else output("[pc.cockNounSimple " + x + "]’s plinth");
	output(". You shudder as Liamme starts to work his tongue on your shaft, getting you hard as diamonds as he trails kisses and loving little licks all the way up to your [pc.cockHeadBiggest].");
	output("\n\nSay what you will about the trappy blonde ausar; he’s damn good with his mouth, and soon has you sinking backwards in bliss. He looks up at you with his big, blue, puppy-dog eyes and gives your cockhead a few more licks before wrapping his pillowy lips around it, resting his hands in his lap. Still lavishing your [pc.cock " + x + "] with his tongue, Liamme slides his way down your shaft, eliciting a few quiet moans from you. His plump lips caress your twitching [pc.cockNounSimple " + x + "] all the way down, right until your [pc.cockhead] reaches the back of his throat. Looks like Liamme’s trained his gag-reflex well enough. He waits there for a moment, swirling his tongue around the length of your cock, continuously coating it with a new layer of ausar spit.");
	if(!pc.isTaur()) output(" You’re able to smile down at the ardorous ausar between whimpers and extend your arm, placing your hand right between his fluffy ears.");
	output("\n\nHis manes is so soft to the touch, to the point where your hand can just sink into it... and start scritching and scratching at Liamme’s perky ears. The poor puppy whimpers and whines girlishly ");
	if(!pc.isTaur()) output("under the weight of your touch");
	else output("with your tool down his throat");
	output(", moaning softly onto your [pc.cock " + x + "], sending a shiver of pleasure rippling up your spine. Liamme starts to bob his head up and down your succulent shaft before he loses himself in his own pleasure, trailing his tongue along the bottom of your cock,");
	if(pc.hasKnot(x)) output(" teasing your knot with each trip down,");
	output(" tearing more than a few lewd groans from your [pc.lips] in the process. Your [pc.hips] roll subconsciously, dragging your dick in and out of Liamme’s maw");
	if(!pc.isTaur()) output("; at the same time you move the cock-sucking ausar’s head, forcing him on and off your [pc.cockNoun " + x + "] until he begins to whine and his cheeks bulge full of dong");
	output(".");

	output("\n\nBefore too long your once gentle hip-rocking is speeding up to a vigorous face-fucking. Liamme doesn’t seem to mind, letting you grab at his head and use his mouth like the perfect, wet, warm onahole it is as your [pc.belly] slaps against his face. The ausar boy whines and groans as you fuck his pretty face, every one of your own pleasured tones making his ears twitch excitedly. At this rate, you won’t be able to hold on much longer, but what’s the point holding on? You try to announce your impending orgasm to your lover, but all that comes out is senseless babbling that trails into a long moan. The bliss of climax overtakes your body in an instant, ecstasy flooding your mind like a dam holding back a wave of endorphins had broken. ");
	if(!pc.isTaur()) output("Grabbing Liamme’s head with both hands, you pull him down on your cock as far as his gag-reflex will allow, your [pc.cock " + x + "] spasming. ");
	output("Your ausar lover’s eyes flutter shut as your [pc.cum] starts to flow down his throat, eagerly accepting your bounty as your hips buck into his mouth, moaning and grunting.");
	output("\n\nYou ride out your orgasm for quite some time, Liamme’s gentle suckling seeming to extend your climax as he greedily swallows as much [pc.cum] as you’ll give him.");
	output("\n\nOnce you do finally come down, the femboy between your legs removes himself from your [pc.cock " + x + "] and ");
	if(!pc.isTaur()) output("opens his maw, showing you his mouth, filled to the brim with [pc.cumNoun], his tongue painted [pc.cumColor]");
	else output("crawls out from under you, opening his maw to show you his mouth, filled to the brim with [pc.cumNoun], his tongue painted [pc.cumColor]");
	output(". You smile at his display, [pc.chest] heaving as you bring a hand down to give Liamme an appreciative pet between his big blonde ears. He grins as your fingers run through his mane, and quickly gulps down your cum before returning his lips to your softening [pc.cockNoun] to lick up the rest of your seed.");
	output("\n\nYou’re content to let the puppy finish cleaning up, and let yourself fall backwards onto the bed. Liamme joins you on the mattress soon after, climbing atop your body and bringing his effeminate face close to yours.");
	output("\n\n<i>“Your cum tastes really good,”</i> he states plainly, blonde locks drooping down around your [pc.face], his voice barely more than a whisper, <i>“You should try some.”</i>");
	output("\n\nWith that, he’s pressing his cushy lips against your [pc.lips] again, that taste of [pc.cockNoun " + x + "] still potent on his tongue. You graciously accept the kiss and let your [pc.tongue] probe his mouth as his does the same to yours. [pc.CumFlavor] does your palate well, and you’re soon craving more. Alas, your flavorful tongue-tying ends when Liamme pulls back, smiling dreamily as he shimmies down to rest his head on your [pc.chest], fluffy mane caressing your [pc.skinFurScales].");
	
	var snowball:Number = (pc.cumQ() * 0.25);
	if(snowball > 100) snowball = 100;
	var ppLiamme:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppLiamme.hasCock()) ppLiamme.createCock();
	ppLiamme.createPerk("Fixed CumQ", snowball, 0, 0, 0);
	ppLiamme.cumType = pc.cumType;
	pc.loadInMouth(ppLiamme);
	
	output("\n\nYou can’t really keep your eyes open after all of that, and right now, you wouldn’t really mind falling asleep with Liamme to let your afterglow fade. ");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",liammePostBeej);
}

public function liammePostBeej():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("When you wake, you’re sprawled out across Liamme’s bed, a fuzzy feeling of pleasure still tingling in your loins. Turning your stiff neck in a few different directions, you see a familiar, happy blonde ausar pulling on his panties. You groan and stretch, and the commotion you make gets Lia’s attention, the femboy quickly turning towards you as he reaches for the rest of his clothes.");
	output("\n\n<i>“Oh, you’re awake!”</i> He exclaims before leaning down and planting his lips right on your cheek. You smile at the little display of affection and sit yourself upright, yawning as you do so. <i>“Hey, uh, I gotta start getting ready for work soon,”</i> Liamme tells you, a look of disappointment on his face, <i>“But this was really fun, we should do it again sometime.”</i>");
	output("\n\nLiamme’s face quickly returns to a grin, though less lascivious this time and more pleased, <i>“Mind walking me back to the plaza?”</i>");
	output("\n\n");
	if(pc.isMischievous()) output("You tell him you think you have the time, your voice thick with sarcasm.");
	else if(pc.isAss()) output("You groan at the prospect of having to get up already, but oblige.");
	else output("You happily accept his proposition.");
	processTime(80+rand(20));
	applyLiamDisable();
	IncrementFlag("SEXED_LIAMME");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



//Ride Cock
//[RideCock]
public function rideLiammesSuperGayCock():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("As your mouth is thoroughly filled with flat asuar-tongue, Liamme starts to push himself into you, to the point where you can feel his bulge steadily growing against your [pc.belly]. If you were to guess, this pent-up puppy needs a nice, warm hole to sheath his puppy-prick in; why not give him one? With a smirk slowly widening on your face, your hands dart down to Liamme’s slim waist and get a firm grip. In one smooth motion you turn the two of you around and push the ausar onto the mattress. Your kiss breaks as the femboy falls backwards, giggling like the horny piece of ass he is until he hits the bed. You join him on the mattress soon after, straddling his body on all fours, able to see nothing but the yearning and desire displayed in his big blue eyes.");
	output("\n\nYou give him a warm smile and return to the kiss, your [pc.lips] connecting with his cushy cockpillows for a long minute before your tongues start slipping and sliding against each other. Liamme’s breath stutters as muffled moans are released into your mouth with each movement of your [pc.tongue]. ");
	if(!pc.isAssExposed()) output("It seems your lover is eager to get things started: his blonde-furred hands reach for your [pc.lowerGarments] and start pulling. You let him, happy to have the trappy ausar strip you down until you’re naked atop him.");
	else output("Your lover seems eager to get things started, his blonde-furred hands moving down to caress your [pc.SkinFurScales] with downy fuzz.");
	output(" You shudder as Liamme’s surprisingly skilled hands have their way with your body, grasping and rubbing along all of your most sensitive spots.");

	output("\n\nOh, you’d love to just hop onto this femboy’s cock and ride it like there’s no tomorrow, but you think he needs a little prep first. You pull yourself back, [pc.lips] disconnecting from Liamme’s with a wet, sloppy sound. If his rapid breathing and swishing tail are any indicator, this ausar is <i>very</i> excited, and he should be. You reach for his hoodie and pull it up; quick to realize what’s going on, Lia aids in his own disrobing. His sweatshirt pops off easily, revealing his thin frame and flat chest to you, along with the ausar’s lustful grin. You’re not done yet: if either of you want to have any fun you need to get ");
	if(liammeSkirted()) output("this skirt");
	else output("these pants");
	output(" off, and Liamme knows it, as he quickly reaches down to push them off. Not one to standby in such a situation, you grab at his lower garment");
	if(!liammeSkirted()) output("s to help remove them ");
	else output(" to help remove it ");
	output("from the ausar’s body. His ");
	if(!liammeSkirted()) output("pants");
	else output("skirt");
	output(", along with the frilly blue panties beneath ");
	if(!liammeSkirted()) output("them");
	else output("it");
	output(", easily come off thanks to your combined efforts, allowing Liamme’s rock-hard puppy-cock to pop free and slap against his smooth stomach.");

	output("\n\nNow that’s what you’re talking about.");

	output("\n\nYou let your eyes wander across Liamme’s bare form, from his cute, fuzzy feet to his effeminate face and golden mane, and you want all of it. Putting yourself back down on all fours, you bring your [pc.face] as close to Lia’s as it will get, letting his hot breath caress your cheeks before giving him a good, long kiss. Then you start to move downward, trailing more kisses down his body: all over his neck, across his flat chest, and along his midsection, making Liamme’s breath shudder until you reach his cute, knotty cock. You deliver a long lick to the bottom of his tool, wetting it before you look up just in time to see the femboy reach a fluffy hand to your head, smiling down at you all the while. He gracefully guides you to the tapered head of his doggy-dong, which you eagerly accept between your lips, giving it a few tender licks that have Liamme whimpering. The ausar boy’s back arches steadily as you slide yourself further down his shaft, his grip on your head tightening. Soon you have his whole canine-cock sheathed in your mouth, your [pc.lips] wrapped firmly around his swollen red knot, while Liamme’s hands are wrapped firmly around your head. He holds you down with some considerable force, to the point where you can feel his pointed tip brush against the back of your throat. You give the ausar what he wants and start to move your [pc.tongue] along his length and wet his shaft, showing particular attention to the thick red bulb of cockflesh at his base. Your oral ministrations have your canid lover moaning with bliss before too long, furred hands running through your [pc.hair] while you gently suckle on doggy-dick. You greedily lap up the first few drops of salty pre the femboy gives you, watching as his limbs tremble with pleasure and his grip on your head loosens.");
	var x:int = -1;
	if(pc.hasVagina()) x = rand(pc.totalVaginas());
	output("\n\nOnce you’re sure you’ve gotten Liamme’s cock nice and wet for what’s to come, you remove yourself from his now spit-slick dong, resulting in a pitiful whine from the trappy ausar as his dick falls from the warm embrace of your mouth. You don’t think he’ll be upset for too long; you slide your way up his body, sitting up straight until you’re straddling his girly hips. Liamme’s chest heaves as he comes down from near-orgasm, and manages to look up at you with a smirk, his blonde, fuzzy hands getting a good grip on your [pc.thighs]. You smile right back down at the femboy, pleased with his eagerness for more. With a steady hand you take hold of Liamme’s cock and guide its pointed head towards your waiting, [pc.vagOrAss " + x + "].");

	//hasVag:
	if(x >= 0)
	{
		output("\n\nHis pointed cockhead brushes against the folds of your [pc.vagina " + x + "], making your breath shudder and your body quiver. ");
		if(pc.vaginalVirgin && pc.tailCount > 0 && pc.catDog("nyan", "bork", false) == "bork") output("Unable to control it, your [pc.tail] starts to wag gleefully, a sheer indicator of your excitement at the thought of this trappy pup being your first. ");
		output("With no intention of not having this dick inside you, you start to slide down Liamme’s shaft, its tapered tip easily spreading your nether lips thanks to your lovingly applied lubrication. The ausar boy beneath you is happy to assist you on your ride down, pushing on your thighs, guiding you down his doggy-dong with a firm grip. Already a bit worked up from your oral adventure earlier, you moan loudly, the feeling of your lover’s cock spreading you wider already overwhelming your mind with lust. By the time you reach Liamme’s thick, red knot, he’s already going to ");
		if(silly) output("town");
		else output("work");
		output(" on your [pc.vagina " + x + "], thrusting his hips upward, sending his turgid rod in and out of your sodden quim at a quickening pace.");
		pc.cuntChange(x,liammeVolume());

		output("\n\nYou cry out with delight at every movement of Liamme’s svelte hips, thrusting his red member as far as his swollen knot will allow. The ball of cockflesh spreads your [pc.vagina " + x + "] wider each time the femboy shoves his throbbing cock into you, leaving it there to grind against [pc.oneClit], but never quite thrusting it in. That’s it; you want this trappy ausar’s knot deep inside you, to feel it stretch you ever wider until that moment of relief where it finally slips into you. You meet Liamme’s thrust upward and push your hips down, making the femboy yelp at your unexpected motion. His grip on your [pc.thighs] tightens, clawed hands digging into your [pc.skinFurScales] as you force his wonderfully wide knot into you, while it in turn forces the lips of your [pc.vagina " + x + "] to stretch around the obscene ball of deep-red cockflesh. You let out a silent scream of inescapable pleasure as Liamme’s knot slips into your [pc.vagina " + x + "], leaving your breath ragged as you wait there, moaning while you and your lover both adjust to your new position.");
		output("\n\nYour lover’s own voice has turned into a chorus of groans and other pleasure tones at this point, his back arching as his knot is squeezed tightly by your [pc.vagina " + x + "]. Before too long he starts to grind his girly sides, making the swollen breeder’s knob inside you rub against your inner walls, leaving you moaning again. You move your hips in a similar fashion, vying for as much movement as Liamme’s turgid knot will allow. Pleasure engulfs your mind, dulling all your other senses to the point where you need to lean forward on your ausar lover’s chest to keep balance, still rolling your [pc.hips] at a blinding speed.");
		output("\n\nSo lost in your own desires and lust, you barely notice Liamme’s hips jerking upward and the long groan escaping his cushiony lips; what you do notice is the sudden, almost molten heat of his alabaster spunk flooding your cunt. You whimper at the sensation");
		if(!pc.isPregnant(x)) output("; the feeling of Liamme filling your womb, along with the trappy ausar’s bucking hips fucking your [pc.vagina " + x + "], ");
		else output(". The trappy ausar’s bucking hips fucking your [pc.vagina " + x + "] ");
		output("is enough to bring you to your orgasm. Heralded by a lusty moan, your [pc.vagina " + x + "] clamps down on your lover’s cock");
		if(pc.isSquirter()) output(", [pc.girlcum] wetting the femboy’s midsection as your climax ensues");
		output(".");
		if(pc.hasCock()) output(" Almost in sync with Liamme’s, [pc.eachCock] spasms, [pc.balls] emptying as you spray [pc.cum] all over the femboy’s chest.");
		output(" You ride out your orgasm with great fervor, grinding your [pc.hips] against his, your cries of pleasure rising in volume until you come down from your peak.");
		output("\n\nIt doesn’t look like either of you can move much after that; Liamme’s chest heaves beneath you, blonde-furred ears drooping with exhaustion, his knotted member still twitching inside you and his grip on your thighs long lost to pleasure. You can feel the femboy’s cum churning inside your [pc.vagina " + x + "], held secure by his knot, which is also holding you in place. With labored breaths you smile down at Liamme and collapse on top of him. He gives you a chuckle as you land on his flat chest, then goes to wrap his fluffy arms around your shoulders.");
		output("\n\nWell, you’re stuck here for a while anyway, might as well be comfortable; you accept the ausar’s fuzzy embrace and settle in, ready to sleep off the trappy boy’s knot.");
		//A good stand-in!
		pc.loadInCunt(chars["SYRI"],x);
	}
	//noVag:
	else
	{
		output("\n\nHis pointed cockhead brushes against your [pc.asshole], making your breath shudder and body quiver. ");
		if(pc.analVirgin && pc.tailCount > 0 && pc.catDog("nyan", "bork", false) == "bork") output("Unable to control it, your [pc.tail] starts to wag gleefully, a sheer indicator of your excitement at the thought of this trappy pup being your first. ");
		output("With no intention of not having this dick inside you, you start to slide down Liamme’s shaft, its tapered tip easily spreading your pucker thanks to your lovingly applied lubrication. The ausar boy beneath you is happy to assist you on your ride down, pushing on your thighs, guiding you down his doggy-dong with a firm grip. Already a bit worked up from your oral adventure earlier, you moan loudly, the feeling of your lover’s cock spreading you wider already overwhelming your mind with lust. By the time you reach Liamme’s thick, red knot, he’s already going to ");
		if(silly) output("town");
		else output("work");
		output(" on your [pc.asshole], thrusting his hips upward, sending his turgid rod in and out of your sodden hole at a quickening pace.");

		output("\n\nYou cry out with delight at every movement of Liamme’s svelte hips, thrusting his red member as far as his swollen knot will allow. The ball of cockflesh spreads your [pc.asshole] wider each time the femboy shoves his throbbing cock into you, leaving it to grind against your gaping pucker, but never quite thrusting it in. That’s it; you want this trappy ausar’s knot deep inside you, to feel it stretch you ever wider until that moment of relief where it finally slips into you. You meet Liamme’s thrust upward and push your hips down, making the femboy yelp at your unexpected motion. His grip on your [pc.thighs] tightens, clawed hands digging into your [pc.skinFurScales] as you force his wonderfully wide knot into you, while it in turn forces your [pc.asshole] to stretch around the obscene ball of deep-red cockflesh. You let out a silent scream of inescapable pleasure as Liamme’s knot slips into your [pc.asshole], leaving your breath ragged as you wait there, moaning while you and your lover both adjust to your new position.");
		pc.buttChange(liammeVolume());
		
		output("\n\nYour lover’s own voice has turned into a chorus of groans and other pleasure tones at this point, his back arching as his knot is squeezed tightly by your [pc.asshole]. Before too long he starts to grind his girly sides, making the swollen ball of cockflesh inside you rub against your inner walls, setting you moaning again. You move your hips in a similar fashion, vying for as much movement as Liamme’s turgid knot will allow. Pleasure engulfs your mind, dulling all your other senses to the point where you need to lean forward on your ausar lover’s chest to keep balance, still rolling your [pc.hips] at a blinding speed.");
		output("\n\nSo lost in your own desires and lust, you barely notice Liamme’s hips jerking upward and the long groan escaping his cushiony lips; what you do notice is the sudden, almost molten heat of his alabaster spunk flooding your ass. You whimper at the sensation, the feeling of Liamme filling your now-gaping hole, along with the trappy ausar’s bucking hips fucking your [pc.asshole], are enough to bring you to your orgasm. With a lusty moan your [pc.asshole] clamps down on your lover’s cock, spasming around it as your climax ensues.");
		if(pc.hasCock()) output(" Almost in sync with Liamme’s, [pc.eachCock] spasms, [pc.balls] emptying as you spray [pc.cum] all over the femboy’s chest.");
		output(" You ride out your orgasm with great fervor, grinding your [pc.hips] against his, your cries of pleasure rising in volume until you come down from your peak.");

		output("\n\nIt doesn’t look like either of you can move much after that; Liamme’s chest heaves beneath you, blonde-furred ears drooping with exhaustion, his knotted member still twitching inside you and his grip on your thighs long lost to pleasure. You can feel the femboy’s cum churning inside your [pc.asshole], held secure by his knot, which is also holding you in place. With labored breaths you smile down at Liamme and collapse on top of him. He gives you a chuckle as you land on his flat chest, then goes to wrap his fluffy arms around your shoulders.");
		output("\n\nWell, you’re stuck here for a while anyway, might as well be comfortable; you accept the ausar’s fuzzy embrace and settle in, ready to sleep off the trappy boy’s knot.");
		//A good stand-in!
		pc.loadInAss(chars["SYRI"]);
	}
	processTime(45);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",getLiammePoundedEpilogue);
}

public function getLiammePoundedEpilogue():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("When you wake, you’re sprawled out across Liamme’s bed, a fuzzy feeling of pleasure still tingling in your loins. Turning your stiff neck in a few different directions, you see a familiar, happy blonde ausar pulling on his panties. You groan and stretch, and the commotion you make gets Lia’s attention, the femboy quickly turning towards you as he reaches for the rest of his clothes.");
	output("\n\n<i>“Oh, you’re awake!”</i> He exclaims before leaning down and planting his lips right on your cheek. You smile at the little display of affection and sit yourself upright, yawning as you do so. <i>“Hey, uh, I gotta start getting ready for work soon,”</i> Liamme tells you, a look of disappointment on his face, <i>“But this was really fun, we should do it again sometime.”</i>");
	output("\n\nLiamme’s face quickly returns to a grin, though less lascivious this time and more pleased, <i>“Mind walking me back to the plaza?”</i>");
	output("\n\n");
	if(pc.isMischievous()) output("You tell him you think you have the time, your voice thick with sarcasm.");
	else if(pc.isAss()) output("You groan at the prospect of having to get up already, but oblige.");
	else output("You happily accept his proposition.");
	processTime(80+rand(20));
	applyLiamDisable();
	IncrementFlag("SEXED_LIAMME");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function straponLiammipoo():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");	
	output("You grin amidst the flurry of Liamme’s eager lips when you feel his fuzzy hands work their way over your body.");
	//moreThanPanties: 
	if(!pc.isCrotchExposedByArmor()) 
	{
		output(" He grabs at all your clothes, gradually pulling them away until all that’s left is your [pc.lowerUndergarment], greedy, fluffy fingers ");
		if(pc.hasCock()) output("grasping at your package");
		else if(pc.hasVagina()) 
		{
			output("digging into your still-clothed cunt");
			if(pc.hasVagina()) output("s");
		}
		else output("grabbing at your crotch");
		output(".");
	}
	else
	{
		if(pc.biggestTitSize() >= 1) 
		{
			output(" He grabs at your [pc.breast], groping your tits to his heart’s content until his greedy, fluffy fingers travel downwards to ");
			if(pc.hasCock()) output("grasp at your package");
			else if(pc.hasVagina()) 
			{
				output("dig into your still-clothed cunt");
				if(pc.hasVagina()) output("s");
			}
			else output("grab at your crotch");
			output(". Whimpering at his touch, you decide you better get this femboy undressed too.");
		}
	}
	output("\n\nYou let your hands reach down to the hem of his sweatshirt and pull up, interrupting your kiss for a single, painful moment as the garment pops over his big, twitching ears. With his bare, boyish chest revealed, you can move on to his ");
	if(!liammeSkirted()) output("pants");
	else output("skirt");

	output(", pulling down while Liamme wiggles his wide hips to assist you. His ");
	if(!liammeSkirted()) output("jeans");
	else output("garment");
	output(" and the frilly blue panties beneath ");
	if(!liammeSkirted()) output("them");
	else output("it");
	output(" come down easily, allowing his stiffening red doggy-dong to pop free with a relieved sigh from its owner.");

	output("\n\nWith both of you good and bare, and with your special undergarments ready to go, you fall back onto the mattress, landing on your ass with Liamme in your lap. The trappy ausar pulls back from the kiss, leaving you both fairly red-faced. He grins wide and reaches down to your [pc.lowerUndergarment]. <i>“So when are these coming off?”</i> he ask lustfully, tugging at your underwear.");

	output("\n\n");
	if(pc.isAss()) output("You smirk and tell him they don’t need to");
	else output("You chuckle and tell him they don’t need to");
	output(", then quickly reach down to your hip and hit a single button. Almost immediately, a big, glowing hardlight cock materializes between you and Lia, a blue glow shining across his smooth skin. The femboy smiles and blushes all the harder at the sight.");

	//firstTime:
	if(flags["STRAPONED_LIAMME"] == undefined)
	{
		output("\n\n<i>“Oh hey,”</i> he says, reaching down and wrapping his fur-covered digits around your holographic shaft, <i>“They sell these at Aliss’, right? Supposed to have some mental feedback or something?”</i>");
		output("\n\nYou shudder at his touch and nod, though you guess your pleasurable response was more than enough to let him know.");
		output("\n\n<i>“Cooool,”</i> he breathes, his eyes wide and locked on your glowing dick, <i>“So this my free trial before I go and buy one?”</i>");
		output("\n\nBarely containing a few moans as he continues to jerk you off, you tell the trappy ausar ");
		if(pc.isAss()) output("you’ll let him try it out");
		else output("he’s welcome to try it out if he wants");
		output(".");
		output("\n\nLiamme smiles all the wider at that.");
	}
	else
	{
		output("\n\nAlmost instinctively at the sight of the familiar, holographic toy, Liamme wraps his fluffy digits around your light-dick and starts to stroke it.");
	}
	output(" He keeps a good grip on your simulated shaft and lifts himself from your lap, positioning himself above your holographic tip. You smirk up at the golden-furred buttslut and place your hands on his girly sides to keep him steady. Blushing down at that little gesture, Lia starts to lower himself onto your hardlight cockhead. He whimpers slightly when his pucker finally presses against your tip, fluffy blonde tail wagging erratically in every-which way. You help the ausar on his way and begin to push down on his hips until his tight tailhole starts to spread around your holo-dong.");

	output("\n\nWhines filled with pleasure and pain fill the air as Liamme continues his trip down, stretching around your synthetic shaft until he starts to moan. The buttslut takes it all in one long, pleasurable descent, leaving himself panting and his asshole spasming around your strapon. You give him some time to adjust to your girth, letting him whimper and groan into your ears while you squeeze and grope at his ass.");

	output("\n\nEventually, he manages to look up at you, his face looking as needy as ever. <i>“I-I think you can start moving now,”</i> he stutters, getting a tight grip on your shoulders and wiggling his hips.");

	output("\n\nYou’re happy to oblige Liamme’s request and start to move your [pc.hips], gently thrusting into your lover and drawing a quiet series of moans from his lips. He leans into you, holding on tight as you gently bounce him in your lap, letting loose his pleasured tones right into your [pc.ear]. Before too long you start to speed up, thrusting deeper into Liamme’s ass, rubbing your holo-dong against his prostate until he’s leaking precum onto your bare stomach. He moans all the louder as you fuck him harder and harder, eventually pulling himself off your body and arching his back with pleasure.");

	output("\n\nHis doggy-dong twitches with the need for release, and you want to give him some. You speed up the grinding of your hips, fucking your girly-boy lover’s ass until his tongue start to loll with lust. Every now and then you pause, thrusting into him to the hilt of your glowing tool and leaving your [pc.hips] there to slide against his, teasing his depths with your lengthy, hardlight shaft.");

	output("\n\nIt’s all enough to make the cute blonde ausar cum. His climax beings with a high cry of pleasure, his tailhole clenching down around your holo-cock. At the same time, his own knotty prick spasms in the open, at just the perfect angle so that he cums up into your face, covering your cheeks, chin, and lips with his warm spooge. Girly hips buck forward against yours as Liamme’s orgasm ensues, his inner walls convulsing against your strapon sending a wave of blissful feedback to your brain. The sudden tightness you find yourself surrounded by finally leads you to your simulated peak, endorphins rushing to your mind and leaving you in a haze of pleasure while your [pc.hips] start to move on their own volition, thrusting hard up into Liamme.");

	output("\n\nIt takes some time, but you both come down from your rapidly plateauing peaks, your chests left heaving and Liamme gazing tiredly into your eyes.");

	output("\n\n<i>“So...”</i> he breathes between each rise and fall of his flat chest, <i>“That thing’s... pretty awesome... kinda tingly...”</i> He takes a deep breath and looks at your cum-covered face and smiles, <i>“Oh, hey, let me clean that up.”</i>");

	output("\n\nWith that, he leans into your again, letting his hands run along your sweat-laden, chest and his flat ausar tongue loll from his mouth. He drags his oral organ across your cheeks and chin, licking up his own seed and cleaning you off until it all culminates into a tongue-filled, cum-flavoured kiss. You’re only able to enjoy that embrace for a short before you both collapse back onto the mattress into a pile of cuddly femboy. Reaching down to your side, you switch off your strapon, emptying Liamme with a single button, leaving him gaping and whimpering, but warm within your arms.");

	output("\n\nThen, all there is to do is sleep away your afterglow with your lover.");

	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",afterLiammeAnalStraponPoundage);
}

public function afterLiammeAnalStraponPoundage():void
{
	clearOutput();
	showLiamme();
	if(silly) author("HugsMostlyAlright");
	else author("HugsAlright");
	output("When you wake, you’re sprawled out across Liamme’s bed, a fuzzy feeling of pleasure still tingling in your loins. Turning your stiff neck in a few different directions, you see a familiar, happy blonde ausar pulling on his panties. You groan and stretch, and the commotion you make gets Lia’s attention, the femboy quickly turning towards you as he reaches for the rest of his clothes.");
	output("\n\n<i>“Oh, you’re awake!”</i> He exclaims before leaning down and planting his lips right on your cheek. You smile at the little display of affection and sit yourself upright, yawning as you do so. <i>“Hey, uh, I gotta start getting ready for work soon,”</i> Liamme tells you, a look of disappointment on his face, <i>“But this was really fun, we should do it again sometime.”</i>");
	output("\n\nLiamme’s face quickly returns to a grin, though less lascivious this time and more pleased, <i>“Mind walking me back to the plaza?”</i>");
	if(pc.isMischievous()) output("\n\nYou tell him you think you have the time, your voice thick with sarcasm.");
	else if(pc.isAss()) output("\n\nYou groan at the prospect of having to get up already, but oblige.");
	else output("\n\nYou happily accept his proposition.");

	//[Next] //Should return the PC to wherever the hell Liamme is.
	processTime(80+rand(30));
	IncrementFlag("SEXED_LIAMME");
	applyLiamDisable();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Liamme shopping at Aliss'
//After doing Liamme's exhibition scene, he can be found at Aliss'. (May be a one time encounter.)
//Also if the Misch/Hard personality requirement for his exhibition scene could be removed that'd be neat.
/*
if(flags["LIAMME_EXHIB"] != undefined && rand(15) == 0)
{
	output("\n\nYou see a blonde ausar femboy walking around the shop with a bag full of naughty goodies. By your guess, it’s Liamme doing a little bit of shopping. Maybe you could pay him a visit.");
	addButton(1,"Liamme",liammeShoppingAtAlissApproach,undefined,"Liamme","See what the trappy ausar is up to.");
}*/

//[Liamme]
public function liammeShoppingAtAlissApproach():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("[pc.Walk]ing up to the familiar femboy, you see he’s perusing the shelves and hangers lined with lingerie, namely stuff that will fit flat chests and petite frames. You give him a tap on his shoulder, making his tail and ears shoot straight up in surprise. He quickly turns around to face you, his eyes brightening with happiness when he sees who’s come to visit.");
	output("\n\n<i>“Hey, [pc.name]!”</i> he exclaims, smiling at you. <i>“You shopping here too, huh?”</i>");

	if(pc.isMischievous() || pc.isBimbo()) 
	{
		output("\n\n");
		if(pc.isBimbo()) output("With bubbly enthusiasm, you");
		else output("You");
		output(" tell him you were looking for something cute, and just happened to find him.");
	}
	else output("\n\nYou tell him you were browsing the selection Aliss keeps here, but you noticed him and figured you’d stop to say hey.");

	output("\n\nLiamme smiles and blushes at your words, <i>“Thanks! It’s nice to have friends around here, especially ones you can meet in a lingerie shop.”</i> The trappy ausar’s eyes dart left to right for a moment, and he takes a few steps closer to you before whispering, <i>“Uh, hey, speaking of, we’re pretty good buds, right?”</i>");

	output("\n\nWell, hard to say no to that after you jerked him off in public, so you give him a nod.");

	output("\n\n<i>“Oh, cool!”</i> he says happily, lifting his shopping bag into view, <i>“So I saved up some money for something cute... and I was hoping to get a second opinion on it before I went and bought it. Think you could help me with that?”</i> A lusty smile appears on his face as he asks, jittering slightly in place, clearly excited for your answer.");

	processTime(5);
	clearMenu();
	//[Yes] Pay a visit to a dressing booth with Liamme.
	//[No] You can’t right now.
	addButton(0,"Yes",yesDressLiammePantyPlayWhatever,undefined,"Yes","Pay a visit to a dressing booth with Liamme.");
	addButton(1,"No",tellLiammeNoPantyFunStuff,undefined,"No","You can't right now.");
}

//Yes
public function yesDressLiammePantyPlayWhatever():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("You smile and tell Liamme you’d be happy to help him out, to which the femboy happily exclaim <i>“Great!”</i> before checking his bag one more time to make sure he’s got everything.");
	output("\n\nWith a big, giddy grin on his, the trappy ausar quickly takes hold of your hand with his own furry digits. <i>“Here,”</i> he says, already leading you off, <i>“Let’s go find a changing room!”</i>");
	output("\n\nThe two of you do just that, easily finding a row of stalls for dressing and undressing, fit for races and people of any size. Liamme stops at the entrance of an empty booth and releases your hand before turning to face you. <i>“Alright, I’m gonna change into this,”</i> he says, accentuating that last word by holding up his lingerie-filled bag, <i>“I’ll let you know when I’m ready.”</i>");
	output("\n\nThen, still smiling and blushing, the happy femboy disappears inside the stall, closing the door behind him. It’s only a few moments before you hear the *whomp* of his discarded clothes hitting the ground, catching a few glimpses of his fluffy feet beneath the door. After that, it’s no time at all before the booth creaks open again, Liamme’s feminine visage poking through the barely-opened entrance. He looks at you with a beet-red face and smirks, saying <i>“Alright, all dressed!”</i> before disappearing into the stall again, making sure to leave the door unlocked.");
	output("\n\nA feeling of ardour and anticipation quickly takes over your body, leading you to follow Liamme into the booth as fast as you can. Once you’re in, you’re greeted with one of the most beautiful sights you’ve ever seen in the void.");
	output("\n\nYour femboy friend is standing with his hip cocked against his hand, both his fluffy arms clad in lacy black silk elbow gloves. His svelte, boyish chest is covered by a tight-fitting wrap, black and frilly like his gloves, with a little heart-shaped hole where Liamme’s cleavage would be if he had any to speak of. Meanwhile, his smooth midsection is left entirely uncovered, fair skin bared to your eyes. Lacy black thigh-highs hug at the ausar’s plush thighs, leading all the way up to his hips, where they’re connected by thin straps to a pair of crotchless panties, letting his half-hard puppy-cock hang out in the open for you to see.");
	output("\n\nYou lick your lips and manage to keep yourself from drooling at the fantasies you soon find yourself lost in before your trappy companion’s voice calls you back.");
	output("\n\n<i>“So,”</i> he beging, grinning wide and lustfully, <i>“What’d you think? I figured it needed a little something, so I went with crotchless.”</i>");

	processTime(7);
	clearMenu();
	//[BlowHim] Is there really any other option?
	//[LooksGreat] Tell him it looks good!
	addButton(0,"Blow Him",blowLiammeInNewPanties,undefined,"Blow Him","Is there really any other option?");
	addButton(1,"LooksGreat",tellLiammeHeLooksGr8,undefined,"LooksGreat","Tell him it looks good!");
}

//Blow Him
public function blowLiammeInNewPanties():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("If you were in a less lustful state of mind, you’d probably tell Liamme that the black complements his hair, or something like that. Of course, you’re pretty focused on that doggy-dong hanging out from the ausar’s outfit right now, growing harder with each passing moment of attention it’s getting.");

	output("\n\nSo, you tell him it looks great, but you also see a little problem with the whole outfit as you lower yourself to ");
	if(pc.hasKnees()) output("your knees");
	else if(pc.isTaur()) output("your haunches");
	else output("the floor");
	output(", right next to Liamme’s crotch, wrapping your fingers around his exposed cock and giving his bare midsection a few kisses.");

	output("\n\nHe gasps in response to your touch, smiling down at you with his cheeks burning scarlet, <i>“Oh really, what’s what?”</i>");

	output("\n\nSmirking up at the trappy ausar, you tell him his dick just looks a bit cold out in the open like this, and it seems like it need a nice, warm place, then go to wrap your lips around his tapered tip.");

	output("\n\nLiamme can only whimper as you kiss at his cockhead, already licking at his cumslit and cleaning up all the precum that’s already there. You turn to look up at him, seeing a cute, feminine face all filled with desire, just as he reaches a silk-clad hand down to your head.");

	output("\n\n<i>“Y-you know,”</i> he stammers between flicks of your tongue, <i>“I was kinda hoping you’d do something like this.”</i> His fluffy fingers get a good grip on your scalp, running through your [pc.hair] and urging you further onto his shaft. ");
	if(pc.earType == GLOBAL.TYPE_CANINE || pc.earType == GLOBAL.TYPE_FELINE) output("Before too long, he even starts to fondle and scritch at your [pc.ears], earning him a few pleasured whimpers. Makes sense that an ausar would know his way around a pair of ears.");

	output("\n\nYou smile at the femboy’s touch and follow his lead, pushing yourself down onto his needy red cock. It’s easy to sheath Liamme’s whole tool in your mouth, [pc.lips] wrapping around his thick knot to make sure the trappy ausar’s kept in your warm, wet embrace. His fluffy digits tremble against your head as you start to lick at the bulb of sensitive cockflesh, wetting it with your spittle and making its owner moan.");

	output("\n\nThe trappy boy’s hips start to gyrate on what seems to be their own volition, gently grinding against your face and drawing his spit-slick tool in and out of your mouth, groaning quietly and leaning back against the wall of the stall. Deciding to help the femboy along his way, you start to bob your head up and down the turgid red rod of Lia’s dick, making sure to stop now and then to lick at his knot and clean up any pre that he’s giving you.");

	output("\n\nIt all has Liamme moaning and whimpering pleasurably, his hand still running through your [pc.hair] and keeping you well in your place, speared on his twitching cock. You’re pretty sure most everyone in this part of Aliss’ can hear you at this point.");

	output("\n\nThat doesn’t stop your from pleasing your scantily clad lover, though, contenting yourself to happily suckle away at his cute doggy-dick until he reaches his peak, which, judging by his quivering legs and erratically wagging tail, won’t be long. Your predictions aren’t far off, because soon Liamme is bucking his hips forward against your [pc.lips], his grip on your scalp tightening and his eyes clenching shut.");

	output("\n\nYou can feel the ausar’s knotty cock spasming in your mouth, looking up to see your lover biting him his lip in an attempt to stave off his impending orgasm. His efforts or for naught, though, because a high cry of pleasure interrupts his once steady moaning and groaning, and the first shot of his salty seed wets your tongue. The femboy quivers and shakes as his climax ensues, wide hips jerking and thrusting forward and fucking your face as he fills your mouth with warm cum.");

	output("\n\nYou take it all happily, letting the trappy ausar hold you down on his convulsing tool and greedily swallowing all the thick white spooge his tight little sack will give you. All his pleasured tones are like music to your ears as his peak continues to rise, leaving you blushing and smiling with a mouth full of cum until Liamme seems all but finished.");

	output("\n\nThe blonde femboy finally comes down from his peak with a deep breath and one last rope of his seed on your tongue. Liamme looks down at you with a tired, pleased gaze beyond his heaving chest. His glove-covered fingers are still ");
	if(pc.hasHair()) output("combing through your [pc.hair]");
	else output("caressing your [pc.ears]");
	output(" when you go to pull off his cock, giving it a few last licks before you leave the softening slab of dickmeat dripping your saliva onto the floor.");

	output("\n\n<i>“Wow...”</i> the ausar musters between deep breaths, <i>“I guess you really like the outfit then, huh? Figured the whole crotchless thing would be pretty kinky.”</i>");

	output("\n\nYou smirk up at him and rise back ");
	if(pc.hasKnees()) output("to your feet");
	else if(pc.isTaur()) output("to your hooves");
	else output("up");
	output(", allowing Liamme’s hand to fall away from your face. Then, after licking some stray cum from your lips, you tell him you think it looks great again, among other things.");

	output("\n\n<i>“Thanks,”</i> he says with a smile. A silk-clad hand drifts down to his soft tool, gently and absentmindedly stroking at oversensitive and tender cockflesh, taking another deep breath, <i>“I’m gonna... gonna make sure this thing fits okay again, then I’ll check out.”</i> He winks, already jerking himself off to hardness again, <i>“Hopefully I’ll see you back at the plaza later.”</i> The ausar manages to pull himself from the booth’s wall and lean in close enough to whisper, <i>“I’d love to try this on again for you later...”</i>");

	output("\n\nBefore you can even respond, the girly ausar presses himself into you, trapping you in a quick kiss while he pleasures himself. You graciously accept his embrace, resting your hands on his spacious hips. After enjoying what must be the upright equivalence of post-coital snuggle, the kiss finally break, Liamme left looking at you with his face burning red, stroking himself faster and faster.");

	output("\n\nGrinning at the sight, you tell the femboy you hope you’ll see him later too, and go to make your way out of the stall, the sound of his vigorous masturbation all too audible as you walk away.");

	processTime(15);
	pc.loadInMouth(chars["SYRI"]);
	flags["LIAMME_ALISS_PROC"] = undefined;
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Looks Great
public function tellLiammeHeLooksGr8():void
{
	clearOutput();
	showLiamme(true);
	author("HugsAlright");
	output("Looking him over, you tell Liamme that the black really complements his skin and hair, bringing out all those lighter colours.");
	output("\n\nThe femboy’s face brightens at your word. <i>“Ooooh,”</i> he coos, proceeding to give his girly hips a little shake, making his cock wobble, <i>“Anything else?”</i> He looks at you with an expectant smile.");
	output("\n\nYou grin and bring yourself closer, pressing your body against his until the blonde pup is up against the changing room’s wall, eyes still looking over his body. Your hands find their way to Liamme’s plush thighs, running up and down his legs as you tell him about how nicely these stockings hug at his curvy thighs. Then, your digits make their way to his butt, digging into his squishy assflesh, enough to make him whimper while you explain how well the panties fit his butt before sliding your hand up to his sides. You trail your fingers along the smooth skin of his midsection, enjoying the simple tactile sensation of his flesh until they reach his chest. You flick your thumbs across his stiff, silk-covered nipple, causing the femboy whine quietly. Licking your lips, you whisper into Liamme’s, twitching, fluffy ears, telling that you wish this little chestwrap wasn’t here so you could see those cute nipples of his.");
	output("\n\nThen, feeling you’ve given his outfit a good appraisal (and that you’ve teased him enough), you pull back, noticing his cock is at full mast and twitching needily.");

	output("\n\nLiamme smiles at you and blushes hard. <i>“Thanks,”</i> he says with a silk-clad hand drifting down to his stiff tool, gently and absentmindedly stroking at his sensitive cockflesh and taking another deep breath, <i>“I’m gonna... gonna make sure this thing fits okay again, then I’ll check out.”</i> He grins, jerking himself off right in front of you, <i>“Hopefully I’ll see you back at the plaza.”</i> The ausar manages to pull himself from the booth’s wall and lean in close enough to whisper, <i>“I’d love to try this on again for you later...”</i>");

	output("\n\nBefore you can even respond, the girly ausar presses himself into you, trapping you in a quick kiss while he pleasures himself. You graciously accept his embrace, resting your hands on his spacious hips. After enjoying his touch for a while, the kiss finally break, Liamme left looking at you with his face burning red, stroking himself faster and faster.");

	output("\n\nGrinning at the sight, you tell the femboy you hope you’ll seem him later too, and go to make your way out of the stall, the sound of his vigorous masturbation all too audible as you walk away.");
	processTime(6);
	flags["LIAMME_ALISS_PROC"] = undefined;
	pc.changeLust(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//No
public function tellLiammeNoPantyFunStuff():void
{
	clearOutput();
	showLiamme();
	author("HugsAlright");
	output("You tell Liamme you ");
	if(!pc.isAss()) output(" unfortunately");
	output(" have other things to do, earning a disappointed look from the ausar.");

	output("\n\n<i>“Oh, that’s fine,”</i> he says, shoulders slumping slightly before he perks up again, <i>“Hey, maybe I’ll see you in the plaza later, and I can try it on for you then.”</i> The femboy grins lustfully at you, tail wagging vigorously.");
	output("\n\nYou smile and tell the trappy pup you hope you’ll see him later too before saying your goodbyes and parting ways.");

	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	flags["LIAMME_ALISS_PROC"] = undefined;
}