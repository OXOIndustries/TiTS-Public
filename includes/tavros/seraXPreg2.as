/* Sub Sera Impregnation */
// The spike is on the other heel

/*

Notes/Thoughts

* You will be able to get her to lay off her contraceptive after you resolve her sex slave/merchant choice. Both path requires you to persuade her by choosing the respectively right convo options, similar to the Quinn showdown (although not getting it right will lock you out for a week, rather than entirely).

* PCs will also be able to get her to knock them up. The framework for it already exists, no reason not to include it.

* You will be able to get her to sleep with you, either at your [pc.feet] like a slave should or for more equitable snuggling. She may wake you up with sex, taking on a more submissive or dominant role depending on which option you chose. This should also allow for pregnant belly rubs, which I understand are popular.

* Have her visit the kids when you’re on Tavros/if you dump her at the nursery. Probably won’t be different from existing scenes. Similarly to what Hugs plans with Erra I’m thinking she asks to be taken there by the third trimester, so the horror of birth is resolved out of sight.

*/
/*
 * @author DrunkZombie
 * added sterilex talk toggle, 2 new vaginal scenes and update shower prank to check for int
 * new flags
 * [SERA_STERILEX_STATE] 0 = off, 1 = on
 * [SERA_STERILEX_DATE] time stamp of last switch
 * [SERA_MADE_LOVE] number of times you made love to her you sick pervert
 * 
*/
public function seraIsPregnant(belly:Boolean = false, bellySize:Number = 10):Boolean
{
	if(chars["SERA"].isPregnant())
	{
		// Obvious belly
		if(belly) return (chars["SERA"].bellyRating() >= bellySize);
		// Just preggers
		return true;
	}
	return false;
}
public function knockUpSeraChance(bSex:Boolean = true):Boolean
{
	if(!chars["SERA"].isPregnant())
	{
		if(canImpregnateSera() && pc.virility() > 0 && chars["SERA"].fertility() > 0)
		{
			if(bSex) {
				var x:Number = ((pc.virility() + chars["SERA"].fertility()) / 2);
				var score:Number = ((1 - Math.exp(-0.38 * x)) * 10000);
				if(rand(10000) <= score)
				{
					flags["SERA_PREGNANCY_TIMER"] = 0;
					pc.clearRut();
				}
			}
			return true;
		}
	}
	return false;
}
public function seraPregnancyIsDue(totalDays:int = 0):Boolean
{
	if(chars["SERA"].isPregnant())
	{
		if(totalDays != 0) flags["SERA_PREGNANCY_TIMER"] += totalDays;
		
		// Automatic birth 3 weeks after past-due.
		if(flags["SERA_PREGNANCY_TIMER"] > 293)
		{
			// Create child!
			var nBabies:int = 1;
			var deltaT:int = (Math.min(totalDays, 293) * 24 * 60);
			seraNurseryEndPregnancy((pc as PlayerCharacter), nBabies, deltaT);
			
			if(flags["SERA_PREGNANCY_CHECK"] != undefined) flags["SERA_PREGNANCY_CHECK"] = undefined;
			return false;
		}
		
		if(flags["SERA_PREGNANCY_TIMER"] > 272) return true;
	}
	return false;
}
public function seraPregnancyClear():void
{
	flags["SERA_PREGNANCY_TIMER"] = undefined;
	if(flags["SERA_PREG_MOVED_TO_TAVROS"] != undefined) flags["SERA_PREG_MOVED_TO_TAVROS"] = undefined;
}
private function seraPregSpawnChildren(father:Creature, numKids:int = 0):Array
{
	var babyList:Array = [];
	
	var traitChar:Creature = father;
	if(father is PlayerCharacter) traitChar = chars["PC_BABY"];
	
	for(var i:int = 0; i < numKids; i++)
	{
		var c:UniqueChild = new SeraUniqueChild();
		
		c.RaceType = GLOBAL.TYPE_HUMAN;
		// 50% Male or Female
		if(rand(2) == 0) { c.NumMale = 1; c.NumFemale = 0; c.NumIntersex = 0; c.NumNeuter = 0; }
		else { c.NumMale = 0; c.NumFemale = 1; c.NumIntersex = 0; c.NumNeuter = 0; }
		
		// Race modifier (if different races)
		c.originalRace = c.hybridizeRace(c.originalRace, father.originalRace, (father is PlayerCharacter));
		
		// Adopt father's colors at random (if applicable):
		if(rand(2) == 0) c.skinTone = traitChar.skinTone;
		if(rand(2) == 0) c.lipColor = traitChar.lipColor;
		if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
		if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
		//if(rand(2) == 0) c.hairColor = traitChar.hairColor;
		//if(rand(2) == 0) c.furColor = traitChar.furColor;
		//if(rand(2) == 0) c.scaleColor = traitChar.scaleColor;
		//if(rand(2) == 0) c.chitinColor = traitChar.scaleColor;
		//if(rand(2) == 0) c.featherColor = traitChar.furColor;
		
		c.MaturationRate = 1.0;
		c.BornTimestamp = GetGameTimestamp();
		
		babyList.push(c);
	}
	
	return babyList;
}
public function seraNurseryEndPregnancy(father:Creature, nBabies:int = 1, deltaT:int = 0):void
{
	var babyList:Array = seraPregSpawnChildren(father, nBabies);
	
	var i:int = 0;
	// Born in the past day maybe
	var timestamp:int = (GetGameTimestamp() + deltaT - (720 + rand(721)));
	for(i = 0; i < babyList.length; i++)
	{
		babyList[i].BornTimestamp = timestamp;
		ChildManager.addChild(babyList[i]);
	}
	
	StatTracking.track("pregnancy/sera sired", nBabies);
	StatTracking.track("pregnancy/total sired", nBabies);
	StatTracking.track("pregnancy/total day care", nBabies);
	
	seraPregnancyClear();
}

// [Impregnate]
// Option turns up in her main menu after PC has fully trained her
public function canImpregnateSera():Boolean
{
	if(flags["SERA_OBEDIENCE_MIN"] > 0 && (flags["SERA_DISABLE_IMPREGNATE"] == undefined || (flags["SERA_DISABLE_IMPREGNATE"] + 7) <= days))
	{
		if(flags["SERA_TALKS_IMPREGNATE"] == -1)
		{
			if(flags["SERA_TALKS_AMBITION"] == undefined) return false;
			flags["SERA_TALKS_IMPREGNATE"] = undefined;
		}
		if(flags["SERA_DISABLE_IMPREGNATE"] != undefined) flags["SERA_DISABLE_IMPREGNATE"] = undefined;
		return true;
	}
	return false;
}
public function seraBitcheningImpregnate(response:String = "intro"):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	clearMenu();
	
	var momSera:Boolean = (!chars["SERA"].hasCock() || !pc.hasVagina());
	
	switch(response)
	{
		case "intro":
			output("You fiddle with your codex, summoning on-screen the voluminous contract Sentient Acquisitions sent to you after you completed the buyout. You probably should have read this thing properly after you bought her... but who does that with any exciting new purchase? A section marked ‘Paternal/Maternal Consumer Rights’ catches your eye.");
			output("\n\n<i>“Your property’s collar automatically and painlessly releases Sterilex into their bloodstream at regular intervals,”</i> you read aloud. <i>“This function is automatically set to ON. You may set it to OFF by repeating the phrase ‘Bareback SUBJECT NAME GOES HERE’. You may set it to ON by repeating the phrase ‘Dose SUBJECT NAME GOES HERE’. Any children engendered with your property are legally the responsibility of the owner. Please breed responsibly, and keep small children away from your designated satiation area.”</i>");
			output("\n\nSera laughs. There’s a high, slightly hysterical note to it.");
			output("\n\n<i>“Yeah, but you’re not actually going to make me have kids with you,”</i> she says. Her long nails pick fretfully at her collar. <i>“You aren’t that stupid or cruel. Right?”</i>");
			output("\n\nYou eye her. Picturing");
			if(pc.isHerm()) output(" swelling your exquisitely proportioned bitch with spawn, or even using her as a prime stud");
			else if(pc.hasCock()) output(" swelling your exquisitely proportioned bitch with spawn, inundating her senses in hormones");
			else output(" using your exquisitely proportioned bitch as an animalistic stud, powerless to do anything but provide you with similarly beautiful spawn");
			output(" definitely does things for you, in the deep red parts of your brain and downstairs. You push down on those impulses for the moment.");
			output("\n\n<i>“What’s the problem, slut?”</i> you ask, sitting down on her bunk. <i>“You heard - any kids are my responsibility, not yours. You’d just have to worry about making them.”</i>");
			// PC has not resolved Ambition
			if(flags["SERA_TALKS_AMBITION"] == undefined)
			{
				output("\n\nThe succubus shifts away from you like a spooked cat.");
				output("\n\n<i>“I’m asking you not to go there,”</i> she says in a harsh tone, not looking at you. <i>“Never. I’m happy to be your fucktoy, if that’s what you want. But I’m not gonna do any serious shit like that. Alright?”</i>");
				output("\n\nYou’ve heard her use the word ‘never’ before. But you’ve also learned Sera’s body language well enough to know to leave it alone for now. You placate her with a few soft words and strokes, and she’s soon leering and vamping it up again, relieved you’ve left the topic behind.");
				// GO [Impregnate] until choice resolved
				flags["SERA_TALKS_IMPREGNATE"] = -1;
				addButton(0, "Next", approachServantSera);
			}
			// Merchant Sera
			else if(seraIsMerchant())
			{
				output("\n\n<i>“Yeah,”</i> sneers Sera. <i>“Then your company goes tits up, or you get your ass captured by pirates and someone has to pay a massive ransom, and suddenly you don’t have a fully financed nursery no more. And then in a few years’ time, I’m stuck with no money and a screaming brat to look after.”</i> She looks you in the eye, jaw set. <i>“I HATE kids, and I JUST started putting my life back together. I’m not laying back and spreading ‘em for something as fucking stupid as that just because you’ve suddenly gotten horny for crotch-spawn.”</i>");
				
				flags["SERA_TALKS_IMPREGNATE"] = 1;
				// [Swearing!] [Responsibility] [Desire]
				addButton(0, "Swearing!", seraBitcheningImpregnate, "swearing", "Swearing!", "Producing children for you is a worthy punishment for having such a filthy mouth.");
				addButton(1, "Responsibility", seraBitcheningImpregnate, "responsibility", "Responsibility", "The whole point about giving her a loan was to get her to learn some. Having kids is simply an extension of that.");
				addButton(2, "Desire", seraBitcheningImpregnate, "desire", "Desire", "You want to breed your bitch pretty damn badly. Tell her as much.");
			}
			// Concubine Sera
			else
			{
				output("\n\n<i>“Kids aren’t fun,”</i> she whines, writhing on the sheets like a snake on a dune. <i>“I don’t wanna spend nine months being sick and looking like a goddamn blimp, it’ll take away all the time I get to fuck around with you. And getting kids involved in our thing feels... I dunno... wrong.”</i>");
				
				flags["SERA_TALKS_IMPREGNATE"] = 1;
				// [Swearing!] [Responsibility] [Desire]
				addButton(0, "Swearing!", seraBitcheningImpregnate, "swearing", "Swearing!", "Producing children for you is a worthy punishment for having such a filthy mouth.");
				addButton(1, "Responsibility", seraBitcheningImpregnate, "responsibility", "Responsibility", "She should learn some.");
				addButton(2, "Desire", seraBitcheningImpregnate, "desire", "Desire", "You want to breed your bitch pretty damn badly. Tell her as much.");
			}
			processTime(4);
			break;
		case "swearing":
			var hasWhip:Boolean = (pc.hasItemByClass(Whip) || pc.hasItemInStorageByClass(Whip) || pc.hasItemByClass(BioWhip) || pc.hasItemInStorageByClass(BioWhip));
			output("<i>“Seems like you’ve given me no choice but to make you " + (momSera ? "bear" : "sire") + " a few kids,”</i> you say, returning her gaze levelly, <i>“with that whore mouth of yours running away like that.”</i>");
			output("\n\nA lopsided leer appears on the demon-morph’s face.");
			output("\n\n<i>“Ooh, did I swear a few times there?”</i> she coos. She rolls over with apparent laziness, her boobs bumping into each other mesmerically, and just happens to bump the shelf above her bed. " + (hasWhip ? "Your whip" : "A long, leather whip") + " falls onto the bed between you. <i>“Guess you’d better fucking do something about it, then.”</i>");
			output("\n\nA couple of minutes later");
			if(pc.hasCock()) output(" your [pc.cock] is mired deep in her soft, round backside and you are rutting her roughly, one hand gripped around her steel collar and the other the whip. You glory in the hot tightness kneading your shaft and the red, slanting lines you’ve carved into the curve of her back - Void is that pleasing! You crack the whip again across her shoulder blades, making her whine in supplication and tighten up around your [pc.cock]. You pull at her collar and cum brilliantly, packing that well-trained back passage of hers full of [pc.cum] with one fountaining thrust after another.");
			else output(" you’ve got your [pc.thighs] locked around her head, her hair balled around one hand and whip gripped in the other. Sheer pleasure pulses through your [pc.vagina] as Sera laps at it, and you glory in how the sensation is twinned by the red, slanting lines you’ve carved into the curve of her back. Void is that sensational! You snap the whip again across her buttocks, making them jiggle and forcing a muffled whine of supplication into your wet sex. You clench her hair tightly and orgasm brilliantly, sensation quivering through [pc.eachVagina] and precipating a " + (!pc.isSquirter() ? "dribble" : "splash") + " of [pc.femcum], which you are sure to rub right over her face with one thrust of the hips after another.");
			output("\n\n<i>“Mmm,”</i> the demon-morph coos, lying on her side and gazing over her shoulder at you magenta-cheeked when it’s over, <i>“thank you for the discipline, [pc.master]. I love it when you take matters into your own hands...”</i> You slide your hands over her smooth, immaculate curves, stroking her chin and hair, feeling thoroughly pleased with yourself.");
			output("\n\nIt’s only afterwards, standing outside her room with your blood cooling down, that you realize that you got played. Did she " + (hasWhip ? "steal your whip" : "buy that whip") + " just so she could distract you with it if you tried to pressure her into doing something she didn’t want? Fuck is she a cunning piece of work! A different tact is evidently called for if you’re going to make Sera babies.");
			// GO [Impregnate] for 7 days
			flags["SERA_DISABLE_IMPREGNATE"] = days;
			processTime(5);
			addButton(0, "Next", approachServantSera);
			break;
		case "responsibility":
			if(seraIsMerchant())
			{
				output("<i>“So you’re scared of responsibility, and have zero faith in your sugar " + pc.mf("daddy", "mommy") + ",”</i> you say, in the most contemptuous tones you can summon. <i>“Thought you wanted to be a bit more than a pathetic baby bitch for the rest of your life.");
				if(flags["SERA_REPAID_LOAN"] == undefined) output(" Perhaps I should rescind my loan.");
				output("”</i>");
				output("\n\nSera looks like you just slapped her, and not in the sexy way.");
				output("\n\n<i>“What? No! I just--”</i>");
				output("\n\n<i>“Think of it this way,”</i> you say, commandingly. <i>“Even if you don’t believe in me - and you should, I own your ass - kids are just another reason why you’ve got to make your career work. It’s obvious to me you work far better when you’ve got a focus, rather than flailing around on your own selfish terms. I’m gonna give you a downward reason, as well as an upward one. But I don’t know now...”</i> you gesture dismissively. <i>“Perhaps you aren’t as good at business as you think you are. Perhaps you’re pissing yourself for very good r--”</i>");
				output("\n\n<i>“Alright then, smartass!”</i> Stung, Sera");
				if(momSera) output(" rolls onto her side, displaying her round ass and pussy to you, face fiery with smarted pride. <i>“Bareback me if you’ve got the fucking guts! I’ve taken everything else you’ve thrown at me, I can take your diaper fillers too! I’ll raise them just so they can make your life a misery!”</i>");
				else output(" rolls onto her side, grabs her twelve inch dick and brandishes it at you, face fiery with smarted pride. <i>“Jump on this if you’ve got the fucking guts! I’ve taken everything else you’ve thrown at me, I can take your diaper fillers too! I’ll raise them just so they can make your life a misery!”</i>");
				output("\n\nIt always gets your own engine running when you manage to break her smug facade and get her snarling and spitting like that;");
				if(pc.hasCock()) output(" hard heat running up [pc.eachCock]");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" liquid arousal oiling [pc.eachVagina]");
				output(".");
				output("\n\n<i>“Bareback Sera,”</i> you husk. Her collar makes a small but certain click. The succubus’s enflamed reptile gaze doesn’t waver.");
				output("\n\n<i>“Come at me whenever, [pc.master],”</i> she growls. <i>“You want some kids off me, fine. I’ll use ‘em as a reason to make myself bigger and better than I ever was before!”</i>");
				
				processTime(3);
				flags["SERA_TALKS_IMPREGNATE"] = 2;
				//+Lust
				pc.lust(15);
			}
			else
			{
				output("<i>“So you’re scared of a little responsibility, and have zero faith in your sugar " + pc.mf("daddy", "mommy") + ",”</i> you say, in as contemptuous tone as you can manage.");
				output("\n\nSera crows with laughter, clapping delightedly.");
				output("\n\n<i>“Responsibility?!”</i> she squeals. <i>“I tried responsibility once and it failed spectacularly, remember? No, I gave all that up the moment you told me to. You make all the hard decisions for your cute little fucktoy now - I’m just here to provide sex and to make your spaceship about three times better looking. Responsibility! You are a silly-head, [pc.master].”</i>");
				output("\n\nThat was a misstep. You cover your failure the best you can, laughing it off - which is easy enough, because Sera is eager to get you to forget the subject. You’ll have to try again with a different tact another time.");
				// GO [Impregnate] for 7 days
				flags["SERA_DISABLE_IMPREGNATE"] = days;
				processTime(2);
			}
			//Return to Sera main menu
			addButton(0, "Next", approachServantSera);
			break;
		case "desire":
			if(seraIsMerchant())
			{
				output("Time to get your dom" + pc.mf("", "me") + " smolder on.");
				output("\n\nYou look her in the eye and growl in lascivious detail how much you want to " + (momSera ? "swell her belly with child" : "make proper use of all that cum you make her spurt") + ", how you intend to own her in and out, take possession of her " + (momSera ? "womb" : "seed") + " as a true [pc.master] must. You gradually lean in as you do so, eyes eating up her curvy body, so that you can end by catching her lip with your teeth and giving it a hungry nibble.");
				output("\n\n<i>“...Yes?”</i> says Sera finally when you pull away, looking at you with an amused quirk of the mouth. <i>“You done? I never doubted your horniness for stretch marks and milky sick, [pc.master]. As I said, I don’t give a shit. But you go ahead and grunt away about my fertile " + (momSera ? "womb" : "sperm") + " whenever you like. It’s pretty sexy - so long as it remains in your head.”</i>");
				output("\n\nDamn. You cover your failure the best you can, laughing it off - which is easy enough, because Sera is eager to get you to forget the subject. You’ll have to try again with a different tact another time.");
				// GO [Impregnate] for 7 days
				flags["SERA_DISABLE_IMPREGNATE"] = days;
				processTime(2);
			}
			else
			{
				output("Time to get your dom" + pc.mf("", "me") + " smolder on. ");
				output("\n\nYou look her in the eye and growl in lascivious detail how much you want to " + (momSera ? "swell her belly with child" : "make proper use of that prestigious amounts of cum you make her spurt") + ", how you intend to own her in and out, take possession of her " + (momSera ? "womb" : "seed") + " as a true [pc.master] must. You gradually lean in as you do so, eyes eating up her curvy body, so that you can end by catching her lip with your teeth and giving it a hungry nibble.");
				output("\n\n<i>“Ooh,”</i> coos Sera, eyes focused on your departing [pc.lips]. She’s grinning lopsidedly, but you can tell by her dilated snake-pupils and the way her claws are playing over the sheets that you’ve aroused her. <i>“You certainly know how to sell something, [pc.master]. And... I guess they would be being taken care of somewhere else, wouldn’t they?”</i>");
				output("\n\n");
				if(momSera) output("She rolls onto her side, displaying her round ass and pussy to you, face smouldering with provocation. <i>“Go on then, [pc.master]. Pack me full of your spooge til I can’t remember my name anymore. If you think you’ve got the balls.”</i>");
				else output("She rolls onto her back, sliding her hand up the mast of her twelve inch dick, face smouldering with provocation. <i>“Go on then, [pc.master]. Jump on this and ride me ‘til I can’t remember my name anymore. If you think you’ve got the ovaries.”</i>");
				output("\n\nIt always gets your own engine running when you manage to get her purring like that;");
				if(pc.hasCock()) output(" hard heat running up [pc.eachCock]");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" liquid arousal oiling [pc.eachVagina]");
				output(".");
				output("\n\n<i>“Bareback Sera,”</i> you husk. Her collar makes a small but certain click. The succubus’s enflamed reptile gaze doesn’t waver.");
				output("\n\n<i>“If it’s your desire it’s mine, [pc.name]. I’ll " + (momSera ? "bear" : "make") + " you the evillest little kids that you’ve ever known!”</i>");
				
				processTime(3);
				flags["SERA_TALKS_IMPREGNATE"] = 2;
				//+Lust
				pc.lust(15);
			}
			addButton(0, "Next", approachServantSera);
			break;
	}
	seraBitcheningImpregnateToggle();
}
public function seraBitcheningImpregnateToggle(addLust:int = 0):void
{
	chars["SERA"].lust(addLust);
	if(flags["SERA_TALKS_IMPREGNATE"] >= 2 && flags["SERA_STERILEX_STATE"] != 1)
	{
		chars["SERA"].impregnationType = "SeraSpawnPregnancy";
		chars["SERA"].removeStatusEffect("Infertile");
	}
	else
	{
		chars["SERA"].impregnationType = "";
		chars["SERA"].createStatusEffect("Infertile");
	}
	chars["SERA"].ballFullness = 100;
	chars["SERA"].cumQualityRaw = 1;
	chars["SERA"].fertilityRaw = 1;
}

// Reworked Ride Scene
// Requires moderately spaced vagina
// Plays instead of regular scene if Sera barebacked
public function seraBitchImpregnateRide(vIdx:int = 0, tinyVag:Boolean = false):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	seraBitcheningImpregnateToggle(100);
	
	output("You smile at Sera and, without saying a word, twirl a finger. The fantastically augmented human flips over onto her back immediately, grinning back.");
	output("\n\n<i>“Has [pc.master] come for a nice long ride on the Sera train?”</i> she coos, twiddling and tweaking her nipple piercings as she gazes up at you, generous erection pointing upwards.");
	if(!pc.isPregnant(vIdx) || pc.bellyRating() < 10) output(" <i>“Maybe [pc.he]’ll let me cum in her, nice and deep. Give [pc.him] those demon babies [pc.he] wants so bad.”</i>");
	else output(" <i>“Even after I’ve done my duty, too! Maybe [pc.he]’s getting nice and addicted to the taste of me packing [pc.his] womb nice and full of demon spunk, hmm?”</i>");
	output("\n\nHer words are one thing; the quiver beneath her [sera.skinColor], the way her cock is already urgently erect, the anticipation tightening up her muscles and flushing her cheeks are another. You both know who’s in charge here, and you show it by climbing onto the bed, pushing your [pc.chest] into her plush boobs and cuffing her hands securely behind her with a practiced click. You pull back, spreading your hands slowly down the softness of her inner thighs, taking your time, reveling in the way the succubus’s poise becomes more and more stretched. Her lips part, slight gasps escape her as you ever-so-gently lead two fingers up her burningly erect cock. It’s beading clear pre, she’s that turned on. Could she cum just from this? Maybe - but she doesn’t.");
	output("\n\n<i>“You’re in luck, slave. I’m in the mood right now,”</i> you husk, leading your [pc.vagina " + vIdx + "] up the hot, stern flesh of her dick, luxuriating in the increasing wetness and heat which pulses through your sex. <i>“I think I’ll fuck you until you can’t even remember your name.”</i> You perch on top of her bulbous head, gently rotating your [pc.hips], teasing the most sensitive part of her achingly erect male sex. She seems to be in a daze, mouth open and eyes glazed, lost in the tantalizing movement of it. <i>“And what are you going to do?”</i>");
	output("\n\n<i>“Cum,”</i> groans Sera. <i>“I mean - not cum. [pc.Master].”</i>");
	output("\n\n<i>“Very good!”</i> you smile widely. She grins back, naked enjoyment shining on her features. Handcuffed and at your disposal.");
	output("\n\nShe lets out a long, drawn-out sigh when you part your pussy lips and sink slowly down onto it. You go as slowly as you possibly can at first, enjoying the sensation of Sera’s hard, veiny flesh pressing against your slick walls, rotating your [pc.hips] to bend it back and forth within you.");
	
	pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
	
	if(tinyVag) output(" You can manipulate her dick however you want in your spacious twat - making her groan hoarsely as you take her down to the base easily, bending it this way and that, clenching your thighs to tighten up on her thick girth. Dreamily you fantasize about using mods to shrink her right down, giving her a small, cute girl dick, humiliating and oh-so sensitive, teasing her with it forever more... your [pc.vagina " + vIdx + "] " + (!pc.isSquirter(vIdx) ? "beads" : "gushes") + " [pc.femcum] freely at the thought.");
	else output(" You’re used to taking her dick now, it no longer intimidates you - despite how massive the end of it feels in your tight, wet fuck-pocket. It’s intense, getting packed out like this - but is it ideal? Dreamily you fantasize about using mods to shrink her right down, giving her a small, cute girl dick, humiliating and oh-so sensitive, teasing her with it more... your [pc.vagina " + vIdx + "] " + (!pc.isSquirter(vIdx) ? "beads" : "gushes") + " [pc.femcum] freely at the thought.");
	
	processTime(6);
	
	// [pb]
	clearMenu();
	addButton(0, "Next", seraBitchImpregnateRideEnd, vIdx);
}
public function seraBitchImpregnateRideEnd(vIdx:int = 0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	output("Her mouth hangs open, luminescent eyes bobbing as you methodically work her in your depths, sensually screwing yourself up towards a shimmering release.");
	output("\n\n<i>“Ohh,”</i> she finally groans as the minutes drag out, need roughening her voice, shoulders flexing against her bonds. <i>“C’mon [pc.master], don’t tease me like this! If you’re gonna use me, fucking use me...”</i> You close your eyes, basking in the helpless arousal you can hear in her voice, allowing the tenseness within you to release in a glorious high, [pc.vagina " + vIdx + "] quivering and clenching around her cock. When the last pulse of bliss has shaken through you, you lazily open your eyes, reach down and pinch one of Sera’s erect nipples sharply. You bite your lip at the way this makes her gasp and jerk her cock into your tender walls.");
	output("\n\n<i>“You swore, bad girl,”</i> you murmur. <i>“You know what I think when you’re bad?”</i> you rotate your [pc.hips] around her fuck-pole rhythmically, hypnotically. <i>“That you don’t deserve release. That I should fit you with a nice, tight cock ring, maybe a urethra plug as well. Keep you pent up and on the edge for a week.”</i>");
	output("\n\n<i>“I’m a good girl!”</i> she cries, head thrown back, teeth clenched. <i>“I’m so gosh darn good! Can’t you feel how f- very polite and obedient I am?”</i> She humps her swollen balls and thick thighs upwards, yellow eyes fixed on your face and [pc.chest], focused solely on your pleasure.");
	output("\n\n<i>“Ooh...”</i> you sigh, pleasure trembling through you, fingers caressing your [pc.nipples]");
	if(pc.isLactating()) output(" until [pc.milk] dribbles freely down your breast, dripping down onto the fervent flesh of your slave");
	output(". <i>“Bit more like that and I might start believing you...”</i>");
	output("\n\nSera grits her teeth and thrusts upwards into your [pc.vagina " + vIdx + "] as hard as she can, tormented by the sight of you embedded on her well-trained cock. You bite your [pc.lips] in high ecstasy, the fervid writhing and thrusting of your slave’s sweet futa penis inside you inflaming your senses. You crook a finger into each brass ring of Sera’s tit piercings and pull firmly upwards, the gasp this draws making your coursing, rampant orgasm all the better. As you come down, cheeks burning and after-tremors tickling through you, you can feel her dick is still ramrod straight and eagerly primed. You " + pc.mf("laugh", "giggle") + ", glorying in the state of the demoness, mouth open and eyes rolled back, but still hard as rock within you. It’s utterly ingrained in her that she cannot cum without instruction, no matter how much she wants to. You did that; with stern hand and expert caress you wrought this foul-mouthed hellion into your own perfect pussy-bitch, and now you’re reaping the wonderful rewards.");
	output("\n\nA long, husky moan escapes her cerulean lips, and you’re driven to start fucking her with energetic bounces of your [pc.ass] again.");
	output("\n\nYou slow down, you speed up, you tease every protrusion of Sera’s luscious body you can reach with your cusping, pinching fingers.");
	if(pc.isLactating()) output(" [pc.Milk] continues to course down from your engorged nipples, warm pleasure spreading within your [pc.boobs] as you continue to ride her big, juicy cock, and you don’t deny it - you caress" + (pc.hasFuckableNipples() ? ", finger" : "") + " and tug at your [pc.nipples] until with a delighted squeal your breasts tremble in squishy boobgasm, spraying Sera’s chest and face with [pc.milkVisc] fluid.");
	output("\n\nThe pleasure builds into one, final, pulsing orgasm, which you ride out with " + pc.mf("roaring", "squealing") + " ecstasy, clutching the succubus’s [Sera.skincolor]’s plump breasts and bending her cock for all it is worth, " + (!pc.isSquirter(vIdx) ? "oozing" : "squirting") + " [pc.femcum] all around it.");
	output("\n\n<i>“Do it!”</i> you cry out, howling caution to the wind. <i>“Give me what I want, you fucking cum pump!”</i>");
	output("\n\nInstantly Sera reacts, huffing and moaning with feral joy as she seizes this moment with both hands, thrusting her thick prick into you with everything she’s got, intensifying your own orgasm lividly as she finds her own release, splurging one warm, thick load of spunk into your womb after another. You open your mouth to the rich, filthy sensation of it, cascading down your tunnel and pooling out from your stretched, tingling pussy.");
	output("\n\nYou work her stringently, impatiently thrusting your [pc.hips] on top of her and working that deliciously thick wick until her mouth is open and her eyes glazed, white slime drooling plentifully down her curvy flanks, utterly spent. Only then do you slow down, lift your [pc.ass] to allow her dick to slide out of you and land with a comical splat in the gooey mess you’ve left on her groin and thighs.");
	output("\n\nYou lie down, undo her cuffs and gently pull her into your [chest], enjoying the warmth of the afterglow with her.");
	output("\n\n<i>“Did you like that, [pc.master]?”</i> she murmurs, eyes unfocused and unabashed grin on her lips. <i>“" + ((!pc.isPregnant(vIdx) || pc.bellyRating() < 10) ? "Me stuffing you full of my kids?" : "A nice cream pie for mommy cakes?") + "”</i> You let your hands roam over her warm, soft, curvy body without saying anything, luxuriating in her lack of resistance to being treated as your in-house cum pump, and she practically purrs when you slide your hand over her horns.");
	output("\n\nAfter you’ve cuddled her a bit longer you get up, redress and get back to it, taking a glow of deep self-satisfaction with you.");
	
	processTime(8);
	
	pc.loadInCunt(chars["SERA"], vIdx);
	chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_RIDE");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// Sera Sleeps
/*
Notes

Begins to proc once ‘Ambition’ is resolved. 
Like Celise she has a chance to turn up in bed every time the PC rests on ship unless barred. Concubine Sera chance 33%, Merchant Sera chance 20%.
If PC allows her though she will always turn up (superseding Celise and Reaha) until they kick her out again. So three states: Trying, Invited, Barred.
*/
public function seraBitchImpregnateBed(bSleep:Boolean = false):Boolean
{
	if(flags["SERA_OBEDIENCE_MIN"] <= 0 || flags["SERA_NO_SLEEP"] != undefined) return false;
	
	var chance:int = 33;
	if(seraIsMerchant()) chance = 20;
	if(flags["CREWMEMBER_SLEEP_WITH"] == "SERA") chance = 75;
	if(!bSleep && rand(100) > chance) return false;
	
	clearOutput();
	showSera(true);
	author("Nonesuch");
	clearMenu();
	
	// Intro if Trying
	if(flags["CREWMEMBER_SLEEP_WITH"] != "SERA")
	{
		output("<i>“Heeeeey [pc.master],”</i> a husky, teasing voice croons the moment you enter your quarters. Sera is sprawled out on your bed, in all her obscene, " + (chars["SERA"].skinTone != "bright pink" ? "purple" : "pink") + " glory, leering up at you. Is it worth even asking how she got in here? The incorrigible hellion has all day to prowl around your ship, whilst you’re out there earning the self-same credits that enables owning a harem.");
		output("\n\nShe runs a claw up the curve of her thigh, the satanic, fluorescent gleam of her eyes seeming to follow the trail of your every thought.");
		output("\n\n<i>“I thought maybe you could use the company of your favourite slave at the end of a long, hard day,”</i> she hisses, in some crooked approximation of kindness. <i>“Come here and hold me, why don’t you? I will whisper toxic nothings in your ear. I will carry you to sleep...”</i>");
		processTime(2);
	}
	// Intro if Invited
	else
	{
		output("Sera is already splayed in your bed, " + (chars["SERA"].skinTone != "bright pink" ? "purple" : "pink") + " bum pointing at the ceiling and tapping away at her device. Of course; once you let the devil in she’s there to stay. She smirks and flicks her eyebrows at you, awaiting your move like a playful, spiky feline.");
		processTime(1);
	}
	// [Cuddle] [Foot Warmer] [Kick Out] [Bar]
	addButton(0, "Cuddle", seraBitchImpregnateBedResponse, "cuddle", "Cuddle", "That does sound pretty nice.");
	addButton(1, "Foot Warmer", seraBitchImpregnateBedResponse, "foot warmer", "Foot Warmer", "She can stay... on your own terms.");
	addButton(2, "Kick Out", seraBitchImpregnateBedResponse, "kick out", "Kick Out", "Boot her out of your room, but don’t put your foot down entirely.");
	addButton(3, "Bar", seraBitchImpregnateBedResponse, "bar", "Bar", "Bar her from doing this entirely. It may be possible to debar her in future.");
	
	return true;
}
public function seraBitchImpregnateBedResponse(response:String = ""):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	clearMenu();
	
	switch(response)
	{
		case "kick out":
			output("<i>“Get,”</i> you say, pointing at the door. You let an amused grin pull at the corners of your mouth, but keep your voice firm. ");
			output("\n\n<i>“You’re no fuuuuuun,”</i> the succubus whines, as she gets up and stomps out of your room. Her spade tail accidentally-on-purpose blats against your arm as she swishes past you. The war is not over.");
			// Sera still set to trying. Standard rest scene from here
			if(flags["CREWMEMBER_SLEEP_WITH"] == "SERA") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
			processTime(1);
			addButton(0, "Next", seraBitchImpregnateBedResumeSleep);
			break;
		case "bar":
			output("The vampy smirk drops right off Sera’s face when you pull out her collar control.");
			output("\n\n<i>“You don’t come in here without my say so,”</i> you deadpan, placing your fingertip over the shock button. <i>“Got it?”</i>");
			output("\n\n<i>“Alright! Alright! Jeez.”</i> The succubus scrambles off your sheets in an undignified hurry. She glares at you, lower lip thrust out, as she stomps out. <i>“You are the most miserable harem-owner in this entire shitty galaxy, you know that?”</i>");
			output("\n\nThat’s a bridge that’ll take some rebuilding. Still, you can rest easy that she won’t be trying to get into your inner sanctum any time soon.");
			// Sera set to banned. Standard rest scene from here
			if(flags["CREWMEMBER_SLEEP_WITH"] == "SERA") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
			processTime(1);
			addButton(0, "Next", seraBitchImpregnateBedResumeSleep, true);
			break;
		case "foot warmer":
			output("You [pc.move] slowly across to the bed, keeping your expression neutral. You reach out and caress Sera’s chin, tracing her round jawline until the leer melts into unguarded, dog-like devotion, bending her head into it when you stroke her hair. <i>That’s</i> more like it.");
			output("\n\n<i>“You can stay,”</i> you say imperiously. <i>“I do need a good bed-warmer. But you will take a slave’s proper place - at the foot of the bed.”</i>");
			output("\n\n<i>“Yes [pc.master],”</i> she groans in response, savoring your harshness and her submission to it. You take off your [pc.gear], clamber into bed and watch as the curvy demon-morph crawls down to the other end, curling herself up in sheets and resting against your [pc.feet], prehensile tail gently wrapping itself around " + (!pc.hasLegs() ? "your tip" : "your lower legs") + ". Mmm... that soft warmth does feel nice. Like a big, sexy water bottle. You let yourself relax and slowly drift off into lusty, spicy dreams of conquest and sadistic indulgence.");
			// +Lust, Sera set to invited
			processTime(1);
			pc.lust(15);
			if(flags["CREWMEMBER_SLEEP_WITH"] != "SERA") flags["CREWMEMBER_SLEEP_WITH"] = "SERA";
			flags["SERA_SLEEP_CHOICE"] = 0;
			addButton(0, "Next", seraBitchImpregnateBedResumeSleep);
			break;
		case "cuddle":
			output("You sigh, take off your [pc.gear] and climb into bed with her. Whatever. You’re tired, and falling asleep with demon boobies pillowed into you will be a pleasure.");
			output("\n\nSera’s leer widens as she clinches you underneath the sheets, hand moving over the swell of your [pc.butt] whilst the other rests in the small of your back. A smooth thigh slides over your own.");
			output("\n\n<i>“Just relax, [pc.master],”</i> she coos, eyes little more than yellow slits. <i>“Let it all go and hold me close. You like that, don’t you? Me making you all safe... Being soft and small and wrapped up in me... belonging and owned...”</i>");
			output("\n\nYou doze in the succubus’s embrace, her voice murmuring and hushing enticements and invitations gentle black waves that you slip beneath...");
			// +Lust, Sera set to invited
			processTime(1);
			pc.lust(15);
			if(flags["CREWMEMBER_SLEEP_WITH"] != "SERA") flags["CREWMEMBER_SLEEP_WITH"] = "SERA";
			flags["SERA_SLEEP_CHOICE"] = 1;
			addButton(0, "Next", seraBitchImpregnateBedResumeSleep);
			break;
		case "debar":
			output("As airily as you can, you say you don’t mind her getting into your room, if she really wants.");
			output("\n\nSera’s grin widens into a vindictive sneer. Your attempted casualness breaks against it like water around a gleaming prow.");
			output("\n\n<i>“You don’t mind, do you?”</i> she scoffs. <i>“That’s big of you.”</i> She examines her two-inch nails, the picture of studied indifference. <i>“Can’t say I care about that anymore. I don’t go where I’m not wanted. I suppose if you really wanted all of this between the sheets again, you could... oh, I don’t know... beg.”</i>");
			// [Beg] [Nope]
			processTime(1);
			addButton(0, "Beg", seraBitchImpregnateBedResponse, "debar beg");
			addButton(1, "Nope", seraBitchImpregnateBedResponse, "debar nope");
			break;
		case "debar nope":
			output("<i>“Oh well,”</i> Sera sniffs. <i>“Guess you care about it as much as I do. Don’t bring it up again, yeah?”</i>");
			output("\n\nIt does cross your mind to shock that insolent attitude right out of her - but there are some unwritten rules here that have to be followed in order to retain your status as someone she (mostly) trusts and obeys. So it looks like you’ll have to swallow your pride if you’re ever going to make it up to her.");
			processTime(1);
			addButton(0, "Next", approachServantSera);
			break;
		case "debar beg":
			output("<i>“Please, Sera...”</i> you try.");
			output("\n\n<i>“Call that begging? On your knees before the Queen of Bedtime!”</i> the former human demands, slapping her desk haughtily. For crying out loud... you bite down on your everything and " + (pc.hasKnees() ? "kneel" : "squat") + " before her, hands clasped.");
			output("\n\n<i>“Now repeat after me,”</i> she says coolly, chin rested on fist. <i>“Please forgive my terrible rudeness, my Queen.”</i>");
			output("\n\n<i>“Please forgive my terrible rudeness, my Queen.”</i>");
			output("\n\n<i>“It will never happen again.”</i>");
			output("\n\n<i>“It will... never happen again.”</i>");
			output("\n\n<i>“I humbly beseech you to brighten my pathetic room with your illuminating presence.”</i>");
			output("\n\n<i>“...I humbly beseech you to brighten my pathetic room with your illuminating presence,”</i> you mumble, cheeks burning.");
			output("\n\n<i>“Mmm. Pleasing,”</i> gloats a horned Cheshire Cat in front of you, stroking the inside of her thigh longingly. <i>“We should do this more often, ‘[pc.master]’.”</i> The air-quotes turn into a dismissive wave, a sadistic beam is downgraded to a teasing smirk. <i>“...we’ll see. I may look favorably on your request in light of this grovelling, who knows...”</i>");
			output("\n\nIt takes all of the self control in the galaxy not to reach for the collar control as you pick yourself back up.");
			// Sera set to trying
			processTime(3);
			flags["SERA_NO_SLEEP"] = undefined;
			addButton(0, "Next", approachServantSera);
			break;
	}
}
public function seraBitchImpregnateBedResumeSleep(bSet:Boolean = false):void
{
	if(!bSet) flags["SERA_NO_SLEEP"] = -1;
	else flags["SERA_NO_SLEEP"] = days;
	sleep(true, false);
	if(!bSet) flags["SERA_NO_SLEEP"] = undefined;
}
// Morning Sex
// 80% chance Sera wakes you up with it if she’s not pregnant, 50% chance if pregnant.
// Randomly select one from dom pool if PC chose cuddling, from sub pool if PC chose foot warmer.
public function seraBitchImpregnateBedWakeCheck():Boolean
{
	if(flags["CREWMEMBER_SLEEP_WITH"] != "SERA" || !seraIsCrew() || flags["SERA_NO_SLEEP"] >= 0) return false;
	
	var chance:int = 80;
	if(chars["SERA"].isPregnant()) chance = 50;
	if(rand(100) > chance) return false;
	
	return true;
}
public function seraBitchImpregnateBedWake():void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	clearMenu();
	
	var sceneList:Array = [];
	var scene:int = -1;
	
	// No Sex
	sceneList.push(0);
	if(flags["SERA_SLEEP_CHOICE"] == 1) {
		// Spooning (Dom)
		// Requires Sera dicked
		if(chars["SERA"].hasCock() && pc.hasGenitals()) sceneList.push(1);
		// Cockmilking (Dom)
		if(pc.hasCock()) sceneList.push(2);
	}
	if(flags["SERA_SLEEP_CHOICE"] == 0) {
		// Pussylicking (Sub)
		if(pc.hasVagina()) sceneList.push(3);
		// Reverse Cowgirl (Sub)
		if(pc.hasCock()) sceneList.push(4);
	}
	
	scene = sceneList[rand(sceneList.length)];
	var cIdx:int = -1;
	var vIdx:int = -1;
	
	switch(scene)
	{
		case 0:
			output("You gradually awake from a deep, satisfying sleep. Glorying in the feeling of being well rested, you cast a glance " + (flags["SERA_SLEEP_CHOICE"] == 1 ? "over" : "down") + " to your bed partner.");
			if(flags["SERA_SLEEP_CHOICE"] == 1) output(" Sera is turned away from you, blue hair cascaded over the pillow, breath rasping through her nostrils. She’s " + (!seraIsPregnant(true, 30) ? "curled into a semi-foetal position, defensive even in sleep" : "curled into her growing baby bump, defensive even in sleep") + ". Her expression is relaxed though and, dare you say, " + (!seraIsPregnant(true, 30) ? "very sweet" : "almost motherly") + ".");
			else output(" Sera is still curled up in your sheets at the bottom of your bed, head rested against your [pc.foot], breath rasping through her nostrils." + (seraIsPregnant(true, 30) ? " She seems layered around her growing baby bump, defensive of it in sleep." : "") + " Her expression is relaxed though and, dare you say, " + (!seraIsPregnant(true, 30) ? "very sweet" : "almost motherly") + ".");
			if(seraIsPregnant(true, 30)) output("\n\n" + (flags["SERA_SLEEP_CHOICE"] == 1 ? "You stroke the curve of her warm belly and plant a kiss on her brow. She murmurs and shifts but doesn’t wake. You slide out of bed, put on your [pc.gear] and creep out" : "You enjoy this fleeting sight of your prickly sex slave at peace for a few moments more, before sliding out of bed, putting your gear on and creeping out") + ".");
			processTime(3);
			break;
		case 1:
			seraBitcheningImpregnateToggle(100);
			if(pc.hasVagina()) vIdx = rand(pc.vaginas.length);
			if(pc.hasCock()) cIdx = rand(pc.cocks.length);
			
			output("You wake slowly to a glow of pleasure throbbing from your groin. In the hinterland between sleep and consciousness it blends into your dreams, pluming them into erotic fancies, and you murmur your contentment as the sensation steadily increases, the hard, hot pressure down there making");
			if(pc.hasVagina()) output(" [pc.eachVagina] wetter and wetter");
			if(pc.isHerm()) output(" and");
			if(pc.hasCock()) output(" [pc.eachCock] increasingly erect");
			output(". Now the pressure is lining itself up with your [pc.vagOrAss], and... wait, what is going on here?!");
			output("\n\nYou fully awake with a jerk, and immediately there’s a soothing, wicked hush in your ear, a hand stroking over your [pc.chest].");
			output("\n\n<i>“There there, [pc.master],”</i> croons Sera, lips touching your [pc.ear]. She’s spooned into you from behind, the warm softness of her boobs and thighs pressed against your back and [pc.hips]. There’s absolutely nothing soft about what she’s got planted between your [pc.thighs] though, rhythmically rocking backwards and forwards over your");
			if(!pc.hasVagina()) output(" taint");
			else if(pc.vaginas.length == 1) output(" pussy");
			else output(" pussies");
			output(". <i>“Just relax. You look so cute when you’re fast asleep and not rocking a mega power trip, you know that? Nobody in the galaxy could resist...”</i>");
			output("\n\nYou mumble uneasily, shifting against her, and she presses her fingers against your [pc.lips] commandingly, all the while her other hand teases your [pc.nipple]");
			if((pc.hasNormalNipples() || pc.hasNippleCocks()) && !pc.isLactating()) output(", bringing it to a fine point with expert rolls of her tips");
			else if(pc.isLactating()) output(" until it is beading [pc.milk]");
			else if(pc.hasCuntNipples()) output(" until it is flush and oozing [pc.femCum]");
			output(". One, is she good at that...");
			output("\n\n<i>“No, don’t say a thing. Don’t do anything. Let your slave move. Doesn’t that feel good?”</i> Her hips shift over yours, and her hot twelve-inch length rubs");
			if(vIdx >= 0) output(" between the lips of your [pc.vagina " + vIdx + "], across your bulging [pc.clitsNoun " + vIdx + "]");
			else if(cIdx >= 0) output(" against the sensitive underside of your [pc.cock " + cIdx + "], hardening it with its insistent pressure");
			output(". In your barely awakened state, it is extremely tempting to just lie here and let the horny hermaphrodite do what she may...");
			output("\n\n<i>“Yeeeees,”</i> hisses Sera in your ear, as if reading your thoughts. <i>“You’re safe in here, in my hands, aren’t you? Nobody has to know you’re lying back and taking it nice and deep from your slave...”</i> You gasp slightly as she draws herself back and presses the bulb of her thick cock against the entrance of your [pc.vagOrAss]. <i>“...unless I make you moan so loud the whole ship hears,”</i> she whispers in your ear, trailing off in a despicable giggle. <i>“That would be tragic, wouldn’t it?”</i>");
			output("\n\nShe slowly works her road inwards, first the hard, bulbous head stretching your " + (vIdx < 0 ? "sphincter" : "pussy lips") + " wide, followed by inch after inch of long, veiny dick. For all that her male sex is dauntingly, aggressively big, in your relaxed, dozy state it’s very easy to relax in her arms and let her ease her way in. Particularly as her mouth and hands are constantly working, nibbling hungrily at your [pc.ears] and neck and playing with your [pc.chest], " + (!pc.hasFuckableNipples() ? "gently pulling" : "fingering") + " your nipples, smoothing her hand down your [pc.belly] to");
			if(vIdx >= 0) output(" flick at your [pc.clit " + vIdx + "]");
			else if(cIdx >= 0) output(" jerk your [pc.cock " + cIdx + "]");
			output(" play with " + (pc.vaginas.length == 2 ? "the" : "a") + " pussy she’s not using");
			output("... Void, that all the while your " + (vIdx >= 0 ? "[pc.vagina " + vIdx + "]" : "[pc.anus]") + " is being filled up with hard, firm meat...");
			
			if(vIdx >= 0) pc.cuntChange(vIdx, chars["SERA"].cockVolume(0));
			else pc.buttChange(chars["SERA"].cockVolume(0));
			
			output("\n\nYou desperately try to still your voice as you cum, and the effort of staying quiet only makes it more tense, writhing in Sera’s arms as");
			if(vIdx >= 0) output(" your cunt flexes and shimmers around her cock, oiling it with [pc.femCum]");
			else if(cIdx >= 0) output(" your cock shoots [pc.cum] onto the bed in wonderful, juicy strokes");
			output(".");
			output("\n\n<i>“Mmm, you like that don’t you?”</i> the opportunistic hellion husks in your ear. <i>“Slutty [pc.master]...”</i> She locks her smooth, full thigh around yours, boobs pressed deeper into you, tightening her grip as she begins to pump you, bending her dick outwards only to mire it firmly back home in your trembling [pc.vagOrAss].");
			// PC pregnant by her:
			if(pc.hasPregnancyOfType("SeraSpawnPregnancy") && pc.bellyRating() >= 10) output(" Her hand rests upon your [pc.belly] again, shifting over it rhythmically. <i>“You can’t get enough of it, can you? Even now, after I’ve made you totter around carrying my child. You just can’t get enough of the feeling of me filling your pretty, prissy pussy full of demon sperm. You can go on pretending you’re in charge if you like, but... ungh! I know who’s addicted to what.”</i>");
			// Sera pregnant by 3 months or more:
			else if(seraIsPregnant(true, 60)) output(" Her watermelon-like belly bumps into your lower back with every thrust, taut in comparison to the softness of her tits. <i>“You’d think the estrogen and shit would calm it down, but it doesn’t, it fucking doesn’t. I can’t stop getting hard, and I can’t even fap because of you. This is my reward for obeying... getting to use you like you use me...”</i>");
			// If else:
			else output(" <i>“And I deserve this, don’t I? I’ve been ever so good. You know how hard it is to control myself when you walk that prissy ass of yours around, giving orders like butter doesn’t fucking melt? What I’d give to own that.. What I’d fucking give... this’ll have to do for now...”</i>");
			output("\n\nHer gloating whispers devolve into lusty groaning as she loses herself in the rhythm, working like a piston behind you now, hot dick sliding into you with each rotation of her hips. Your orgasm has left you soft and tender in the warmth of your bed, transfixed by the feeling of her deep inside you; it’s way too good for the thought of resistance to ever occur. ");
			output("\n\nShe bites your ear hard, fingers " + (pc.biggestTitSize() >= 3 ? "deep in the pillowy give of your breasts" : "imprinting themselves into your [pc.chest]") + " as she drives herself in as deep as she can");
			if(!seraIsPregnant(true, 60)) output(", bulging balls pressing against your " + (vIdx < 0 ? "[pc.ass]" : "[pc.thighs]") + " and heavy warmth blooms in your " + (vIdx < 0 ? "gut" : "womb") + ", quickly filling your tunnel as she orgasms with a husky exhalation again and again. The feeling of it is so filthily exquisite you are forced to another high yourself, unable to stop a high yelp escaping your [pc.lips] as your " + (vIdx >= 0 ? "pussy" : "ass") + " convulses again around her, adding your own " + (vIdx >= 0 ? "[pc.femCum]" : "[pc.cum]") + " to the payload drooling out around your packed " + (vIdx >= 0 ? "twat" : "asshole"));
			output(".");
			output("\n\nSera holds you against her breasts");
			if(seraIsPregnant(true, 30)) output(" and belly");
			output(", cock still within you, for a long time afterwards, silently sharing the wonderful afterglow. Eventually you cough meaningfully, and after a moment longer she slowly withdraws, meat sliding down your tingling, tender walls and leaving with a mini-gush of cum.");
			output("\n\n<i>“Mmm,”</i> she sighs, wiping the offending foot long member on the sheets, <i>“I do so love it when [pc.master] lets me be in charge for once.”</i> She winks when you stare at her stone-faced, utterly unabashed, and she hums a jaunty little tune to herself as she saunters off towards the shower.");
			output("\n\nShe’s a piece of work. Still, there are definitely worse ways of being woken up.");
			processTime(35);
			if(vIdx >= 0) pc.loadInCunt(chars["SERA"], vIdx);
			else pc.loadInAss(chars["SERA"]);
			chars["SERA"].orgasm();
			pc.orgasm();
			IncrementFlag("SERA_WAKEUP_SEX");
			break;
		case 2:
			seraBitcheningImpregnateToggle(100);
			cIdx = rand(pc.cocks.length);
			
			output("You’re being held down and ridden briskly by a snake-headed alien princess, in some deranged, open-air palace out of M.C. Escher’s most warped fantasies. You have been here for years, deathless aeons perhaps, but that doesn’t matter. What matters is the moment; what matters is your [pc.cock " + cIdx + "] sunk deep in sopping, muscular pussy that writhes and wrings it with jealous zeal. You don’t dare reach up and touch the snake princess’s perfect breasts or curvy hips, because then she’ll bite you, and then the clear venom she’s drooling all over your [pc.belly] and [pc.chest] will enter your veins. You just have to lie perfectly still and let her take her satisfaction from you... be her slave, and let the wet, wringing heat around your cock overwhelm you...");
			output("\n\nYou awaken suddenly. Your immediate instinct is to fling your arms out, reassure yourself that snake -related death is no longer hovering over you. They are surrounded by somebody else’s arms, and there is a soothing hush in your ear.");
			output("\n\n<i>“Was somebody having a bad dream?”</i> Sera whispers, teasing cruelty shadowing her cooing tone. <i>“Never mind, [pc.master]. You just lie back and... mmm... let your slave comfort you.”</i>");
			output("\n\nEither you turned over or she cleverly changed position during the night, because now you’re face to face. The succubus has gotten your [pc.cock " + cIdx + "] fiercely erect, morning wood given passionate purpose, and she’s half-slid into her tight, silky pussy, the soft weight of her thigh clasping over your own, her prehensile tail wrapped around your [pc.leg]. Again you shift uncertainly - perhaps to pull away, perhaps to climb on top - and are almost paralysed by how <i>good</i> her cunt feels around you. You don’t want that to end, not when you’re feeling so relaxed and fuzzy in bed... Sera’s hushes, kisses and licks against your [pc.ears] push you even further back down.");
			
			pc.cockChange();
			chars["SERA"].cuntChange(0, pc.cockVolume(cIdx));
			
			output("\n\n<i>“No, no, [pc.master], I’ll do everything. Doesn’t this feel good?”</i> She moves her hip back and forth, and you groan woozily as her pussy tightens... then loosens, tightens... then loosens around your eagerly erect prick. <i>“Isn’t that wonderful?”</i> she purrs, " + (pc.hasHair() ? "running her claws through your [pc.hair]" : "stroking your pate with her claws") + " before firmly pushing your " + (pc.tallness > (chars["SERA"].tallness + 6) ? "head over shoulder" : ("head into her big, soft, " + (chars["SERA"].skinTone!= "bright pink" ? "purple" : "pink") + " cleavage")) + ". <i>“I modded every part of my body to be in control. To make my every bitc... lover powerless against me. Because doesn’t it feel good? For me to be in control?”</i>");
			output("\n\nWith the barest of movement, the soaked tunnel of her pussy tightens up like a silken vice around you, and when she writhes her curves against you it <i>jerks</i> your [pc.cock " + cIdx + "] most sensitive zone so that you reflexively arch your back to it. Void yes... it does feel so good to let go and let her have you however she wants...");
			output("\n\n<i>“Thaaaat’s it,”</i> sniggers Sera. She exhales slowly into your ear as she sinks herself even further down your shaft,");
			if(pc.cockVolume(cIdx) <= chars["SERA"].vaginalCapacity(0)) output(" enveloping the entirety of it in supple, wet magic");
			else output(" enveloping even more of the long, ponderous fuck-stick in supple, wet magic");
			output(". Again she rotates her thick hips back and forth, swivelling you masterfully in her depths, using you to stir herself");
			if(pc.cockVolume(cIdx) > chars["SERA"].vaginalCapacity(0) || pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_KNOTTED) || pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_NUBBY) || pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_RIBBED) || pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_STINGER_BASED))
			{
				output(", your");
				if(pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_NUBBY)) output(" swollen barbs");
				else if(pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_RIBBED)) output(" swollen knobbles");
				else if(pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_STINGER_BASED)) output(" swollen feelers");
				output(" rubbing against her walls causing her to groan with content");
			}
			output(".");
			output("\n\n<i>“Who’s an obedient [pc.boy]? Every mistress needs one of you in her bed, a " + (pc.cockVolume(cIdx) > chars["SERA"].vaginalCapacity(0) ? "big heated dildo" : "heated little fuck toy") + " to enjoy at her leisure in a morning. You’re gonna cum so hard to this, aren’t you?”</i> She asks, smoothing her hand over your [pc.ass] as she’s talking, and she grips it hard when she poses the question, making you twitch. It’s so hard to think in this dreamy state, not when she’s working and milking your [pc.cock " + cIdx + "] so exquisitely within her... <i>“When I say so, anyway. Because if you do jizz yourself like some spotty teenager, I can always do this...”</i> You gasp, clutching her reactively as she tightens her thighs around you and her cunt seems to limpet your cock at the base, fastening it deep in her hot, soaking embrace. <i>“...and keep fucking you until I’ve decided we’re done.”</i>");
			output("\n\nThe succubus screws you slowly and rhythmically, her soft breasts pillowing into " + (pc.tallness < chars["SERA"].tallness ? "your face" : "your [pc.chest]") + ", the hypnotic movements of her inhumanely spry and flexible cock-trap keeping you sunk deep under her spell. Her wicked murmurs and teasings eventually pick up into passionate grunts and hisses as her ardour coils tighter, claws digging into your [pc.ass] as she works you harder and harder. You moan woozily as pussy juices dribble down your " + (pc.balls > 0 ? "[pc.balls]" : "[pc.thighs]") + ".");
			output("\n\n");
			// If not pregnant AND barebacking:
			if(knockUpSeraChance(false)) output("<i>“You didn’t dream of knocking me up this way, did you?”</i> she growls. <i>“You never saw me MAKING you give me your seed. Well, this is the way it’s going to be. Me - fucking - drain - you - dry!”</i>");
			// If else:
			else output("<i>“I’m just a cum-sponge to you, aren’t I?”</i> she growls. <i>“That’s what you made me into. Well, this sponge is fucking thirsty, and it’s got you all to herself. I’m going to - fucking - drain - you - dry!”</i>");
			output(" She punctuates each word with a fierce drive of her hips, molding her " + (chars["SERA"].skinTone!= "bright pink" ? "purple" : "pink") + " flesh against yours as she squeezes your [pc.cock " + cIdx + "] ruthlessly in her soaked heat. You couldn’t say no to that if you were made of titanium.");
			output("\n\nYou cum like a firework, [pc.eachCock] seizing up and rocketing [pc.cum] out in maddeningly wonderful surges, your whole body locked up by it. In Sera’s tight, wringing heat it feels like it’s being vacuumed out of you; she crows triumphantly and limpets herself around your waist, forcing your orgasm on and on with athletic bucks of her hips");
			if(pc.tallness < chars["SERA"].tallness) output(", thrusting your face back between her breasts as she does");
			output(".");
			if(pc.cumQ() >= 500) output(" Abundant amounts of cum is soon spurting out around " + (pc.cocks[cIdx].hasFlag(GLOBAL.FLAG_KNOTTED) ? "your [pc.knot]" : "the base of your dick") + ", spattering all over your [pc.skinFurScales] and the bed, but the demon morph continues to clamp and ride you heedlessly.");
			output("\n\nYour [pc.cock " + cIdx + "] is " + (pc.cumQ() < 500 ? "soon" : "eventually") + " shooting blanks, flexing dryly in her silky, kneading wetness");
			if(pc.balls > 0) output(", your [pc.balls] achingly spent");
			output(", and yet Sera doesn’t stop milking you like you’re the last bull in the universe for a moment. It’s only when a groan in protest is forced past your lips that she eases up, her flexible sex blessedly loosening around your abused prick.");
			output("\n\n<i>“You’ve done very well for me, [pc.boyGirl],”</i> she purrs, slowly peeling away from you to consider the heavy amounts of [pc.cum] trailing from your [pc.cock " + cIdx + "] and her snatch. <i>“I feel quite full up.");
			if(knockUpSeraChance(false)) output(" Mmm, if I get pregnant from that... yes, I think I’d be willing to accept it this way. Milking you like a cute kitty bitch boi.");
			output("”</i> Perhaps she’s able to sense your growing irritation with her brazenness, because she slithers away from you the next moment, tail grazing your flank as she head towards the shower, leaving a dripping trail of [pc.cumColor] fluid behind her.");
			output("\n\n<i>“Thank you, [pc.master],”</i> she coos at the door. <i>“You know how much I love it when you let me be in charge for once!”</i>");
			output("\n\nShe’s a piece of work. Still, there are worse things to be woken up by than an extremely thorough screw.");
			processTime(35);
			knockUpSeraChance();
			chars["SERA"].orgasm();
			pc.orgasm();
			pc.ballFullness = 0;
			IncrementFlag("SERA_WAKEUP_SEX");
			break;
		case 3:
			vIdx = rand(pc.vaginas.length);
			
			output("You’re lying naked on a sun-baked beach, and a beautiful serpentine creature is making love to your [pc.vagina " + vIdx + "] with hungry flicks of its forked tongue. With a mere flick of your finger, you can send a shudder of pleasure through the purple reptile, making it twitch and writhe its effervescent scales whenever you like. It quickens its licking in response to your idle gestures, and underneath its attentions and the burning sun your lower body begins to melt...");
			output("\n\nYou awaken with a sudden jerk, and look down. Mischievous slitted eyes meet yours. Sera is sprawled on her side, has her hands wrapped around your [pc.thighs], and is lapping away at your [pc.vagina " + vIdx + "], already spread and soaked to the slither and flick of the succubus’s tongue across its inner folds.");
			output("\n\n<i>“Do you like that, [pc.master]?”</i> she murmurs, pulling her tongue away with a crooked little flick. <i>“No point in making your slave sleep with you if she can’t wake you up this way, is there? Particularly when...”</i> She opens her mouth and allows her whole tongue to unfold out of her mouth like a wet, red venetian blind; eight inches of blunt, saliva-slathered, obscene magic. You forget she has that sometimes. You forget that that absolutely should be applied to your genitals as much as is humanly possible.");
			output("\n\nYou grasp one of her horns and pulling her face back into your wet heat. Sera sets back to it with a pleased hum, playing with your [pc.clit " + vIdx + "] with the tip of her tongue until it is bulging with intense pleasure before slowly sinking the tentacle-like appendage deep into the hole, inching up your tender tunnel bit by bit until it feels like it’s completely packed out with writhing, wet muscle. She curls at you deep until you’re gasping and twitching with the ecstasy of it before withdrawing, drawing out " + (pc.isSquirter(vIdx) ? "dribbles" : "a sizeable gush") + " of [pc.femcum] as she goes.");
			output("\n\n<i>“Is the way your slave tickles you pleasing, [pc.master]?”</i> The succubus leers up at you, her mouth smeared with [pc.femcum]. <i>“There’s no point in even owning anyone else, is there? Not the way she can make your pussy sit up and da--”</i> You grip both of her horns and pull her face back between your open thighs. She hasn’t performed nearly enough to start gloating yet.");
			output("\n\n");
			if(pc.vaginas.length != 1) output("You make her concentrate on your [pc.vagina " + vIdx + "], lavishing it with just as much wet, swirling pleasure as your first pussy, getting in sumptuously deep with that python of a tongue until waves of ecstasy are washing through your core.");
			else output("Obediently she goes back in sumptuously deep, writhing that python of a tongue of hers within your tunnel until the waves of ecstasy crashing through your core are redoubled.");
			output(" You clamp your [pc.thighs] around her head as you orgasm, writhing your body around that wonderful wet, prehensile mouth-tentacle of hers" + (pc.isSquirter(vIdx) ? ", completely icing her face in the copious amounts of juices you spurt around it with each ecstatic clench" : "") + ".");
			output("\n\nWet flesh slides over your tingling");
			if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_NUBBY)) output(" nubs");
			else if(pc.vaginas[vIdx].hasFlag(GLOBAL.FLAG_STINGER_BASED)) output(" cilia");
			else if(pc.vaginas[vIdx].type == GLOBAL.TYPE_FLOWER) output(" petals");
			else output(" walls");
			output(" as Sera slowly withdraws. She maintains eye contact, eerily yellow slits as she continues to lap at you, this time concentrating on [pc.eachClit]. She makes out with " + (pc.vaginas[vIdx].clits == 1 ? "it" : "them") + ", surrounding the sensitive bud" + (pc.vaginas[vIdx].clits == 1 ? "" : "s") + " with her lips and pulling at " + (pc.vaginas[vIdx].clits == 1 ? "it" : "them") + " with wet smooches, a different but almost equally intense rhythm she inundated your innards with. Sera doesn’t stop until " + (pc.vaginas[vIdx].clits == 1 ? "it is" : "they are") + " bulging so hard " + (pc.vaginas[vIdx].clits == 1 ? "it feels like it’s" : "they feel like they’re") + " going to explode, and then actually seems to, bursting with joy, flexing up repeatedly to her suckling and licking. You moan and harshly huff your approval, once again making sure that well-trained mouth of hers goes nowhere by tightening your hips around her head hard, silky hair shifting against your [pc.skinFurScales].");
			output("\n\nOnly when the last delicious pulse has chimed through you do you loosen your grip, let her withdraw and grin up at you. [pc.EachVagina] feels like " + (pc.vaginas.length == 1 ? "it’s" : "they’re") + " gently steaming.");
			output("\n\n<i>“I sleep with you just so I get to eat you,”</i> she whispers. <i>“I could do it aaaaaall day.”</i>");
			output("\n\nBe that as it may, you should probably get into action. You shoo her off you and head for the shower, still enjoying little aftershocks and a certain loosened tenderness. You could definitely get used to being woken up this way.");
			processTime(35);
			chars["SERA"].orgasm();
			pc.orgasm();
			IncrementFlag("SERA_WAKEUP_SEX");
			break;
		case 4:
			seraBitcheningImpregnateToggle(100);
			cIdx = rand(pc.cocks.length);
			
			output("You mumble and groan, rolling in the cotton wool fathoms of sleep. Something has grasped your [pc.cock " + cIdx + "], lovingly stroking it and pulling it into stern erection, surrounding it in succulent, milking pressure. It’s heaven to just lie there and enjoy it, mind switched off, nothing but a vessel drifting free on the tides of pleasure... but eventually it’s impossible to ignore this is not something that’s happening in a wonderful dream. You open your eyes.");
			output("\n\nSera is sat astride your prostrate body, back to you, big [sera.skinColor] butt firmly planted over your crotch. Its soft warmth shifts back and forth over your [pc.thighs] as she rides your [pc.cock " + cIdx + "], stretched deep into her wet, supple cunt. Sulphuric yellow orbs gaze at you over one shoulder.");
			
			pc.cockChange();
			chars["SERA"].cuntChange(0, pc.cockVolume(cIdx));
			
			output("\n\n<i>“Wakey wakey,”</i> she coos. <i>“Welcome to another day of being a big dick harem owner! Here’s some slave pussy for breakfast.”</i>");
			output("\n\nFor a little while you just lie back and revel in it, your morning glory kneaded back and forth within the succubus’s hot, unholy body, perfect curves");
			if (seraIsPregnant(true)) output(" wedded to the new life you’ve swollen her stomach with");
			output(", plump labia up against your");
			if (pc.hasKnot(cIdx)) output(" [pc.knot]");
			else if (pc.balls > 0) output(" [pc.balls]");
			else output(" base");
			output(", deep as hell. Void, she really does have such a nice ass: round and soft and pert, crying out to be fondled and slapped. Wait, you <i>own</i> that ass, don’t you? With a big grin, you reach out to grip its suppleness and give one buttock a big, resounding swat. The horny gasp and shudder this draws out of her is every bit as satisfying.");
			
			output("\n\n<i>“‘S right, like that,”</i> she groans, spade tail flipping about feverishly. <i>“Treat your bed warmer like she deserves!”</i>");
			output("\n\nAs ever with Sera it’s all absurdly theatrical, but that doesn’t make the performance any less enjoyable, particularly not when her pussy is squishing around your [pc.cock " + cIdx + "] so exquisitely, and your doministic tendencies rear upwards, spiky urges that make you pull her tail, reach around and seize a soft tit, using the purchase to thrust into her hard.");
			if (chars["SERA"].hasCock()) output(" Her cock pats against your [pc.thighs], semi-hard and beading pre, only able to dream of the free, easy pleasure yours is indulging in.");
			else output(" It’s always a pleasure to remind yourself that you took away her own maleness, molded her into a slut so cock-hungry she cannot help but climb on top of you whilst you’re still dreaming.");
			
			output("\n\nShe responds to the roughness of it like you know she does, increasing the pace of her backwards riding, urging you onwards with wordless snarls and moans, claws biting into the [pc.skinFurScales] of your [pc.legs], soaked sex writhing around your [pc.cockNoun " + cIdx + "]. You surge upwards into outrageous orgasm, a night’s worth of backed-up [pc.cum] rocketing into her clenching pussy");
			if (pc.hasKnot(cIdx))
			{
				output(". You thrust your [pc.knot] into her, stretching out her entrance with round, hard dick flesh, ensuring the load of hot seed goes nowhere except towards packing out her");
				if (seraIsPregnant()) output(" pussy");
				else if (chars["SERA"].fertility() > 0) output(" fertile womb");
				else output(" womb");
				output(" in yet more of your fertile baby creator, a thick, filling reminder of your ability to sire her at will.");
			}
			else output(", soon drooling out again in thick streams as your dick seizes up again and again.");
			
			output("\n\nYou lie back against the sheets when you’re finally done, sweat drying on your [pc.skinFurScales], post-coital bliss throbbing through you. Sera sits atop you, gazing over her shoulder at you with a smirk");
			if (pc.hasKnot(cIdx)) output(" your swollen knot ensuring she can’t go anywhere.");
			else output(" still stirring your spent member inside of her.");
			output(" Her tail spade brushes over your lips teasingly.");
			
			output("\n\n<i>“I love you in the morning,”</i> she says. <i>“That higher thinking hasn’t quite clicked in yet... and we can do it like animals.");			
			if (flags["SERA_PREGNANCY_TIMER"] >= 60) output(" Always reminds me of the time you first knocked me up. Just making me your breeding bitch, total abandon... yeah. That does feel pretty good.”</i>");
			else if (!seraIsPregnant() && chars["SERA"].fertility() > 0) output("”</i> She rests her hand on her stomach. <i>“Feels like the best way of getting knocked up, don’t you think?”</i>");
			else ("”</i>");
			
			output("\n\nAt length she gets off you and clacks her way towards the bathroom, leaving a spotty trail of [pc.cumColor] behind her, leaving you to sink back into the sweat-stained sheets for a little while longer. What a life you lead.");

			processTime(15 + rand(15));
			knockUpSeraChance();
			chars["SERA"].orgasm();
			pc.orgasm();
			IncrementFlag("SERA_WAKEUP_SEX");
			break;
	}
	
	addButton(0, "Next", mainGameMenu);
}

// New Blurbs
public function seraPregQuitSmoking():void
{
	clearOutput();
	showBust("");
	author("Nonesuch");
	
	var planetName:String = getPlanetName().toLowerCase();
	
	output("There’s some stuff piled just outside the airlock to your ship - several cartons of unfiltered cigarettes and a crate of wine.");
	if(planetName == "tarkus") output(" Tears in the cardboard and scatters of cigs on the floor inform you that the port raskvel have helped themselves already.");
	if(planetName == "myrellion") output(" There’s several beady-eyed gold myr hanging around nearby, evidently waiting for you to buzz off so they can claim the valuable contraband.");
	output(" Wonder who left all that there?");
	
	flags["SERA_QUIT_SMOKING"] = 1;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// [Belly Rubs]
// Add option to her main menu if pregnant >110 days
public function seraPregBellyRubs():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	if(flags["SERA_PREGNANCY_TIMER"] <= 170)
	{
		output("<i>“What are you...?”</i> Sera watches you with an amused frown as you clamber onto the bed with her and spoon into her from behind. She tenses and huffs with discomfited embarrassment as you spread your hands over her belly bulge, freely enjoying the warm, taut skin with sweeps of your palms.");
		output("\n\n<i>“Don’t do that! It’s bad enough that you’ve made my body do all sorts of nasty sh- stuff without you getting <b>weird</b> about it...”</i> You ignore her weak complaints and continue to hold her close, rubbing the delightful, cute swell of her stomach, new life growing within her.");
		output("\n\n<i>“You good?”</i> she says tartly, cheeks flushed, when you finally disengage. <i>“Can we get back to whipping or assfucking me or whatever now? I get enough reminders of what the next few months are going to be like, thanks.”</i>");
	}
	else
	{
		output("<i>“Oh for the love of...”</i> Sera sighs in exasperation as you clamber onto her bed and clinch her from behind, but she’s smirking despite herself, and doesn’t tense up when you spread your hands over her balloon of a stomach, slowly rubbing that wonderful, taut baby bulge. It’s made even better by how soft and motherly her body has started to become - particularly her thick hips and ass, fleshy pillows pressing into your [pc.groin].");
		output("\n\n<i>“Alright, so, this bit’s not so bad,”</i> she says in a low voice, practically purring as you stroke her. <i>“If it was just this and... not the sickness, and... not the hormones, and... not the screaming brat at the end of it, and... hey!”</i> She slaps at you as you cheekily flick at her distended belly button.");
		output("\n\nYou soothe her back down by returning your hands to the sides, and there’s that rare, unguarded expression of happiness on her face when you do finally pull away. She looks very different looking like that, with her belly full of life, than you might ever have expected her to.");
		output("\n\n<i>“Guess we can’t do much BDSM anymore,”</i> she murmurs. <i>“Guess this lovey dovey crap’ll have to do instead.”</i>");
	}
	
	processTime(4);
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
}

// 195 Days
// Displays if Sera pregnant on ship after day 195 of it
public function seraPregMoveToTavros(response:String = "intro"):void
{
	clearOutput();
	author("Nonesuch");
	clearMenu();
	
	switch(response)
	{
		case "intro":
			showSera();
			
			output("<i>“Hey.”</i> Sera is in your room, sitting on the bed. Her usual vampy smile is nowhere to be seen; she looks rather sullen and vulnerable as she flicks her eyes up at you and then to the corners of the room, cradling her great, round baby bump. <i>“I want to go to " + (shipLocation != "TAVROS HANGAR" ? "Tavros" : "the Nursery") + ", ok? Like, now.”</i>");
			output("\n\nYou");
			if(shipLocation != "TAVROS HANGAR") output(" head to the nearest warpgate and are soon joining the crowded ship lanes that surround the vast space station");
			else output(" nod and arrange a few things while she vanishes from your view");
			output(".");
			
			processTime(1);
			
			addButton(0, "Next", seraPregMoveToTavros, "next");
			break;
		case "next":
			//+8 hours, move PC to Vahn square on Tavros.
			if(shipLocation != "TAVROS HANGAR") processTime(480 + rand(11));
			else processTime(15);
			
			flags["SERA_CREWMEMBER"] = 0;
			showSera();
			
			output("Sera has changed by the time you " + (shipLocation != "TAVROS HANGAR" ? "meet her at the landing ramp" : "finish") + "; she’s now in");
			if(flags["MET_SERA_IN_NURSERY"] == undefined)
			{
				output(" a remarkably staid jeans and baggy blouse combo that you’ve never seen her in before");
				flags["MET_SERA_IN_NURSERY"] = 1;
			}
			else output(" the jeans and blouse combo she uses when she’s staying at the Nursery");
			output(".");
			if(flags["SERA_MERCHANT"] != undefined) output(" She’s got her shop gear all packed up and ready to go with her.");
			if(shipLocation == "TAVROS HANGAR") output("\n\nWhen ready, you access the controls to drop the landing ramp.");
			output(" She looks much more relaxed now; she’s humming a little tune as the ramp hits the deck with a clang.");
			
			output("\n\n<i>“Thanks, [pc.master].”</i> She kisses you on the lips and squeezes your hand. <i>“I’ll be in the Nursery until... y’know. Come and visit me sometimes, ok? It’s gonna be mega boring up there.”</i>");
			output("\n\nYou watch her slowly waddle off towards the elevator");
			if(flags["SERA_MERCHANT"] != undefined) output(", arms full of modding merchandise,");
			output(" until she disappears.");
			
			if(shipLocation != "TAVROS HANGAR") shipLocation = "TAVROS HANGAR";
			currentLocation = "TAVROS HANGAR";
			generateMap();
			
			flags["SERA_PREG_MOVED_TO_TAVROS"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// Preg Sera Tavros Texts
// Talk
public function seraPregTalk():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	output("<i>“The staff here are such fu- fracking fussers,”</i> she complains. <i>“I can’t even go out without the head bolt-bag insisting I take a drone escort. They’re supposed to look after babies, not treat me like one!”</i>");
	output("\n\n" + (flags["SERA_PREG_MOVED_TO_TAVROS"] != undefined ? "You point out it was she who insisted on being left here." : "You tell her that they’re only doing their job."));
	output("\n\n<i>“Yeah, well...”</i> She waves irritatedly. <i>“I want to pop this brat and get out of her as soon as possible. It’s not just how boring it is around here, it’s the weird dreams, the weight, the urges...”</i> She stews for a little bit, absently stroking her belly, before brightening a bit. <i>“They do have a great kitchen here. I ordered sushi pizza last night.”</i>");
	output("\n\nHer grin widens as she sees you blanch.");
	output("\n\n<i>“And before that it was stilton and tuna risotto... seaweed baklava... Rodenian Gorkhog on rye...”</i>");
	
	processTime(3);
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
}

// [Sera]
public function brigetSeraPregCheck():void
{
	clearOutput();
	showBriget();
	author("Nonesuch");
	clearMenu();
	
	if(flags["SERA_PREGNANCY_CHECK"] == undefined)
	{
		output("<i>“In the natal unit, dear. Don’t worry, it’s all going fine,”</i> Briget says soothingly. <i>“Although certainly me and the staff have learnt some interesting new swear words over the past few hours. Come back in a day or so. She’ll want to see you.”</i>");
		
		// Option removed for 24 hours
		flags["SERA_PREGNANCY_CHECK"] = days;
		
		nurseryBrigetMenu();
	}
	else
	{
		output("<i>“Why don’t you come and see for yourself?”</i> Briget beams. <i>“Her and the beautiful, healthy addition to your family?”</i>");
		
		flags["SERA_PREGNANCY_CHECK"] = undefined;
		
		addButton(0, "Next", brigetSeraPregCheckNext);
	}
	
	processTime(1);
}
public function brigetSeraPregCheckNext():void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	
	generateMapForLocation("NURSERYSERA");
	
	// Create child!
	var nBabies:int = 1;
	seraNurseryEndPregnancy((pc as PlayerCharacter), nBabies);
	
	var seraNoNameBabies:Array = listSeraNoNameBabies();
	var babyIdx:int = (seraNoNameBabies.length - 1);
	var babym:Boolean = (seraNoNameBabies[babyIdx].NumMale > 0);
	var babyName:String = seraNoNameBabies[babyIdx].Name;
	
	output("The droid leads you back into Sera’s room. Someone has given it a serious tidy whilst its main occupant was absent, which makes the appearance of the person lying in the bed all the more noticeable. Sera’s blue hair is messy and frazzled, there are dark circles under her yellow eyes, and a couple of her claws are broken. Still, there’s a content expression on her worn face. In her arms, she has a regular, human, brown-haired baby, fast asleep against her breast.");
	output("\n\n<i>“This little " + (babym ? "bastard" : "bitch") + ",”</i> she says slowly and clearly, when she’s managed to focus upon you, <i>“has completely ruined my pussy. Completely. Ruined.”</i>");
	output("\n\n<i>“I told you. There are mods for that,”</i> sighs Briget. She turns to you. <i>“As you can see, she’s recovering well. In accordance with her own wishes, we’ll be integrating your little " + (babym ? "son" : "daughter") + " into the nursery system in the next couple of days - so you can take Sera back onto your ship once she’s recuperated, if you wish.”</i>");
	output("\n\n<i>“You’d like that, wouldn’t you, bolt-bag?”</i> the demon-morph croaks.");
	output("\n\n<i>“I told you. I only want what’s best for you, Miss Landon,”</i> replies Briget primly. She squeezes your arm. <i>“I’ll leave you three alone.”</i>");
	output("\n\n<i>“Guess you get to name it,”</i> Sera says once the nurse bot has bustled out, eyeing you knowingly as she strokes the down on top of the sleeping baby’s head. <i>“I remember the contract saying slaves get jack in this situation.”</i>");
	
	processTime(8);
	
	// [Enter Name]
	clearMenu();
	addButton(0, "Next", nameSeraSpawn, [babyIdx, babym, babyName, 0, true]);
}
// Block access to her room for 4 hours, then go back to reg sub Sera visit texts
public function brigetSeraPregCheckFinish():void
{
	pc.createStatusEffect("Sera Mommy Time", 0, 0, 0, 0, true, "", "", false, 240);
	mainGameMenu();
}

// If she has kids in the Nursery, have sub Sera show up in the canteen 18:00-21:30 every day. She can use the exact same [Visit] and [Play] texts that dom Sera uses, with a few modifications:

//checks if sera or pc is pregnant with kid
//returns 0 if neither, 1 if pc, 2 if sera
public function seraPregMotherCheck():int
{	
	if (seraIsPregnant()) return 2;
	
	if (pc.isPregnant())
	{
		if (pc.hasPregnancyOfType("SeraSpawnPregnancy")) return 1;
	}
	
	return 0;
	
}
public function seraPregSterilexOK():Boolean
{
	var timeframe:int = 7 * 24 * 60;
	
	if (flags["SERA_TALKS_IMPREGNATE"] < 2) return false;
	
	if (flags["SERA_STERILEX_STATE"] == undefined) flags["SERA_STERILEX_STATE"] = 0;
	
	if (flags["SERA_STERILEX_DATE"] == undefined) return true;
	
	if (GetGameTimestamp() - timeframe > flags["SERA_STERILEX_DATE"]) return true;
	
	return false;	
}
public function seraPregSterilexOn(turnon:Boolean):void
{
	clearOutput();
	showSera();
	author("Nonesuch");
	var seraBabies:Array = listBabiesOfParent("SERA");
	var numKids:int = seraBabies.length;
	
	if (turnon)
	{
		output("<i>“Dose Sera,”</i> you say clearly. Her silver collar responds with a beep.");
		if (seraPregMotherCheck() > 0)
		{
			output("\n\n<i>“Turning my contraceptive back on? Bit late for that [pc.master],”</i> Sera observes dryly,");
			if (seraPregMotherCheck() == 1) output(" gazing at your [pc.belly].");
			else output(" stroking the growing curve of her belly.");		
			output(" <i>“Sterilex doesn’t work as a mega morning-after pill, you know that right?”</i>");
		
			output("\n\nMaybe not, but it will shut down her breeding capabilities moving forward.");	
		}			
		else if (numKids >= 3)
		{			
			output("\n\nSera blows her cheeks out in relief.");
			output("\n\n<i>“That puts my pill back on, right? Thank f- friday,”</i> she sighs. <i>“Not going to lie [pc.master], the whole pushing out brats thing’s exhausting beyond belief.");
			if (chars["SERA"].hasCock()) output(" Even if I just have to watch it.");
			output("”</i>");	
			
			output(" She leers at you, stretching her gorgeous body out across her bed. <i>“Now we can screw as much as we want to again. Gives you a whole new appreciation of contraceptive, right?”</i>");	
		}
		else output("\n\n<i>“That turns my pill back on, right? Cool,”</i> she says, looking relieved. <i>“I like not worrying about a money time bomb growing inside me anymore. Keep it on, yeah?”</i>");
		
		flags["SERA_STERILEX_STATE"] = 1;
		chars["SERA"].impregnationType = "";
		chars["SERA"].createStatusEffect("Infertile");
	}
	else
	{
		output("<i>“Bareback Sera,”</i> you say clearly. Her silver collar responds with a beep.");
				
		if (seraPregMotherCheck() > 0)
		{
			output("\n\n<i>“You sure you understand how contraceptives work?”</i> she asks,");
			if (seraPregMotherCheck() == 1) output(" reptilian eyes on your [pc.belly]. <i>“You’re not");
			else output(" hand on the growing curve of her stomach. <i>“I’m not");	
			output(" going to get, like, mega-pregnant just because you switched them off again.”</i>");
			
			output("\n\nMaybe not, but you’ll be able to have more kids with her moving forward.");
		}			
		else if (numKids >= 3)
		{
			output("\n\n<i>“Awww, [pc.master]... “</i> Sera rolls onto her back, wailing theatrically. <i>“I thought you were finally DONE with the whole crotch-spawn thing! Isn’t " + numKids + " enough?! Why have we gotta make more?”</i>");
			
			output("\n\nBecause you love tormenting her, clearly. And using your bitch as");
			if (chars["SERA"].hasCock()) output(" a demon stud");
			else output(" a baby factory");	
			output(" is an undeniable turn-on.");			
		}
		else output("\n\n<i>“You want to make babies, do you,”</i> she says, with an odd mix of coyness and nervousness. <i>“Well... they’re on you. That’s all I’m going to say.”</i>");
		
		flags["SERA_STERILEX_STATE"] = 0;	
		chars["SERA"].impregnationType = "SeraSpawnPregnancy";
		chars["SERA"].removeStatusEffect("Infertile");
	}
	
	flags["SERA_STERILEX_DATE"] = GetGameTimestamp();
	
	clearMenu();
	addButton(0, "Next", approachServantSera);
}
public function seraPregMakeLove(kok:int=0):void
{
	clearOutput();
	showSera(true);
	author("Nonesuch");
	
	seraBitcheningImpregnateToggle(100);
	
	output("You retrieve the grav-cuffs from the case and carefully fasten her wrists to the bedposts. You do it with the ease that comes with practice, and it gives you plenty of license to touch her smooth, supple [sera.skinColor] skin, puff breath on her sensitive neck and ears, trace the curves of her generous breasts. The succubus tries to bite you when you get too close - perhaps in jest, perhaps not - and smirks, biting her lip in anticipation when you finally sit back, admiring the succulent, heavily modded body of the slave you’ve spread-eagled helpless over the sheets.");
	output("\n\n<i>“What are you gonna do to little ol’ helpless me, [pc.master]?”</i> she breathes. <i>“You gonna treat her nasty? You gonna bite her and hit her and do it to her rough, until all she can think of is how <i>good</i> it feels to be your fuckdoll?”</i> Her long, tapering tongue slips out of her mouth, a fleshy snake flicking its tail across her lips. <i>“I fucking hope so.”</i>");
	output("\n\nLike any good sex demon, just being near her and listening to her smoky tones makes you tetchy, pent up and eager to throw yourself on her, lust burning a path to your groin, inflating [pc.eachCock] with leaden, reckless need. Yeah. You could treat her rough... or maybe there’s something even more perverse you could do with her.");
	output("\n\nSlowly, ever so slowly, you lie yourself down besides Sera, sinking your hand between the cleft of her thighs and playing with her, enjoying the lust and frustration that quickly bubbles to the surface of her pretty round face as you diddle her, hot silkiness beneath your touch that just gets more and more sodden the longer you stroke her innards and flick at that irascible little clit of hers.");
	output("\n\n<i>“C’mon... “</i> she starts to huff, slim muscles tensing in her trapped arms, breasts trembling. <i>“You gonna... fuck me or what...?”</i>");
	output("\n\nYes, but not the way she’s anticipating. You gently nibble her ear as you climb on top of her, trailing a series of soft kisses from there across to her lovely little nose, which you boop with your [pc.lips] as you slide your throbbing, ready [pc.cock " + kok + "] down the");
	if (seraIsPregnant(true)) output(" growing curve");
	else output(" plain");	
	output(" of her belly. There’s no fakery in the love you do it with: you <i>do</i> have great affection for this raunchy pest you’ve made your own, and you show that to her with each little kiss.");
	
	output("\n\n<i>“What are you doing?”</i> she cries, pulling her face away and glaring at you with genuine alarm. <i>“Don’t do... that!”</i> She splits her thighs beneath you, baring her steaming pussy to you. <i>“Fuck me hard, like you should! Look, I swore!”</i> she exclaims with sudden inspiration. <i>“Now you have to punish me!”</i>");
	output("\n\nYes... but punishment is almost what this is to her, isn’t it? You chuckle softly, and then draw her into a passionate kiss, lining yourself up as you do it sinking your [pc.cockHead " + kok + "] past her lips, slipping deep into her wonderfully supple innards. But you do it slowly... lovingly. Sliding your [pc.hip] upwards, marvelling at the smooth warmth of hers as you simply sit inside her, gently rocking back and forth, hand on the small of her back, drawing her into a tender embrace, [sera.skinColor] boobies flattening against your [pc.chest].");
	
	pc.cockChange();
	chars["SERA"].cuntChange(0, pc.cockVolume(kok));
	
	output("\n\nShe breathes heavily into your mouth and bucks against you frustratedly, pussy wetly stirring itself around your cock, then wrapping her wide hips around your waist and clinching you as hard as she can, doing her very best to will you on. Arousal throbs thickly up your [pc.cock]; it is an effort not to just do what she wants and go to pound-town on her. ");
	output("\n\nBut no. You had to master your own desires in order to tame her, and you’re perfectly able to call upon that self-control now. You wait until she subsides, panting, and then go back to making love to her, laying kisses at the base of her horns, stroking them and her cerulean hair as you allow a gentle tide dictate your [pc.hips], slowly sliding in and out of her, enjoying every inch of her supple sex and body beneath you with leisurely movements.");
	output("\n\n<i>“You’re not supposed to... “</i> she groans. <i>“I’m your whore! Your pet! Your fuck-toy! Not your WIFE!”</i> She is trapped in an incredibly sensual, horny body, and she can’t help but react to what you’re doing to her, femcum drooling down your [pc.cock " + kok + "], hips and breasts raising themselves reactively to your touch. When she opens her unholy, fluorescent eyes, breath hard in her throat, she’s confronted by your gloating grin. <i>“Oh, Onedammit. I hate you <b>so</b> much.”</i>");
	
	output("\n\nYou laugh and then kiss her again, just letting your [pc.lips] and [pc.tongue] trace shapes over her lips and mouth, and this time she lets you slip inside, twine it with her own, a genuinely loving snog as orgasm inexorably tightens your body. You let your hand slide down to her big, juicy rump, stroking it rather than gripping it as you sink");
	if (pc.cocks[kok].cLength() >= 11.5) output(" the greater portion of your massive length inside her");
	else output(" the entirety of your length inside her");
	output(", and when the floodgates open you don’t jackhammer her, simply let it surge upwards and bloat out her");
	if (seraIsPregnant()) output(" pussy");
	else output(" womb");
	output(" as you continue to dance with her tongue. Exulting in the muffled little gasps and moans that are pushed into your mouth, her body now moving to the same rhythm as yours, a gentle back and forth where the main joy is not in the animalistic pleasure of cumming deep inside your bitch, but the joining of your bodies, the affection, the way she’s loving you back despite being cuffed to the bed.");
	
	if (!seraIsPregnant() && flags["SERA_STERILEX_STATE"] == 0) output(" Is there really anything better than marital missionary for the purpose of procreation?");
	
	output("\n\nYou rest on top of Sera when you’re spent, gently stroking her hair and face, breathing in her scent as [pc.cum] drools out of her stuffed pussy and seeps into the bed beneath you.");
	output("\n\n<i>“You really are one sick puppy, [pc.master],”</i> she says, gazing at you with a kind of smirking awe. <i>“I never would have done something as twisted as that with any of my slaves. You need to get your head looked at.”</i>");
	output("\n\nWhen you uncuff her though, her claws do momentarily scrape down your sides, giving you a little squeeze as you draw away. You think maybe she didn’t dislike that <i>so</i> much.");
	
	processTime(15 + rand(15));
	knockUpSeraChance();
	chars["SERA"].orgasm();
	pc.orgasm();
	
	IncrementFlag("SERA_BITCHENING_SEXED");
	IncrementFlag("SERA_MADE_LOVE");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}