/*Cowdude developed by Fenoxo the turrible
Yancy - but he aint a Nancy!
Human-faced, perhaps with a cow-tipped nose, ala - https://www.dropbox.com/s/xyq384aot0j95ai/CyanCapsule_Millie_Topless.jpg?dl=0
Smaller for a bull. 6'6".
Wound up with a very thick, flared cock (like a horse) with feline nubs. Nubs are super fucking soft and tickle inner walls in awesome ways. Not that long tho - only 10".
Has to take virility control pills in order to keep the job. Side effect is that his spunk tastes a little sweeter.
Blonde hair, blue eyes, and fair skin.
Hairstyle - Kinda spiked.
Cow-like ears
Ram-like horns. Something like the ones in here (warning gayfursmut): http://www.furaffinity.net/view/8617006/
Used to be into Theater before he grew up and got a job. Still holding out hope that he can get a job offworld as a holo actor.*/

//Yancy & His Slutmilker
public function yancyBonusSloots():Boolean
{
	//Unmet
	if(flags["MET_YANCY"] == undefined)
	{
		output("\n\nA burly, well-muscled man with ram-like horns is slouching against one of the stall’s walls with a bored-looking expression. Aside from a ratty-looking pair of brown shorts, he’s naked");
		if(pc.isBimbo()) output(". Delicious");
		output(".");
		addButton(0,"Bull/Ram",approachYancyYouFaggot);
	}
	//Met
	else
	{
		output("\n\nYancy is leaning against one of the stall’s walls with a bored-looking expression. His blue eyes follow you as you enter, but he waits for you to approach him");
		if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] != undefined) output(", no matter how thick the bulge snaking down his leg");
		output(".");
		addButton(0,"Yancy",approachYancyYouFaggot);
	}
	return false;
}

//Approach Variations
public function approachYancyYouFaggot():void
{
	clearOutput();
	showName("\nYANCY");
	showBust("YANCY");
	//First time
	if(flags["MET_YANCY"] == undefined)
	{
		output("The bull (or ram, whatever he is), smiles when you step up to him.");
		output("\n\n<i>“Hey there. Looking to get milked?”</i> He looks you up and down");
		if(!pc.isTreated() && pc.mfn("","","d") == "d") output(", confusion crossing his face. “Or... did you get lost? Whatever the case, I’m free to help, if I can.”</i>");
		else if(pc.mf("d","") == "d") output(", chuckling. <i>“What’s up, brother? Looking for a lost cow?”</i>");
		else if(pc.isTreated()) 
		{
			output(", smiling at the sight of you. <i>“Oh, needing milked, ");
			if(pc.tallness < 76) output("little ");
			output("cow?”</i> One of his hands edges his lengthening bulge into a more comfortable position. <i>“I’d be happy to help.”</i>");
		}
		else output(", apparently liking what he sees.");

		output("\n\nYou cock your head, digesting his question.");
		output("\n\n<i>“Oh, I didn’t mean to be presumptive,”</i> the bull apologizes, snorting at his own hubris. <i>“My name’s Yancy, and no, I’m not a nancy.”</i> He rolls his eyes, obviously tired of a common jibe. <i>“I’m one of the milker attendants here. Nice to meetcha.”</i> A calloused hand is being held out to you for a handshake.");
		//Bimbo
		if(pc.isBimbo())
		{
			output("\n\nYou grab his big hand in both of yours and vigorously shake, enthused to meet the big fella.");
			if(pc.biggestTitSize() >= 5) output(" As an added bonus, your [pc.chest] jiggles and bounces until the big bull is staring right at it. Your [pc.nipples] feel hot and tight under his gaze, and you preen happily, delighted to have his attention.");
			output(" <i>“I’m like, [pc.name]! Nice to meet ya!”</i>");
		}
		//Bro
		else if(pc.isBro())
		{
			output("\n\nYou grip his palm tightly and give an answering shake. <i>“The name’s [pc.name]. ‘Sup.”</i>");
		}
		//Nice
		else if(pc.isNice()) output("\n\nYou give him a friendly shake and a smile. <i>“I’m [pc.name]. It’s a pleasure to meet you, Yancy.”</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nYou grab hold of his palm and shake it back and forth, imitating a primitive tool. <i>“Glad I </i>saw<i> ya.”</i>");
		//Hard
		else output("\n\nYou eyeball his palm but don’t bother taking it. <i>“You can call me [pc.name].”</i>");
		//Merge
		output("\n\nYancy ");
		if(pc.isBimbo()) output("gives you a toothy smile. <i>“Oh, it’s my pleasure, believe me.”</i>");
		else if(pc.isBro()) output("nods. <i>“Not much.”</i>");
		else if(pc.isNice()) output("gives a friendly grin. <i>“Glad to hear it.”</i>");
		else if(pc.isMischievous()) output("chuckles, bemused. <i>“You should probably bury that joke somewhere deep, where no one can find it.”</i>");
		else output("shrugs. <i>“Whatever you say, boss.”</i>");
		output(" He runs a thick-fingered hand through his spiked, blonde hair, gathering his thoughts. <i>“Well, if you’re after a thorough milking with a little masculine assistance, I’m your guy, and this is your stall.”</i>");
		flags["MET_YANCY"] = 1;
	}
	//Repeat Greeting
	else
	{
		//Last Milked & Fucked
		if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & fucked") output("<i>“Welcome back, [pc.name],”</i> Yancy says while wrapping a tight, muscled arm around your waist. <i>“Why don’t we get you hooked back up to the milker?”</i>");
		//Last Milked & Suck
		//Last Milked & Titfucked
		else if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & sucked" || flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & titfucked") output("<i>“Welcome back, [pc.name].”</i> Yancy adjusts the waistband of his shorts, already dangerously tenting them at the memory of your previous encounter. <i>“Up for a little... reciprocal milking?”</i>");
		//Last Milked & Pitched
		else if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & pitched") output("<i>“So, how about a uh... more normal milking this time, [pc.name]?”</i>");
		//Not yet milked
		else if(flags["YANCY_MILKED_PC"] == undefined) output("<i>“Welcome back, [pc.name].”</i> Yancy smiles genially. <i>“I’m glad for the company. You’ve no idea how boring it is standing around here all day waiting for a tourist or horny cow to come by.”</i> He tucks his hands in his pocket, leaning coolly against the wall. <i>“Wanna give the milkers a try?”</i>");
		//Backed out with nothing last time
		else output("<i>“Welcome back, [pc.name].”</i> Yancy smiles genially. <i>“Change your mind about getting a milking?”</i>");
	}
	clearMenu();
	if(pc.isLactating()) addButton(0,"Get Milked",getMilkedByYancyYaSloot);
	else addDisabledButton(0,"Get Milked","Get Milked","You need to be lactating to get milked.");
	addButton(14,"Back",mainGameMenu);
}

//Get Milked
public function getMilkedByYancyYaSloot():void
{
	clearOutput();
	showBust("YANCY");
	showName("\nYANCY");
	processTime(4);
	//Bimbo
	if(pc.isBimbo())
	{
		output("<i>“Ohhh, yeah, let’s do a milking! You’ll help, right?”</i> You ");
		if(pc.hasHair() && pc.hairLength > 4) output("twirl your [pc.hair] and ");
		output("giggle, thrusting your chest forward automatically, already imagining yourself riding the handsome stud while your boobs are pumped.");
	}
	//Nobimbo
	else
	{
		output("<i>“Yeah, I’ll take that milking now.”</i> You look down at your own chest, wondering just how much the texan milkers will manage to draw from you");
		if(flags["YANCY_MILKED_PC"] != undefined) output(" this time");
		output(".");
	}
	//Merge
	output("\n\nRubbing his hands together, Yancy turns toward the equipment on the wall. <i>“You’ll want to ");
	//Not nakkers
	if(!pc.isNude())
	{
		output("go ahead and get naked so we don’t get any fluids on your gear.”</i> He flips a switch to cycle the machine’s storage and warm up for the next customer.");
	}
	//Nakkers
	else 
	{
		output("prepare yourself. This can get pretty intense.");
		if(flags["YANCY_MILKED_PC"] != undefined) output(" You remember, right?");
		output("”</i> He flips a switch to cycle the machine’s storage and warm it up for you.");
	}
	//Not treated
	if(!(pc.isTreated() && pc.isBimbo()))
	{
		//Clothed
		if(!pc.isNude())
		{
			output("\n\n<i>“All right.”</i> You ");
			if(pc.libido() >= 75) output("eagerly pull off your [pc.gear], stealing glances over your shoulder to see if you’re making Yancy’s shorts tent any more than they already are.");
			else if(pc.libido() >= 25) output("carefully remove your [pc.gear], feeling at once very exposed and excited. There’s no hiding the bull’s rapt gaze.");
			else output("nervously remove your [pc.gear], unsure how to feel about being naked around an oversexed guy like this, especially when he’s going to be the one getting you milked. Still... you feel more than a twinge of excitement as well.");
			output(" You toss the stuff in a marked bin, and cock your head at the man with the broad, obviously waxed chest. <i>“Now what?”</i>");
		}
		//Unclothed
		else
		{
			output("\n\nYou chuckle. <i>“");
			if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & fucked") output("Of course. After </i>that<i>, it’d take an army to keep me from coming back for another ride. ");
			else 
			{
				output("Prepare myself? I’m already naked, lactating, and standing in a barn stall with a ram-horned adonis.”</i> ");
				if(pc.libido() < 33) output("You flush at your own words, wondering just why you’re feeling so loose-lipped and well... tingly.");
				else if(pc.libido() < 70) output("A flush works through your body at the inadvertent flirt. Just because you’re on New Texas doesn’t mean you need to think like one of those slutted-up honies!");
				else output("You flush hotly, pleased your body is getting warmed up so quickly. This guy looks like he’s gonna be fun!");
				output(" <i>“");
			}
			output("So... ");
			if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & fucked") output("you ready?");
			else output("now what?");
			output("”</i>");
		}
		//merge clothed & unclothed, still in untreated branch
		output("\n\nThe bull just shakes his head. You note with less than clinical interest that the tube-like distention in his shorts seems to be flagging. Yancy unashamedly grabs hold of it and shifts it into the other pant leg, letting out a sigh. <i>“You’ll have to forgive me... most of my clientele are citizens. ");
		if(flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] == "milked & fucked") output("I’m not sure I’ll ever get used to a naked girl </i>not<i> jumping me.");
		else output("It’s just... surprising to have a chance to milk someone who isn’t trying to fish out my dick at the drop of a hat.");
		output("”</i>");

		output("\n\nYou tear your eyes away from his crotch. <i>“Well, not all of us are brain-dead sluts.”</i> Despite what you’re saying, you can definitely see why a girl would want to pin him to the ground and ride him for all he’s worth. You take a step closer. <i>“Some of us are just here for a quick, fun milking.”</i>");
		output("\n\nThis close, it’s impossible not to smell Yancy, not in a bad way either. He smells good, like clean sweat and hay and well... sex. He smells kind of like sex, male and female, but mostly male. There’s a sharp, nutty musk that you can identify as his own, so unique that you could probably pick him out by it if you were blindfolded in a room full of bulls.");
		if(!CodexManager.entryViewed("The Treatment")) output(" You wonder why.");
		else output(" Of course, the New Texans are like that - some effect of the Treatment.");
		if(pc.hasVagina()) 
		{
			output(" You get ");
			if(pc.wettestVaginalWetness() < 2) output("a little damp");
			else if(pc.wettestVaginalWetness() < 4) output("wetter");
			else output("even wetter");
			output(" just thinking about it.");
		}
		else output(" You get a little hotter just thinking about it.");
		output(" The pheromone soup doesn’t affect you as strongly as it might a Treated cow, but Yancy’s odor is definitely having an effect. You wrinkle your nose, trying to decide whether you should breathe through your mouth or take a deep breath and enjoy yourself.");
		output("\n\nYancy flicks a switch on the milker, causing something behind the wall to cycle, likely preparing the machine to hum. He barely notices you while he fiddles with a few knobs and buttons, scratching idly at one of his horns. <i>“There we go. Should be all set for a milking.”</i>");
		output("\n\nHe looks a little flustered.");
		output("\n\n<i>“So, I guess I’ll just... uh...”</i> Yancy holds two of the milking cups in his hands and stares at your chest. That bulge is back, and bigger than ever.");
		output("\n\nYou struggle to look him in the eye, barely managing to keep his swelling cock in the periphery of your vision. <i>“Uhh, what?”</i> You inhale through your nose, getting a powerful whiff of the sweating guy’s scent. Was he that sweaty when you walked in here? You can definitely smell him stronger than before. You ogle his straining zipper. Maybe coming to this stall was a good idea. Yancy’s supposed to personally help you with your milking, right? You lick your lips.");
		output("\n\nThe big, loveable bull doesn’t seem to mind. In fact, he’s nervously approaching you, two milk cups in hand, steadfastly trying to explain. <i>“I’ll just hook these up, and once the machine kicks in, I’ll help you give as much milk as possible.”</i>");
		output("\n\nYou turn and lean into him before he can press them onto you, rubbing your shoulder against a glistening pec. It feels nice on your [pc.skinFurScales]. You turn your nose into it and breathe deeply, feeling... safe, protected, and horny. You’re really horny. But what are you going to do about it-?");
		// [Get Fucked] [Blowjob] [Titfuck]
		clearMenu();
		addButton(0,"Get Fucked",untreatedMilkedAndFucked,undefined,"Get Fucked","Do what comes naturally....");
		addButton(1,"Give B.J.",untreatedGirlsSuckYancyOffAndShit,undefined,"Give Blowjob","Give Yancy a blowjob while you’re milked....");
		if(pc.canTitFuck()) addButton(2,"Titfuck",untreatedTittyFucksForYancy,undefined,"Titfuck","Put those big jugs to work properly....");
		else addDisabledButton(2,"Titfuck","Titfuck","You need a large enough rack to do this.");
		if(pc.hasCock() && pc.cockThatFits(600) >= 0) 
		{
			if(flags["YANCY_BUTTFUCKED_BY_PC"] == undefined) addButton(3,"Pitch Anal",yancyGiantParagraphButtfucksByAnalmancyIncorporated,undefined,"Pitch Anal","You can’t deny that you’d like to see the bull’s cock bouncing while you fucked Yancy’s ass to the beat of the milkers. Ask him if he feels the same way... you never know!");
			//Tooltip (Repeat): 
			else addButton(3,"Pitch Anal",yancyGiantParagraphButtfucksByAnalmancyIncorporated,undefined,"Pitch Anal","Fuck Yancy’s ass to the beat of the milkers draining your tits.");
		}
		else addDisabledButton(3,"Pitch Anal","Pitch Anal","You need a dick that will fit Yancy’s butt to do him there.");
	}
	//Treated
	else
	{
		output("\n\nYou thrust your [pc.fullChest] and [pc.hips] in his direction");
		if(pc.isNude()) output(" and gleefully wiggle back and forth. <i>“I am sooo ready!”</i>");
		else output(" and vainly tug at your [pc.gear]. <i>“This stuff is hard to get off by myself.”</i>");
		output(" Stepping closer, you rub yourself against him, surreptitiously feeling his cock through his pants. It’s still kind of squishy - not yet hard - with the most interesting, nubbed texture. Your fingers fly to his zipper");
		if(pc.hasVagina()) 
		{
			output(" while your [pc.vaginas] moisten");
			if(pc.totalVaginas() == 1) output("s");
		}
		output("; you’ve just got to let the poor guy out! Cocks are best when they’re hanging out there, all stiff and dripping, waiting to be shoved up inside you. You bet it’d fit <i>so</i> good, too.");
		output("\n\nYancy wraps one of his hands around your wrist and spins, placing your back against his chest and your [pc.butt] square against the stiffening length he’s trying to hide. You try vainly to struggle, but his hands are just so strong! Besides, your body totally isn’t listening to you, rendering your attempts laughably feeble.");
		output("\n\n<i>“Settle down.”</i> The bull’s rough voice surrounds you, like sandpaper and a booming drum. You shiver, relaxing instinctively. <i>“I’m all for making you bow-legged and dripping, but I have a job to do, too.”</i>");
		output("\n\nHuh? You crane back over to look up at him. A job? How can he think about a job when there’s a hot piece of ass here just begging for his dick! You bounce, rubbing your cheeks against either side of rigid mast through the too-thick fabric of his pants, hoping that he’ll get hard enough to tear them clean off and slip into your [pc.vagOrAss].");
		output("\n\nYancy grunts in annoyance, but he doesn’t stop you either.");

		if(pc.isNude())
		{
			output(" Starting with gentle petting, he slowly massages your body. He doesn’t even make an effort to avoid your overheated [pc.nipplesNoun]");
			if(pc.hasVagina()) output(" or simmering slit");
			if(pc.totalVaginas() > 1) output("s");
			output(".");
		}
		else
		{
			if(pc.armor.shortName != "") output(" Starting with your [pc.armor],");
			else if(pc.isChestGarbed()) output(" Starting with your [pc.upperGarment],");
			else output(" Smirking at your lack of anything but [pc.lowerGarment],");
			output(" he begins to undress you, unwrapping you like a present, not very careful to avoid your overheated [pc.nipplesNoun]");
			if(pc.hasVagina()) output(" or simmering slit");
			if(pc.totalVaginas() > 1) output("s");
			output(".");
		}
		output(" Your [pc.thighs] quiver from an errant touch, and you nearly collapse.");
		output("\n\n");
		if(!pc.isNude()) output("Chuckling, Yancy tosses your forgotten gear over his shoulder and into a storage bin. Instead of worrying when he pulled that out, y");
		else output("Y");
		output("ou nibble on your lower lip and bat your eyelashes");
		if(pc.hasVagina()) output(", stroking a finger through your folds to show just how wet you are.");
		else 
		{
			output(", circling a ");
			if(pc.isLactating() && pc.milkFullness >= 100) output("leaking ");
			output("nipple to show just how ready you are for your milking... or his cock. Whichever.");
		}
		output(" Those warm hands fall on your sensitive flesh once more. Yancy grunts, lifting you like little more than a ");
		if(pc.tallness >= 80) output("very ");
		if(pc.tallness >= 70) output("heavy ");
		output("sack of grain, your head nestled firmly against one of his sweating, musky pecs.");

		output("\n\nHis particular body odor is really nice, actually. You can pick out individual notes in it. Here, an aroma of slow-roasted nuts, laced with a pheromone cocktail that has your skin flushing. There, a whiff of an almost chocolatey scent, a unique chemical mark that’s already rubbing off on you, marking you as his, at least until you take a shower. Your Treated brain, freed from pointless, overdrawn thoughts, parses the chemical stew in an instant. Your eyes light up. The stud wants to fuck you!");
		output("\n\nHe smirks in the most adorable, panty-soaking way.");
		if(!pc.hasVagina()) output(" You wish you had a pussy just so you could cream yourself all over his hand, then feel him slipping his digits inside to make sure you’re ready.");
		else output(" You’re just glad he can feel you creaming yourself all over his hand; that you can enjoy the way his fingers are sliding inside, starting to wriggle around playfully. Void above, each is thicker than a normal terran’s cock.");

		output("\n\n<i>“I’ve seen that look before,”</i> he observes");
		if(pc.hasVagina()) output(" with an accompanying twist of his fingers inside you. Your [pc.hips] shake and buck");
		output(". <i>“If it wasn’t my job to ensure you were perfectly milked, I’d already have you bent over the table for a good seeding, but since you’re technically a customer, what do you want to do while we drain these puppies?”</i>");
		output("\n\nThere’s a very serious-looking bulge in his pants. You could be a real slut and let him fuck you until your [pc.legOrLegs] stop");
		if(pc.legCount == 1) output("s");
		output(" working, or you could let the milkers get you off while getting a drink of the lovely-smelling ambrosia staining his fly.");
		//[Fucked] [Blowjob]
		clearMenu();
		addButton(0,"Get Fucked",treatedPCsGetCuntFilledAndMilkedPtI,undefined,"Get Fucked","Do what comes naturally....");
		addButton(1,"Give B.J.",treatedBlowjoerbsAndMilking,undefined,"Give Blowjob","Give Yancy a blowjob while you’re milked....");
		if(pc.hasCock() && pc.cockThatFits(600) >= 0) 
		{
			if(flags["YANCY_BUTTFUCKED_BY_PC"] == undefined) addButton(3,"Pitch Anal",yancyGiantParagraphButtfucksByAnalmancyIncorporated,undefined,"Pitch Anal","You can’t deny that you’d like to see the bull’s cock bouncing while you fucked Yancy’s ass to the beat of the milkers. Ask him if he feels the same way... you never know!");
			//Tooltip (Repeat): 
			else addButton(3,"Pitch Anal",yancyGiantParagraphButtfucksByAnalmancyIncorporated,undefined,"Pitch Anal","Fuck Yancy’s ass to the beat of the milkers draining your tits.");
		}
		else addDisabledButton(3,"Pitch Anal","Pitch Anal","You need a dick that will fit Yancy’s butt to do him there.");
	}
}

//Treated Blowjoerbs + milkin’
public function treatedBlowjoerbsAndMilking():void
{
	clearOutput();
	showBust("YANCY");
	showName("\nYANCY");
	output("You run a hand down the center of his sweating chest, all the way to the inadequately reinforced band of his straining trousers. The fabric is warm, heated by that too-thick length inside. Your other hand dabs at the drool eking out of the corner of your mouth while you try to think past the all-consuming thoughts of cocks that occupy your sizzling, oversexed brain. You open your mouth and giggle, fishing around for words. <i>“Well... I could suck too.”</i> You leave your [pc.lips] pursed afterward, licking them once to make sure they shine.");
	output("\n\nYancy chuckles. <i>“Sure thing, babe. Here, let me get things arranged for you.”</i> He casually pushes your hand away from his zipper. <i>“If we’re gonna do this, we’re gonna do it right. No half-assed blowjobs.”</i>");
	output("\n\nYou pout after gulping down a mouthful of spit, unsure how you could do anything less than mouth-worship a wonderful smelling guy like that. When did you start salivating so much anyway?");
	output("\n\nThe hay underfoot rustles while Yancy drags one of the stools up next to the padded table. He nods to himself with a grunt of satisfaction. <i>“That ought to do. Well...”</i> He looks you up and down, sizing you up. <i>“Here.”</i> The big bull’s thick, calloused digits fiddle with a knob to adjust the stool’s height. <i>“I figure that should put you at just about the right height for what you’re planning. What do ya think?”</i>");
	output("\n\nYou shrug, watching Yancy climb up atop the milking table, barely aware of his question. He’s looking at you awfully expectantly, but his cock isn’t out yet. He must not want it sucked yet. Oh, he wants an answer! <i>“Yeah...”</i>");
	output("\n\nHe nods and hops atop the table. To its credit, it doesn’t even creak, obviously built to withstand the weight of two or three vigorously entwined bodies. Grabbing " + num2Text(pc.totalBreasts()) + " milker tubes, Yancy lays them down alongside his perfectly spread legs.");
	output("\n\nYou can smell his cock, not just him, but his package. You aren’t sure why you even bothered smelling the rest of him; the soul-searing scent of his building arousal takes hold of you as firmly as the arms guiding you into the chair. You ");
	if(!pc.hasVagina()) output("settle");
	else output("squish");
	output(" into your place, ");
	if(pc.hasVagina()) output("dripping everywhere with ");
	output("your face a scant few inches from a seriously manly looking bulge. Yancy is openly grinning now, and why shouldn’t he? He’s gonna get to cum out all that delicious... spunky... white stuff. You giggle nervously and reach for his zipper.");
	output("\n\nThis time he doesn’t stop you. The button at the top practically bursts open of its own accord, releasing a tube of nub-covered horsecock. Its blunt head thickens before your eyes, stretching a solid five inches above the waistband, and its still-growing, increasingly tumescent mass is actually forcing the zipper down with the force of its engorgement.");
	output("\n\nA slow-sucking tube presses against one of your [pc.breasts], barely felt or noticed. Your mind is too full of thoughts of dick to wholly process the sensations it triggers, but it does bring with it a kind of slow-burn, dizzying euphoria. Giggling, you nuzzle the musky rod and revel in the feelings his magic machine is pumping into you. The second cup touches down, making you moan on the spot. New instincts kick in, and you dive forward to put your open mouth to use.");
	output("\n\nIt’s a tight fit, but you manage to slip him inside. He tastes like salt and sweat and heaven. Your cheeks hollow, your body doing its best to see just how much of his delicious length it can handle. It turns out to be a lot.");
	pc.changeLust(14);
	processTime(3);
	clearMenu();
	addButton(0,"Next",treatedPCsSuckYancysDickForMilkPartII);
}
public function treatedPCsSuckYancysDickForMilkPartII():void
{
	clearOutput();
	showBust("YANCY");
	showName("\nYANCY");
	output("Yancy’s stoic, gruff facade melts in the squeezing, sucking embrace of your throat. His groan practically rattles the stall.");
	output("\n\nYou revel in it, paying special attention to just how your tongue was moving at that moment. Cocks are like puzzles to you. Puzzles that quiver and pulse, then spurt out their creamy reward once you solve them. Yancy’s is a lot of fun. There’s not a lot of guys in the galaxy with cocks this thick, and certainly not a lot of guys with such potent-smelling, nub-covered horse-cocks.");
	output("\n\nIf you weren’t already committed to the idea of getting him to blow a cheek-bulging load in your mouth, you’d be climbing on top of him right now just to see how great it would feel. It would feel great. You nod around the mouthful, confident in that assessment.");
	output("\n\nYancy’s tip bloats during one slow, backwards-sliding suck, dumping a shot glass worth of slick pre onto your tongue. The texture is something like syrup, only that sweet-tasting concoction has nothing on the delightful flavor or a mouthful of bullboy fuckbatter. You roll it around your mouth and over every inch of his dick, mixing it with your spit into a shining coat of sex gloss. Only then do you stop to swallow the deposit of pre-jizz.");
	output("\n\nWhinnying in delight, Yancy ");
	if(pc.horns > 0 && pc.hornLength > 2) output("grabs you by the horns");
	else if(pc.hasHair() && pc.hairLength > 2) output("grabs you by the [pc.hairNoun]");
	else output("grabs you by the back of the head");
	output(" and stuffs his whole ten inches inside you. You let him, too busy enjoying the taste of his pulsing, hot rod against your palate and [pc.tongue]. There’s not really anything else you can do anyhow, not with how strong his muscles look. You bat your eyelashes and look up, hollowing your cheeks for best effect. His dick gives an approving quiver.");
	output("\n\n<i>“Oh shit, sorry.”</i> Yancy releases you with a shudder and another spurt of bullcream.");
	output("\n\nStill fully embedded, you look at him quizzically. The thought of pulling out of the position he’s forced you into doesn’t even occur to you; besides, you could pull back an inch and breathe through your nose once you start to get light-headed.");
	output("\n\nThe farmhand’s thighs tremble. He’s obviously struggling with the urge to grab you and fuck your throat raw. It’d feel really good for him. You bet he’d even give a ");
	if(pc.hasVagina()) output("panty-drenching");
	else output("stall-rattling");
	output(" roar of satisfaction if he really started going at it. And then he could squirt straight into your belly... or pull off and paint your face. You’d be able to really enjoy it that way, dabbing drop after drop of ivory ambrosia onto your tongue until you got full.");
	output("\n\nYancy’s muscles flex, the veins standing out in stark relief against his well-groomed skin. <i>“Gotta... milk you.”</i>");
	output("\n\nBut you’ve been milking all this time! The feeling of trickling, gentle release has echoed your mouth’s accomplishments suck for suck, creating tiny little puddles inside the glass cups that hang from your [pc.fullChest].");
	output("\n\nThe sound of a mechanical click draws you from your lactic reverie.");
	//Next
	processTime(11);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",treatedPCsSuckYancysDickForMilkPartIII);
}

public function treatedPCsSuckYancysDickForMilkPartIII():void
{
	clearOutput();
	showName("\nYANCY");
	showBust("YANCY");
	output("The milkers come alive, the suction doubling, then tripling in seconds. They soon establish a steady rhythm, sucking hard then giving you a moment of more relaxed tugging. Yancy must have turned them up. There’s no way that you could have been leaking like that from an idle setting... could you?");
	output("\n\nYour eyelids droop low while you try to puzzle out the wonderful feelings coming from your [pc.chest]. Each [pc.nipple] is shooting electric currents of squirting relief into your sorely-taxed mind, bathing your conscious thoughts in a [pc.milkColor] soup. Shrugging, you pump your mouth up and down Yancy’s considerable girth like a tight masturbation sleeve, not that a stud like him would ever need one. Sometimes he squirts pre-cum straight into your esophagus, other times it gives your [pc.tongue] the tastiest kind of bath.");
	output("\n\nSometimes you forget where you are, too excited and too full of dick for your memory to work properly. You feel like a slippery throat hooked up to a ");
	if(pc.bRows() > 1) output("few sets");
	else output("set");
	output(" of gushing teats, barely conscious of anything else. The muffled moo you make is involuntary, but Yancy’s dick seems to like it. The vibrations ripple along his textured, spit-slicked length, and his blunted tip widens until it threatens to eclipse the rest of his girth.");
	output("\n\nYou moo again, for fun of course. It feels like the right sound for you to be making. Plus, it has your favorite bull ever on the edge of creaming himself. You reach out to cup his balls. They looked so lonely before - you couldn’t just leave them sitting there, all sweaty and untouched. Your fingers glide around them while your palms cradle them like heavy, precious relics, the only things in all the universe that can make the perfect sauce to accompany Yancy’s tasty cock.");
	//Cunts
	if(pc.hasVagina())
	{
		output("\n\nYour empty puss");
		if(pc.totalVaginas() > 1) output("ies have");
		else output("y has");
		output(" been randomly spasming, triggered by short-circuiting bursts of bliss, riding miniature orgasm after orgasm. You don’t even have to touch ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output("; getting your tits sucked is like riding the best high, and getting to taste a bull’s happiness? You could probably cream from the latter alone. The chair is soaked with [pc.girlCum] at this point.");
		if(pc.wettestVaginalWetness() >= 4) output(" The straw below is just as bad. Droplets are running down the chair legs right this very moment.");
	}
	//Dicks
	if(pc.hasCock())
	{
		output("\n\n");
		if(pc.hasVagina()) output("Your girl parts aren’t the only ones reacting to the good-time feelings basting your Treated brain. ");
		output("Your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("isn’t");
		else output("aren’t");
		output(" entirely hard, but ");
		if(pc.cockTotal() == 1) output("it is");
		else output("they are");
		output(" weeping ");
		if(pc.cumQ() < 25) output("a few trickles");
		else if(pc.cumQ() < 200) output("streams");
		else if(pc.cumQ() < 1000) output("steady streams");
		else output("rivers");
		output(" of [pc.cum]. There’s too many endorphins floating through your systems for a proper ejaculation, but too much pleasure not to let it out.");
	}
	//Back to errybody
	output("\n\nThoughts and concerns fade away, devoured by the rhythmic sucking of your [pc.fullChest] and the noisy slurps emanating from your mouth with each pass over Yancy’s oozing tool. It’s easier not to try to think - to just let your body slide along his thickening cock, to enjoy the smell of his sweat when your nose brushes his abs, to moo in amazement at the size and deliciousness of your bull’s pre-cum.");
	output("\n\nThrough it all, some part of you manages to stay aware of Yancy’s tip flaring. That blunt, seeping crown is getting bigger and bigger, squishing against the sides of your throat whenever you bottom out. He’s so close to cumming that you can actually taste it in the flavor of his pre. It’s gaining a certain salty richness that it lacked before, signalling that your stud is finally about to blow.");
	output("\n\nYou drag your dazed, glassy eyes up to meet his and moo, vibrating his cock from his sheath all the way to throat-obstructing flare. His response is immediate and powerful. Grabbing you by the ");

	if(pc.horns > 0 && pc.hornLength > 2) output("horns");
	else if(pc.hasHair() && pc.hairLength > 2) output("[pc.hairNoun]");
	else output("head");
	output(", he slams himself in to the hilt, bunching his sheath up under your lips and bathing your nostrils in pheromones so powerful that they make your head swim and your tits gush.");
	output("\n\nYancy peaks, holding you there, firing what feels like gallons of seed directly into your belly. He roars in ecstasy. The strength of it seems to rattle around the barn. Rolling back into your head, your eyes give up on meeting his, their work done. You ride it out, rubbing his balls to coax out every drop of seed with one hand while the other caresses your filling belly. Yancy shoves you back halfway through, smearing your lips with white spunk before he paints the rest of your face.");
	output("\n\nYou let your mouth hang open, catching as much as you can in there while he continues to soak your [pc.face] with spooge. You savor the taste and smell of it, slowly realizing that your tits have finally calmed, emptied of all [pc.milk].");
	if(silly) output(" You finally did it! YOU CALMED YOUR TITS! The galaxy could benefit from this discovery.");
	processTime(20);
	var ppYancy:PregnancyPlaceholder = new PregnancyPlaceholder();
	pc.loadInMouth(ppYancy);
	pc.loadInMouth(ppYancy);
	pc.loadInMouth(ppYancy);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] = "milked & sucked";
	IncrementFlag("YANCY_MILKED_PC");
	IncrementFlag("YANCY_SEXED");
	clearMenu();
	addButton(0,"Next",treatedPCsSuckYancysDickForMilkPartIV);
}

public function treatedPCsSuckYancysDickForMilkPartIV():void
{
	clearOutput();
	showBust("YANCY");
	showName("\nYANCY");
	//[Next]
	output("Yancy shuts down the machinery and helps you out of the pumps while you’re busy cleaning your face. Honestly, you’re smearing it around more than actually cleaning it up, making a show of gathering a dollop and then slowly sucking it off your finger. It gives you plenty of time to catch your breath, anyway.");
	output("\n\nStill wearing a mask of bull-cum, you bounce up and give the big guy a nice, long kiss for taking such good care of you. He seems a little taken aback by it all but stiffens nicely against your [pc.belly] all the same.");
	output("\n\nYou kiss him on the nose again.");
	output("\n\n<i>“Uh... thanks.”</i> The big guy blushes, rubbing his neck uncomfortably. <i>“Listen... I know you’re not mine or anything, but...”</i> He trails off, fishing for words while giving his cock a few idle strokes.");
	output("\n\nYou twirl away and gather your things, feeling a good bit lighter thanks to the milking. <i>“How could I not come back after you treated me so nice?”</i>");
	output("\n\nYancy smiles and blushes harder.");
	
	//End
	processTime(2);
	
	milkResultDisplay();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Treated PCs Get Fucked & Milked
public function treatedPCsGetCuntFilledAndMilkedPtI():void
{
	clearOutput();
	var x:int = pc.cuntThatFits(400);
	if(x < 0 && pc.hasVagina()) x = rand(pc.totalVaginas());
	showBust("YANCY");
	showName("\nYANCY");
	output("You wrap your arms around Yancy’s neck and kiss his stubbly chin, giggling at the way his coarse hairs scratch your face. <i>“Fuck me, big boy.”</i> You plant another kiss on his lips before he can respond, figuring you’ll be too busy moaning to give him any proper tongueplay in a few seconds. <i>“Fuck me raw.”</i>");
	output("\n\nYancy chuckles. <i>“Sure thing, babe. Here, let me get you positioned.”</i> He casually unwraps your arms and twists you in place, holding you so that your back is against his gleaming chest once more. He must wax it; you can’t feel a single scratchy hair, just the firmness of his potent, flexing muscles. Another arm is under your [pc.legOrLegs], adjusting you so that his hard, nubby horse-dick is aimed squarely at your [pc.vagOrAss]. He grunts a few times from the awkward positioning, and you do your best to make it easy on him. You wouldn’t want to interfere with this bull getting relief for his big, thick fuckstick and ooze-filled nuts.");
	output("\n\n<i>“You ready?”</i> Yancy pauses, then laughs. <i>“Of course you are.”</i>");
	output("\n\nWhat’s the hunk talking about? You were busy inhaling his scent and admiring the way his sweat let your [pc.butt] rub against his six-pack, hoping he’d go ahead and shove it on in. Your [pc.vagOrAss] is all tingly and hot, eager for an injection of hot, Texan meat, and for that matter, so is the rest of you.");
	output("\n\nSpreading your buttcheeks with two fingers, Yancy ");
	if(!pc.hasVagina()) output("circles your pucker a few times, just for fun.");
	else
	{
		output("slips a sausage-sized finger past them to prod");
		if(pc.hasClit()) output(" [pc.oneClit]");
		else output(" your female sex");
		output(", earning him a thorough glaze of [pc.girlCum].");
	}
	output("\n\n<i>“Knew it.”</i> The big bull doesn’t delay a moment later, lowering you down while you’re still trying to deal with the aftermath of his lazy probing, filling your brain with a hot, sticky mess of penetration-induced endorphins. Your eyelids droop, and your [pc.tongue] lolls out, drooling while you moan. His blunt-headed instrument slips right in, widening your passage as if to make room for the subsequent column of flesh. <i>“You Treated [pc.boy]s are so transparent. The merest hint of a dick, and it’s all you can think about.”</i>");

	if(pc.hasVagina() && x >= 0) pc.cuntChange(x,400);
	else pc.buttChange(400);

	output("\n\nThis displeasure in his voice is enough to pull you out of the sticky, pink-tinged pleasure that you were so enamored of just seconds ago. <i>“Nuh uh!”</i> You smile, proud you could manage that much while those nubs are pressing on every bundle of super-dense nerves inside your [pc.vagOrAss], pulling your nervous system’s triggers until you feel like a living, 21-gun salute.");
	output("\n\nThe more super-thick breeding stick slips inside you, the less Yancy bothers to hold you aloft. In the time it takes you to protest, he stops lifting you entirely, letting his pulsating cream-dispenser support you with only an arm around your chest to keep you from toppling forward");
	if(pc.biggestTitSize() >= 5) output(" under the weight of your bloated tits");
	output(".");

	output("\n\n<i>“You could’ve fooled me. It took you all of two minutes to start trying to jack me off through my pants... and look where you are now.”</i> He turns to face you towards a polished, metallic console. <i>“Really. Look.”</i>");
	output("\n\nThe sight of him taking you... it’s... it’s beautiful. You think back to art class in school, or at least what you remember of it, and compare it to millennia of masterpieces from a hundred different races. None came close to the perfect vision before you. Yancy is magnificent, all strong and firm, embedded in you to the hilt");
	if(pc.hasVagina()) output(", your [pc.girlCum] dripping freely from his balls");
	else output(", his balls looking positively full of the yummiest kind of juice");
	output(", and you’re a perfect picture of sexuality, your lips half open, eyelids lowered, blushing from head-to-");
	if(pc.legType == GLOBAL.TYPE_HUMAN) output("toe");
	else output("[pc.foot]");


	if(pc.hasFur() || pc.hasScales() || pc.hasFeathers()) output(" where it isn’t hidden by your [pc.skinFurScales]");
	output(".");
	if(!pc.biggestTitSize() < 1) output(" Oh, your chest is amazing too! Your [pc.nipples] are all puffy, ready to be milked, so flushed.");
	else output(" Oh, your [pc.chest] are amazing too! They’re jiggling around with every panting breath you take, the [pc.nipples] so prominent that anyone who sees you will know that they exist just to be licked, teased, and milked.");

	output("\n\n<i>“Yeaaaaah.”</i> Your reply is slow and dreamy. You stop trying to talk so that you can moan. Your internal muscles give Yancy a happy squeeze. So what if you jumped on his cock at the drop of his cock. You rub the tiny bit that’s still exposed, amazed at how those bumps pulse under your fingertips. <i>“It’s an awesome cock,”</i> you declare. <i>“Nothing wrong with an ap-... appreciation for one.”</i> Rippling those internal muscles again, you feel a hot jet of pre-cum against your " + ((pc.hasVagina() && x >= 0) ? "cervix" : "insides") + ". Talking is hard, but Yancy seems to like it.");

	output("\n\nThe bull uses his free hand to grab one of the milker’s cups and places it over a tit. The machine’s idle suction is enough to prickle your [pc.nipple] and hold the glass tube in place without any assistance, but not quite enough to make your boobs drool.");

	output("\n\nHe grunts, <i>“See? You’re already agreeing with me.”</i> The other cylinder pops right on, tugging just enough to fill your teats with blood and sensation. <i>“If I told you I was gonna work with you right here, on my dick, draining my balls so I can focus on my job, you’d probably just smile and nod.”</i>");
	if(pc.totalBreasts() == 3) output(" He attaches the last pump hose.");
	else output(" He attaches the last couple pump hoses.");

	output("\n\nThat’s silly. Why wouldn’t you want to fuck all day? You could probably wring out so many orgasms without even having to bounce up and down. His breathing alone shifts those ");
	if(pc.hasVagina()) output("pussy");
	else output("asshole");
	output("-massagers enough to make you pant and moan. The girl reflected on the machinery is grinning, but she’s not nodding at least. Closing your eyes, you let your head rest on Yancy’s shoulder and just enjoy the moment. <i>“If you really want to...”</i>");
	output("\n\nThe stud grumbles, <i>“This is why our movie industry never makes anything better than porno.”</i> He flicks a switch on the wall, and the pumps lurch into motion, bobbing and shaking as they rhythmically suck at your teats.");
	processTime(5);
	pc.changeLust(15);
	//Next
	clearMenu();
	addButton(0,"Next",treatedPCsGetCuntFilledAndMilkedPtII);
}

public function treatedPCsGetCuntFilledAndMilkedPtII():void
{
	clearOutput();
	showName("\nYANCY");
	showBust("YANCY");
	output("The milker doesn’t make much sound when it starts up, just a quiet, pulsating whirr. Honestly, you make more noise than it does. You’re moaning and quivering on Yancy’s dick, assaulted with enough sensation to break the mind of a lesser person. The pleasure center of your mind overwhelms every free neuron, leaving you with no thoughts aside from squirting milk, ");
	if(!pc.hasVagina()) output("stuffed assholes");
	else output("slippery slits");
	output(", and an all-consuming, fizzy kind of pleasure. Errant giggles slip your [pc.lips] in between the moans and moos, letting everyone in the barn know that a treated [pc.boy] is getting a thorough milking.");

	output("\n\nYancy, the big, wonderful stud, doesn’t bother talking anymore, too taken in by the way you’re wringing his extra-thick fuckstick to bother. With your boobs bound and ");
	if(pc.milkFullness < 70) output("dripping");
	else if(pc.milkFullness < 150) output("leaking");
	else output("squirting");
	output(" [pc.milkColor], he’s free to have a little fun with you. His hands grab you just below your ");
	if(pc.bRows() > 1) output("lowest row of ");
	output("[pc.breasts] and lift, dragging you up that nubby totempole until you’re feeling gaped and almost entirely empty. It felt so good that you hadn’t realized just how thick this guy is. He’s probably only ten inches long, but he’s as thick around as guys twice his length. Your [pc.vagOrAss] won’t soon forget him.");
	output("\n\nWith an excited-sounding growl, Yancy lets go, letting your bodyweight carry you the distance to his base.");
	if(pc.hasVagina()) output(" Your dripping [pc.girlCum] splatters out, displaced by a cock strong enough to serve as a shipboard strut.");
	else output(" Your [pc.asshole] bottoms out, filled with a cock strong enough to serve as a ship’s support strut.");
	output(" [pc.Milk] gushes out. The pumps had you going already, but the ");
	if(pc.hasVagina()) output("vaginal");
	else output("anal");
	output(" stimulation triggers a response firmly wired into your brain, left behind by busy machines not too long ago.");

	output("\n\nYou let out something between a moo and a cry of pleasure while Yancy pulls you back up for another gravity-assisted fuck.");
	if(pc.hasVagina())
	{
		output(" The next drop presses");
		if(pc.hasClit()) output(" a firm nub against [pc.oneClit]");
		else output(" a collection of nubs along your labia");
		output(" on its way past, and you nearly black out from the awesome, cunny-pleasing pleasure of it all.");
	}
	else output(" The next drop caresses your sorely taxed bottom’s nervous system once more, wrapping you in so much butt-clenching pleasure that you nearly black out from the ecstasy of it all.");
	output(" Giggling dopily, you moo again. The vocalization is instinctive and automatic. The harder your [pc.nipples] gush, the more enthusiastically you do it.");
	output("\n\nOf course you cum by the third drop. How could you not? Yancy’s dick is like a pre-cum hose too, and the head just keeps getting wider! By the time you hit drop number five, it’s easily the fattest part of his shaft by a fair margin, and your walls are painted with a thick layer of pre-emptive stud-cream");
	if(pc.hasVagina()) output(", somehow making you even slicker");
	else output(", making you twice as slippery as any terran’s cunt");
	output(". The girl on the other side of that silver machine looks really out of it. Her eyes are about to roll up into her skull, and she’s shaking like crazy while gushing [pc.milk]");
	if(pc.hasVagina()) output(" and splattering [pc.girlCum] across her adonis-like mate’s nuts");
	output(".");
	if(pc.hasCock()) output(" And the mess coming from her [pc.cocks]... well, someone’s going to need to bring a mop.");

	output("\n\nYou’re too well and truly fucked to contribute anything to the lovemaking at this point, but Yancy doesn’t seem to mind. He picks up the pace, pounding your [pc.vagOrAss] faster and faster, tossing you around like some kind of smiling fuckdoll. The best part is how right it feels, cumming from his big dick one moment and your buzzing nipples the next. All you have to do is moo, moan, and look like a slutty, blissed-out whore.");
	output("\n\nIt comes naturally to you. ");
	//Pass 35 minutes.
	processTime(35);
	var ppYancy:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(pc.hasVagina())
	{
		pc.loadInCunt(ppYancy, 0);
		pc.loadInCunt(ppYancy, 0);
		pc.loadInCunt(ppYancy, 0);
	}
	else
	{
		pc.loadInAss(ppYancy);
		pc.loadInAss(ppYancy);
		pc.loadInAss(ppYancy);
	}
	//Cum 10 ten times.
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	//Next:
	clearMenu();
	addButton(0,"Next",treatedPCsGetCuntFilledAndMilkedPtIII);
}

public function treatedPCsGetCuntFilledAndMilkedPtIII():void
{
	clearOutput();
	showBust("YANCY");
	showName("\nYANCY");
	output("Yancy pulls out of you with a satisfied sigh, chased by a flood of creamy white. The deluge slaps into the floor with wet, sloppy sounds. You dazedly rub at your slightly-bloated tummy. There’s a hole in your memory starting at the moment when his flare <i>really</i> swelled up and started to properly juice your insides. You’re pretty sure it was fucking awesome, if the way your [pc.vagOrAss] is still quivering is any indication.");
	output("\n\nYancy sits your ");
	if(!pc.hasVagina()) output("sperm-splattered ");
	output("derriere on the table and flicks the switch to the <i>“off”</i> position. At some point, your [pc.fullChest] went dry, and your [pc.nipples] have gotten so sore and sensitive, despite the [pc.milkColor] sheen that they still shine with. Standing up seems a little too hard, given your " + possessive(pc.legOrLegs()) + " boneless twitching, so you dip your finger into your [pc.vagOrAss] and idly stir it around, keeping the happy glow going as long as possible.");
	output("\n\nTossing you your stuff with a knowing smile, Yancy explains, <i>“");
	if(!pc.hasVagina()) 
	{
		output("Not that we need it for this, but it’s just habit, you know?");
	}
	else if(flags["YANCY_EXPLAINED_HIS_PILLS"] == undefined) 
	{
		output("Shame I have to take pills to keep from knocking all my clients up. You’d look awful hot with twins inside you.");
		flags["YANCY_EXPLAINED_HIS_PILLS"] = 1;
	}
	else output("Unfortunately, I’m not allowed to knock up the girls that come here. The pills I’m on make it so that goo’s only really for show. If you see Big T, tell him he should let the milker attendants really take care of their customers, okay?");
	output("”</i>");
	output("\n\n");
	if(pc.hasVagina()) output("Awww, that’s too bad. You get dressed and make ready to leave, but Yancy’s dick is still all wet with the mixed juices. You drop to your [pc.knees] and lick him clean, pleased to see him back at full mast by the time you finished. The next girl should appreciate your effort, and besides, his cum is like, totally tasty.");
	else output("Yeah... maybe someday you can bear this bull a few kids of his own, but for now, you’ll settle for tonguing off his pole. There’s no sense in letting such a nice rod go uncleaned. The next girl will appreciate it, and if the next girl is you... all that time spent hard ought to help him refill with more yummy sauce!");
	
	processTime(3);
	
	flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] = "milked & fucked";
	IncrementFlag("YANCY_MILKED_PC");
	IncrementFlag("YANCY_SEXED");
	
	milkResultDisplay();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Untreated Milked & Fucked
public function untreatedMilkedAndFucked():void
{
	clearOutput();
	author("JimThermic");
	showBust("YANCY");
	showName("\nYANCY");
	output("Pulling back, you look Yancy in the eye and bite your [pc.lips]. <i>“Could you fuck me, like one of those cows?”</i>");
	if(pc.hasVagina()) output(" [pc.EachVagina] is so hot and sticky");
	else 
	{
		output(" You wonder ");
		if(pc.analCapacity() < 400) output("if you can");
		else output("just how it’ll feel to");
		output(" take something that thick in your [pc.asshole].");
	}
	output("\n\nYancy smiles at that. <i>“If you really want it that way, " + pc.mf("Sir","Miss") + ". You’re the customer.”</i>");
	output("\n\nThe powerfully built bull suddenly strips off his shorts. His fleshy horse cock swells before your very eyes. Not only is he incredibly girthy, but his pink sheath is covered in delicious little nubs.");
	output("\n\nYou lick your lips just looking at his flaring horse head. You imagine your [pc.lips] slowly wrapping around it and savoring his salty taste. If you weren’t already ");
	if(pc.hasVagina()) output("glistening wet");
	else if(pc.hasCock()) output("aching hard");
	else output("worked up");
	output(" you certainly are now. You don’t have long to ogle it.");

	output("\n\nYancy twists you in his arms, and you let out a surprised gasp. <i>“W-what are you doing--?”</i> you nervously ask, at the same time a little thrilled by the rough treatment.");

	output("\n\n<i>“Treating you exactly like a cow. That’s what you asked for, right?”</i> His rough voice echoes your request, and your cheeks furiously flush. Right. You DID ask for that, but hearing it repeated out loud is more than a bit embarrassing.");

	output("\n\nYancy doesn’t seem bashful in the least. His calloused hands trail up your naked [pc.skinFurScales] and tease your [pc.skinFurScalesNoun]. He forcefully grabs your waist. His impressive horse cock rubs pointedly between your bare buttocks and you shiver with delight.");

	output("\n\nIs this how the cows feel every day? You’re totally entranced by his stiffening cock pressed flush against you. Spending every day with that magnificent piece of man meat buried inside of your [pc.ass] - maybe being a Treated " + pc.mf("boy","girl") + " isn’t so bad?");

	output("\n\n<i>“Get on the milking table, ");
	if(pc.legCount == 2) output("on all fours");
	else output("ass in the air");
	output(",”</i> the strapping bull commands you. His powerful hands guide you up onto the knee-high table. You’re acutely aware of his firm digits on your [pc.hips] as they expertly guide you into position.");
	if(pc.hasCock() || pc.hasVagina())
	{
		output(" <i>Is he looking at your ");
		if((!pc.hasCock() || rand(2) == 0) && pc.hasVagina()) 
		{
			if(pc.wettestVaginalWetness() < 3) output("dripping wet");
			else if(pc.wettestVaginalWetness() < 5) output("sopping wet");
			else output("sloppy");
			output(" puss");
			if(pc.totalVaginas() > 1) output("ies?</i>");
			else output("y?</i>");
		}
		else if(pc.hasCock()) output("hard [pc.cocksNounSimple]?</i>");
	}

	output("\n\nYou wait with bated breath for what comes next. The strapping stud really <i>is</i> treating you like just another cow. You can feel his large hands sliding up from your hips and up your sides. They rise up underneath your [pc.breasts] and give them a firm squeeze. It feels so good-!");
	output("\n\nYou arch your back and let out an involuntary throaty moan. Your [pc.nipples] are painfully erect between his strong fingers. He pinches them, and you tremble with delight. You want more than for him to play with your [pc.breasts].");
	output("\n\n<i>“");
	if(pc.biggestTitSize() < 10) output("Such cute little udders. We don’t see many this size around these parts.");
	else if(pc.biggestTitSize() < 25) output("You’ve got nice, well-rounded udders. Good milking stock.");
	else if(pc.biggestTitSize() < 45) output("Such large udders! We’ll get a few batches out of you.");
	else output("You’ve got some massive udders! Are you sure you’re not a runaway cow?");
	output("”</i> He sizes up your [pc.breasts] with his hands, squeezing them like a farm animal’s. You flush with embarrassment, and you think about objecting. You part your [pc.lips] and let out a needy little whine instead.");

	output("\n\nHe leans in to squeeze and knead your breasts, and you can <i>feel</i> his fully erect love-rod pressing between your bare buttocks. It’s so hard and thick! You clench your cheeks and wiggle your [pc.ass] against his fleshy equine staff. You’re desperate to be milked and mated by the girthy bull-!");

	output("\n\nYou hear him reaching for something, and suddenly a suction cup is being pressed flush with one of your tits. You watch as your [pc.nipple] is immediately sucked into the glass tube. The vacuum prickles your pert areola and you let out a truly lewd moan. He then attaches the other cup");
	if(pc.totalBreasts() > 2) output("s");
	output(".");

	output("\n\nYour warm [pc.milkNoun] begins to ");
	if(pc.milkFullness < 75) output("slowly drip");
	else if(pc.milkFullness < 150) output("freely leak");
	else output("liberally squirt");
	output(" into the transparent cylinders. Watching your [pc.breasts] being milked by the machine and the [pc.milkColor] spoils traveling up the see-through tubes makes you a little giddy. Just like a herd animal, you’re offering up your [pc.milkFlavor] broth to be drunk, without complaint!");

	output("\n\n<i>“Let’s see if we can stir a bit more [pc.milkNoun] out of you, cow.”</i> You feel the beefy bull’s firm hands on your [pc.hips], guiding you back against his incredible girth. His gigantic balls caress your [pc.thighs] and they tremble in delight. Is he finally going to fill your [pc.vagOrAss]?");

	output("\n\nSuddenly he’s pressing his flared equine tip against your [pc.vagOrAsshole], rubbing it back and forth against your ");
	if(pc.hasVagina()) output("sopping wet slit");
	else output("puckered star");
	output(". Something creamy and slick is drooling all over your sensitive ");
	if(pc.hasVagina()) output("snatch");
	else output("hole");
	output(", and you realize it’s the bull’s pre-cum. His masculine odor deliciously assaults your nose. You feel like swooning simply from his musky scent!");

	output("\n\nThe extra lubrication helps the girthy bull work his flat tip inside of you. You feel yourself stretching wide around his fleshy column, your [pc.vagOrAss] slowly accommodating him, and you whimper with delight. Inch by inch, he slides inside of you, and you sink further into ecstasy.");

	output("\n\nHis flared equine tip presses ");
	if(pc.hasVagina()) output("flush against the entrance to your womb");
	else output("into the deepest recesses of your [pc.ass]");
	output(". A gooey gush of pre-cum spurts out of his stallion cock, painting your warm confines with his spunk. You gasp as his girthy cock flexes and spills inside of your [pc.vagOrAss]. You melt with pleasure and lift your [pc.hips], hopeful that his ");
	if(pc.hasVagina()) 
	{
		output("fertile seed will find its way to your eager womb...");
		pc.cuntChange(0,400);
	}
	else 
	{
		output("frothy seed will be followed up by successive servings...");
		pc.buttChange(400);
	}

	output("\n\n...Wait, what are you thinking? You’re [pc.name], not some dumb cow slut looking to be bred! At the same time, you can’t deny the thrill you feel at the thought of being used as this bull’s personal fuck-toy. Right now, his girthy cock in your [pc.vagOrAss] truly feels like the most important thing you can imagine.");
	output("\n\nYour thoughts are obliterated by the sensation of his muscular hips slapping against your [pc.ass] and his fleshy column gliding back and forth. With every carnal thrust, his nubs deliciously caress your inner walls, and you positively melt with pleasure. His cock feels so good!");
	output("\n\nWith each slapping thrust, your [pc.nipples] liberally spurt out [pc.milk], and your [pc.vagOrAss] needily wrings his throbbing shaft. His strong, muscular cock feels so wonderful inside you, like it belongs there, and every withdrawal makes you yearn for its return. As he gives it to you from behind, you return the favor from your [pc.breasts], providing him with wonderful, [pc.cumFlavor] [pc.milkNoun].");
	output("\n\nBehind you, you can hear him moaning out loud, and his powerful hips slam against your [pc.ass]. His glorious flat-tipped member flares and fires thick, hot ropes of sticky spunk inside of your [pc.vagOrAss]. Feeling his hot seed spill inside of your ");
	if(pc.hasVagina()) output("fertile womb");
	else output("naughty ass");
	output(" as your [pc.breasts] are milked pushes you right over the edge.");
	if(pc.hasVagina()) output(" Your [pc.thighs] shake and you spastically cream yourself, your [pc.pussies] coating them with your [pc.girlCum].");
	if(pc.hasCock())
	{
		if(pc.hasVagina()) output(" Meanwhile, your");
		else output(" Your [pc.thighs] shake and your");
		output(" [pc.cocks] spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" [pc.cum] all over your [pc.belly], coating it in your jism.");
	}
	if(!pc.hasVagina() && !pc.hasCock()) output(" Your [pc.thighs] shake and you spastically cream yourself.");

	output("\n\nWhen the waves of body wracking pleasure subside, you’re surprised to feel a pair of powerful hands still gripping your [pc.hips]. Suddenly you feel him press his incredible length deep inside of your sloppy, cum-filled ");
	if(pc.hasVagina()) output("[pc.vaginaNoun]");
	else output("ass");
	output(", and you let out a startled gasp. Surely the muscular bull can’t still be raring to go?");

	output("\n\n<i>“...Who said I was done yet? Cow sluts get fucked for a half hour at the very least.”</i> You moan as you feel Yancy’s flat-tipped horse-member flexing and flaring inside of you, stirring up the slick spunk plugging up your hole. <i>“After all, don’t you want the real experience?”</i>");
	output("\n\nYour eyes roll back at the blissful sensation and you instinctively press your [pc.hips] against his. Your mind is out to lunch, and your animal instincts take over - and all you want is to be mated and milked by this virile bull. And the bull is more than happy to oblige.");
	//Pass 35 minutes.
	processTime(35);
	var ppYancy:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(pc.hasVagina())
	{
		pc.loadInCunt(ppYancy, 0);
		pc.loadInCunt(ppYancy, 0);
		pc.loadInCunt(ppYancy, 0);
	}
	else
	{
		pc.loadInAss(ppYancy);
		pc.loadInAss(ppYancy);
		pc.loadInAss(ppYancy);
	}
	//Cum 10 ten times.
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	//Next:
	clearMenu();
	addButton(0,"Next",untreatedMilkedAndFuckedII);
}

public function untreatedMilkedAndFuckedII():void
{
	clearOutput();
	author("JimThermic");
	showBust("YANCY");
	showName("\nYANCY");
	output("Your whole body is buzzing with pleasure and your mind is completely blank. A thin sheen of sweat covers your [pc.skinFurScales] as you fight for breath. You are dimly aware of hot, thick globs of cum pouring down your white streaked [pc.thighs], and the milking caps being removed. Your [pc.breasts] feel drained dry.");
	output("\n\nReaching between your legs, you tentatively touch your quivering [pc.vagOrAss]. It’s already been well spread by his length and your probing digits slip easily inside. You’re totally packed with his slick and fertile seed! Right now you could die a happy " + pc.mf("man","woman") + ".");
	output("\n\nThere’s a surprisingly tender kiss on the [pc.skinFurScales] of your back, and you’re aware your lower back is being caressed. <i>“Thank you, my dear. Not only did you provide ");
	var milked:Number = pc.lactationQ();
	if(milked < 500) output("a bit");
	else if(milked < 2000) output("a lot");
	else output("gallons");
	output(" of [pc.milkNoun], I also really enjoyed fucking you. Most fun I’ve had in ages.”</i>");
	output("\n\nIs that a bashful tone to his voice? You turn around, though your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" no help - ");
	if(pc.legCount == 1) output(" it’s");
	else output(" they’re");
	output(" pretty much jelly after the thorough fucking he gave you. You notice he’s downing ");
	if(flags["YANCY_EXPLAINED_HIS_PILLS"] != undefined) output("those familiar pills");
	else 
	{
		output("some pills, and you quirk an eyebrow.");
		output("\n\nYancy gives you a knowing grin. <i>“...Oh, these? I’ve got to take pills to keep from knocking my clients up. ");
		if(pc.hasVagina()) output("That’s a real shame, too. I’d love to see you ready to bear my young.");
		else output("Not that we need it for this, but it’s just habit, you know?");
		output("”</i> There’s a slight flush to his cheeks, despite being naked and his magnificent tool covered in his and your love juice. <i>“Come back anytime, y’hear?”</i>");
	}
	
	processTime(2);
	
	flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] = "milked & fucked";
	IncrementFlag("YANCY_MILKED_PC");
	IncrementFlag("YANCY_SEXED");
	
	milkResultDisplay();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Untreated Milked + SuckHimOff
// By JimT
public function untreatedGirlsSuckYancyOffAndShit():void
{
	clearOutput();
	author("JimThermic");
	showName("\nYANCY");
	showBust("YANCY");
	output("Your hand rubs against his impressive bulge, and he flexes it within his tight shorts. Wow! You feel it pressing back against you, and an electric shiver runs up your spine. His pheromone-laced musk is making it hard to think.");
	output("\n\n<i>“On your knees.”</i> The powerfully built bull orders you. You’re surprised to find yourself kneeling on the hay before him. D-did you just do that without thinking? He presses his impressive bulge against your cheek and rubs it against your [pc.face]. <i>“...Now inhale.”</i>");
	output("\n\nYou do as he asks without thinking, breathing in his magnificent, heady scent. Your mouth is salivating and your eyes are fluttering back in their sockets. You let out a low, primal moan, losing yourself in the smells and sensations of his intoxicating loins.");
	output("\n\n<i>“..." + pc.mf("Good boy","Good girl") + ". I know a natural cock-sucker when I see one.”</i> Yancy gruffly tells you. You blush furiously, all the while rubbing your cheek against his hot firmness. You’re butt naked from head to");
	if(pc.legType == GLOBAL.TYPE_HUMAN) output(" toe");
	else output(" [pc.foot]");
	output(" and kneeling before a virile bull, What’s wrong with you?");
	output("\n\nWhen the burly bull pulls his bulge away, you feel a rush of disappointment, only to realize he’s grabbing the milking cups. Right - you asked to be milked! Your mind blanked the moment he pressed that wonderful, godly bulge against your face... you shake your head once more, trying to clear your thoughts. You’re acting like a common cow slut!");
	output("\n\nHowever, when his powerful hands press the suction cups against your [pc.nipples], you melt with pleasure once more. Your [pc.breasts] are tugged and teased by the glass cylinders, heightening your truly unbridled excitement. Your suckled nubs ");
	if(pc.milkFullness < 50) output("slowly drip");
	else if(pc.milkFullness < 100) output("freely leak");
	else output("liberally squirt");
	output(" [pc.milk] into the tubes before you.");

	output("\n\nThe fact you’re on your [pc.knees] getting milked like some slutty stock animal gets you so hot that your [pc.thighs] can’t stop quivering. Just when you think it can’t get any hotter, the beefy bull strips off his shorts, and his fleshy horse-cock flops out before your very eyes - all ten inches of him.");

	output("\n\nYou take in the sight of his flaring stallion with bated breath. It’s so thick and long! Not only that, his pink length is covered in delicious little nubs. When he pushes his pheromone-laced crotch into your face once more, you positively melt with pleasure. It smelled so good covered up, but it was nothing compared to this!");

	output("\n\n<i>“Suck it.”</i> Yancy orders you. You tremble with delight - it’s like he’s answered your prayers! You greedily wrap your [pc.lips] around his flat-tipped horse-member, desperate to bring relief to your virile bull. Your jaws creak as you barely manage to take his awe-inspiring tip into your hungry mouth. As his fleshy tip rubs against your tongue, you swoon with delight. Have you ever tasted anything so exquisite?");
	output("\n\nA thick dollop of pre-cum drools out from his tip and coats your tongue, rewarding your efforts. You swoon in the knowledge that the stocky bull is enjoying himself. Your tongue hungrily lashes at his sizable urethra and sensuously dips inside his slickened hole. Drool runs down your cheeks as you desperately seek out every drop of his delectable sperm.");
	output("\n\n<i>“What did I tell you? A natural cock-sucker.”</i> Yancy groans and brings his powerful hands behind your head. With a single, mighty thrust he buries his fleshy horse-column down your throat, and you let out a muffled moan. For some reason your gag-reflex doesn’t even kick in as his flared tip spreads and caresses the deepest recesses of your throat. Your head is spinning from his potent musk - maybe what he what he says true, and you were born to suck cock?");
	output("\n\nAnother thick, creamy dollop of his glorious spunk dribbles down your throat, and the last of your resolve crumbles. You happily plunge forward and bury your nose hard against his base, eager to please the exquisite male bull. Every dribble of his hot seed down your throat sets your senses aflame and warms your belly, your [pc.thighs] quivering with the knowledge he’s filling it with his awe-inspiring spunk. It feels so <i>right</i>, and you wonder why you would ever want anything other than this?");
	output("\n\nYancy lets out a deep, guttural groan and grinds his powerful hips against your face. You flush with satisfaction and pride, your [pc.thighs] trembling. He’s enjoying it! You gurgle noisily and moan as he animalistically fucks your narrow throat. In that moment [pc.name] Steele is gone, and all that is left is Yancy’s cock-sucking cow slut, using your mouth as his rightful prize.");
	output("\n\nSuddenly you hear him let out a sharp cry and bury his glorious flat-tipped cock in the deepest recesses of your throat. The bull fires spastic ropes of thick, gooey sperm in your gullet. You thoroughly cream yourself with Yancy’s incredible length buried down your neck, your [pc.thighs] spastically shaking as he fills your stomach with his creamy seed.");
	output("\n\nYou tremble and quake a while longer, [pc.milk] squirting from your tits");
	if(pc.hasVagina()) output(" and [pc.girlCum] from your [pc.vaginas]");
	else if(pc.hasCock()) output(" and [pc.cum] from your [pc.cocks]");
	output(". When he stops twitching, you pull Yancy’s cock out of your wet, sperm splattered mouth. The drunken, bliss-filled look in your eyes sets him off once more, and you moan as another glorious rope of his spunk splatters your [pc.face] and cheek, covering you in his heady scent.");

	output("\n\nNot wanting a single drop of his wonderful spooge to go to waste, you diligently lick off his cum-splattered equine cock. Just when you think you’re done, his flat head flares and delivers another gooey gush of his succulent seed for you to lick off. You moan like a total cum slut, savoring his heavenly taste washing over your tongue.");

	output("\n\n<i>“That was - wow.\”</i></i> Yancy coughs. You lie back, utterly spent, and your [pc.breasts] feeling well and truly emptied. The virile bull removes the cups for you, and you tremble at the feeling of his strong fingers caressing your well-pumped udders. Your head finally begins to clear a little, and you furiously blush.");

	output("\n\n<i>“Anytime you want to do that again - anytime at all - come see me.”</i> Yancy winks and slips on his shorts. You feel a pang of regret seeing the fabric cover up his well-licked man meat. Perhaps next time he’ll fuck your [pc.vagOrAss] with it, you fantasize, feeling a little giddy at the thought...");

	processTime(30);
	
	var ppYancy:PregnancyPlaceholder = new PregnancyPlaceholder();
	pc.loadInMouth(ppYancy);
	pc.loadInMouth(ppYancy);
	pc.loadInMouth(ppYancy);
	pc.orgasm();
	flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] = "milked & sucked";
	IncrementFlag("YANCY_MILKED_PC");
	IncrementFlag("YANCY_SEXED");
	
	milkResultDisplay();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Untreated Titjob
// By JimT
public function untreatedTittyFucksForYancy():void
{
	clearOutput();
	showName("\nYANCY");
	showBust("YANCY");
	author("JimThermic");
	output("His masculine odor fills your nostrils and it smells so intensely erotic. You slide your arms around Yancy and sensuously rub your lactating breasts against his broad, manly chest. You can see his cheeks flushing with delight, and you feel a rush of pride at this. He’s definitely into you!");
	output("\n\n<i>“...How about instead of you milking my tits, I milk you with them--?”</i> You naughtily suggest, deliberately dragging your [pc.nipples] across his deliciously waxed chest. You can feel his sizable bulge twitching at your sensation, and he lets out a throaty groan. Just one more push, and you’ll have your way.");
	output("\n\nYou sinfully slide your fingers down his mighty abdomen, trailing the tips between his contours. Finally, you slide it underneath his shorts, until you’re firmly grabbing his prodigious equine length. Boy, is he thick! You marvel at the sheer girth of the bull boy; you’re barely able to strain your digits around him.");
	output("\n\nLooking at the impressive fleshy pillar jutting up from between his thighs, you realize there’s nothing ‘boyish’ about him. You drool over the sight of his impressive manhood, from his flat equine tip to his heavy, fist-sized balls dangling between his legs. Just <i>looking</i> at it makes your [pc.thighs] tremble!");
	output("\n\nNot one to back down from such a <i>considerable</i> challenge, you ");
	if(pc.hasKnees()) output("sink down to your knees and ");
	output("slide between his legs. It looks even taller and more impressive looking up at it - a true paragon of masculinity. You start your summit climb at the base, wrapping your [pc.breasts] tenderly around it.");
	output("\n\nUp and down, you slowly slide his flat-tipped equine cock between your [pc.chest] in sensuous, unhurried strokes. Your udders jiggle as you lewdly wring his magnificent man meat. The musky scent of his cock is making you dizzy with desire and you find yourself moaning as you squeeze it, losing yourself in the moment.");
	output("\n\nYancy groans and a thick, gooey dollop of pre-cum spills down his shaft and smears across your [pc.skinFurScales]. You greedily suck on the head of his equine cock and suck up his zesty spunk. Another creamy pearl spills across your tongue and you tremble with delight, relishing in his ambrosial taste.");
	output("\n\nGreedy for more of his wet cum, you dive down onto his flaring member and hungrily take it between your [pc.lips]. You swoon at the feeling of his pulsing head inside of your mouth, and you marvel at how awesomely <i>right</i> it feels. You - [pc.name] Steele - are totally butt-naked, titfucking, and sucking off a virile bull, and loving it!");
	output("\n\nThe pleasure circuits in Yancy’s brain tick over, and suddenly he’s taking charge - grabbing the back of your head and grinding his hips up against you. You gag as his flat tip hits the back of your throat, and you drool all over his cock. At the same time, your loins ache with pleasure at the abuse, totally getting off on it. You want to be used, abused, and covered in his glorious bull boy cum!");
	output("\n\nBetween your slapping breasts and your slurping sperm hungry lips, Yancy quickly reaches his peak. You hear a primal, bull-like groan and toasty, slick spunk spills across your tongue. You let out a muffled moan, utterly creaming yourself at the same time, your senses swallowed by his spurting spunk. Your [pc.thighs] quake and ");
	if(pc.hasVagina()) output("are liberally covered in your [pc.girlCum]");
	else if(pc.hasCock()) output("you spurt your [pc.cum] all over his muscled belly");
	else output("you experience a galaxy shattering orgasm");
	output(". Unable to swallow it all, you pull back and several long ropes of bull cum splatter over your udders, coating them in his delicious heady musk.");

	output("\n\nYou continue to wring his flat-tipped horse-cock with your slickened mammaries, making sure that every drop is splattered on you. Deep down you want to be utterly coated in his sticky spunk, and your insistent wringing prolongs the bull boy’s orgasm. Smaller jets jump out and smear across your sperm splattered face and breasts. You experience another small orgasm just wringing him dry, trembling madly as you fiercely clench his equine cock between your tits.");

	output("\n\nAfterwards, you sigh happily and run your fingers across your [pc.skinFurScales]. You utterly reek of sex, not to mention Yancy’s distinctive bull scent. He provided so much that you look like you’ve been in an orgy with several bulls, instead of a single one, and this thought makes you shiver with delight.");
	output("\n\nYou don’t seem to be alone in the thought as Yancy looks you over. His impressive girth twitches and becomes erect once more simply looking at you.");
	output("\n\n<i>“...You look so hot like that - I just can’t help myself!”</i> He rumbles, picking you up and placing you on the milking bench. You shiver with delight as he shoves his newly erect cock fiercely inside your [pc.vagOrAss], ravaging you with animalistic lust. Utterly dazed and shivery from before, you go with the flow, moaning as his impressive girth fills up your needy hole. Talk about waving a red flag in front of a bull!");
	if(pc.hasVagina()) pc.cuntChange(0,400);
	else pc.buttChange(400);
	// Time pass
	// Five more cums.
	processTime(20);
	clearMenu();
	addButton(0,"Next",tittyFuckingYancyUntreatedEpilogue);
}

public function tittyFuckingYancyUntreatedEpilogue():void
{
	clearOutput();
	showBust("YANCY");
	showName("\nYANCY");
	author("JimThermic");
	output("When you finally leave the milking stall, your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" quivering, and you’re utterly splattered head to");
	if(pc.legType == GLOBAL.TYPE_HUMAN) output(" toe");
	else output(" [pc.foot]");
	output(" with glorious bull spunk. It leaks from your [pc.vagOrAss] and down your [pc.thighs], and you shiver with pleasure, feeling well and truly satiated. Yancy himself is completely spent, lying short of breath on the table. It seems you wore the bull boy out.");
	
	flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] = "milked & titfucked";
	flags["YANCY_SEXED"] = 1;
	
	processTime(10);
	
	var ppYancy:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(pc.hasVagina())
	{
		pc.loadInCunt(ppYancy, 0);
		pc.loadInCunt(ppYancy, 0);
		//pc.loadInCunt(ppYancy, 0);
		//pc.loadInCunt(ppYancy, 0);
		//pc.loadInCunt(ppYancy, 0);
	}
	else
	{
		pc.loadInAss(ppYancy);
		pc.loadInAss(ppYancy);
		//pc.loadInAss(ppYancy);
		//pc.loadInAss(ppYancy);
		//pc.loadInAss(ppYancy);
	}
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	
	milkResultDisplay();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yancy Buttfucking (Treated or Untreated)
//Tooltip (1st Time): You can’t deny that you’d like to see {the bull’s cock // that big, nubby cock of his} bouncing while you fucked Yancy’s ass to the beat of the milkers. Ask him if he feels the same way... you never know!
//Tooltip (Repeat): Fuck Yancy’s ass to the beat of the milkers draining your tits. 
public function yancyGiantParagraphButtfucksByAnalmancyIncorporated():void
{
	clearOutput();
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	author("Savin");
	showBust("YANCY");
	showName("\nYANCY");
	//First time:
	if(flags["YANCY_BUTTFUCKED_BY_PC"] == undefined)
	{
		//If not hard or Treated: 
		if(!pc.isTreated() && !pc.isAss()) output("A little nervously, you ");
		else output("You ");
		output("ask Yancy if he’d mind milking a different part of you while the machine works. For emphasis, you wrap a hand around [pc.oneCock], already at half-mast after the little bit of foreplay the bull’s lavished on your already.");
	}
	else
	{
		output("You press yourself up against Yancy’s bare chest, grabbing his hand and guiding it down to your bare, stiff erection. His eyes grow a little wider as he feels what you’re packing for him, and you’re gratified to feel a little growth in that bulge of his. Looks like he enjoyed what you were able to do with it last time.");
		output("\n\n<i>“");
		if(pc.isTreated()) output("Mind being my personal little cock-cozy again, Yancy?");
		else output("Think you could stand letting me get milked from both ends again?");
		output("”</i> you tease, releasing his hand in exchange for a nice grip on his butt that makes him flinch.");
	}

	output("\n\nA sudden tinge of red flushes the bull-man’s cheeks - a reaction completely absent when he was ");
	if(!pc.hasVagina() || !(pc.isTreated() && pc.isBimbo())) output("teasing you before");
	else output("knuckle-deep in your [pc.cunt]");
	output(". It takes him a moment to turn a stream of stammers into a coherent, <i>“Uh, I guess,”</i> as his eyes wander down to your crotch. You beam at the bull and slip down onto your [pc.knees] in front of him, letting your hands play across the growing bulge. Might as well make sure he enjoys this as much as you’re going to, right? His zipper takes a little care and work to pull down, but the reward is immediate as Yancy’s thick rod spills out into your waiting grasp. It’s not as long as ");
	if(flags["YANCY_SEXED"] == undefined) output("you might have imagined");
	else output("the other bulls around New Texas");
	output(", but your attendant more than makes up for it with thickness: at a glance, he’s as wide around as a cow-girl’s arm, with a flare surrounded by rings of feline-like nubs.");
	//if PC has a cunt, Untreated:
	if(pc.hasVagina() && !pc.isTreated()) output(" Oooh, maybe it’s not too late to switch places. You suppress a shiver at the thought of those little nubs teasing every inch of your drooling pussy.");
	else if(pc.hasVagina()) output(" You squeal in delight as the half-hard prick plops into your hand, the meaty flare smacking you right in the cheek. Instinctively, you reach out and lick it, shivering at the taste of him, so musky and sweaty and delicious. You’re strongly tempted to just flop back and let the bull fuck you a few times to get warmed up first! He looks so pent up, you can’t bear to see him go without release.");
	else output(" You give the bull’s hybrid cock a few playful strokes, thinking about how it might feel in your [pc.asshole] after you’re done with his. Turnabout’s fair play, after all....");

	output("\n\nYou push those thoughts aside for now, focusing on relieving Yancy of his pants. Once you fish his prick out of them, they fall away easily, and Yancy kicks them off into the corner. Now that he’s as naked as you are, there’s nothing to stop your enjoyment of his thick dick. You quickly swallow it down, opening as wide as you can to allow him entrance to your mouth.");

	output("\n\n<i>“Ah, that’s not so bad...”</i> Yancy groans, planting one of his big, strong hands on the top of your head. He sighs contentedly, bucking his hips into your welcoming lips and letting you taste every inch of that big slab of meat. Just got to make him relax a little more, and he’ll be all yours....");

	output("\n\nAs you’re suckling on his rod, though, the big bull remembers his job, and grabs the milker cups back up. You ");
	if(pc.hasKnees()) output("awkwardly lean back on your [pc.knees]");
	else if(pc.isNaga()) output("languidly lean back on your serpentine lower body");
	else output("awkwardly lean back");
	output(" and thrust your chest out for him");
	if(pc.biggestTitSize() >= 4) output(", making your tits bounce enticingly");
	output(" as Yancy attaches the milker cups to them. You suck in a breath - and a little bit of pre - as the suction takes hold on you, firmly affixing the milker to your [pc.breasts].");

	output("\n\n<i>“Alright. Looks like you’re ready to go,”</i> he announces, reaching back towards the machine’s panel to turn it on.");

	output("\n\nYou catch his arm just in time, pull him back down toward you. <i>“Not yet, big guy,”</i> you murmur around a mouthful of dick, giving Yancy a gentle push towards a table at the back of the stall. He hesitantly follows your lead, one stride taking him at once out of your mouth’s warm embrace and onto the table. He hops up on it, facing you with his legs dangling off the edge.");
	output("\n\nYou follow close behind him, the sweet scent of masculine excitement drawing you in");
	if(pc.isTreated()) output(" until it’s a force of will not to climb up onto the table and take that big, thick cock of his inside you");
	output(". After getting a nice, long taste of Yancy’s shaft, your own [pc.cock " + x + "] is stiff as diamonds and almost painfully desperate for a little attention. With one hand, you grab your cock and start to stroke; with the other, you push Yancy back and spread his locked legs open, getting your first view of his tight little hole, only partially concealed by his balls once you heft his cock to lie against his belly.");

	output("\n\nFlashing Yancy a grin, you slowly angle your [pc.cock " + x + "] to alight with his tight pucker. There’s no sign on lube in the stall; what cowgirl would need it, after all? But all you need is one thrust, and then the milker will make sure you spill all the seed you’ve got into the bull’s warm, squeezing embrace - of that, you have no doubt. The bull winces slightly as the [pc.cockHead " + x + "] of your [pc.cock " + x + "] pushes against his clenched hole, but a few gentle pumps of his own manhood soon has him relaxing in your grasp, enough for you to wiggle in the first inch or two. Now that’s better....");

	output("\n\nYou reach over to the panel on the wall and hit the big button labeled <i>“MOO,”</i> and surrender to the milker. It starts with a powerful suck, more forceful than any man’s lips could ever be, pulling on your [pc.nipples] with unyielding force. It’s only the blink of an eye before you feel a rising pressure in your tits, and then a sweet, sweet release. [pc.milkNoun] squirts out of your teats in a sudden burst, and then a steady flow, quickly whisked away through the tubs and off out of sight. A whimper of pleasure hangs on your lips as the device starts to drain you");
	//if PC was really full:
	if(pc.milkFullness >= 150) output(", giving you a blessed relief from the burden you’ve been carrying. You’ve got to do this more often...");
	output(".");

	output("\n\n<i>“E-easy there,”</i> Yancy groans, grunting and arching his back against the hard surface of the table. You hadn’t realized your [pc.hips] were thrusting like that, bucking against the bull’s inviting backside. You’re almost fully buried in him now, wedged snugly into the hot grip of his ass. It wouldn’t take much to cum just from that, but you’d hate to leave the bull high and dry. You wrap your shaking hands around his cock, bringing it back from half mast. He gives you a grateful grin as you start to stroke him, and returns the favor with little contractions and squeezes with his backdoor.");
	output("\n\nYou slide the rest of the way into him, slow but steady this time, letting him get used to you bit by bit");
	if(pc.hasKnot(x)) output(" until your knot is flush against his hole. There’s no way you’re getting that into him, sadly");
	output(". Once you’re buried in him, you’re content to let Yancy’s hole do the rest of the work, joining with the machine’s tireless suckling to milk the cum out of your [pc.balls]. Your hands wrap around his cock, pumping it hard and fast. Your movements quickly wash away whatever signs of discomfort the bull was showing, replacing them with unabashed pleasure. You can’t blame him: the feeling of being drained from cock and tits at once just about makes you want to roll your eyes up and give in to total, mindless bliss.");
	output("\n\nTo your surprise, and delight, Yancy cums first. His whole body stiffens for a second, squeezing wonderfully around your [pc.cock " + x + "] before his balls clench and he busts his nut all over his belly.");

	output("\n\n<i>“Oh, fuck,”</i> he grunts, fingers clenching around the edge of the table. ");
	if(flags["YANCY_BUTTFUCKED_BY_PC"] == undefined) output("<i>“It feels... way different with something in there....”</i>");

	output("\n\nYou grin at him in turn");
	//if Treated:
	if(pc.isBimbo()) output(", giggling at the sight of all that creamy, yummy-looking spooge all over him");
	output(". You wipe up a few delicious strands of his cum and lick your fingers clean, purring at the over-sweet taste of it. Your digits glisten by the time you’re done with them, and your tits and cock are thrumming with waves of pleasure, so close to release that you can taste it");
	if(pc.isBimbo()) output("- or is that just more of Yancy’s cum you’re licking up? Hard to tell!");
	else output(".");
	output(" Now that your blissed-out attendant’s gotten off, you let yourself go utterly, dropping all your defenses and letting the milker and Yancy’s sweet, hot, tight ass finish you off in return.");

	output("\n\nYou cup one of your [pc.breasts], giving it a squeeze to urge the [pc.milkNoun] out faster - and to elicit just a little more pleasure from your quickly draining mounds. A few moments of that and your cock twitches and erupts inside Yancy, filling him with [pc.cumNoun].");
	// if PC is Hard & has used prostate milker:
	if(pc.isAss() && StatTracking.getStat("milkers/prostate milker uses") > 0) output(" He’ll probably have to go across the hall to Carrie after you’re done with him!");
	output(" You give his up-turned butt a squeeze as you cum, making him clamp down on your with vice-like intensity, striking that border between pain and pleasure that can’t help but milk out every drop of cum from your [pc.balls].");

	output("\n\n");
	if(pc.isTreated()) output("The moment you’re done, it’s as if the energy drains right out of your body with the last trickles of [pc.milkNoun] from your tits. You collapse overtop Yancy, and nuzzle against that broad chest of his. His prick twitches and drools, trapped comfortably between your bodies. Now that’s a feeling you could get used to - especially when his big, strong arms wrap around you, holding you tight. You give a giddy little squeal and hug him back with what remains of your energy.\n\nAfter a long moment of snuggling up to the big bull, he finally pulls you up and off him, and pops the milkers off your [pc.breasts] with the same motion that pulls your cock from his ass.");
	else output("Whew! You sag over him, putting your weight on the table as you recover from the overwhelming pleasures. The milkers come off easily once they’ve suckled the last drops from your chest, and you gingerly draw yourself out from Yancy’s ass.");
	output("\n\n<i>“That was... wasn’t bad,”</i> Yancy admits as you gather up your clothes. He rubs his butt for emphasis, faking soreness that looks a little more like afterglow tenderness. You can’t help yourself but to ");
	if(pc.tallness >= 80) output("lean down ");
	else if(pc.tallness < 70)
	{
		output("get up on your tippy-toes");
		if(pc.legCount > 3 || pc.isNaga()) output(" or as close as you can get, given your bestial body, ");
	}
	else output("lean over ");
	output("and give him a peck on the cheek.");
	output("\n\n<i>“You come back now, you hear,”</i> he chuckles as you scoot out of the stall, leaving the bull to recover.");
	
	processTime(30);
	
	pc.orgasm();
	flags["YANCY_PREVIOUS_ENCOUNTER_RESULT"] = "milked & pitched";
	IncrementFlag("YANCY_MILKED_PC");
	IncrementFlag("YANCY_BUTTFUCKED_BY_PC");
	IncrementFlag("YANCY_SEXED");
	
	milkResultDisplay();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function milkResultDisplay():void
{
	output("\n\nA holodisplay on the wall proudly broadcasts this session’s productivity: <b> ");
	var milkAmount:Number = pc.lactationQ(99);
	if(milkAmount < 1000 && pc.hasStatusEffect("Temporary Treatment")) milkAmount += 1500 + rand(500);

	milkAmount = Math.round(milkAmount);
	StatTracking.track("milkers/breast milker uses");
	StatTracking.track("milkers/milk milked", milkAmount);

	if(milkAmount > 1000) output(milkAmount/1000 + " Ls</b>")
	else output(milkAmount + " mLs</b>");

	pc.milked(pc.milkFullness);
	pc.boostLactation(1);
}
