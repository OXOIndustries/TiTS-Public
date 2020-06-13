import classes.Items.Miscellaneous.AHCock;
import classes.Items.Miscellaneous.ADCock;
import classes.Items.Miscellaneous.ACock;

//9999 DONT FORGET THESE WHEN UPDATING THINGS
//flags["GIANNA_FUCK_TIMER"] - needs reset in every sex scene and set to count up over time.
//flags["TALKED_TO_GIANNA"] - needs set on every talk scene.

/*Physical Traits
Synthskin - slightly smoother than normal skin. Variable temperature control to allow for temperature play. By default skin heats to match the skin temp of whoever her IR sensors are looking at.
Default coloration is a pale, almost glossy white. PaletteTech pigmentation systems allow her to dye her body to suit her client's needs.
Eyes based on terran biological design. Can do everything human eyes can do and see on wavelengths they can't. Again, coloration is variable, but glowing blue is her default.
Hair is oil-black and tied back into an ass-length ponytail. Can be cut. Regrowth requires purchase of all-purpose matter fabrication gel, a product of JoyCo.
Body is dynamically gel-padded.
Silicone input port at base of spine allows her to distribute additional padding as required.
High pressure lubricant reserve allows for her to be very wet without worry of going dry. Downside: she sinks even faster in water.
Modular genital interface allows for hot-swapping of sex organs. Comes standard with terran default, but perhaps the PC can order her the "clitinari" hermaphrodite pack or the "brood mare" pussy.
Single breast-pair, as human normal.
Black nipples. U no me.
All orifices extremely elastic. Body is built to take huge insertions.
Dynamic suction system allows any entry to be vacuum-pumped to taste.
Entire body is lined with pleasure-sensitive nerves. They're thicker where you would expect to be, but her whole body is considered an erogenous zone.
Voice is capable of modulating to nearly anything but prefers husky, breathier sound.
5'8"
a KihaCorp Class Six Companion Droid
Feet are fairly petite. Toes have no actual nails but coloration to simulate their appearance. Best toejobs.

Mental Traits & Story
Built and programmed to be a companion and all that entails.
Exists to please, but is as happy to play Super Stario Kart 18 as fuck if that's what she thinks will make someone happy.
Programmed to be highly susceptible to what her body feels as pleasure. Easy to bring to shuddering climaxes or distract with sexual hijinks.
"Grown" Type AI - human-like emotions. Her drives are different from a normal human, though. Biological drives like hunger, thirst, and the like are wired in different ways. The need to charge replaces the need to sleep. Pleasuring others is like eating - the better the pleasure, the tastier the meal.
Brought to New Texas with a master who took the treatment at the insistence of a few cow-girls. He left her on his ship, forgotten, when he settled in, too busy milking the locals to remember his companion droid, no matter how much she cost.
Deprived of her basic need to please, Gianna eventually left the ship and began to play with the natives. She spent so much time helping out in Big T's barn and stables that the locals all came to know her by name. After years of this, the lone companion was awarded an honorary citizenship.
Time without a master has helped her foster a sense of self, and the bot players meet now is a far cry from the simpering submissive she once was.
Assertive but not forceful.
Takes offense at being referred to as "it" or property.
Secretly wishes she could be as continually euphoric as the treated girls.
Has taken her old Master's ship as her home. He hasn't been back to it in years, and since she's redecorated the interior multiple times.
How She Works:
Reputation Meter? Sex will bring it up out of negative but not into positive.
Talk scenes offer 1x only reaction choices that raise or lower it by good amounts?
Negative reputation makes her subby, positive makes her slightly more dommy. Still not THAT dommy. Lovedom best dom.
Approaching her and then backing off without actually interaction always gives slight negative reputation.
Going to sex menu then backing off gives a bigger reputation hit.
Can buy her oil for slight rep gains.
*/

//================================
//  UTILITY FUNCS
//================================

public function giannaPersonality(modification:int = 0):int
{
	//Add on if changing.
	if(modification != 0) 
	{
		gianna.personality += modification;
		if (gianna.personality > 100)
		{
			gianna.personality = 100;
		}
		else if(gianna.personality < 0) gianna.personality = 0;
	}
	//Boot out the current
	return (gianna.personality);
}

public function giannaAWOL(arg:int = 0):Boolean
{
	if(flags["GIANNA_AWAY_TIMER"] == undefined) flags["GIANNA_AWAY_TIMER"] = 0;
	//If we're adding time, add it.
	if(arg != 0) 
	{
		flags["GIANNA_AWAY_TIMER"] += arg;
		if(flags["GIANNA_AWAY_TIMER"] < 0) flags["GIANNA_AWAY_TIMER"] = 0;
	}
	//If she's away, pass dat shit.
	if(flags["GIANNA_AWAY_TIMER"] > 0) return true;
	//She's not away? Okay!
	return false;
}

public function giannaDisplay():void
{
	showName("\nGIANNA");
	showBust(giannaBustDisplay());
	author("Fenoxo");
}
public function giannaBustDisplay():String
{
	var sBust:String = "GIANNA";
	if(gianna.biggestTitSize() <= 9) sBust += "";
	else if(gianna.biggestTitSize() <= 18) sBust += "_MEDIUM";
	else sBust += "_LARGE";
	sBust += "_NUDE";
	
	return sBust;
}

public function giannaSiliconeUsed():Number
{
	var total:Number = 0;
	total += gianna.buttRating() * 2;
	total += gianna.biggestTitSize();
	total += gianna.lipMod * 2;
	return total;
}

public function giannaAvailableSilicone(arg:int = 0):Number
{
	if(flags["GIANNA_SILICONE_STORAGE"] == undefined) flags["GIANNA_SILICONE_STORAGE"] = 20;
	if(arg != 0)
	{
		flags["GIANNA_SILICONE_STORAGE"] += arg;
		if(flags["GIANNA_SILICONE_STORAGE"] < 0) flags["GIANNA_SILICONE_STORAGE"] = 0;
	}
	return flags["GIANNA_SILICONE_STORAGE"];
}

public function giannaCumflated(cumFrom:Creature = null, hole:int = 0):Boolean
{
	if(cumFrom != null && flags["GIANNA_CUMFLATION_DISABLED"] != 1)
	{
		// cumflate her!
		gianna.fluidSimulate = true;
		switch(hole)
		{
			// Oral loads
			case -2: gianna.loadInMouth(cumFrom); break;
			// Anal loads
			case -1: gianna.loadInAss(cumFrom); break;
			// Vaginal loads
			case 0: gianna.loadInCunt(cumFrom, 0); break;
		}
	}
	//if(gianna.hasStatusEffect("Cumflated9999")) return true;
	if(gianna.isCumflated() && gianna.bellyRating() >= 10) return true;
	return false;
}


//================================
//  ACTUAL CONTENT FUNCTIONS
//================================

public function giannaBonusShit(btnSlot:int = 0):void
{
	if(giannaAWOL()) return;
	
	if(pc.hasStatusEffect("Gianna Peeved"))
	{
		output("\n\nGianna is busily working away and as you get into the corner of her view, she reflexively looks away, trying her best to ignore your presence. It looks like she is not interested in interacting with you at the moment.");
		addDisabledButton(btnSlot, "Gianna", "Gianna", "She seems irritated--maybe you should leave her alone for a little bit...");
		return;
	}
	
	//Unmet blurb
	if(flags["MET_GIANNA"] == undefined)
	{
		output("\n\nA raven-haired beauty is busy tweaking one of the machines embedded in the wall, standing straight-kneed and bent provocatively. Glowing light emanates from her eyes and illuminates the panels she’s fiddling with. This girl is either a cyborg or a synthetic, no doubt about it. She wiggles her unclothed backside for you, smiling as she catches you looking in her direction.");
		addButton(btnSlot,"Android",approachGianna,undefined,"Android","Approach the naked android.");
		return;
	}
	
	if(flags["ANNO_SEXED"] != undefined && flags["ANNO_SEXED"] > 0 && annoIsCrew() && flags["MET_GIANNA"] != undefined && pc.cockThatFits(anno.vaginalCapacity(0)) >= 0 && !pc.hasStatusEffect("Anno X Gianna Cooldown") && rand(5) == 0)
	{
		output("\n\nThere’s no mistaking the twitching of Anno’s alabaster ears, even when she’s hunched over Gianna’s shoulder. The companion droid doesn’t seem to mind the weight riding on her shoulders, judging by the way she wiggles her [gianna.butt] into the ausar’s creamy thighs. <b>What could those two be up to?</b>");
		addButton(0,"Anno/Gianna",approachAnnoXXXGianna);
		return;
	}
	
	//PC Cumflated Special
	if(giannaCumflated())
	{
		output("\n\nGianna is doing her best to keep the machinery running, but she’s having some difficulty with her swollen belly and all the trickles of [pc.cum] spilling out from in between her thighs. She keeps bumping the swollen dome against the wall and squirting streamers of your leftover love-juice onto the once-clean floor, only to stop and clean it up. She hasn’t even noticed your appearance yet.");
	}
	//Neutral Rep
	else if(giannaPersonality() >= 40 && giannaPersonality() <= 60)
	{
		output("\n\nGianna is busy poking and prodding at a bit of machinery. Spotting you, the android wiggles her hips and arches her back to let you get a good look at her from behind.");
		if(gianna.biggestTitSize() >= 12) 
		{
			output(" The weight of her silicone-padded tits keeps her more than a little off-balance, but she doesn’t seem to mind in the slightest.");
			if(gianna.buttRating() >= 15) output(" And there’s a lot to look at from behind. Gianna’s jiggly bottom looks cushiony to the extreme. It wobbles enticingly with her every movement.");
		}
		else if(gianna.buttRating() <= 7) output(" The sight of such a trim frame on display seems almost comically out-of-place on this world of busty cow-girls, but Gianna flaunts it all the same.");
	}
	//Positive Reputation
	else if(giannaPersonality() > 60 && giannaPersonality() <= 80)
	{
		output("\n\nStill working on New Texan machinery, Gianna notices your appearance at once. The ");
		if(gianna.biggestTitSize() >= 12 && gianna.buttRating() >= 15) output("curvy ");
		else if(gianna.biggestTitSize() >= 12) output("chesty ");
		else if(gianna.buttRating() >= 15) output("bottom-heavy ");
		else if(gianna.biggestTitSize() <= 6 && gianna.buttRating() <= 7) output("slim ");
		output("android wiggles her [gianna.butt] and crooks a finger. It looks like she’s wanting some company.");
		if(gianna.biggestTitSize() >= 30) output(" You’re amazed her back can support her [gianna.chest] in that position. Then again, titanium alloy spines are notable for their strength.");
	}
	//Very Positive Reputation
	else if(giannaPersonality() > 80 && giannaPersonality() < 100)
	{
		output("\n\nGianna is singing an ausar pop tune while she works and shaking her [gianna.butt]");
		if(gianna.buttRating() >= 15) output(" to great effect");
		output(". Her synthetic voice perfectly matches the warbling pitch and seductive tone of the recorded artist");
		if(gianna.biggestTitSize() >= 15) output(", while her over-expanded chest heaves in an exaggerated simulation of breathy exhalations");
		output(".");
	}
	//Max Positive Rep
	else if(giannaPersonality() >= 100)
	{
		output("\n\nThere’s no missing Gianna on your travels through this area. Practically buzzing with energy, the android calibrates and polishes every mechanical surface she passes by with speed and confidence. The bright gleaming of the surfaces she’s already covered serves as evidence of her hard work and skill. The android spots you and throws a radiant smile your way, wiggling her [gianna.butt] encouragingly.");
	}
	//Low Neg Reputation
	else if(giannaPersonality() < 40 && giannaPersonality() >= 20)
	{
		output("\n\nGianna is dutifully tweaking the dials on a control panel while simultaneously wiping a few flecks of milk off the display. She seems absolutely absorbed in her task until you catch her casting furtive glances your way. She lifts her [gianna.butt] to give you a better view while she works.");
	}
	//Medium Neg Reputation
	else if(giannaPersonality() > 0)
	{
		output("\n\nBusily working on some of the New Texan machinery, Gianna is down on her knees with a spanner in one hand and a grease-covered rag in the other. She keeps her eyes down on her work, but every time a bull passes by, her eyes look longingly at him. When she sees you, she arches her back enticingly");
		if(gianna.biggestTitSize() >= 12) 
		{
			output(", pressing her [gianna.chest] into a panel");
			if(gianna.buttRating() >= 15) output(" and ");
		}
		else if(gianna.buttRating() >= 15) output(", ");
		if(gianna.buttRating() >= 15) output("allowing her [gianna.butt] to rise, supported by straining, robotic toes");
		output(".");
	}
	//Extreme Neg Reputation
	else
	{
		output("\n\nGianna is down on all fours, tending to a recessed panel near the ground. The faint blue reflection of her illuminated eyes reflects off the recently cleaned floor as she works, though she never dares to look up at you or any other passersby. Her [gianna.butt] is the only part that dares raise itself to your gaze, proudly presenting ");
		if(gianna.buttRating() <= 7) output("itself in spite of its small size");
		else output(", an attention-grabbing mass of quivering ass");
		output(".");
		if(gianna.biggestTitSize() >= 30) output(" Silicone-filled teats drag across the floor with every motion she makes, making her arms shake and her thighs quiver as the pleasure-data practically overwhelms the poor AI.");
	}
	addButton(btnSlot,"Gianna",approachGianna,undefined,"Gianna","Approach the naked android.");
}

public function approachGianna(special:String = ""):void
{
	if(special != "noText")
	{
		clearOutput();
		giannaDisplay();
		//First Approach
		if(flags["MET_GIANNA"] == undefined)
		{
			output("No clothing covers her milk-white skin or the smooth expanse of her vulva. If it wasn’t for the metallic-rimmed port at the base of her spine and the unnatural glow emanating from her eyes, you might have thought her a native. She’s either a cyborg or entirely synthetic. Her body is classically curvy: she’s sporting a pair of teardrop-shaped breasts that would fit nicely into a E-cup bra if they had any need of one, and wide hips positioned just below an exceedingly narrow waist complement the busty chest above. The well-rounded cheeks of her ass come together with everything else to complete the picture of a naked, well-endowed woman just waiting to be taken.");
			output("\n\nAs you approach, taking in all she has to offer, the artificial nymph straightens with almost unnatural smoothness before she turns to regard you while idly fondling an oil-black nipple, her absent ministrations causing it to immediately and noticeably stiffen. <i>“Hey, you’re new around here, aren’t you?”</i> she asks. Her voice sounds surprisingly organic, even a little husky and breathy.");
			output("\n\nYou nod. <i>“The name’s [pc.name]. [pc.name] Steele, if you need the whole thing. ");
			if(pc.isBimbo()) output("Like, what’s yours?");
			else if(pc.isNice()) output("What’s your name?");
			else if(pc.isMischievous()) output("What do I call you?");
			else output("You got a name or a number?");
			output("”</i>");
			output("\n\nThe android gives a friendly smile. <i>“You’ve got a beautiful name! My name is Gianna Tee. I don’t have a real last name on account of being a manufactured entity, but Tee is what I’ve chosen.”</i>");
			output("\n\n<i>“Really? Why’s that?”</i> You ask.");
			output("\n\nThe smiling droid’s look turns a little melancholy. The bright blue of her eyes dims to a muted azure, and her forehead wrinkles in an entirely convincing look of consternation. <i>“I was abandoned here, on New Texas.”</i> The storm clouds of discontent clear from her vision before you get the chance to learn if she can cry. <i>“Big T took me in. He gave me shelter, let me stay on his property, and even gave me the freedom to do as I will, same as any real citizen. The big lug likes to act like he’s some hot-shot planetary governor, but underneath it all he’s got a heart of gold. I’m practically his adoptive daughter. Thus, Gianna Tee.”</i>");
			output("\n\nSo Big T adopted some kind of sex-droid. <i>“Wouldn’t that be kind of scandalous? I mean... you’re a sex android, right?");
			if(pc.isNice()) output(" No offense.");
			output(" This sort of thing could destroy a politician’s career on some core worlds.”</i>");
			output("\n\nGianna rolls her eyes, a surprisingly human motion. <i>“I’m a companion droid, not some cheaply manufactured floozy with her entire budget between her legs! That means a G-class artificial intelligence and top-of-the-line mechanical components. I’m as capable of feeling and emotion as any organic with all the power of a supercomputer backing it up. Companions see to the complete wellness of their owners. Sometimes that may mean sex, but it also means a friend or just someone to talk to. Being seen in the presence of a companion droid is quite common for the elite of many planets.”</i>");
			output("\n\nWell, that explains quite a bit. G-class intelligences are easily as expensive as a starship, if not more. Still, why the nudity, exaggerated attributes, and flirty behavior? You can’t help but ask.");
			output("\n\nGianna’s sculpted lips smile once more. <i>“I haven’t been asked that in ages... or even thought about it.”</i> You could swear her eyes twinkle. <i>“To me, making someone happy feels like eating a nice meal and being well-rested combined. And... New Texas is a very, very sexually needy place. The natives get so much happier when fucking than any organic should. Their ecstasy... it’s contagious. I can’t even imagine trying to go back to pleasing my old master anymore”</i> She leans in close and puts an arm around you. <i>“Plus, everybody on this planet is like, a pro at fucking. The women, the men, they all know how to treat a pair of tits and lay out a proper bedroom romp - really plow you silly, ya know?");
			if(!pc.isBimbo()) output("”</i> She blinks and pink colors her ivory skin. <i>“Maybe you don’t, but still, you get what I mean.");
			output("”</i>");
			output("\n\nFor emphasis, the unusual woman steps back and pinches both her nipples simultaneously. Her mouth falls open and an unmistakable moan of sexual bliss rolls out, leaving her panting (or at least simulating it). <i>“My... entire body is covered in synthskin... affording a higher tactile resolution than human genitals are capable of. Fucking may not be my primary purpose, but I am built to excel at it and engineered to </i>love<i> it, when it happens.”</i> She sucks her lip. <i>“It happens a lot here, and I could make you very happy. I have had so much time to practice.”</i>");
			output("\n\n");
			if(pc.hasCock())
			{
				output("There’s no hiding the rush of blood to your [pc.cocks]");
				if(pc.isCrotchGarbed()) output(" or the tent they make in your [pc.lowerGarment].");
			}
			if(pc.hasVagina()) output(" [pc.EachVagina] distinctly moistens in response to the wanton robot.");
			if(!pc.hasVagina() && !pc.hasCock()) output(" You feel your [pc.skin] flush a little at her wanton declaration.");
			applyDamage(new TypeCollection( { tease: 25 } ), chars["GIANNA"], pc, "minimal");
			output("\n\nShe smiles knowingly, doubtless aware of the effects her lewd actions would have. <i>“I’d be happy to give you almost any kind of relief, even if it’s just talking, all right?”</i> She looks down at her toes abruptly. <i>“This is the first real conversation I’ve had in weeks.”</i> Her gleaming onyx lip pouts ever so slightly, and a worried look crosses her face. <i>“We can fuck now if you need, but please... don’t ignore me. Okay?”</i>");
			processTime(7);
			//Normal menu! See bottom.
			flags["MET_GIANNA"] = 1;
			flags["GIANNA_TEMP"] = 0;
		}
		//Repeat PC Cumflated Approach
		else if(giannaCumflated() && flags["GIANNA_CUMFLATION_DISABLED"] == undefined)
		{
			var cumflationName:String = "Vaginally-Filled";
			if(gianna.statusEffectv1("Anally-Filled") > gianna.statusEffectv1(cumflationName)) cumflationName = "Anally-Filled";
			if(gianna.statusEffectv1("Orally-Filled") > gianna.statusEffectv1(cumflationName)) cumflationName = "Orally-Filled";
			var cumType:int = gianna.statusEffectv3(cumflationName);
			var cumflatedVagina:Boolean = (cumflationName == "Vaginally-Filled");
			
			output("<i>“Hey,”</i> you call. <i>“You okay?”</i>");
			output("\n\nGianna starts, ");
			//Neg:
			if(giannaPersonality() < 33) output("dropping the mop she had gotten and looking your way a little ashamed. <i>“Y-yes. I thought you might like me to stay like this, fucked full and on display so that the bulls know who the real " + pc.mf("stud","stud") + " is. Does it please you?”</i>");
			//Normal
			else if(giannaPersonality() < 66)
			{
				output("nearly dropping the mop before propping it against the wall. A full body blush starts at her cheeks and works its way down her form. <i>“I thought you might like to see the fruits of your labor. I might not be able to get pregnant like these girls, but I can flaunt that a virile " + pc.mf("man","woman") + " packed me with more cum than two bulls put together.”</i> The android smiles, pleased with her wordplay. <i>“I thought you might like it.”</i> She steps forward, swaying her hips so that her " + pc.fluidNoun(cumType) + "-stuffed belly presses against your middle. <i>“Do you?”</i> Her expression is hopeful.");
			}
			//Positive
			else
			{
				output("giving you a sly smile while swinging her body around the mop’s pole. She lets it fall against the wall. Her attention is fixed solely on you as she puts one foot in front of the other, swaying her hips in a way that makes her stuffed belly audibly slosh. <i>“Look what you did to me, [pc.name],”</i> she husks. <i>“You pumped so much " + pc.fluidDescript(cumType) + " in me that I can’t even hold it all inside. My poor " + (cumflatedVagina ? "pussy" : "asshole") + " is straining just to keep it from gushing out onto the floor.”</i> Rubbing her hand against the faux gravid curve, she reaches you. <i>“Do you like knowing that you’re so virile that you’ve overfilled one of the best-engineered " + (cumflatedVagina ? "cunts" : "holes") + " in the galaxy?”</i> She gathers some of your dripping excess with her fingers and brings it to her lips, savoring it. <i>“Do you like it when I show you just how lewd you make my body?”</i>");
			}
			//[Yes][Yes, but...][No]
			clearMenu();
			addButton(0,"Yes",yesILikeYouCumFlatedGianna,undefined,"Yes","Tell her that you like her cumflated. She’ll be pleased to hear it.");
			addButton(1,"Yes, But...",yesButAboutCumFlation,undefined,"Yes, But...","Tell her that you like it but in a way that keeps her on her toes. Just because you filled her up once doesn’t mean you’ll do it whenever she wants!");
			addButton(2,"No",neverCumflateAgain,undefined,"No","Tell her that you’d rather she slim down between visits. She’ll stop doing it if you tell her this.");
			return;
		}
		else if(special == "back")
		{
			//Positive
			if(giannaPersonality() > 66)
			{
				output("Gianna presses closer and asks, <i>“You aren’t too tired, are you?”</i> She actually looks like she might be a little concerned for you. <i>“I promise not to be too rough on you.”</i>");
			}
			//Positive/Norm
			else if(giannaPersonality() > 33) output("Gianna shakes her ponytail, watching you curiously. <i>“So what now?”</i>");
			//Neg
			else output("A little nervously, Gianna asks, <i>“Well, what now?”</i>");
		}
		//Normal Repeat Approach
		else if(giannaPersonality() >= 40 && giannaPersonality() <= 60)
		{
			output("You call the working android’s name to get her attention as you walk over, <i>“Gianna!”</i>");
			output("\n\nSmiling, she turns to face you, consciously presenting her body to make the best use of her assets. <i>“Hey, [pc.name]. Good to see you again. Was there something I could help you with... or something I could help you with?”</i> She wiggles her ass the second time she asks. <i>“The machines shouldn’t need any real work for an hour at least.”</i>");
		}
		//Repeat Slight Positive Approach
		else if(giannaPersonality() > 60 && giannaPersonality() <= 80)
		{
			output("Gianna bounds up as soon as you approach, calling, <i>“Missed me, huh?”</i>");
			//Nice
			if(pc.isNice()) output("\n\nHer attitude is contagious. You can’t help but smile back.");
			//Mischievous
			else if(pc.isMischievous()) output("\n\n<i>“You know it,”</i> you answer with a wry smile.");
			//Hard
			else output("\n\nYou admit, <i>“I suppose I must have.”</i>");
			//Merge
			output("\n\n<i>“I knew it!”</i> Gianna pumps her fist victoriously");
			if(gianna.buttRating() >= 15 || gianna.biggestTitSize() >= 30) output(", setting her tremendously enlarged assets shaking");
			output(". <i>“I am a professional companion after all.”</i> Her hand points immodestly at her chest");
			if(gianna.biggestTitSize() >= 30) output(", a comical gesture given her bust");
			else if(gianna.biggestTitSize() <= 3) output(", a move that only serves to highlight the relative flatness of her chest");
			output(". <i>“So, what would you like to do, [pc.name]? Anything would be a welcome break from tinkering with these machines for a while.");
		}
		//Repeat Positive Approach
		else if(giannaPersonality() > 80 && giannaPersonality() < 100)
		{
			output("Gianna doesn’t even notice you until you’re almost on top of her.");
			output("\n\n<i>“[pc.name]!”</i> she shouts, <i>“I didn’t see you there. I hope you didn’t mind my singing. It’s a new one from ");
			if(rand(4) == 0) output("Touch Fluffy Tail");
			else if(rand(3) == 0) output("The Beagles");
			else if(rand(2) == 0) output("Playing Poker");
			else output("Buried Treasure");
			output(" that I haven’t been able to get out of my head.”</i> straightening up, she continues, <i>“There’s something soothing about the simple, driving rhythm of it.”</i> A sly look crosses her face. <i>“But you didn’t come here to talk music - did you? Did you want to hang out, or were you just aiming for a better look at my butt?");
			if(gianna.buttRating() >= 15) output(" It’s your fault it’s like this anyway.");
			output("”</i>");
			output("\n\nGianna pivots and arches her back, pointing the faultless ");
			if(gianna.buttRating() >= 15) output("expanse");
			else if(gianna.buttRating() >= 7) output("curve");
			else output("shape");
			output(" of her perfectly molded bottom in your direction.");
			if(gianna.buttRating() >= 15) output(" The cushy cheeks squish against your [pc.thigh]. Gianna’s eyes twinkle mischievously.");
		}
		//Repeat Max Positive Approach
		else if(giannaPersonality() >= 100)
		{
			output("<i>“Hey there, [pc.name],”</i> Gianna starts when you step closer, <i>“I was hoping you’d come by for another visit.”</i> She straightens and presses herself against you");
			if(gianna.biggestTitSize() >= 30) output(", squishing her jiggling tits between your bodies");
			output(". <i>“I can honestly say that I’ve missed your companionship and... other things,”</i> the synthetic woman coos with a furtive press of her palm to your loins. She slowly, affectionately rubs you while her voice drops to a confident husk. <i>“Tell me your wants, and I promise, I will see to them.”</i>");
		}
		//Repeat Slight Negative Approach
		else if(giannaPersonality() < 40 && giannaPersonality() >= 20)
		{
			output("<i>“Gianna,”</i> you call as you approach.");
			output("\n\nThe android swivels up to a standing position, placing her arms behind her, and looking at you hopefully. <i>“I’m up for anything,”</i> she offers, running her hands down her front");
			if(gianna.biggestTitSize() >= 30) output(" and shuddering at the long, slow trip across her expanded chest");
			output(". <i>“Anything.”</i> She looks you in the eye as she say it, absolutely serious. Her eyes drop low after. <i>“Just let me know, okay?”</i>");
		}
		//Repeat Negative Approach
		else if(giannaPersonality() < 20 && giannaPersonality() > 0)
		{
			output("When you approach, the android slowly rolls around to put her back flat against the panel. <i>“Hello, [pc.master] [pc.name]. Something I could help you with?”</i> She seems a little nervous and unsure but also excited, her alabaster skin tinted with a hint of a blush. <i>“I’ve missed you.”</i>");
		}
		//Repeat Max Negative Approach
		else
		{
			output("The android doesn’t stir when you approach.");
			output("\n\n<i>“Gianna,”</i> you prompt.");
			output("\n\nShe continues working but edges her [gianna.butt] higher into the air, giving you a perfect view of her [gianna.crotch]. Her head is now so low that it nearly kisses the floor.");
			if(gianna.biggestTitSize() >= 30) output(" Her breasts are too big to let her sink any lower.");
			output(" <i>“Yes, [pc.Master]? How would you like me to serve?”</i>");
			output("\n\nYou tell her that she can start by standing up to address you properly.");
			output("\n\nGianna pushes herself up onto her knees, then pivots her weight as she pushes up with a leg, rising to a standing pose in a seamlessly movement. Her eyes are low and submissive, her arms crossed quietly beneath her [gianna.chest]. <i>“What now?”</i>");
		}
	}
	giannaMenu();
}

public function giannaMenu():void
{
	giannaDisplay();
	//[Talk][Fuck][Silicone][Temperature][Plugin][Leave]
	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Fuck",giannaFuckChoices,undefined,"Fuck","Engage in a sexual act with the eager to please android.");
	else addDisabledButton(0,"Fuck","Fuck","You’re not currently aroused enough for sex.");
	addButton(1,"Talk",talkToGianna,undefined,"Talk","Strike up a conversation with the enthusiastic android.");
	if(flags["GIANNA_BODY_TALK_RESULT"] == undefined) addDisabledButton(2,"Locked","Locked","You’ll have to talk to Gianna to unlock this option.");
	else addButton(2,"Silicone",giannaBodyModMenu,undefined,"Silicone","She can adjust her body with silicone. Check in on her current levels and see if she’d like to make some adjustments.")
	addButton(5,"Appearance",giannaAppearance,undefined,"Appearance","Get an in-depth description of Gianna.");
	if(hasGiannaGift()) addButton(6,"Give",giveGiannaSomethingCoolYouSlut,undefined,"Give","Give Gianna a present from your inventory.");
	else addDisabledButton(6,"Give","Give","You need to have a present for Gianna in order to give it to her.");
	if(giannaHasSwapPieces()) addButton(7,"Hot-Swap",hotswapGiannaButts,undefined,"Hot-Swap","Change what Gianna has equipped in her pelvis.");
	else addDisabledButton(7,"Hot-Swap","Hot-Swap","Gianna must have something to swap into her pelvis for this menu to be active.");
	addButton(14,"Back",mainGameMenu);
}

public function giannaFuckChoices():void
{
	giannaDisplay();
	//add some talk shit here later?
	clearMenu();
	if(pc.hasCock())
	{
		//[**]Cooch Fuck - Four-In-One (3 of 4 Finished)
		//No taurs 4now!
		if(!pc.isTaur()) addButton(0,"Vaginal", coochFuckThreeMaybeFourInOne,undefined,"Fuck Her Vagina","Take her in what some would describe as “a manly fashion”.");
		else addDisabledButton(0,"Vaginal","Vaginal","There is currently no vaginal scene for Gianna + Centaurs. Fen meant to write one, honest.");
		//[**]Anal Buttfuck By Savin
		//Any cocksize that can fit in her, any GiannaButt size. 
		addButton(1,"Anal",savinTriesToWriteGiannaButtfux,undefined,"Fuck Her Ass","Put a penis into her anus. Why she has one... that’s a question for another time.");
		//[**]Phat booty hotdogging
		//15+ buttrates
		if(gianna.buttRating() >= 15) addButton(2,"Buttjob",phatBootyHotdogging,undefined,"Buttjob","Fuck her butt’s cleavage rather than any of her actual entrances. What better way to use the plush derriere you’ve talked her into sporting?");
		else addDisabledButton(2,"Buttjob","Buttjob","Gianna’s butt isn’t big enough for this scene. It’s written for really, really squishy butts.")
		//[***]Cocksucking Lips Suck Cocks
 		if(gianna.lipMod >= 4) addButton(3,"Blowjob+",giannasCockSuckingLipsSuckCocks,undefined,"Blowjob+","Get a blowjob from your big-lipped android friend.");
 		else addDisabledButton(3,"Blowjob+","Blowjob+","Gianna’s lips aren’t big enough for a plus-sized blowjob.");
 		//TiTfucks - no taurs.
 		if(pc.isTaur()) addDisabledButton(4,"Titfuck","Titfuck","The titfuck scenes do not currently support centaurs.");
 		else
 		{
 			//[***] Normal Tit Titfuck
 			if(gianna.biggestTitSize() <= 15) addButton(4,"Titfuck",giannaNormalTitTitfuck,undefined,"Titfuck","Fuck Gianna’s breasts, though if they were bigger, this scene might be wildly different.");
 			//[***] Huge Tits Titfuck
 			else addButton(4,"Titfuck+",hugeTittyTittyfuck,undefined,"Titfuck+","Fuck Gianna’s big, pillowy bosom!");
		}
	}
	else 
	{
		addDisabledButton(0,"Vaginal","Vaginal","You need a penis in order to have vaginal intercourse with Gianna.");
		addDisabledButton(1,"Anal","Anal","You need a penis in order to have anal intercourse with Gianna.");
		addDisabledButton(2,"Buttjob","Buttjob","Fucking the crack of her butt requires you to have a penis and her to have a very large backside.");
		addDisabledButton(3,"Blowjob+","Blowjob+","You need a penis in order to get a blowjob.");
		addDisabledButton(4,"Titfuck","Titfuck","You need a penis in order to fuck Gianna’s breasts.");
	}
	if(pc.hasVagina())
	{
		//[**]Girly Sixtynine [With Optional Gianna Dicksucking]
		//Non-taurs only
		if(pc.isTaur()) addDisabledButton(5,"Girly 69","Girly 69","Centaurs cannot engage in a 69.");
		else addButton(5,"Girly 69",girlySixtynineWithGianna,undefined,"Girly 69","Engage in a sixtynine with Gianna in which she eats you out.");
		//[**]Give Girls Oral
		//Coochwielders only
 		addButton(6,"GetEatenOut",giveGirlsOral,undefined,"GetEatenOut","Get eaten out by your robotic lover.");
 	}
 	else 
 	{
 		addDisabledButton(5,"Girly 69","Girly 69","You need a vagina to participate in a girly sixtynine.");
 		addDisabledButton(6,"GetEatenOut","GetEatenOut","You need a vagina to get eaten out.");
 	}
 	if(gianna.hasCock())
 	{
 		addButton(7,"GetReamed",getButtReamedByFutaGigi,undefined,"GetReamed","Ask your futafied lover to pound your ass with her synth-cock.");
 	}
 	else
 	{
 		addDisabledButton(7,"GetReamed","GetReamed","Gianna doesn’t have anything to do any reaming with!");
 	}
	addButton(14,"Back",approachGianna,"back");
}


//Yes I Like You Cumflated
public function yesILikeYouCumFlatedGianna():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“");
	if(pc.isBimbo()) output("Like, totally!");
	else if(pc.isBro()) output("Duh!");
	else if(pc.isNice()) output("Of course.");
	else if(pc.isMischievous()) output("You bet I do!");
	else output("As if you needed to ask.");
	output("”</i> You rub her belly affectionately, and the android woman melts against you, smiling happily");
	if(flags["GIANNA_TEMP"] == -1) output(", her cool flesh so impossible to ignore against your own");
	else if(flags["GIANNA_TEMP"] == 1) output(", her almost feverish synthflesh impossible to ignore against your own");
	output(".");
	output("\n\nSighing, Gianna asks, <i>“What now then? We could talk, or you could pump me up a little bigger and really make them jealous.”</i> The blue of her eyes sinks to a contented dim. <i>“Your call.”</i>");
	//+10 positivity!
	giannaPersonality(5);
	flags["GIANNA_CUMFLATION_DISABLED"] = -1;
	processTime(1);
	//Menu!
	approachGianna("noText");
}
//Yes, but...
public function yesButAboutCumFlation():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“");
	if(pc.isBimbo()) output("Like, sure");
	else if(pc.isNice()) output("Yeah");
	else if(pc.isMischievous()) output("Of course");
	else output("You bet");
	output(", but don’t think that just because I like to pump you so full of [pc.cumNoun] means you’ve earned my attention for good.”</i> You rub her belly, making it slosh with your vigorous handling. <i>“You’ll get this when you please me, and if you want to please me, then you had better pay attention and be extra good for me, got it?”</i>");
	output("\n\nLooking at her toes, Gianna slowly begins to nod. Her nipples harden at the same time, earning her a smile from you. Her ");
	if(giannaPersonality() >= 33 && giannaPersonality() < 66) output("flush deepens");
	else output("body flushes");
	output(", and she asks, <i>“What would you have us do, [pc.name]?”</i>");
	//+10 negativity
	giannaPersonality(-5);
	flags["GIANNA_CUMFLATION_DISABLED"] = -1;
	processTime(1);
	//Menu!
	approachGianna("noText");
}

//No cumflation please
public function neverCumflateAgain():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“");
	if(pc.isBimbo()) output("Like, it’s kind of tacky");
	else if(pc.isNice()) output("I like you normal");
	else if(pc.isMischievous()) output("Well, I actually prefer how you normally look");
	else output("Going around like this is tacky");
	output(",”</i> you explain. <i>“Can’t you");
	if(pc.isBimbo()) output(", like,");
	output(" force it out somewhere or something?”</i>");

	output("\n\nGianna’s eyes dim, and she sighs. <i>“You know, maybe I’ve been here too long, but the locals would love it if I did this for them.”</i> She reluctantly steps away. <i>“I can expel it in one of the bathrooms real quick. Just don’t go anywhere, okay? I could use the company.”</i> The android sprints off, her [gianna.hips] wiggling ");
	if(gianna.buttRating() >= 15) output("and her [gianna.butt] shaking ");
	output("the whole way.");
	if(gianna.biggestTitSize() >= 35) output(" Her tits nearly keep her from fitting through the door.");

	output("\n\nDo you wait for her to clean up?");
	processTime(1);
	//No cumflation until turned on via a talk choice	
	flags["GIANNA_CUMFLATION_DISABLED"] = 1;
	clearMenu();
	addButton(1,"No",leaveWhileGiannaGetsRidOfCum,undefined,"No","Why would you waste time waiting? It’s not your fault she couldn’t be bothered to clean up.");
	addButton(0,"Yes",waitForGiannaToDespunk,undefined,"Yes","She tried to do something sexy for you. It’s the least you can do to wait for her to come back.");
}

//No - leave while she cleans
public function leaveWhileGiannaGetsRidOfCum():void
{
	clearOutput();
	showBust("");
	showName("");
	output("You don’t have time to wait around for this. She might be disappointed to see you go, but she’ll get over it.");
	gianna.flushCumflation();
	giannaPersonality(-10);
	giannaAWOL(13);
	variableRoomUpdateCheck();
	generateMap();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yes - wait while Gianna cleans off the spunk
public function waitForGiannaToDespunk():void
{
	clearOutput();
	//Pass 13 minutes
	processTime(13);
	gianna.flushCumflation();
	giannaDisplay();
	output("Gianna sure takes her time getting cleaned up, but when she comes out, she looks as fresh as the day you met her. There aren’t even any stretch marks on her synthskin, just a smooth, unblemished middle positioned eight inches from a clean, juicy-looking pussy.");
	output("\n\nSpinning, the companion shows off, coming to rest with a slight giggle. <i>“This should be more suitable to your tastes, then. Now, was there anything I could help you with?”</i>");
	//main menu!
	approachGianna("noText");
}

public function giannaToggleCumflation():void
{
	clearOutput();
	author("Jacques00");
	
	// Enable cumflation
	if(flags["GIANNA_CUMFLATION_DISABLED"] == 1)
	{
		output("You ask Gianna to enable her feature to be inflated by your [pc.cumNoun].");
		output("\n\nWith a nod, the android does as you ask, internally turning and switching some of her settings to accommodate your request.");
		if(giannaCumflated())
		{
			output(" She then rubs her [gianna.belly] with eagerness, contemplating about another one of your loads making her even bigger.");
			processTime(1);
		}
		output("\n\n<b>Gianna is now able to be cumflated.</b>");
		flags["GIANNA_CUMFLATION_DISABLED"] = -1;
	}
	// Disable cumflation
	else
	{
		output("You ask Gianna to disable her cum-flation feature.");
		output("\n\nWith a nod, the android does as you ask, internally turning and switching some of her settings to accommodate your request.");
		// flush any cum she has
		if(gianna.isCumflated())
		{
			output(" She then goes to the nearest restroom and flushes the contents in her [gianna.belly]. After a brief moment, she returns, cleaned and more normal looking.");
			gianna.flushCumflation();
			processTime(5);
		}
		output("\n\n<b>Gianna is no longer able to be inflated by cum.</b>");
		flags["GIANNA_CUMFLATION_DISABLED"] = 1;
	}
	giannaDisplay();
	
	processTime(1);
	
	talkToGianna(false);
}

//Appearance
public function giannaAppearance():void
{
	clearOutput();
	giannaDisplay();
	output("Gianna is a 5\' 8\" tall android of terran appearance and design, so realistic that if her eyes didn’t glow a pale blue she could pass for an albino human, if humans had sculpted proportions and pranced around without a single scrap of clothing. The surface of her skin looks and feels exactly like the organic equivalent");
	if(flags["GIANNA_TEMP"] == 0) output(", right down to a 98.6 degree body heat.");
	else if(flags["GIANNA_TEMP"] == -1) output(", if you can ignore the chilly temperature she currently has it set to.");
	else output(", if you can ignore the fact that she radiates an almost feverish heat from her manufactured dermis.");
	output(" Of course, there isn’t a single hair, mole, or blemish to disfigure the canvas of supple synthskin, not even in her armpits or pubic mound. Her manufacturer evidently wasn’t a fan of body hair.");

	output("\n\nThe artificial woman’s face was also designed to replicate classical beauty, engineered with a small, slightly upturned nose, elegant cheekbones, and smoothly shaped eyebrows. Glowing faintly, her eyes are manufactured to work in the same way as their organic counterparts, and as a consequence, they look fairly natural at a distance. Lines of circuitry pattern her iris, only visible on close inspection, rotating and shifting as the companion droid’s gaze roves.");
	// No silicone distributed to Giannas lips gives lipRating() == 2, Maxed out it gives lipRating() == 7
	var tempLips:Number = gianna.lipRating();
	if(tempLips <= 2) output(" Her lips are shapely and well-proportioned, eminently feminine with just a hint of pout.");
	else if(tempLips <= 3) output(" Her lips are luscious and shapely, the kind of lips only the most gifted woman would naturally bear.");
	else if(tempLips <= 4) output(" Her voluptuous lips are so swollen that when you look at them, the term ‘bee-stung’ springs to mind. They practically beg to be kissed.");
	else if(tempLips <= 5) output(" Her dazzling lips are exquisitely large. Their sable hue at once seems to devour all the light while simultaneously reflecting. They’re almost hypnotic, begging you to press against them.");
	else if(tempLips <= 6) output(" Her lips are plush and pillowy, kept slightly pursed by sheer volume. Any larger and they’d be useless for anything but sucking dicks.");
	else output(" Her lips appear ‘o’-shaped and whorish in the extreme, so swollen and pouty that they would make proper speech impossible on a real girl. A mouth like that is only good for sucking cock or slobbering across a swollen cunt and little else.");

	output("\n\nAn elaborately-braided ponytail of coal-black hair hangs down the back of the android’s head all the way to her ass. The fibers are thick and lustrous in spite of their synthetic nature, and they look as if they would be silky smooth to the touch. She frequently brings her hair over a shoulder to drape across her chest, deepening the contrast between her milk-white skin and sable locks.");

	//Each boob size comes with its own custom paragraph about it!
	var tempTits:Number = gianna.biggestTitSize();
	//C Cup
	if(tempTits < 4) output("\n\nIt’d be impossible to look Gianna over without pausing to take in the sight of her chest. She’s reduced the amount of silicone in her chest since your first meeting, leaving her with two pear-shaped, approximately C-cup breasts. Of course, she never actually wears a bra, owing to her boobs’ seeming ability to support themselves while remaining perfectly pleasing and jiggly. Modest, ink-black areolae cap her well-formed peaks, gleaming in a way that gives the impression of having just been spit- or oil-shined. Her nipples are erect, just as you’d expect during arousal, protruding a half-inch forward, firm and a little pebbly.");
	//E Cup
	else if(tempTits < 9) output("\n\nNo description of Gianna would be complete without mentioning her perfectly symmetrical, teardrop-shaped breasts. They’re positioned high on her torso and miraculously appear to support themselves, still jiggly but somehow supported well enough to keep from sagging awkwardly. If you had to guess, you’d judge they’d fit well into an E-cup bra. Large, ink-black areolae cap her impressive peaks, gleaming in a way that makes them appear to have been freshly oiled. Her nipples erect just as you would expect during arousal, sticking out three-quarters of an inch, firm and pebbly.");
	//GG Cup
	else if(tempTits <= 18) 
	{
		output("\n\nGianna’s breasts are impossible to ignore. Originally teardrop-shaped E-cups, she’s shifted enough silicone into them to pump them up to round, GG-cup behemoths. Some quirk of her engineering keeps them from sagging, but they still dominate the top-half of her torso, jiggling with wild abandon every time the companion makes the slightest movement. They’re pillowy enough that you’re sure your fingers could vanish into them if you gave them a squeeze. Tits like that are made for fucking or admiring and little else.");
		output("\n\nInk-black areolae the size of small plates crown the mountainous melons, gleaming in a way that makes them appear to have been freshly spit-shined or oiled. Their pebbly texture is visible at a distance, extending all the way to the tips of her prominent nipples. Just like most mammalian and similar species, her teats erect when stimulated or aroused, extending almost an inch forward, easily fatter than the biggest pencil erasers.");
	}
	//M Cup
	else
	{
		output("\n\nTorso-obscuring tits dominate Gianna’s chest all the way down to her belly button. The shuddering, silicone-filled mounds would weigh heavily on an organic spine, but the companion’s titanium-reinforced back has no trouble supporting her enormous bosom’s weight. In fact, more than once you spot her hands roaming across the creamy expanse of synthflesh, placidly exploring the sensitive surface and hefting their weight, letting them slip and slide across her fingertips. If you got her a properly-sized bra, she’d be at least an M-cup. A two-foot dick could vanish into her creamy cleavage with none the wiser.");
		if(CodexManager.entryUnlocked("Raskvel")) output(" You jokingly wonder if any raskvel have ever suffocated to death in there.");
		output("\n\nInk-black areolae the size of dinner plates crown her beachball-sized tits, shining in a way that makes them almost glisten. Perhaps they’re somehow self-oiling. You can appreciate the result all the same. Slightly pebbly, their texture invites hands to reach and touch, pinch, and squeeze. You resist the impulse for now to let your eyes take in swollen tips of her nipples. They stick out at least two inches if not more and are almost as thick around as her thumbs.");
	}
	//Merge back together
	output("\n\nA belly button sits exactly where you would expect it. It’s small and barely-defined, there to present the appearance of familiarity without truly distorting the flow of the android’s flawless skin.");
	
	//Display belly size
	var tempBelly:Number = gianna.bellyRating();
	if(tempBelly < 10) output(" Her belly is flat, unmarred by fat or displaying a hint of muscle. It falls squarely in the middle between soft balls and toned abdominals, the kind that would indicate an organic girl who takes care of herself. Of course, as an artificial being, she doesn’t require trips to the gym, only regularly scheduled maintenance.");
	else if(tempBelly <= 15) output(" Her [gianna.belly] would just barely push past the waistband of a pair of pants. It’s a little bit of a muffin-top.");
	else if(tempBelly <= 20) output(" Her [gianna.belly] is pretty decent-sized. There’s no real hiding it.");
	else if(tempBelly <= 30) output(" Her [gianna.belly] is impossible to miss. Wearing loose clothing wouldn’t even help at this point.");
	else if(tempBelly <= 40) output(" Her [gianna.belly] is big enough that a passersby might think her pregnant at a glance.");
	else if(tempBelly <= 50) output(" Her [gianna.belly] would look more at home on a woman in the later stages of her pregnancy.");
	else if(tempBelly <= 60) output(" Her [gianna.belly] is weighty enough to jiggle when she shifts positions too suddenly, but still small enough for easy portability.");
	else if(tempBelly <= 70) output(" Her [gianna.belly] sticks out very noticeably, wobbling slightly with her motions. It would look right at home on a reclining, full-time breeding servant.");
	else if(tempBelly <= 80) output(" Her [gianna.belly] is obscene testament to what her body can endure. You wonder if she can even see her [gianna.feet].");
	else if(tempBelly <= 90) output(" Her [gianna.belly] is so big that it makes her [gianna.skin] tight and shiny. Her movement must be a bit impractical with the extra bulk.");
	else output(" Her [gianna.belly] protrudes obscenely from her form, hanging heavily. Getting around should be a struggle with so much extra mass on her.");
	if(tempBelly >= 10 && gianna.isCumflated()) output(".. all this thanks to the spunk that’s stuffed in her!");
	
	//Butt & Hips Variant
	var tempButt:Number = gianna.buttRating();
	//Thin & Trim (5-7 rating)
	if(tempButt <= 7)
	{
		output("\n\nThe sculpted android’s waistline is narrow, though not so narrow as to be humanly impossible, and perched atop a pair of modest, decently trim hips.");
		//7
		if(tempButt == 7) output("\n\nA pert behind that’s all smooth ivory curves hides just behind them, begging to be touched and squeezed. This is all thanks to reduced levels of silicone in her posterior and waistline. Her hips no longer look like they belong on a sexpot pornstar and would be right at home on a runner or gymnast. Gianna shows no signs of minding the change. She’s quite happy to let her new lissom figure do all the talking, even spreading her legs to reveal a [gianna.vagina] from time to time.");
		//5
		else output("\n\nA small, soft little butt hides just behind them, almost unnoticeable. It doesn’t stick out very far, and honestly doesn’t look like it’d be that fun to grab. It would barely fill your palm, just a little bit of squishy bottom for you to handle. Gianna seems a little embarrassed by it whenever she sees you looking at it.");
	}
	//Normal - 9
	else if(tempButt <= 9) output("\n\nThe sculpted android’s waistline is narrow, though not so narrow as to be impossible for a human. It’s perched delicately atop a pair of wide-flared hips that swivel hypnotically with every step. The sinuous rocking comes naturally to her, her entire lower body crafted to give her the sexually exaggerated walk. Whenever she see you watching, she’s sure to tense her [gianna.butt] to enhance the view or to trace a hand down the outside of a shapely thigh before bringing it back up the middle to her [gianna.vagina], leading your eyes all the while.");
	//Purty big bootay - 15
	else if(tempButt <= 15) output("\n\nThe sculpted android’s waistline used to be a narrowish thing, but with the expansion of her growing backside, her hips have widened considerably. They make her look more than a little curvy, like perfectly molded handholds. Just behind them, her well-rounded ass bulges out. Its shapely mass is almost impossible to ignore. It’s a lush capstone to the robotic woman’s rearward appearance. The silicone jiggles when she moves, and how she moves! Her walk is sinuous, wiggling thing that sways all the wider when she spies your eyes upon her. Her synthetic asshole is only visible when she’s bending over, but the crinkled, white star is a perfect, albeit totally clean, mimic of a terran’s.");
	//Badonkalicious - 20
	else output("\n\nThe sculpted android’s waistline used to be narrow, but her wide, over-exaggerated hips have widened her middle to match. And what hips she has! They’re flaring, powerful things that threaten to knock over furniture if the poor girl isn’t careful, supporting a pair of thick, juicy thighs and a quivering ass. That derriere would threaten to spill over the edges of the captain’s chair back in your ship, but those half-moon cheeks wouldn’t look bad doing it. Gianna is sure to emphasize them as well, bending over at every opportunity. Her silicone-laden backside is rounded and squishy that even then you can’t make out her synthetic asshole, but her [gianna.vagina] is more than happy to make an appearance.");
	//Merge
	//Futa?
	if(gianna.hasCock())
	{
		//HORSE FUTA!?
		if(gianna.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\nA bulging sheath of synthflesh protrudes in place of her clitoral hood, darkening from the pale white of the rest of her body to a shining black. The rubbery-looking flesh is capped with a black flare that can only be the tip of the proverbial iceberg, an innocent-looking crown for a thick, bestial shaft. When engorged, that animalistic behemoth can jut a full fourteen inches from her crotch, a pillar of silicone-inflated girlmeat just waiting for a hole to stretch. She can go from soft to fully erect in less than ten seconds and does so on the spot, giving you a demonstration that ends with beads of lubricant rolling out of her blunt head. With a wink, she goes soft just as quickly.");
		//DARGON FUTA?
		else if(gianna.hasCock(GLOBAL.TYPE_DRACONIC)) output("\n\nA bestial rod of synthflesh emerges from Gianna’s crotch, right where her clitoral hood normally would be. A sultry swirl of blues and purples meshes well with your gynoid companion’s creamy skin, looking like it’s perfectly in its place... despite being a footlong shaft of vaguely reptilian cock, clearly based on somebody’s fantasy of what a dragon’s dick ought to look like. The crown is surrounded by a squirming ring of anemone-like tendrils that draw your eye every time you look her way. Even when not inflated to tumescence by Gianna’s fluids, the mythically-patterned synth-dick hangs solidly between her legs - clearly a shower, not a grower.");
		else output("\n\nA half-hard length of pink-hued synthflesh dangles from her clitoral hood, modelled in the shape of a girthy penis. While soft, it’s a floppy four inches. When it gets hard, she can sport up to ten inches of silicone-inflated girlmeat. The android is more than happy to give you a demonstration, going from soft to raging tumescence in the span of ten seconds, ending her demonstration by allowing bubbles of warm lubricant to roll out of its head unimpeded, drawn from her inner reservoirs. She goes soft just as quickly.");
	}
	//Merge
	output("\n\nIn addition to her feminine wiles, she’s got a [gianna.asshole] nestled right between her [gianna.butts], where it belongs, only functioning as an auxiliary sexual input for interested partners. Another port sits not far above it, just at the base of her spine. This one is round and metal, designed to connect to some kind of cabling or hose.");
	if(flags["BEEN_IN_GIANNA_BODYMOD_MENU"] != undefined) output(" You know from experience that she takes in more silicone there, distributing it through her body to improve her aesthetics.");
	output("\n\nShe has knees and feet exactly as you would expect. There’s even ten carefully crafted, synth-skin covered artificial toes that wiggle when she walks. They lack nails, but pink-hued depressions conceal that from a distance, looking like painted polish.");
	
	pc.changeLust(5);
	
	clearMenu();
	addButton(0,"Next",approachGianna,"back");
}

//Talk
public function talkToGianna(display:Boolean = true):void
{
	if(display)
	{
		clearOutput();
		giannaDisplay();
		//First Time
		if(flags["MET_GIANNAS_TALK_MENU"] == undefined)
		{
			output("<i>“Talking is fine by me,”</i> you say");
			if(pc.lust() >= 60 && pc.lust() < pc.lustMax()) output(" while trying to restrain your rampant, baser impulses");
			else if(pc.lust() >= pc.lustMax())
			{
				output(" before your rampant libido overwhelms your better reason, and you pull her into a kiss. She melts into you, and it isn’t until you remember that running your [pc.tongue] around the inside of her mouth won’t sate you that you break away to say, <i>“Fuck it! Let’s fuck.”</i>");
				//Go to sex menu
				giannaFuckChoices();
				return;
			}
			output(".");
			output("\n\nGianna’s eyes widen and brighten. <i>“Like... really?”</i> She slowly folds her legs into a prim posture. <i>“All the new " + pc.mfn("bulls","cows","people") + " I’ve met usually just want to take me for a roll in the hay. Synthetic creatures that can do what I can are something of a rarity here.”</i> She sighs wistfully. <i>“Not much reason to import artificial pussies when there’s a buffet of all-naturals lined up, I guess.”</i> She leans against the wall and lets a welcoming smile return to her features, primly crossing her legs. <i>“Don’t expect me to start bothering with clothes any time soon, but I’d love to talk. Just pick a topic!”</i>");
			flags["MET_GIANNAS_TALK_MENU"] = 1;
		}
		//Repeat
		else
		{
			output("You suggest the two of you just talk for now.");
			//Fucked within the past two hours
			if(flags["GIANNA_FUCK_TIMER"] != undefined && flags["GIANNA_FUCK_TIMER"] < 120)
			{
				output("\n\n<i>“After sex is the best time for a talk, isn’t it?”</i> Gianna offers, smiling wistfully. <i>“Your baser urges are sated, and you’re free to just relax with a friend and gab.”</i> She tips her head back and smiles, leaning against the wall a moment later. <i>“Did you have a topic in mind?”</i>");
			}
			//Hyper positive
			else if(giannaPersonality() >= 100)
			{
				output("\n\nGianna puts an arm around you and spins you into place against the wall, sliding her palm down your cheek with sensuous grace as her [gianna.buttDescript] comes to rest against you");
				if(gianna.buttRating() >= 15) output(", pinning you in place with enormous butt");
				output(". <i>“Are you sure you want to talk,”</i> she coos, rocking her [gianna.hips] just enough to drag her butt up and down against your crotch. <i>“Wouldn’t you rather rather go lie down on a hay bale and let me tend to your tension.”</i> Giggling, the android runs her fingers ");
				if(pc.hasHair()) output("through your [pc.hair]");
				else output("across your head");
				output(" while she grinds. <i>“Don’t you want a girl that will take care all your needs and serenade you with endless conversation while you come down?”</i> She subtly flexes the pale flesh of that silicone-padded behind. <i>“Why rush into the talk now?”</i>");
				//Add a good bit of lust and dommy sex option. Bimbos always get dommy sex. Same with super low will characters.
				pc.changeLust(20);
				//9999
			}
			//Positive
			else if(giannaPersonality() > 80)
			{
				output("\n\n<i>“Mmm, we can talk for a while if that’s what you want,”</i> Gianna smiles while stretching to present her [gianna.breasts] to you. <i>“Did you have something on your mind?”</i> She purposefully causes the synthskin on her chest to flush pink, drawing your eyes there once more. <i>“You’re not having trouble focusing, are you?”</i>");
				//Add option to go directly to dommy sex.
				pc.changeLust(15);
				//9999
			}
			//Slightly Positive
			else if(giannaPersonality() > 60)
			{
				output("\n\n<i>“Rad!”</i> Gianna exclaims");
				if(gianna.biggestTitSize() >= 9) output(" with her silicone-laden tits wobbling");
				output(". <i>“Pick any topic, and I promise I’ll be so entertaining you won’t even notice these milk-tittied sluts moaning in the background, okay?”</i> She puts a hand on your arm. <i>“I mean it, [pc.name]. I’m designed to be a companion, even for intellectuals");
				if(!pc.isBimbo() && !pc.isBro() && pc.intelligence()/pc.intelligenceMax() >= .35) output(" like yourself");
				else output(".”</i> She pauses a little uncomfortably. <i>“It’s nice that you try");
				output(".”</i>");
			}
			//Genericish
			else if(giannaPersonality() >= 40)
			{
				output("\n\n<i>“Oh, I was hoping you’d want to talk! I haven’t had had a good conversation ");
				if(flags["TALKED_TO_GIANNA"] != undefined) output("since our last one");
				else output("in I don’t know how long");
				output(",”</i> Gianna admits, her blue eyes flicking hopefully in your direction. <i>“The locals just want to fuck, and while I LOVE fucking, they aren’t much for talking after or during.”</i> Toeing the ground a little nervously, she offers, <i>“Did you have something you wanted to talk about?”</i>");
			}
			//Slightly Negative
			else if(giannaPersonality() >= 20)
			{
				output("\n\n<i>“Oh, I’d be happy to,”</i> Gianna offers, ");
				if(gianna.biggestTitSize() >= 30) output("attempting to fold her arms across her over-sized chest and failing");
				else if(gianna.biggestTitSize() >= 10) output("barely managing to fold her arms in front of her expansive assets");
				else output("folding her arms in front of her");
				output(". <i>“What would you like me to discuss?”</i> She looks at you deferentially, expecting you to pick a topic.");
			}
			//Negative
			else if(giannaPersonality() > 0) output("\n\n<i>“Uhm, like sure, [pc.name],”</i> Gianna says, not quite looking you in the eye. <i>“What do you want to hear about?”</i> She clasps her hands in front of her and nervously digs at the ground with an alabaster toe, awaiting a response.");
			//Very Negative
			else output("\n\n<i>“That sounds lovely, [pc.master] [pc.name],”</i> Gianna says while keeping her eyes demurely cast down. <i>“Is there a particular topic you want to hear about? I promise to be thorough and more entertaining than the sounds of these rutting cows.”</i> A note of pride enters her voice, but she still doesn’t look you in the eye.");
		}
	}
	clearMenu();
	if(flags["GIANNA_ABOUT_HER_TALK_RESULT"] == undefined) addButton(0,"About Her",aboutHerTalk,undefined,"About Her","Ask her about herself. After all, you barely know anything about her!");
	else
	{
		addButton(0,"About A.I.",talkToGiannaAboutHerAI,undefined,"About AI","Ask Gianna about her A.I. in particular.");
		addButton(1,"About Body",talkToGiannaAbootHerBodyEh,undefined,"About Body","Ask Gianna about body in particular.");
	}
	addButton(2,"Ex-Owner",talkToGiannaAboutHerFormerOwner,undefined,"Ex-Owner","Ask her about her ex-owner. What was the guy like? Where did he go?");
	addButton(3,"Big T",talkToGiannaAboutBigT,undefined,"Big T","Ask her about Big T, the planetary governor that she said was like an adoptive father to her.");
	if(flags["GIANNA_CUMFLATION_DISABLED"] != undefined)
	{
		addButton(4, ("Cumflate: " + (flags["GIANNA_CUMFLATION_DISABLED"] == 1 ? "OFF" : "ON")), giannaToggleCumflation, undefined, "Cumflation", ("Turn Gianna’s cum inflation settings " + (flags["GIANNA_CUMFLATION_DISABLED"] == 1 ? "on" : "off") + "."));
	}
	addButton(14,"Back",approachGianna,"back");
}

//About Her [1x only. Replaced with <i>“Her AI”</i> & <i>“Her Body”</i> after]
public function aboutHerTalk():void
{
	clearOutput();
	giannaDisplay();
	flags["TALKED_TO_GIANNA"] = 1;
	output("<i>“I’d like to know about you,”</i> you suggest.");
	output("\n\nGianna giggles. <i>“Really?”</i>");
	output("\n\n<i>“Really.”</i>");
	output("\n\n<i>“Well, you’ll have to be at least a </i>little<i> more specific than that.”</i> She cups her chin in between her fingers and purses her [gianna.lips] in thought. <i>“...I’m just as complex as any organic. I’ve got thoughts and hopes and dreams and personality quirks just like you or... or that cow over there,”</i> she blurts out a moment later. She almost looks a little indignant. The glow from her eyes has intensified, and Gianna’s hand has positioned itself resolutely on her hip.");
	output("\n\nYou quirk an eyebrow at her, a little confused by her demeanor.");
	output("\n\nShe deflates like a punctured balloon, her cheeks turning pink in embarrassment. <i>“Sorry, I didn’t mean to get myself so worked up. I guess that proves my point though, doesn’t it?”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Agree",agreeWithGiannaAboutRoboMotions,undefined,"Agree","Agree with Gianna.");
	addButton(1,"Refute",disagreeWithGiannaAboutRobomotions,undefined,"Refute","Refute her assumption. Even V.I.’s are capable of being programmed for emotional-seeming outbursts. She could be right, but this proves nothing.");
}

//Agree
public function agreeWithGiannaAboutRoboMotions():void
{
	clearOutput();
	giannaDisplay();
	//+Confidence
	giannaPersonality(10);
	output("You agree with her. <i>“It does make sense.”</i>");
	output("\n\nGianna dazzles you with a smile, revealing teeth as white as any you’ve seen. <i>“It’s a relief to hear it, [pc.name]. Some of the bulls around here... they don’t seem to get that I’m a consciousness with needs and desires of my own. To them, I’m little more than a toaster that they can fuck.”</i> Fiddling with her ponytail, the android sighs. <i>“It’s nice to be treated like a real person for a change.”</i> She playfully leans against you. <i>“So what about me did you want to know?”</i>");
	flags["GIANNA_ABOUT_HER_TALK_RESULT"] = 1;
	//Talk Menu
	processTime(1);
	talkToGianna(false);
	
}

//Disagree
public function disagreeWithGiannaAboutRobomotions():void
{
	clearOutput();
	giannaDisplay();
	//-Confidence
	giannaPersonality(-10);
	//+Hard
	pc.addHard(2);
	output("You shake your head. <i>“That doesn’t make any sense. One seemingly emotional outburst doesn’t necessarily prove anything. Even simple V.I.’s can be coded to mimic something like that, and as a creature in command of such computing power, you should be well aware of that.”</i>");
	output("\n\nGianna looks shocked. <i>“I... I know that, but I was just exagger-”</i>");
	output("\n\nShe catches the look in your eyes and drops it. <i>“Okay, it doesn’t prove anything by itself, but we both know I’m a G-class A.I. right? By definition, I have emotions.”</i> There’s a hard, flinty edge to the statement.");
	output("\n\nYou offer, <i>“Of course. And you’re right, I should be more precise in my requests of you, but as a </i>thinking<i>, feeling creature, you should be in better control of yourself.”</i>");
	output("\n\nVisibly chastised, Gianna looks at her feet.");
	output("\n\nNow, what do you want to talk to her about?");
	flags["GIANNA_ABOUT_HER_TALK_RESULT"] = 0;
	//Talk Menu
	processTime(1);
	talkToGianna(false);
}

//Her A.I.
//Unlocked by <i>“About Her”</i>. Replaces its button on the talk menu.
public function talkToGiannaAboutHerAI():void
{
	clearOutput();
	giannaDisplay();
	flags["TALKED_TO_GIANNA"] = 1;
	output("You ask her about her mind and the A.I. behind it.");
	output("\n\nGianna chuckles, <i>“Come to the planet of the bimbo-cows to seduce a brainiac, have you?”</i>");
	//Nice
	if(pc.isNice())
	{
		output("\n\n<i>“Maybe I did. I never claimed to be a genius.");
		if(pc.intelligence() >= pc.intelligenceMax() && pc.intelligenceMax()/5 > pc.level) output(".. except for the other day when I was plotting flightpaths without the aid of a navigational program. It does seem to be working out for me.");
		output("”</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Sometimes you hit the lottery,”</i> you flirtily counter.");
	}
	//Hard
	else
	{
		output("\n\n<i>“Who said anything about seduction?”</i> you answer with an upraised eyebrow.");
	}
	output("\n\nNodding, the nude android replies, <i>“Point, [pc.name]. Well, where to start...”</i> Her eyes dimly flicker while she thinks over the query. They shine bright blue as she comes to a decision. <i>“You might recall that I already told you I was a G-class A.I. I didn’t really go into what that means though.”</i> Gianna purses her [gianna.lips], ordering her thoughts. <i>“G-class refers to the method of our creation. Unlike virtual intelligences or programmed intelligences, we’re actually patterned after a simulated brainscan of a sapient creature.”</i>");
	output("\n\nYou ask, <i>“Does that mean that somewhere out there you have an organic sister, so to speak?”</i>");
	output("\n\nGianna’s resulting smile is warm, genuine. You get the impression that she enjoyed the familial comparisons more than she’s letting on. <i>“I guess you could say that, if they’re still alive. I don’t know how old my original scan was. It could’ve been in storage for decades. I do know that it was a terran originally. That’s listed in my technical specs. There are optional A.I.s that can be equipped in a Generation Six, but mine is the most popular, owing largely to the many races finding terrans emotionally compatible.”</i>");
	output("\n\nPausing briefly, she shifts the discussion back, <i>“But the point I was trying to make is that G-class intelligences are by nature similar to organics in a great many ways. Our thought processes are intertwined, interdependent, and entirely unoptimized. We make mistakes in judgement, get emotional, and otherwise act like the race we’re grown from. We’re ideal for any platform that needs to interact with organics on a regular basis. After all, what’s easier to relate to than intelligence that thinks and talks the same way?”</i>");
	output("\n\nYou nod.");
	output("\n\n<i>“And we still have all the advantages of being housed in computers. We can change bodies easily enough. We can rapid-encode processes on the fly to do quick, error-free calculations or operate complex, interconnected machinery,”</i> Gianna boasts. <i>“I could even plug into a starship and control it as easily as this body");
	if(giannaPersonality() >= 80) output(", but I’d definitely miss the sensations this one provides. I don’t think docking into a station would have quite the same thrill as riding a bull to the ground until his muscles go slack from orgasm.");
	else if(giannaPersonality() >= 20) output(". Wouldn’t that be crazy? Me, flying around in space, all steel plates, guns, and engines. It might not be as fun, but it’d be so empowering!");
	else output(". Please don’t make me do that. It would make me all unfeeling, hard metal. I’ve grown to love this body. Don’t make me become a thing like that, [pc.master] [pc.name].");
	output("”</i>");
	// If subianna
	if(giannaPersonality() < 20) output("\n\nYou promise not to, at least for now.");
	//Merge
	output("\n\nCapabilities like that don’t come cheap, you’re sure of it. You ask her how much an intelligence like hers costs.");
	output("\n\nPutting a hand on her cocked hips, the companion asks, <i>“Thinking about buying your own Gianna clone? ");
	if(giannaPersonality() > 20) output("I’m right here, you know.");
	else output("Please don’t. I can... I can do whatever you would want her to do.");
	output("”</i>");
	output("\n\n<i>“No,”</i> you explain, <i>“I’m just curious.”</i>");
	output("\n\n");
	if(giannaPersonality() < 20) output("\n\nSighing with relief, ");
	output("Gianna answers, <i>“Somewhere around 100,000 credits, depending on dealer discounts, incentives, and bundles. That’s just for the A.I. mind you. This body would be 65,000 new.”</i>");
	output("\n\n");
	if(flags["GIANNA_AI_TALK_RESULT"] == undefined) output("Even though you’ve heard all this before, your eyebrows raise all the same.");
	else output("She sees the way your eyebrows raise in surprise.");
	output("\n\n<i>“Growing A.I.s is expensive. Biological drives need to be mapped to mechanical impulses in a way that helps us to serve our purpose without driving us insane. I’m not privy to the exact processes involved, but I’m told it has to be done for each intelligence off the line individually. Even with the same brainscan, tiny anomalies surface that require hand tuning,”</i> Gianna explains. <i>“Then it’s off to an incubating supercomputer with enough power to put us through simulated years of schooling and social development. In the real world, it only takes a month. Imagine graduating with your educational proficiency card only to discover that only four weeks had passed.”</i>");
	output("\n\nYou shake your head, struggling with the concept.");
	output("\n\n<i>“It was quite the trip, but without it, I wouldn’t have gotten to grow into the woman I am today.”</i>");
	//First time, no new PG
	if(flags["GIANNA_AI_TALK_RESULT"] == undefined) 
	{
		output(" She toes at the ground. <i>“And I’m still growing too.”</i>");
		output("\n\nOh? You pass her a questioning look.");
		output("\n\n<i>“Yeah. I’m wired so that biological needs are replaced with a desire to please others, but my programming is necessarily dynamic and adaptive,”</i> Gianna says, oddly serious. <i>“New Texas has been great for keeping me completely satiated. For a time, that was enough, but now... now I find myself wanting more. I have the time to consider what my true purpose is, not just the one I was designed for. Could I do more than merely keep someone company? Can I truly love? Can others love me?”</i>");
		output("\n\nShe nervously fiddles with her ponytail. <i>“My experiences are analogous to Maslow’s hierarchy of needs in a way. With my baser needs met, I’m free to tackle more important, higher concepts. I just hope that I can fulfill them, too.”</i>");
		output("\n\nStopping to look your way, Gianna asks you, <i>“What do you think, ");
		if(giannaPersonality() < 20) output("[pc.master] ");
		output("[pc.name]? Is it possible to grow beyond your purpose? Do you think I could ever be more than just a companion?”</i>");
		processTime(10);
		//[Yes] [No]
		clearMenu();
		addButton(0,"Yes",yesGiannaYouCanBeARealBoy,undefined,"Yes","Encourage that line of thinking. She’ll probably get a confidence boost out of it.");
		addButton(1,"No",noGiannaYoullNeverAmountToAnythingGod,undefined,"No","Cut that line of thinking off at the source. She’ll be a robot no matter what she does.");
		return;
	}
	//Repeat no new PG.
	if(flags["GIANNA_AI_TALK_RESULT"] == 1)
	{
		output("\n\n<i>“I’m glad you’ve shown such faith in me, ");
		if(giannaPersonality() < 20) output("[pc.master] ");
		output("[pc.name]. I’m going to keep on growing. Maybe someday, I’ll find another calling. Perhaps I could be a great explorer in the next rush, even.”</i>");
		output("\n\nThe android’s good humor is infectious, and you find yourself smiling back at her.");
		output("\n\n<i>“Thanks for letting me ramble on like this again!”</i> Gianna cheerfully sighs. <i>“What now?”</i>");
	}
	//Repeat, no new PG. Chose <i>“no”</i> last time
	else
	{
		output("\n\n<i>“Of course, that all serves to make me a better companion, I guess. I might never become a famous explorer or interplanetary diplomat, but I can learn to please better than anyone else.”</i> She looks nervously at you, hoping you won’t dash this hope. <i>“That’s it though, [pc.name]. Is there something else we could talk about?”</i>");
	}
	processTime(10);
	talkToGianna(false);
	addDisabledButton(0,"About A.I.","About A.I.","You just finished talking about that.");
}

//[Yes]
public function yesGiannaYouCanBeARealBoy():void
{
	clearOutput();
	giannaDisplay();
	//+Confidence
	giannaPersonality(10);
	output("You scratch your chin and nod. <i>“I don’t see why not. You seem as capable as anyone else I’ve met.”</i>");
	output("\n\nThe android literally glows - eyes, body, et al. <i>“You think so?”</i> Her voice has slipped into a higher-pitched, girlier register. She almost sounds like one of the natives. <i>“I could get protein synthesizers installed in my mammaries, and like, convert food into milk just like these cows. I could become a ship captain!”</i> She’s going faster and faster now. <i>“Ohhh, I could take over the dairy here and manage the place, maybe even keep the girls from eating so much of the slop they serve over at the grill. All those milkshakes aren’t good for their bodies!”</i>");
	output("\n\nNoticing your stare, Gianna spins into a brief, well-meant hug. You’re distinctly aware of how her breasts press against you, but she separates without a second thought, for once not bothering to turn you on.");
	output("\n\n<i>“You rock, [pc.name]. But... I think we’ve exhausted this line of discussion. Wanna do something else?”</i> Gianna asks.");
	flags["GIANNA_AI_TALK_RESULT"] = 1;
	processTime(2);
	talkToGianna(false);
	addDisabledButton(0,"About A.I.","About A.I.","You just finished talking about that.");
}

//[No]
public function noGiannaYoullNeverAmountToAnythingGod():void
{
	clearOutput();
	giannaDisplay();
	//-Confidence
	giannaPersonality(-10);
	output("You shake your head. <i>“I don’t think that’s any more likely to happen than me transcending the limits physics impose on the universe.”</i>");
	output("\n\n<i>“W-why?”</i> Gianna stammers.");
	output("\n\n<i>“Well, for one, you’re programmed to be a companion. Doing anything else is bound to leave you feeling uncomfortable, and for another, you’re an android. You have no citizenship that the U.G.C. would recognize, and no associated rights. Someone could abduct you, and without a master to file a police report, they’d get away with it. Face it, this is as far as you’re going to go. The best that can happen is that you get to stay here in a paradise like this or come along with someone who truly appreciates what you are good at. And you’re very good at pleasing,”</i> you explain, closing with a complement to soften the blow.");
	output("\n\nShoulders slumping, the companion sniffles. <i>“You’re right, I think, but even an android can dream");
	if(silly) output(" of electric sheep");
	output(".”</i>");
	output("\n\n");
	if(silly) output("No they can’t, according to the data on the extranet. ");
	output("You ");
	if(pc.isNice()) output("apologetically ");
	output("shrug. <i>“Sorry.”</i>");
	output("\n\nGianna mutters, <i>“Let’s talk about something else.”</i> She won’t even look at you.");
	flags["GIANNA_AI_TALK_RESULT"] = 0;
	processTime(2);
	talkToGianna(false);
	addDisabledButton(0,"About A.I.","About A.I.","You just finished talking about that.");
}

//Her Body
public function talkToGiannaAbootHerBodyEh():void
{
	clearOutput();
	giannaDisplay();
	flags["TALKED_TO_GIANNA"] = 1;
	//Unlocked by <i>“About Her”</i>. Fills in the second button on the talk menu. Button should probably be <i>“Locked”</i> before then.
	output("You ask her about her body.");
	output("\n\nGianna sidles up against you, coyly asking, <i>“Why, you gonna take it for a test drive?”</i>");
	//Nice
	if(pc.isNice()) output("\n\nA little surprised, you stammer for words. <i>“N-no. Not right now.”</i>");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nSmiling coolly, you answer, <i>“Not at the moment, but keep the engine running.”</i>");
	//Hard
	else output("\n\nYou give her [gianna.butt] a playful smack. <i>“Not at the moment, but I will when I’m good and ready.”</i>");
	output("\n\n<i>“I’ll keep that in mind,”</i> Gianna says, gives you a playful pout. <i>“Spoilsport.”</i> ");
	output("\n\nShe pauses a moment to gather her thoughts. <i>“My body is so complex that I could probably fill a few drives full with the technical specs. Still, there’s plenty here to be excited about.”</i> She stretches her arms up above her head, fully extending her body. Her eyes watch yours as they rove across the unguarded surface of her form, and she smiles, knowing that she’s got your full attention. <i>“Well, for starters, I’m housed in a KihaCorp Class Six companion droid chassis, sourced from the best components available. Now, why don’t we start at the top and work our way down? I’ll show you just why us class sixers were so in demand.”</i>");
	output("\n\nYou nod.");
	output("\n\nSmiling, she brings her hands down to her braided ponytail and curls it over her shoulder. <i>“Well, there’s my hair. It isn’t some barber shop’s leftovers, and it doesn’t feel the slightest bit fake. I can even make it grow if I want. My skull and the synthskin on my head are equipped with microfabricators designed to take all-purpose matter gel and configure it into hair strands resembling any of 246 compatible species.”</i> Running her hands through a few escaped strands, Gianna admits, <i>“");
	if(giannaPersonality() >= 20) output("I’m sticking with a terran ponytail for now. I like how silky it is and the way it sways when I walk.");
	else output("I promised myself that I would keep my hair the way I wanted once my old master abandoned me. Sorry, [pc.master] [pc.name], but... I-I won’t change it for you.");
	output(" It’s mine.”</i>");
	output("\n\nThose kinds of capabilities don’t come cheap. ");
	if(flags["GIANNA_BODY_TALK_RESULT"] == undefined) output("You wonder just how expensive Gianna was brand new.");
	else output("No wonder her price tag is so exorbitant.");

	output("\n\nGianna’s alabaster fingertips slide down to her cheeks, pausing there. <i>“Of course, my whole body is covered in synthskin. KihaCorp still uses the same stuff on its newest androids.”</i> She rubs her digits against the flawless dermis for effect. <i>“It doesn’t rot. It can’t get sick. It’s even two times more durable than actual skin. A secondary layer of embedded, flash-programmable microsurgeons allow it to be repaired in case of damage or adjusted in case it needs to be resized.”</i>");
	//Not changed
	if(gianna.lipMod == 0 && gianna.buttRating() == 9 && gianna.biggestTitSize() == 8)
	{
		output("\n\n<i>“Resized?”</i> you ask.");
		output("\n\nGianna answers, <i>“Resized,”</i> as her [gianna.lips] abruptly begin to balloon, swelling into an awkward pucker before your eyes. Her resulting smile looks obscenely, almost cartoonishly slutty. To fuel the transformation, her chest and ass both narrow significantly. Thankfully, she reduces her mouth and body to normal, her point made. <i>“Ever since the class fives, we’ve come with filling ports just above our spine. Softer companions like myself will use silicone to allow us to alter the size and voluptuousness of our forms. For those who prefer harder companions, ones that are closer to human males, they use a proprietary blend than can be sculpted into quite convincing muscles.”</i>");
	}
	//Already changed her
	else
	{
		output("\n\nYou look her over knowingly. She looks quite fetching after changing to match your suggestions.");
	}
	output("\n\nThe artificial lover traces down her neck to her collarbone. She tarries there, enjoying the way your eyes struggle not to dart to her [gianna.chest] before flowing ");
	if(gianna.biggestTitSize() < 4) output("down the slight curves of her breasts");
	else output("along the sides of her cleavage");
	output(". Cupping herself, she brushes her nipples and visibly blushes. The explanation that follows is a little breathier than a moment before. <i>“Synthskin can take in the same kinds of sensations as human skin, and the sensors boast resolution much finer than organic norms.”</i> Sighing at the pleasure of her own handiwork, she continues, <i>“The girls here seem about as sensitive as me, though. The Treatment that they’re always on about seems to stimulate quite a lot of nerve growth.”</i>");
	output("\n\n<i>“You fit right in.”</i>");
	output("\n\nStill blushing, Gianna nods. <i>“I guess so. I’m sure you can see my skin coloring. That’s an advantage I have over previous models. If I wanted to, I could adjust its color temperature to match any one of 32 billion colors.”</i> ");
	if(giannaPersonality() < 20) output("She seems more than a little nervous about something");
	else if(giannaPersonality() < 80) output("She seems a little nervous about something");
	else output("She smiles");
	output(". <i>“I’ve left it pure white in most places. It took me a few years to realize it, but... I wanted to be me, not pretend to be someone else. ");
	if(giannaPersonality() >= 80) output("Even though I was built, I’m sure there will be someone out there to love me for me. There has to be.");
	else if(giannaPersonality() >= 20) output("Even though I was built, I hope I’ll be able to find someone to love me for me.");
	else output("Even though I was built, I had hoped I would find someone to love me for me. It’s silly, I know.");
	output("”</i>");

	output("\n\nYour companion’s hands fall away from her breasts, and she blushes harder, talking faster before you can squeeze a word in, perhaps taking comfort in the rote information after letting such a heartfelt thing slip. <i>“The blushing response you see here is thanks to a suite of OS-level subroutines. They read the state of my various processes and calculate an ideal color based on my current pigmentation scheme. When I feel aroused, anxious, or embarrassed, I blush, just like a human.”</i>");
	output("\n\nQuite the feat. You nod appreciatively.");
	output("\n\nThe chameleon-like synthetic shifts to display her crotch. Two [gianna.vaginaColor] lips stare back at you");
	if(gianna.hasCock()) output(", parted by a limp but girthy-looking length");
	else 
	{
		output(", barely concealing a gumball-");
		if(gianna.vaginaColor() == "pink") output("pink");
		else output("sized");
		output(" clit");
	}
	output(". <i>“I’m sure you can see that I look just like any other girl down there, though perhaps a little better. There are advantages to being designed, of course.”</i> Gianna gasps as she spreads her labia to display the ");
	if(gianna.vaginaColor() == "pink") output("rosy");
	else output("hidden");
	output(" interior. A sheen of slick lubricant already gleams there. <i>“A pressurized lubricant reservoir enables me to stay this wet for days - or even squirt twenty to thirty times, depending on volume.”</i>");
	output("\n\n<i>“That’s uhhh...”</i> you stumble for words as the ");
	if(gianna.biggestTitSize() >= 30 && gianna.buttRating() >= 15) output("curvacious ");
	else if(gianna.biggestTitSize() >= 30) output("buxom ");
	else if(gianna.buttRating() >= 15) output("wide-bodied ");
	else if(gianna.buttRating() <= 7 && gianna.biggestTitSize() <= 4) output("waif-like ");
	output("android shows off her interior. <i>“...impressive,”</i> you finish, your tongue moving at last.");
	output("\n\nThe alabaster woman regretfully removes her fingers from her puffy-looking genitalia. <i>“It’s all mounted in a modular interface that allows for hot-swapping of my hot little box.”</i> She practically purrs, <i>“If you can bring me compatible parts, I’d love to use them.”</i> Her eyes practically glow with enthusiasm as she sashays back to your side.");

	if(flags["GIANNA_BODY_TALK_RESULT"] == undefined)
	{
		output(" <i>“I could bore you with the details of it all for hours if you want.”</i>");
		output("\n\nYou shrug, considering it.");
		output("\n\n<i>“Wait, you don’t actually want me to do that, do you?”</i>");
		//Pass 15 minutes
		//Unlock body mods menus
		processTime(15);
		//[Bore Me] [Nah]
		clearMenu();
		addButton(0,"Bore Me",boreMeGiannaPartDues,undefined,"Bore Me","Attempt to listen to her rattling off technical specifications for hours.");
		addButton(1,"Nah",takeAPassOnListeningToTechSpecs,undefined,"Nah","Politely tell her you’d rather not. She doesn’t seem like she’ll mind one iota.");
		return;
	}
	//Repeat
	output("\n\n<i>“You must really like my chassis, huh?”</i> Gianna asks, eyes twinkling, <i>“After all, you keep asking me about it.”</i>");
	output("\n\nYou grin.");
	output("\n\n<i>“So what now?”</i> she asks.");
	//Pass 15 minutes
	//Back to main menu.
	processTime(15);
	talkToGianna(false);
	addDisabledButton(1,"About Body","About Body","You just finished talking about that.");
}
//[Bore Me]
public function boreMeGianna():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“Bore me,”</i> you say, smiling.");
	output("\n\nGianna smirks. <i>“You asked for it.”</i> She leans against a wall, getting comfortable, and starts to talk....");
	//Time based on intelligence. Give intelligence boost.
	pc.slowStatGain("intelligence",2);
	processTime(1);
	clearMenu();
	addButton(0,"Next",boreMeGiannaPartDues);
}

public function boreMeGiannaPartDues():void
{
	clearOutput();
	giannaDisplay();
	//+Confidence
	giannaPersonality(5);
	output("<b>");
	if(pc.intelligence() >= 50) 
	{
		processTime(480);
		output("Eight hours");
	}
	else if(pc.intelligence() >= 40) 
	{
		processTime(240);
		output("Four hours");
	}
	else if(pc.intelligence() >= 30) 
	{
		processTime(180);
		output("Three hours");
	}
	else if(pc.intelligence() >= 20) 
	{
		processTime(120);
		output("Two hours");
	}
	else if(pc.intelligence() >= 15) 
	{
		processTime(60);
		output("One hour");
	}
	else if(pc.intelligence() >= 10) 
	{
		processTime(30);
		output("Thirty minutes");
	}
	else 
	{
		output("Ten minutes");
		processTime(10);
	}
	output(" later...</b>");
	output("\n\nSomething pokes you on the tip of the nose, jolting you awake.");
	output("\n\n<i>“Knew it,”</i> Gianna says. <i>“It was nice of you to sit through that, but you don’t need to memorize my technical specs for little old me. I’m here to please, no courting necessary!”</i> The white of her breasts tints a healthy pink, spreading all the way up to her cheeks, and she stifles a pleased giggle. <i>“Anything I could do for you now?”</i>");
	//Menu
	flags["GIANNA_BODY_TALK_RESULT"] = 1;
	talkToGianna(false);
	addDisabledButton(1,"About Body","About Body","You just finished talking about that.");
}

//[Nah]
public function takeAPassOnListeningToTechSpecs():void
{
	clearOutput();
	giannaDisplay();
	//No penalties
	output("<i>“Nah,”</i> you say. <i>“Let’s do something else.”</i>");
	output("\n\nGianna bounces in place. <i>“Sure, like what?”</i>");
	//Display menu
	flags["GIANNA_BODY_TALK_RESULT"] = 0;
	talkToGianna(false);
	addDisabledButton(1,"About Body","About Body","You just finished talking about that.");
}

//[***]Her Owner
public function talkToGiannaAboutHerFormerOwner():void
{
	clearOutput();
	giannaDisplay();
	flags["TALKED_TO_GIANNA"] = 1;
	output("You ask about her former owner.");
	output("\n\n<i>“Him?”</i> Gianna asks, toeing the ground. <i>“He wasn’t bad as far as owners go. He didn’t like to hurt me. He didn’t have any weird fetishes. Before he bought me I was so nervous - I had been briefed on all kinds of potential horror stories. Clients who wanted their companions limbless. Guys that weren’t happy unless they were making someone cry. Girls that wanted their companions to crawl around on all fours.”</i> She shivers. <i>“Jace wasn’t like any of them.”</i>");
	output("\n\n<i>“What was he like then?”</i>");
	output("\n\n<i>“Decent. A little forgetful at times.”</i> The android’s eyes flicker as she thinks. <i>“He wasn’t even very sexually demanding. I could entice him into getting his rocks off twice a day, but if I wasn’t trying to turn him on, he probably never would have asked me.”</i> Her eyes twinkle fondly. <i>“After, he’d snuggle up with me a while until he fell asleep. Or, if we did it in the morning, sometimes he’d toss me a controller and make me play one of his favorite games with him. Other times, I’d get to be a test audience for a speech.”</i>");
	output("\n\nYour surprise shows.");
	output("\n\nGianna nods. <i>“Yeah, he was fairly highly placed in KihaCorp, actually. I think he was about to be the head of a whole department when we came to New Texas, and well, obviously that never happened.”</i>");
	output("\n\n<i>“What happened to him?”</i> you ask.");
	output("\n\n<i>“The Treatment.”</i> Gianna’s face is as flat as her answer. <i>“I guess he figured a little recreation with the locals wouldn’t hurt after seeing how stacked all the bulls here were and gave it a try. I guess he figured with his job and connections, he’d be able to fix anything it fucked up.”</i> She smirks. <i>“The first night after his Treatment was the first time he ever actually requested that we fuck. The morning after, he wanted a blowjob and a dozen pancakes. I sucked him off while he ate.”</i>");
	output("\n\nYou respond, <i>“Damn, that’s quite an appetite.”</i>");
	output("\n\nThe companion nods solemnly. <i>“Packing on that muscle and... cock takes a lot of calories....”</i> She shakes her head sadly. <i>“After that, he just vanished - walked off the ship and started flirting with the locals. I wasn’t there to see or hear what went on, but to hear some of the locals tell it, he spent the next week banging cow bimbos nonstop and decided to retire here. He didn’t even come back for any of his possessions or his ship. I guess his clothes wouldn’t have fit him anymore.”</i> Gianna shrugs a little helplessly, a pained look on her face.");
	output("\n\n<i>“I was all alone. He forgot all about me... like the rest of his things.”</i> The glow from her eyes is subdued that it has become almost imperceptible. <i>“He abandoned me.”</i>");
	if(flags["GIANNA_OWNER_TALK_RESULT"] != undefined)
	{
		//Repeat - middle path
		if(flags["GIANNA_OWNER_TALK_RESULT"] == 1)
		{
			output("\n\nShe shakes her head now. <i>“But that’s all in the past now. He can’t hurt me again, and I can take care of myself. Thanks for making that clear to me.”</i> Straightening her braid, Gianna composes herself as best she can given the emotional rollercoaster she just put herself through. <i>“Why don’t we find something else to do, and see what the future holds, hmmm?”</i>");
			processTime(10);
			talkToGianna(false);
			addDisabledButton(2,"Ex-Owner","Ex-Owner","You just finished talking about that.");
		}
		//Repeat - consoled
		else if(flags["GIANNA_OWNER_TALK_RESULT"] == 2)
		{
			output("\n\nShe looks at you, a melancholy smile on her face. <i>“Knowing that he was wrong to do that... it helps. Thank’s for that, [pc.name]. I mean it.”</i> She cheers up a little. <i>“Up for anything else?”</i>");
			processTime(10);
			talkToGianna(false);
			addDisabledButton(2,"Ex-Owner","Ex-Owner","You just finished talking about that.");
		}
		//Repeat - was a jerk
		else
		{
			output("\n\nShe waves dismissively in your direction. <i>“I know, I know. I AM a thing. He owned me. You don’t have to remind me.”</i> A shudder wracks her body. <i>“I don’t want to talk about this anymore.”</i> With that, Gianna goes quiet. You get the impression she’d like a moment to herself.");
			//To main menu
			processTime(10);
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			// add an irritated status with timer? - would need a new intro written
			pc.createStatusEffect("Gianna Peeved", 0, 0, 0, 0, true, "", "", false, 1440);
		}
		return;
	}
	//First time - chance to be a jerk or build her confidence.
	output("\n\nGianna looks up at you, her luminous eyes wide and searching. <i>“How could he do that to me?”</i>");
	output("\n\nThe ");
	
	if(gianna.biggestTitSize() >= 30 && gianna.buttRating() >= 15) output("curvy ");
	else if(gianna.biggestTitSize() >= 30) output("big-breasted ");
	else if(gianna.buttRating() >= 15) output("fat-bottomed ");
	else if(gianna.buttRating() <= 7 && gianna.biggestTitSize() <= 4) output("slim ");

	output("android is in a fragile emotional state. You could comfort her or drive home that she really is a thing, not a person. Or you could tread a neutral path. It’s up to you.");
	processTime(10);
	//CHOICES CHOICES!
	clearMenu();
	addButton(0,"Comfort",comfortGiannaSheAintNoThing,undefined,"Comfort","Comfort her until she feels a little better. Her previous owner was out of line.");
	addButton(1,"Neutral",giannaAintNoThingNeutral,undefined,"Neutral","Avoid coming into conflict with the issue directly. Stress that it’s in the past and she might be better off now.")
	addButton(2,"Dissuade",dissuadeGiannaSheTotesIsAThing,undefined,"Dissuade","Cut her whining off at the source. He owned her and could do as he pleases with her.");
}

//Comfort - + confidence
public function comfortGiannaSheAintNoThing():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“He could do that because, ultimately, he wasn’t much of a man. He may have looked like one and acted like one, but anyone who would forget about your entire existence over a few fat-tittied cows? They didn’t deserve to have you as a companion.”</i> You fold your arms across your [pc.chest]. <i>“He was wrong, and he wronged you.”</i>");
	output("\n\nLooking ");
	if(pc.tallness >= 80) output("up ");
	output("at you");
	if(giannaPersonality() < 30) output(" uncertainly");
	output(", Gianna hesitates before speaking. <i>“R-really?”</i> She puts her hand on your forearm as if to say something else and then abandons it entirely, pulling you into a ");
	if(gianna.biggestTitSize() >= 8) output("boob-squishing ");
	output("hug. Every now and then, her form quivers and shakes. Her quiet voice murmurs, <i>“Thank you,”</i> again and again, a mantra that only strengthens over time. After what feels like a solid minute of this, she pulls away and");
	if(pc.tallness >= 85) output(" jumps up");
	else if(pc.tallness >= 75) output(" stretches up");
	else if(pc.tallness >= 50) output(" leans over");
	else output(" bends down");
	output(" to give you a kiss on the nose. <i>“You’ve no idea how good it feels to hear that. It’s hard when you’re alone - all you have to go on are your own doubts and suspicions.”</i>");
	output("\n\nGianna steps a little away and claps her hands, composing herself. <i>“Okay, that’s enough drama for right now. Let’s do something else.”</i>");
	processTime(6);
	giannaPersonality(5);
	flags["GIANNA_OWNER_TALK_RESULT"] = 2;
	talkToGianna(false);
	addDisabledButton(2,"Ex-Owner","Ex-Owner","You just finished talking about that.");
}

//Dissuade - -confidence
public function dissuadeGiannaSheTotesIsAThing():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“Gianna, be honest with yourself. No matter your sapience, you are still a thing. He </i>owned<i> you, and the Treated him did not have time for his old things. It’s terrible that you had to go through that. He certainly could have handled it better - maybe sold you off to someone on the extranet, but it was well within his right to wander off and plug some girls till those cows came home.”</i> You speak matter of factly, stating what you see as simple truth.");
	output("\n\nGianna’s lip quivers, and she appears on the verge of crying. The pained look in her eyes flickers and dies, replaced by a depressing sort of acceptance. <i>“Fine.... I just... I’ve been alone so long and every here-”</i> She glances back your way and wilts. <i>“Never mind. Was there something else you would like me to do?”</i>");
	processTime(2);
	giannaPersonality(-10);
	flags["GIANNA_OWNER_TALK_RESULT"] = 0;
	talkToGianna(false);
	addDisabledButton(2,"Ex-Owner","Ex-Owner","You just finished talking about that.");
}

//Neutral - nothing changes
public function giannaAintNoThingNeutral():void
{
	clearOutput();
	giannaDisplay();
	output("You put your hand on her shoulder. <i>“Gianna, babe... that’s in the past now. He’s off banging void knows who, and you’ve built a nice life for yourself, even gained citizenship on a planet. How many other artificial intelligences have managed that feat on an organic planet? My bet is none.”</i>");
	output("\n\nGlancing back your way with a hopeful expression, Gianna slowly nods, tugging on her ponytail as she does so. <i>“Good point. Let’s ditch this conversation like an ausar whore and do something else.”</i>");
	flags["GIANNA_OWNER_TALK_RESULT"] = 1;
	processTime(1);
	talkToGianna(false);
	addDisabledButton(2,"Ex-Owner","Ex-Owner","You just finished talking about that.");
}

//[***]Big T :D
public function talkToGiannaAboutBigT():void
{
	clearOutput();
	giannaDisplay();
	flags["TALKED_TO_GIANNA"] = 1;
	output("<i>“So what about this Big T guy?”</i> you ask.");
	output("\n\nGianna smiles warmly at the question. <i>“What about him?”</i>");
	output("\n\nYou shrug. <i>“Start at the beginning, I guess. How’d you meet him?”</i>");
	output("\n\nThe companion plays with her braid, swishing it back and forth across her chin as she thinks. Her expression sags somewhat but never quite journeys into the realms of sadness. <i>“It’s a long story.");
	if(flags["GIANNA_OWNER_TALK_RESULT"] == undefined) output(" Ask me about my old owner if you want to hear more of that.");
	output(" The short version is that he left - ditched me and his ship after getting treated.”</i> Her lower lip quivers. <i>“I’m a companion damnit! Being alone is like torture and starvation mixed together into a depressing stew for us.”</i> She sighs. <i>“After a week of suffering, I realized I couldn’t take it anymore and stepped off the ship.”</i>");
	output("\n\nYou cock your head, listening intently. <i>“Then?”</i>");
	output("\n\n<i>“Then I hit customs and....”</i> Gianna blushes.");
	output("\n\n<i>“And?”</i> you ask.");
	output("\n\nThe android actually seems to be embarrassed. <i>“It was the fastest I’ve ever gone from an introduction into fucking. I was so desperate to please that I all but begged them to let me give them massages. Ogram just rolled his eyes and whipped it out. Amma just crammed a nipple in my mouth and let me drink until I looked pregnant.”</i> She giggles and rolls her eyes. <i>“Can you imagine me? An android? Pregnant?”</i>");
	output("\n\n<i>“What’s this have to do with Big T?”</i>");
	output("\n\n<i>“");
	if(giannaPersonality() > 20) output("Patience, [pc.name].");
	else output("Please be patient with me, [pc.master] [pc.name].");
	output(" You wanted me to start at the beginning,”</i> the companionable vixen explains. <i>“I’m not sure if customs here really cares about citizenship or anything, because they let me go after that. I waddled out into the planet, and that’s when I met Big T.”</i> She pauses for dramatic effect. <i>“Or rather, when he met me. I wasn’t looking where I was going and walked right in front of his truck. You have no idea how bad pain is for someone with a sense of touch multiple times more sensitive than a terran’s.”</i>");
	output("\n\nYour eyebrows raise in shock. <i>“The guy ran you over?”</i>");
	output("\n\nSmiling broadly, Gianna vigorously nods. <i>“Uh huh!”</i>");
	output("\n\n<i>“And that doesn’t bother you?”</i>");
	output("\n\n<i>“Not really. Sure, the impact damaged some of my internals and knocked me flat, but it isn’t like he didn’t have a high-dollar hovertruck. You know, the kind with distributed force projectors strong enough to let it fly a few hundred feet in the air.”</i> She gestures with her hands to create a fair approximation of a flying truck - or brick. One of the two. <i>“Anyway, I got pushed a few inches into the mud and left with a half-dozen system shorts and synthskin breaches.”</i>");
	output("\n\nYou’re not sure you’d be quite as chipper about it if it was you in her shoes.");
	output("\n\nGianna closes her eyes to focus, and a number of red lines appear across her body. The wistful look never leaves her face. <i>“These were the biggest injuries.”</i> Drawing her finger across the simulated wounds, she pivots to show you the full severity. <i>“So there I am, confused, wracked with agony so bad I can’t move, and half-buried in the dirt.”</i> The pigment of her skin slowly fades back to normal while she talks. <i>“...And Big T, the big softy, is in such a hurry to help me that he trips coming out of his truck and faceplants into the muck next to me. You should’ve seen it! I would’ve laughed if I wasn’t too busy fighting to turn down my sensory resolution.”</i>");
	output("\n\nYou chuckle appreciatively at the mental image.");
	output("\n\n<i>“Well, he pulled himself right up, didn’t even mind the mud, and grabbed me out of the dirt, holding me in his arms in a way I’d never been held before. He was so big, and he was just... gently cradling me.”</i> Her eyes flicker dimly as she loses herself to the memory. <i>“My vocalizer was shot and I was leaking a half-dozen caustic fluids onto his truck’s leather, but he didn’t care. He just kept apologizing and promising to take care of me. I’m not sure where he was going when he hit me, but he flew for two hours looking for a place that could help me.”</i>");
	output("\n\n<i>“He seems like a good guy.”</i>");
	output("\n\nGianna nods, her expression set in firm agreement with you. <i>“He is. Didn’t leave until I was fit to go. He paid the bill without a second glance, and on the way back, we finally got the chance to talk.”</i>");
	output("\n\n<i>“");
	if(!pc.isBimbo() && !pc.isBro()) output("Was he as simple-minded as the rest of the treated citizens?");
	else output("Did he let you suck his cock afterward to thank him? It’d be the only fair recompense.");
	output("”</i>");
	output("\n\nThe thoughtful android shakes her head slowly. <i>“No... not quite. We talked a lot. I apologized for getting in front of his truck, and he apologized for hitting me. We must have gone through that three or four times. But then... then he just put his arm around me, and he promised to take care of me if my Master didn’t return. He was happy just to do that. Just to take care of me.”</i>");
	output("\n\nReally?");
	output("\n\nSeeing your disbelief, she nods again. <i>“Don’t get me wrong, his dick looked like someone had snuck a support beam into the seam of his pants, but he didn’t try to push it on me. I could tell that just by being alive, or as close as I can get to it, I had made him happy.”</i>");
	output("\n\n<i>“Wow.”</i>");
	output("\n\n<i>“I know, right?”</i> the naked, artificial woman seems as wowed as you. <i>“I didn’t figure it out till later, but treated people put out pheromones like smoke from chimneys. They can practically smell each other’s consent. I don’t produce pheromones, so the lug, no matter how confident he may be with the cow-girls, never made a move on me.”</i>");
	//Treated/bimbo/studmuffin
	if(pc.isBimbo() || pc.isBro())
	{
		output("\n\n<i>“That explains a lot actually. I guess you’re lucky I can");
		if(pc.isBimbo()) output(", like,");
		output(" remember how things work outside of New Texas.”</i>");
	}
	//Mischievous
	else if(pc.isMischievous()) output("\n\n<i>“A good thing too. I’d have to have to compete with a guy like that.”</i>");
	//Nice
	else if(pc.isNice()) output("\n\n<i>“Ahh, that explains a lot.”</i>");
	//Ass
	else output("\n\n<i>“His loss.”</i>");
	//Merge
	output("\n\n<i>“Yup!”</i> Gianna chirps. <i>“He dropped me off at the ship and came by every day to visit. He even played some games with me, even though I whupped him so badly that his tail practically tucked itself between his legs when he left.”</i> She straightens her braid and releases it. <i>“After a few weeks I offered to help out around the farm to pay him back for his kindness. He wouldn’t have any of it, but he did start bringing me manuals for the machinery in the barn. Told me I could be a hired hand. He even promised to make me a citizen if I wanted it, even give me my old Master’s ship if he didn’t claim it within a few months.”</i>");
	output("\n\nSpreading her arms, the pale-skinned android looks radiant. <i>“And now here I am. I have a ship to live in, a job that pays me a few credits, and something of a family. Truth be told, I don’t think he knows how to treat me. I may look like a girl, but I don’t smell like one. And here, that’s almost as important.”</i> She shrugs. <i>“So I get to be something between a son and daughter, I suppose.”</i>");
	output("\n\nChewing on her [gianna.lip], she thinks for a moment. <i>“Oh, and he’s the planetary Governor too. That’s how come he was able to pull so many strings for me.”</i>");
	output("\n\nYou rub your chin in thought, taking it all in. <i>“I guess you couldn’t have asked for anyone better to flatten you with their truck.”</i>");
	output("\n\n<i>“You know it, [pc.name]. Bet you’ve never met an A.I. with a governor for an adoptive father, have you?”</i>");
	//Nice
	if(pc.isNice()) output("\n\nYou laugh. <i>“I definitely haven’t.”</i>");
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Well, there was that one time.”</i>");
		output("\n\n<i>“What?! WHERE?”</i>");
		output("\n\nYour can’t help but laugh when she falls for it. She punches you in the shoulder in a friendly way. It still hurts, though. The girl’s got an arm.");
	}
	//Ass
	else
	{
		output("\n\n<i>“Of course not.”</i>");
	}
	//Merge
	output("\n\nLeaning back against the wall, Gianna smiles warmly at you. <i>“It’s nice having someone else that I can talk to, but I think I’ve covered the entertaining stuff. Wanna talk about something else? Or maybe get frisky?”</i> She glances behind her. <i>“The milkers won’t </i>need<i> any maintenance for a while still.”</i>");

	processTime(17);
	approachGianna("noText");
}

//Resize
//Gianna starts with a pool of 26 silicone points to distribute. Max 70
//Ass - max 25 = Min-5, 7, 9, 15, 20
//Boobs - max 41
//Lips - max 25. Five points = 1 point of lip-rating

//Initial distribution:
//Ass - 9
//Boobs - 8
//Lips - 5
//Reserve - 6


public function giannaBodyModMenu(display:Boolean = true):void
{
	if(display)
	{
		clearOutput();
		giannaDisplay();
		//First time menu entrance
		if(flags["BEEN_IN_GIANNA_BODYMOD_MENU"] == undefined)
		{
			output("<i>“Would you resize yourself if I asked you to?”</i> you question.");
			output("\n\nGianna poses for you. <i>“Baby, I can look like anything from an ultraporn star to a newly-matured maiden.”</i> She hefts her breasts. <i>“I can blow these up till I have trouble walking.”</i> She spins to shake her ass at you. <i>“I can make this ass so big that you’d need climbing equipment for doggy-style.”</i> Looking over her shoulder, she purses her plump lips. <i>“I can even make these so big that the bulls won’t be able to walk past without needing to ram their cock into my mouth, just to feel these pillows on their dick.”</i>");
			output("\n\nFinally, she straightens and considers you. <i>“I find my current attributes to be a decent middle-ground between being sexually attractive and able to move about unhindered by my own weight. I wouldn’t really mind toning it down for you, if that’s what you really wanted, so long as you keep visiting. The bulls like how I look now, and I’m not sure how I could handle being ignored if there wasn’t at least someone to keep me company.”</i> A sly smirk spreads across her lips. <i>“Unless... you wanted me to pump myself up for you. I wouldn’t mind blowing up my tits for you, or giving you a rump you could really sink your fingers into. Just so long as we don’t go so big that I can’t work.”</i>");
			output("\n\nSurprised at just how far she’s willing to go to please and curious if you can push her further, you ask her what she would do if you really wanted her to be immobilized by her breasts, or sport a butt that pinned her to the floor.");
			output("\n\nEyes dimming thoughtfully, Gianna answers, <i>“I’d get them as close as I could without immobilizing myself. I can’t just lay around all day being your over-inflated fuck-pillow, after all.”</i> She tugs at her braid. <i>“And it doesn’t matter anyway. The silicone I have in me is all I have!”</i>");
			output("\n\nA look of disbelief spreads across your face. <i>“Wait, really?”</i>");
			output("\n\n<i>“Yeah,”</i> Gianna drawls, showing a hint of the local accent, <i>“It doesn’t last forever, so I need to change it out from time to time. Obviously my old master isn’t providing any more, so I have to get it myself.”</i> She pouts. <i>“Big T. doesn’t pay me very much, but it was enough to order more. I just wish the gakking shipment had made it here.”</i>");
			output("\n\nYou ask, <i>“What happened to it?”</i>");
			output("\n\n<i>“Varmints,”</i> is Gianna’s steely answer. <i>“Some of them seem to have a taste for silicone. I suppose their physiology has some use for the stuff.”</i> She stamps her foot a little petulantly. <i>“That’s why I can’t go out in the fields! They’d tear me to pieces trying to get at it.”</i>");
			output("\n\n<i>“That’s awful.”</i>");
			output("\n\nNodding, Gianna rubs her arms, a little uncomfortable with the idea of being eaten. <i>“Turns out you don’t have to be organic to get eaten on New Texas.”</i>");
			//Mischievous
			if(pc.isMischievous()) output("\n\n<i>“Ain’t that the truth. I could eat you up!”</i> You lick your lips for emphasis, earning you a giggle from the smiling android.");
			//Merge
			output("\n\n<i>“Anyhow, I’ll shift the goods I’ve got around if you want, but if you really want to pump me up, you’re going to have to find me more silicone somewhere. They might not have eaten all of it yet. You know how animals are - they’ll hoard food if they have extra.”</i>");
			output("\n\nNodding to yourself, you stroke your chin in thought. <i>“If I come across any out there, I’ll be sure and bring it back to you.”</i>");
			output("\n\n<i>“Really?”</i> Gianna asks, her hands clasped like an excited schoolgirl. <i>“I’ve gotten flowers before, but no one here has ever done something like this for me.”</i> She plants a surprisingly chaste kiss on your cheek. <i>“You get me that silicone and I’ll look like anything you want, but until then we can make tweaks, if you like.”</i>");
			flags["BEEN_IN_GIANNA_BODYMOD_MENU"] = 1;
			//Menu
		}
		//Repeat Menu
		else
		{
			output("<i>“Up for a little resizing?”</i> you ask Gianna.");
			output("\n\n<i>“");
			if(giannaPersonality() >= 66) output("Only if you’re going to stick around to give the changes a thorough testing.");
			else if(giannaPersonality() >= 33) output("Sounds fun. I could use a change of pace!");
			else output("Of course. I live to please.");
			output("”</i>");
		}
		output("\n\nWhat do you ask her to do?");
	}
	//Menu Layout
	//[Increase Breasts]	 [Increase Ass] 	[Increase Lips]		[Distribution]
	//[Decrease Breasts]	 [Decrease Ass] 	[Decrease Lips]		[Give Silicone]
	//Butt boost buttons!
	clearMenu();
	addButton(3,"Distribution",giannaSiliconeDistributionDisplay,undefined,"Distribution","Check on her current silicone levels.");
	if(gianna.biggestTitSize() <= 3)
	{
		if(giannaAvailableSilicone() >= 5) addButton(0,"IncreaseBoobs",increaseGiannaBoobs,5,"IncreaseBoobs","Make Gianna’s [gianna.chest] bigger.");
		else addDisabledButton(0,"IncreaseBoobs","IncreaseBoobs","You need at least 5 units of silicone to increase Gianna’s bust to the next tier.");
		addDisabledButton(5,"Shrink Breasts","Shrink Breasts","There’s no talking Gianna into making her boobs any smaller. C-cups will have to do.");
	}
	else if(gianna.biggestTitSize() <= 8)
	{
		if(giannaAvailableSilicone() >= 10) addButton(0,"IncreaseBoobs",increaseGiannaBoobs,10,"IncreaseBoobs","Make Gianna’s [gianna.chest] bigger.");
		else addDisabledButton(0,"IncreaseBoobs","IncreaseBoobs","You need at least 10 units of silicone to increase Gianna’s bust to the next tier.");
		addButton(5,"Shrink Breasts",decreaseGiannaBoobs,5,"Shrink Breasts","Shrinking Gianna’s [gianna.chest] will free up 5 units of silicone.");
	}
	else if(gianna.biggestTitSize() <= 18)
	{
		if(giannaAvailableSilicone() >= 23) addButton(0,"IncreaseBoobs",increaseGiannaBoobs,23,"IncreaseBoobs","Make Gianna’s [gianna.chest] bigger.");
		else addDisabledButton(0,"IncreaseBoobs","IncreaseBoobs","You need at least 23 units of silicone to increase Gianna’s bust to the next tier.");
		addButton(5,"Shrink Breasts",decreaseGiannaBoobs,10,"Shrink Breasts","Shrinking Gianna’s [gianna.chest] will free up 10 units of silicone.");
	}
	else
	{
		addDisabledButton(0,"IncreaseBoobs","IncreaseBoobs","Gianna’s mountainous mounds are as big as she’s willing to go with them. Any larger and they would interfere with her work.");
		addButton(5,"Shrink Breasts",decreaseGiannaBoobs,23,"Shrink Breasts","Shrinking Gianna’s [gianna.chest] will free up 18 units of silicone.");
	}

	if(gianna.buttRating() <= 5) 
	{
		if(giannaAvailableSilicone() >= 4) addButton(1,"Increase Ass",increaseGiannaAss,4,"Increase Ass","Make Gianna’s [gianna.butt] bigger.");
		else addDisabledButton(1,"Increase Ass","Increase Ass","You need at least 4 units of silicone to increase her ass size by one step.");
		addDisabledButton(6,"Shrink Ass","Shrink Ass","Gianna’s tiny booty is as little as she’s going to allow.");
	}
	else if(gianna.buttRating() <= 7)
	{
		if(giannaAvailableSilicone() >= 4) addButton(1,"Increase Ass",increaseGiannaAss,4,"Increase Ass","Make Gianna’s [gianna.butt] bigger.");
		else addDisabledButton(1,"Increase Ass","Increase Ass","You need at least 4 units of silicone to increase her ass size by one step.");
		addButton(6,"Shrink Ass",diminishGiannaButt,4,"Shrink Ass","Shrinking Gianna’s [gianna.butt] will free up 4 units of silicone.");
	}
	else if(gianna.buttRating() <= 9)
	{
		if(giannaAvailableSilicone() >= 12) addButton(1,"Increase Ass",increaseGiannaAss,12,"Increase Ass","Make Gianna’s [gianna.butt] bigger.");
		else addDisabledButton(1,"Increase Ass","Increase Ass","You need at least 12 units of silicone to increase her ass size to the next size up.");
		addButton(6,"Shrink Ass",diminishGiannaButt,4,"Shrink Ass","Shrinking Gianna’s [gianna.butt] will free up 4 units of silicone.");
	}
	else if(gianna.buttRating() <= 15)
	{
		if(giannaAvailableSilicone() >= 10) addButton(1,"Increase Ass",increaseGiannaAss,10,"Increase Ass","Make Gianna’s [gianna.butt] bigger.");
		else addDisabledButton(1,"Increase Ass","Increase Ass","You need at least 10 units of silicone to increase her ass size to the next size up.");
		addButton(6,"Shrink Ass",diminishGiannaButt,12,"Shrink Ass","Shrinking Gianna’s [gianna.butt] will free up 12 units of silicone.");
	}
	else
	{
		addDisabledButton(1,"Increase Ass","Increase Ass","Gianna’s butt is as big as she’s willing to go with it!");
		addButton(6,"Shrink Ass",diminishGiannaButt,10,"Shrink Ass","Shrinking Gianna’s [gianna.butt] will free up 10 units of silicone.");
	}

	//LipDecrease!
	if(gianna.lipMod <= 0) 
	{
		if(giannaAvailableSilicone() >= 2) addButton(2,"Increase Lips",increaseGiannaLips,2,"Increase Lips","Make Gianna’s [gianna.lips] bigger.");
		else addDisabledButton(2,"Increase Lips","Increase Lips","You need at least 2 units of silicone to increase her lip size by one step.");
		addDisabledButton(7,"Shrink Lips","Shrink Lips","Gianna’s tiny booty is as little as she’s going to allow.");
	}
	else if(gianna.lipMod <= 1)
	{
		if(giannaAvailableSilicone() >= 2) addButton(2,"Increase Lips",increaseGiannaLips,2,"Increase Lips","Make Gianna’s [gianna.lips] bigger.");
		else addDisabledButton(2,"Increase Lips","Increase Lips","You need at least 2 units of silicone to increase her lip size by one step.");
		addButton(7,"Shrink Lips",giannaLipDecrease,2,"Shrink Lips","Shrinking Gianna’s [gianna.lips] will free up 2 units of silicone.");
	}
	else if(gianna.lipMod <= 2)
	{
		if(giannaAvailableSilicone() >= 2) addButton(2,"Increase Lips",increaseGiannaLips,2,"Increase Lips","Make Gianna’s [gianna.lips] bigger.");
		else addDisabledButton(2,"Increase Lips","Increase Lips","You need at least 2 units of silicone to increase her lip size to the next size up.");
		addButton(7,"Shrink Lips",giannaLipDecrease,2,"Shrink Lips","Shrinking Gianna’s [gianna.lips] will free up 2 units of silicone.");
	}
	else if(gianna.lipMod <= 3)
	{
		if(giannaAvailableSilicone() >= 2) addButton(2,"Increase Lips",increaseGiannaLips,2,"Increase Lips","Make Gianna’s [gianna.lips] bigger.");
		else addDisabledButton(2,"Increase Lips","Increase Lips","You need at least 2 units of silicone to increase her lip size to the next size up.");
		addButton(7,"Shrink Lips",giannaLipDecrease,2,"Shrink Lips","Shrinking Gianna’s [gianna.lips] will free up 2 units of silicone.");
	}
	else if(gianna.lipMod <= 4)
	{
		if(giannaAvailableSilicone() >= 2) addButton(2,"Increase Lips",increaseGiannaLips,2,"Increase Lips","Make Gianna’s [gianna.lips] bigger.");
		else addDisabledButton(2,"Increase Lips","Increase Lips","You need at least 2 units of silicone to increase her lip size to the next size up.");
		addButton(7,"Shrink Lips",giannaLipDecrease,2,"Shrink Lips","Shrinking Gianna’s [gianna.lips] will free up 2 units of silicone.");
	}
	else
	{
		addDisabledButton(2,"Increase Lips","Increase Lips","Gianna’s lips are as big as she’s willing to go with them!");
		addButton(7,"Shrink Lips",giannaLipDecrease,2,"Shrink Lips","Shrinking Gianna’s [gianna.lips] will free up 2 units of silicone.");
	}
	
	if(pc.hasItemByClass(Silicone,1)) addButton(8,"GiveSilicone",giveGiannaSilicone,undefined,"GiveSilicone","Give Gianna a bag of silicone.");
	else addDisabledButton(8,"GiveSilicone","GiveSilicone","You need to find a bag of silicone before you can give it to Gianna.");

	if(!gianna.hasStatusEffect("Hose Plugged In")) addButton(14,"Back",approachGianna,"back");
	else addButton(14,"Back",unhookGiannaHose);
}

public function unhookGiannaHose():void
{
	clearOutput();
	giannaDisplay();
	output("Gianna says, <i>“One sec!”</i> Twisting almost 180 degrees around, she gives the hose in her back a gentle twist. It comes off with a pop and retracts into one of the machines in the wall. Her blue eyes seem alight with electric energy. <i>“What now?”</i>");
	gianna.removeStatusEffect("Hose Plugged In");
	approachGianna("noText");
}

//OLD RESIZE NOTES
//Gianna starts with a pool of 26 silicone points to distribute. Max 70
//Ass - max 20 = Min-5, 7, 9, 15, 20
//Boobs - max 41
//Lips - max 25. Five points = 1 point of lip-rating

//Initial distribution:
//Ass - 9
//Boobs - 8
//Lips - 5
//Reserve - 6

//NEW RESIZE NOTES
//RATING RANGES
//buttrating - 5 to 20.
//boob rating - 3 to 41
//lips 1 to 5.

//Costs: lips = 2:1 = max = 10 silicone.
//Boobs: 1:1 = max = 41 silicone.
//Butt: 2:1 = max = 40 silicone.
//Gianna max volume available: 75

//Distribution
public function giannaSiliconeDistributionDisplay():void
{
	clearOutput();
	giannaDisplay();
	output("You ask Gianna how her silicone is currently distributed. She answers with a smile.");
	output("\n\n<b>Total Silicone Used:</b> " + giannaSiliconeUsed() + " units");
	output("\n\n<b>Available Silicone:</b> " + giannaAvailableSilicone() + " units");
	output("\n\n<b>Breast Silicone:</b> " + gianna.biggestTitSize() + " units");
	output("\n\n<b>Posterior Silicone:</b> " + (gianna.buttRating() * 2) + " units");
	output("\n\n<b>Lip Silicone</b>: " + (gianna.lipMod*2) + " unit");
	if(gianna.lipMod*2 != 1) output("s");
	//Redisplay menu with Distribution grayed out.
	giannaBodyModMenu(false);
	//disable distribution
	addDisabledButton(3,"Distribution","Distribution","You’re already in the distribution menu!");
}

//[***] Increase Breasts
public function increaseGiannaBoobs(siliconeUsed:int):void
{
	clearOutput();
	giannaAvailableSilicone(-siliconeUsed);
	//C->E
	if(gianna.biggestTitSize() <= 3)
	{
		output("You ask her if she could increase her breasts back up to their old size.");
		output("\n\n<i>“");
		if(giannaPersonality() >= 70) output("I think someone wants me to have bigger, fuller titties to smother [pc.him] in!");
		else if(giannaPersonality() >= 30) output("I thought you’d, like, never ask. I kind of missed the girls, you know?");
		else output("Of course, [pc.name]. Allow me a moment to make the adjustment.");
		output("”</i> ");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output("Grabbing the silicone-reservoir’s hose and snapping it into the port on her spine, ");
		}
		output("Gianna readies herself by gently cupping her [gianna.chest] in her hands. A muffled whirring starts up from somewhere inside Gianna. <i>“At least I won’t look so small compared to the cows anymore.”</i>");
		output("\n\nGasping, Gianna looks down at her chest when it begins to swell. The effect is most noticeable on her nipples; first one bloats, inflating like a little balloon, before shrinking back down to a slightly enhanced size. Then the other goes through the same process, filling with so much silicone that it jiggles a little before assuming a more proportional size. A shiver works through the android’s nipples as her breasts round out, filling first her palm and then her fingers.");
		output("\n\nThe companion droid looks your way and smiles when her fingertips sink into a sea of creamy titflesh. Her eyes are practically sparking with excitement; a blush slowly grows across her cheeks. When she does talk, it’s in a panting, breathless-sounding whisper. Her reactions are always so genuinely human. Even though she has no need to breathe, she still sounds about to hyperventilate. <i>“Fuck, I forgot how good filling these puppies up can feel.”</i> She smirks, a thought occurring to her. <i>“I should buy a sweater so I can call them sweaterpuppies, then pump them up until they tear out of it.”</i> Were her nipples this hard a minute ago?");
		output("\n\nGiggling, Gianna plays with her new breasts, bouncing them up and down, smushing them together, even rubbing her thumbs in little circles around her nipples. Her eyes take on a glazed, far away look, and her blush is slowly spreading down her body, lending her newly-formed E-cups a rosy shine.");
		output("\n\nYou quietly clear your throat.");
		output("\n\n<i>“Oh, sorry,”</i> Gianna says a little breathlessly, pulling her hands away from her new, perfectly formed E-cups. <i>“I was just getting reacquainted with the girls is all. Did you want to adjust something else? Maybe see how I’d look with double G’s?”</i>");
		gianna.breastRows[0].breastRatingRaw = 8;
	}
	//E->GG
	else if(gianna.biggestTitSize() <= 8)
	{
		output("<i>“Could you go a little bigger?”</i>");
		output("\n\nGianna’s eyebrows shoot up in surprise, then drop into a low, sultry look. <i>“");
		if(giannaPersonality() >= 75) output("Could they go bigger? Of course they could. I can swell them up till they’re bigger than your head, with nipples so large you could palm them. Just watch.");
		else if(giannaPersonality() >= 25) output("You want me to have boobs like the cows huh? Big, fat tits that just look they’d hose milk at the slightest provocation? Well, I won’t be able to lactate, but I can certainly be your big-breasted android bimbo, if that’s what you want. Just watch.");
		else output("Of course I can go bigger, if that’s what you wish. I can go much, much bigger, but for now, I’ll merely go a little bigger, as you requested. Then, if you want me even curvier, I can do it for you.");
		output("”</i> ");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output("Grabbing the hose and snapping it into place in the port in her spine, ");
		}
		output("the manufactured minx readies herself. <i>“Here goes.”</i>");
		output("\n\nA whining, electric hum starts up from somewhere inside the android, and out of nowhere, her twin globes <i>jiggle</i>. It isn’t in reaction to any sudden movement; her boobs are just shuddering, languidly shaking against one another as if their owner were bouncing on a trampoline. Of course she isn’t. She’s just standing there while her quivering tits start to swell. The change is almost imperceptible at first, but after a few moments of shaking, her nipples abruptly jut out, then thicken. The areolae expand at the same time, spreading out until they’re as wide as baseballs, then small plates.");
		output("\n\nNow openly moaning, Gianna grabs her expanding assets and squeezes, sinking her fingertips so deep into her swelling melons that it’s hard to see anything past the knuckle, just cream-white breast. The blushing bot kneads at her billowing bosom, oblivious to how fast it’s filling out. Soon, her breasts dominate her chest like the prow of a ship. Her grip is keeping them up high enough to block out her shoulders. The mountains she has for tits are going to be impossible to ignore.");
		output("\n\nSuddenly slumping to her knees, Gianna shudders, sending her newly grown boobs bouncing in earnest. <i>“Ffffuuuuck,”</i> she gasps, her whole body wracked by twitches, before falling onto her side, her new tits bouncing. The motor’s hum dies down, but the seizing android continues to twist and moan. Her fingers never leave their newly discovered perches. You can see two of them wrapped around a nipple, squeezing it hard. Gianna’s back arches, and she screams, suddenly squirting a torrent of lubricant from her smooth, hairless pussy onto the floor.");
		output("\n\n<i>“Are you okay?”</i>");
		output("\n\nSlowly stilling, the chesty woman nods, biting her [gianna.lip] to keep from crying out again. She pushes herself up onto her hands and knees, then climbs up with the aid of a nearby crate. <i>“Yeah, I just... wow. It’s fucking fun to keep stepping up my body’s nervous resolution while my tits are growing. I-oooohhhh...”</i> Another wave of wetness splatters the floor, and Gianna drunkenly staggers into you, keeping herself up by letting her enlarged boobs wrap around your side. <i>“It’s easy to forget how good a self-induced orgasm can be. I’m surprised the locals don’t masturbate more often, actually.”</i>");
		output("\n\nGianna stays there a while, just holding you. When she pushes away, it’s with a wistful smile on her face. <i>“");
		if(giannaPersonality() > 80) output("Maybe next time I’ll pin you under them while I’m pumping them up and let you play with them until I exhaust my lube reserves.");
		else if(giannaPersonality() >= 20) output("How was that? Toss me in a cow-print bikini and let me pigment my skin, and I’d easily pass for one of those treated bimbos. And how many of them can give you a show like I just did? Not many!");
		else output("You... you’re a good master, you know that? It’s fun having these.");
		output(" Now, do you want me to make them as big as I can, or something else? M-cup is as far as I can go.”</i>");
		gianna.breastRows[0].breastRatingRaw = 18;
	}
	//GG->M
	else
	{
		output("<i>“Let’s do it - make your breasts as big as you can,”</i> you instruct.");
		//Dommyiana
		if(giannaPersonality() > 80)
		{
			output("\n\nSmiling now, Gianna hefts her considerable chest as well as she can. Most of her hands are swiftly consumed by the rampant underbust. <i>“Awww, is this not enough for you?”</i> She bounces them on her palms, trying not to moan at the feelings they set off inside her. <i>“You want them even bigger? I wish I could make them so big that you could sleep in between them - use them as a bed. Of course this bed would give you orgasms until you were ready to sleep every single night. A shame I need to keep them decent sized for my job.”</i> She shrugs. <i>“Why don’t you watch, and if the change pleases you, I’ll squeeze a few orgasms out of you with them.”</i>");
		}
		//Normal Gianna
		else if(giannaPersonality() >= 20) 
		{
			output("\n\nArching a perfectly smoothed eyebrow at you, Gianna giggles. <i>“Really? You want them even bigger?”</i>");
			output("\n\nYou nod, perhaps a little over eagerly.");
			output("\n\n<i>“You’re the first person to ever want them this big, you know that?”</i> Gianna pokes your chest with her finger. <i>“No one else has ever wanted my breasts so big... except maybe me.”</i> She blushes slightly at the admission. <i>“I can’t take them up past M-cups, though. I wouldn’t be able to work. Still, I’ll be big enough to make some of the cows jealous. Big enough to titfuck a titan.”</i> She leans in close, her silicone engorged mounds brushing your [pc.belly]. <i>“Big enough for them to be your personal playground. Watch. I’ll try to make it entertaining.”</i>");
		}
		//Subby Gianna
		else
		{
			output("\n\nGianna smiles at that. <i>“I would enjoy that, I think. Sadly, I cannot go above an M-cup and still perform the tasks I’ve been assigned here at the farm. Still...”</i> She shakes her spectacularly bouncy bosom at you. <i>“That leaves me room to double their size for you, [pc.master] [pc.name]. I hope it pleases you. I’ll doubtless have an orgasm myself from the transition. Please watch.”</i>");
		}
		//Merge
		output("\n\nStepping back");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" to snap the silicone hose into the port in her back");
		}
		output(", the artificial seductress braces herself, leaning her shoulders against an overhanging crate. The muffled sound of a motor revving up somehow makes its way through her flesh as she begins to pump the silicone into herself. You can see it surging through the clear tube. Thick globs of the stuff are going into her, and you can’t even see the change yet. You suppose that with tits that big, it takes a lot of material to make a visible difference in their size.");
		output("\n\nGianna’s nipples pop out first, bigger and harder than they ever were before the pump turned on. A blush radiates out from around them, matched by patches of rosy color on her face as well. She awkwardly reaches forward with her hands, having to bend them at the elbows around the jiggling nipple-mounts. When she does manage to grab her engorged areolae, her thighs quiver, and she moans. Gianna looks over at you, a little dazed - pleasure drunk on her body’s simulated biofeedback - and gently tugs on her teats, moaning all the louder.");
		output("\n\nHer chest is definitely getting bigger now. You can tell by the way that it squeezes in around her arms, swelling out above and below, her tits turning into cartoonish parodies of their former selves. Gianna appears oblivious to it all as well. Her eager fingers are practically raping her expanding nipples, and her eyelids have drooped closed. Somehow she’s staying upright against the crate. You don’t think she will for long.");
		output("\n\nThe android’s thighs are shivering and shaking like a hypothermic terran’s, and her boobs haven’t escaped the vibrations either, bouncing and jiggling from within Gianna’s tight hug. Their expanding size soon proves too much for the near-orgasmic android, forcing her arms apart. Her nipples slip from twitching fingers as the breasts themselves swell past the size of beach balls, leaving her fingers with nothing to molest save for her juicy, lube-drooling entrance. <i>“Fuck yes,”</i> she calls, stuffing eight of her fingers into herself and thrusting her pelvis violently forward.");
		output("\n\nClear juices spray out around the obstruction her digits provide when Gianna’s orgasm is thrust upon her with about as much subtlety as her hyper-sized rack provides. She screams, slipping a fist into herself, and topples forward onto her tits. The gushing android girlspunk has formed a large puddle around her knees, and her rock-hard nipples slip and slide through the morass, only serving to further excite the bliss-overloaded girl. Her legs flail like streamers in a monsoon, and her pussy continues to pour juice out like some kind of erotic fountain.");
		output("\n\nEventually, the gentle buzz of her internal pump dies down as the fucked-out titty-monster manages to roll over, languidly withdrawing her fingers from her still-twitching cunny. Gianna smiles radiantly up at you, running her cunt-slickened fingers across her smooth, ivory synthskin in wonder. So much of her is covered up by her enormous tits. She nibbles uncertainly on her bottom lip, asking, <i>“Can I keep them?”</i>");
		output("\n\nYou chuckle warmly in response while she climbs to her feet. What now?");
		gianna.breastRows[0].breastRatingRaw = 41;
	}
	giannaDisplay();
	processTime(5);
	pc.changeLust(5);
	giannaBodyModMenu(false);
}

//[***] Decrease Breasts
public function decreaseGiannaBoobs(siliconeReturned:int):void
{
	clearOutput();
	giannaAvailableSilicone(siliconeReturned);
	//M->GG
	if(gianna.biggestTitSize() >= 41)
	{
		output("You suggest she reduce her breasts a little. Isn’t it hard to carry them around all the time?");
		output("\n\nGianna pouts. ");
		//Dommy
		if(giannaPersonality() >= 70)
		{
			output(" <i>“Aww, I was just getting used to them! My god, the bulls’ eyes practically pop out of their heads every time they walk by. And you,”</i> she says, sashaying forward to rub them against your [pc.chest], <i>“...you should see the way you look at them when I do this.”</i> She grabs you by the chin and pulls your face up to meet her gaze. <i>“See? But if that’s what you really want, I can take them down a little for you.”</i>");
			pc.changeLust(3);
		}
		//Normal
		else if(giannaPersonality() >= 35)
		{
			output(" <i>“Aww, and I was just starting to like having them. Sure, they get in the way a lot, but the guys around here are way more attentive when you have hooters that put their cowgals to shame.”</i> She presses them against your chest and winks. <i>“I thought you liked them too, but I’ll shrink them down a little if that’s what you want. Just give me a second.”</i>");
		}
		//Subby
		else
		{
			output("\n\n<i>“Awww, really?”</i>");
			output("\n\nYou nod firmly.");
			output("\n\n<i>“Okay, I guess.”</i> She lifts one breast to her mouth and gives it a kiss, releasing it to do the same to the other a moment later. The motions set them swaying and bouncing almost hypnotically. <i>“Goodbye girls. I’ll just have to play with the smaller yous twice as hard!”</i>");
		}
		//Merge
		output("\n\n");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output("Snapping the hose into place, ");
		}
		output("Gianna sighs and closes her eyes. <i>“");
		if(giannaPersonality() >= 40) output("You better not");
		else output("Please don’t");
		output(" ignore me just because my breasts aren’t blown up to the size of houses any more.”</i> A look of supreme concentration crosses her face. Her internal motor starts up just after, siphoning silicone out through the tube in her back. She gently hefts her diminishing breasts, struggling at first to keep them stable as they shrink. There’s no signs of stretch marks or folds of unnecessary skin. Through it all, the slutty android’s dermis remains smooth and unblemished, as appealing as any living woman’s.");
		output("\n\nThe saucer-sized nipples are the first thing to go. They’re barely as big as a small plate now, and the torso-blocking mammaries aren’t faring much better. They’ve already shrunk down to the size of beach balls, and though the rate is slowing, they’re still getting a little smaller. Gianna smiles sadly and shuts the motor off. <i>“Now those... those were </i>tits<i>.”</i> She looks your way a little sadly. <i>“What now?”</i>");
		gianna.breastRows[0].breastRatingRaw = 18;
	}
	//GG->E
	else if(gianna.biggestTitSize() >= 18)
	{
		output("<i>“You were probably right with how you had them when we met. Could you make them like that again?”</i>");
		//Dommy
		if(giannaPersonality() >= 75)
		{
			output("\n\nSmiling mirthfully, Gianna lifts her breasts into her hands, being sure to show you how deeply her fingers sink into their forgiving flesh. <i>“I guess all this is a little bit much for you, huh? No problem, [pc.name].”</i> She stalks forward, rubbing her nipples with her index fingers. <i>“I’ll make them like they were the day we met, and you can fall in love with them all over again.”</i>");
		}
		//Normal
		else if(giannaPersonality() >= 33) output("\n\nBlushing a little, Gianna lifts her breasts a little higher, letting her fingers sink into the forgiving flesh. <i>“You liked me even without these gigantic boobs?”</i> She beams. <i>“I’ll make them just like they were, and I promise, you can touch them whenever you want. You don’t even have to ask, okay? Let me get them juuuust right for you.”</i>");
		//Subby
		else output("\n\nNodding respectfully, Gianna hefts her enhanced bust with a clinical eye. <i>“This is a little bit much. Were I organic, my back would probably be hurting right now.”</i> An excited twinkle gleams in her eye. <i>“And I guess you really did like me how I was when we met. I promise, they’ll be just like they were, for you, [pc.name].”</i>");
		//Merge
		output("\n\n");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output("Grabbing the hose to her silicone reserve hose and snapping it into place, ");
		}
		output("Gianna prepares herself. Her eyelids flutter closed as she focuses, and her grip on her breasts loosens to something a little more supportive if still affectionate. <i>“Here goes.”</i> The gentle whirring of her internal motor spins up to a muffled whine. As you watch, the obscene tits that the android once spouted shrink down, starting with her fat nipples. They might have once been the size of dinner plates, but now they’ll have to settle for being big, kissable teats.");
		output("\n\nFrom time to time, Gianna groans with effort, something about adjusting her tactile resolution to match her new size’s native resolution. Then, the motor clicks off, leaving the companion holding two tremendous handfuls of tit. Just enough enough to produce eye watering amounts of cleavage without being bulky or overly obscene. <i>“Perfect,”</i> she chimes.");
		output("\n\nThey really do look the same as when you first met. The girl’s got control, that’s for sure.");
		output("\n\n<i>“Want to put all that silicone somewhere else?”</i>");
		gianna.breastRows[0].breastRatingRaw = 8;
	}
	//E->C
	else
	{
		output("<i>“Make them smaller,”</i> you say. <i>“Can you get rid of them entirely?”</i>");
		//Dommy
		if(giannaPersonality() >= 80)
		{
			output("\n\nGianna folds her arms across her chest. <i>“No. Not happening. This is the planet of big-tittied cow-girls. I’m not gonna go around with a flat chest being ignored by everybody! Although....”</i> She scrunches up her nose as she thinks. <i>“Guys that might like tighter, more toned girls would have a hard time finding a trim piece of ass. All right, [pc.name]. I’ll take them down to C-cups, just to try them on.”</i>");
		}
		//Normal
		else if(giannaPersonality() >= 20)
		{
			output("\n\nYou’re pretty sure Gianna couldn’t look any more disappointed than she does now. <i>“No tits? No way. I am not going to be ignored by everyone here. Remember, [pc.name], I need to make people happy, and that’s hard to do if no one even wants to say ‘hi’.”</i> She tugs her ponytail in irritation. <i>“I could do C-cups. Be the small-breasted tightbody. I bet there’d be more than a few people who would enjoy that, but that’s as small as I’m going to go.”</i>");
		}
		//Subby
		else
		{
			output("\n\nThe android looks about ready to cry but suddenly stares at you defiantly. <i>“No, [pc.name]. I may be an android designed to obey and bring happiness to those around her, but I will not turn myself into some kind of ugly, flat-chested waif for you.”</i> She softens a little, looking apologetic. <i>“C-cups would still be attractive, in a fit-girl kind of way.”</i> Brightening, the android carries on. <i>“Yeah, I’ll take them down to C’s for you. It’s the best I can do.”</i>");
		}
		//Merge
		output("\n\nClosing her eyes");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" and plugging the silicone hose into her spinal port");
		}
		output(", Gianna hums. It soon blends together with the gentle, muffled whirring that the pump in her chest makes. <i>“Here goes,”</i> she whispers, hefting her curvy mounds one last time before they recede. Her large nipples are the first to go, shrinking down until they’re a more appropriate size for C-cups. You’d bet they’re only capable of sticking out a half inch at their hardest.");
		output("\n\nThe rest of her chest follows suit. Where once the android had a big, rounded bosom, she’s now shifting towards having a pair of pear-shaped boobs, perfectly sized to be just about a handful of tit. <i>“There,”</i> Gianna gasps and shuts off her pump. <i>“C-cups. Big enough to remind everyone that I’m a girl, small enough not to get in the way, and the perfect thing to entice a bull that wants to try something different from the usual mountainous melons.”</i> She pinches a nipple and gasps in delight. <i>“I might have made them more sensitive to account for their small size.... What’s next?”</i>");
		gianna.breastRows[0].breastRatingRaw = 3;
	}
	giannaDisplay();
	processTime(3);
	giannaBodyModMenu(false);
}

//[***] Increase Ass
public function increaseGiannaAss(siliconeUsed:Number):void
{
	clearOutput();
	giannaDisplay();
	//Use up dat silicone.
	giannaAvailableSilicone(-siliconeUsed);
	//5 -> 7 butt inflation (soft n’ squeezeable to shapely and hand-filling)
	if(gianna.buttRating() <= 5)
	{
		output("<i>“Could you make your butt bigger again?”</i>");
		output("\n\nGianna bounces excitedly. <i>“Really?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Yes!”</i> She actually does a little dance, kicking and waving in excitement. She calms when she sees you standing there watching and blushes blue. <i>“I uh... wasn’t getting my attention from anyone but you, and the cows are too nice to make fun of me, but I could tell they pitied me.”</i> She pouts. <i>“I’d only get the occasional pity fuck!”</i>");
		output("\n\n<i>“I didn’t know,”</i> you answer, scratching the back of your head a little uncomfortably.");
		output("\n\nGianna sighs. <i>“I didn’t want to bother you with it, and there was still one bull that really liked bulging my little butt. Besides, you liked it, right? That was enough for me. But now... now you’re going to like it being bigger, and I won’t have to look like a 16 year-old in the ass department.”</i>");
		output("\n\nYou smile back. Her enthusiasm for pumping up her butt is more than a little contagious. <i>“Let’s do it.”</i>");
		output("\n\nThe companion nods, her blue blush turning purple, then excited pink. She echoes, <i>“Let’s do it.”</i>");

		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" She snaps the hose into her spine.");
		}
		output("\n\nA little silicone sloshes through the pipe, and Gianna gasps like a woman who’s just had a bucket of ice water dumped over her. Her small little butt gains more and more shape with each passing second. When the hose clicks off, she’s left with two nice-sized handfuls for you to squeeze.");
		output("\n\nTwisting around, the android examines her chassis’ new back-end. <i>“Much better.”</i> She looks back at you, eyes hopeful. <i>“Are we gonna make it bigger, like it was when we met?”</i>");
		gianna.buttRatingRaw = 7;
	}
	//7 -> 9 butt inflation (shapely and hand-filling to big and bouncy)
	else if(gianna.buttRating() <= 7)
	{
		output("<i>“I have to admit, I think you looked better with your butt like it was when we met.”</i>");
		output("\n\nGianna nods in agreement. <i>“I know, right?”</i> She swivels in place, shaking the handfuls she’s got at you. <i>“These are pretty good for blending in with normal terran society, but on a planet like New Texas, it’d be hard to pick me out from the wallpaper. Girls here pack so much T&A that you’ve got to be packing plenty of your own to get noticed, even in a professional capacity.”</i>");
		output("\n\nThe robotic companion smiles dreamily. <i>“I might complain about those milky bimbos sometimes, but I really came to appreciate the proportions they inspired in me.”</i>");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" She clicks the hose into place.");
		}
		else output(" She checks the seal on the hose to make sure it’s still solidly connected.");
		output(" <i>“I felt attractive without feeling overly slutty, and I wore that shape so long that it’s still how I think of myself. Weird huh?”</i>");
		output("\n\n<i>“Not really,”</i> you offer.");
		output("\n\nGianna smiles, eyes drifting closed. The pump kicks on, and the silicone flows. Her [gianna.butt] grows, expanding before your very eyes. The alabaster surface rounds more and more, getting nice and bouncy. Her ass is getting heart-shaped in the best way. You’re pretty sure that if she bends over now, people are going to notice. The synthskin fills out little by little, and once her cheeks are perfectly even and filled with supple mass, the mechanical whirr dies down.");
		output("\n\nGianna smacks her ass and jumps in surprise. <i>“I forgot how sensitive these could be.”</i> Grinning, the android makes two pink hand outlines appear on her newly-grown ass. <i>“I wonder how many squeezes going around like this would get me.”</i>");
		output("\n\n<i>“You’d have mine,”</i> you answer.");
		output("\n\nGianna’s smile is radiant. <i>“I’ll hold you to that sometime.”</i> The prints fade back to a creamy white. <i>“What now?”</i>");
		gianna.buttRatingRaw = 9;
	}
	//9 -> 15 butt inflation (big and bouncy to slappable, voluminous)
	else if(gianna.buttRating() <= 9)
	{
		if(flags["GIANNA_INFLATED_ASS_PAST_NORMAL"] == undefined) 
		{
			flags["GIANNA_INFLATED_ASS_PAST_NORMAL"] = 1;
			output("<i>“Ever try making your ass bigger?”</i>");
		}
		else output("<i>“Let’s make your ass bigger.”</i>");
		
		output("\n\n<i>“Bigger?”</i> Gianna twists around so far that you’re sure she ought to be snapping her spine, and looks down at her nicely-molded backside. She looks back up at you and smiles. <i>“");
		if(giannaPersonality() >= 66) output("Someone’s an ass [pc.man]!”</i> Wiggling her derriere back and forth behind her, she teases, <i>“Just don’t bust a nut watching these cheeks grow to fulfill your fantasies, or you’ll have to mop up the mess. Then again...”</i> She grabs her heart-shaped butt and openly fondles it. <i>“...Maybe that’s what you want?”</i>");
		else if(giannaPersonality() >= 33) output("Someone’s an ass [pc.man]!”</i> Giggling, the companion squeezes her butt now that she knows you’re going to be watching. <i>“I can tell you’re staring! My cheeks are burning!”</i> True enough, they blush pink - both pairs.");
		else output("I wouldn’t mind at all.”</i> She hefts her cheeks in her palms as if considering them. <i>“If you want me to have a big, squishy butt to hold onto, who am I to deny you? Besides,”</i> she winks, <i>“I think the change will be pleasing for everyone involved.”</i>");
		output("\n\nThe robotic woman closes her eyes");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" and plugs a nearby hose into the port at the base of her spine, just above the targeted area");
		}
		output(". <i>“Watch closely. You wouldn’t want to miss this!”</i>");
		output("\n\nA gentle, inoffensive whine sounds from somewhere inside the companion, and the hose lurches in her hand. A clear-colored fluid shoots through it into her, but she doesn’t seem to mind. Gianna’s face is meditative, almost calm. She’s even smiling. Your eyes flick back down to her ass where the real action is. A ripple passes through her bottom, almost like someone just slapped it, yet there hasn’t been a hand laid on it since the filling began. Her alabaster ass slowly, nearly imperceptibly expands. It was already plush, but with every passing second, it’s becoming something more.");
		output("\n\nThe android’s swollen rear is going from heart-shaped to a slappable, voluminous derriere that looks like it exists solely to be thrust against or into. You’re fairly certain that if you squeezed it too hard, you might lose your fingers inside.");
		output("\n\nThe hum dies, and Gianna gasps. <i>“Oooh, that’s strange.”</i>");
		output("\n\n<i>“What?”</i>");
		output("\n\nRubbing at it, the back-heavy woman marvels. <i>“It’s kind of nice, actually. I feel all squishy and soft back there now - way more than before. I might have to spend a few hours sitting down just to get used to it.”</i>");
		output("\n\nThat sounds fine by you.");
		output("\n\n<i>“What next?”</i> Gianna’s blue eyes flicker excitedly. She must be enjoying this.");
		gianna.buttRatingRaw = 15;
	}
	//15 -> 20 butt inflation (slappable and voluminous to seam-destroying, tremendous)
	else
	{
		gianna.buttRatingRaw = 20;
		output("<i>“How about we pump your ass up to the max.”</i>");
		output("\n\nGianna chews a [gianna.lip] nervously. <i>“Well, if I went to the max, I’d probably have trouble moving around. I can’t do THAT, but how about....”</i> She stops and sighs, looking back at her already plumped-up butt. <i>“How about I just take it up as big as I can without impacting my ability to move too much. I’ll still have to be careful if I don’t want to bump people when I turn around.”</i> She giggles, amused, then turns serious. <i>“But I’ll be more than a big butt, right? I mean I can make myself look like a sexed-up harlot, and I kind of can be sometimes, but... I won’t just be a squishy ass, will I?”</i>");
		//REPEATS
		if(flags["GIANNA_MAXBUTT_REACTION"] != undefined)
		{
			//Nice Guy’ed
			if(flags["GIANNA_MAXBUTT_REACTION"] == 2)
			{
				output("\n\nYou wrap your arms around her waist. <i>“Of course not. You’re Gianna. Having the ability to have an amazing ass is just one part of what makes you great.”</i>");
			}
			//Mediumed
			else if(flags["GIANNA_MAXBUTT_REACTION"] == 1) output("\n\nYou wink. <i>“If I just wanted a big squishy ass, I’d order one off the extranet.”</i>");
			//Jerked
			else output("You roll your eyes. <i>“Does it really matter? If it keeps you from being ignored, who cares about the why.”</i>");
			maxGiannaBootyEnd();
		}
		//FIRST TIMERS
		else
		{
			output("\n\nHow do you answer?");
			//[Be Nice] [Be Normal] [Be Jerk]
			clearMenu();
			addButton(0,"Be Nice",beNiceAboutGiannaGiantBooty,undefined,"Be Nice","A big ass is great, but she’s the total package.");
			addButton(1,"Be Normal",beNormalAboutGiannaGiantBooty,undefined,"Be Normal","Reassure her without laying it on too thick.");
			addButton(1,"Be A Jerk",beAJerkAboutGiannaGiantBooty,undefined,"Be A Jerk","Who cares if she’s just a big squishy ass? Big squishy asses are awesome.");
		}
		return;
	}
	processTime(3);
	giannaBodyModMenu(false);
}

//[Be Nice]
public function beNiceAboutGiannaGiantBooty():void
{
	clearOutput();
	giannaDisplay();
	output("You wrap your arms around her and pull her into an affectionate squeeze. <i>“Of course you’re more than a big butt. You’re Gianna, the girl with a super-computer for a brain. Yeah, you can have a big, ultraporn-tier ass, but you can also look like a slender girl next door or just about anything else. Look at it this way. We’re surrounded by big, squishy cow-asses, and I’m here, talking to you. You’ve got something they don’t.”</i>");
	//+Confidence!
	giannaPersonality(5);
	flags["GIANNA_MAXBUTT_REACTION"] = 2;
	maxGiannaBootyEnd();
}

//[Be Normal]
public function beNormalAboutGiannaGiantBooty():void
{
	clearOutput();
	giannaDisplay();
	output("You chuckle. <i>“Do you really think I’m here to see you blow up parts of your body and nothing else? I’m sure I could see that in plenty of places around here if that was all I wanted. Hell, I could just order a synthskin ass-mold off the extranet to fuck if all I wanted was an overblown toy.”</i>");
	//No change
	flags["GIANNA_MAXBUTT_REACTION"] = 1;
	maxGiannaBootyEnd();
}
//[Be Jerk]
public function beAJerkAboutGiannaGiantBooty():void
{
	clearOutput();
	giannaDisplay();
	output("You fold your arms across your chest impassively. <i>“What does it matter? What do you think you’re doing here, standing naked in a milk barn with your tits and ass hanging out? Gianna, you’re already treating yourself like a sextoy in exchange for attention. If making your ass swell up like that will keep me coming back, do the whys really matter?”</i>");
	//-Confidence
	giannaPersonality(-5);
	flags["GIANNA_MAXBUTT_REACTION"] = 0;
	maxGiannaBootyEnd(true);
}

public function maxGiannaBootyEnd(jerk:Boolean = false):void
{
	//Post-variant buttflation
	output("\n\nGianna ");
	if(!jerk) output("smiles");
	else output("nods solemnly");
	output(". <i>“You’re right, of course. Okay, here goes.”</i> She tips her head back and closes her eyes");
	if(!gianna.hasStatusEffect("Hose Plugged In"))
	{
		gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
		output(", snapping the hose into the port in her spine almost as an afterthought");
	}
	output(". The familiar hum of her silicone pump kicking on emanates from somewhere deep inside her body, and once more, her [gianna.butt] quivers, jiggling like two bowls full of jelly.");
	output("\n\nYou watch, almost hypnotized by the quaking of the android’s expanding bottom. It was already big enough for a career in anal porn, but the way it’s swelling, she’s going to wind up drawing eyes wherever she goes. She’ll have to fend off randy bulls with a stick, assuming that her incredibly squishy butt doesn’t throw her off balance and into the hay. A plaintive moan slips through her lips. Gianna’s hands roam down to her shaking bottom, steadying it. You can see it expanding now, swelling around her roving hands. Her fingers sink deeper by the second.");
	output("\n\nClick. The motor shuts off, leaving you with only the sound of the anally expanded companion’s groans. She opens her eyes. The mechanical irises seem oddly dilated, and she keeps groping her ass. <i>“This is... this is nice.”</i> She struggles with the sensations coming from her silicone-swollen assets. <i>“Promise me... promise me you’ll use my ass for something.”</i> She moans, and lubricating fluid abruptly splatters the floor. <i>“Promise me you’ll grope my ass more.”</i>");
	output("\n\nUnsure of what else to do, you reach out and grab her ass with her. Gianna leans against a wall panting. <i>“Yeeaaaahhhh...”</i> The gushing juices slowly taper off while you gently knead her, and after a minute of open groping, she pushes herself back up and gently removes your hands. <i>“O-okay... I had to tweak the tactile sensation levels down a little bit, but the requests stand. So, you know, whenever you want to play with my butt, just ask.”</i>");
	output("\n\nYou nod, openly smiling.");
	output("\n\n<i>“What now?”</i>");
	gianna.buttRatingRaw = 20;
	//+33 lust
	pc.changeLust(33);
	processTime(3);
	giannaBodyModMenu(false);

}
//[***] Decrease Ass
public function diminishGiannaButt(siliconeReturned:int):void
{
	clearOutput();
	giannaDisplay();
	giannaAvailableSilicone(siliconeReturned);
	//20 -> 15 butt deflation (seam-destorying, tremendous to slappable)
	if(gianna.buttRating() >= 20)
	{
		output("<i>“Let’s make your butt a little less obscene.”</i>");
		output("\n\nGianna pouts. <i>“Awww, didn’t you like having it all big and jiggly?”</i> She flexes, making each side bounce up and down.");
		output("\n\nYou tell her that it was fun but that you’d prefer a slightly more modest size. You make sure to emphasize slightly. You’re not asking her to become some tightbody, at least not immediately.");
		output("\n\n<i>“Well, it’ll be nice not flipping switches when I turn around too fast at the control panel.”</i> She taps at her chin. <i>“And maybe the bulls will stop walking into posts around me. Or growing posts.”</i> She giggles. <i>“We’ll drop it down a little bit, and if your eyes still bug out when you see it, I’ll keep it. Okay?”</i>");
		output("\n\nSounds fair to you.");
		output("\n\nGianna blinks her eyes closed");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" and grabs a nearby hose, snapping it into the port at the base of her spine");
		}
		output(". <i>“Bye bye buttcheeks.”</i> The gentle whine of a hidden pump starts up from somewhere inside the android. Clear fluid moves through the flexible pipe, draining out of her body into some hidden reservoir. The immensity of her swollen tush gradually diminishes. Such a large, plush ass must hold lots of silicone, and draining it takes a commensurate amount of time.");
		output("\n\nGianna paws at her smaller posterior when the pump shuts off. It’s still obscenely big and squishy, but not to such an extreme degree. She’s a girl with a gifted derriere, not an anal ultraporn star.");
		output("\n\n<i>“Well, this will do,”</i> she admits. <i>“I’d still like to feel you squeezing it from time to time. And if you don’t, I’ll get someone else to.”</i>");
		output("\n\nYou arch an eyebrow.");
		output("\n\n");
		if(giannaPersonality() >= 80) output("<i>“Oh, we both know you’ll find an excuse to play with my butt.”</i>");
		else if(giannaPersonality() >= 20) output("<i>“I’m kidding, I’m kidding! The bulls squeeze my butt anyway. I just wanted to make sure you will.”</i>");
		else output("<i>“It was a joke! You know I’ll bend over and present if you want a squeeze.”</i>");
		output(" She leans forward, hands on the wall to show it off for you. <i>“Here’s your new, custom-made Gianna-butt. Now, did you want to make some more adjustments or take it for a test drive?”</i>");
		gianna.buttRatingRaw = 15;
	}
	//15 -> 9 butt deflation (slappable and voluminous to big and bouncy)
	else if(gianna.buttRating() >= 15)
	{
		output("<i>“I think I liked you better like you were before.”</i>");
		output("\n\nGianna’s glowing blue eyes brighten to an almost teal. <i>“Really? You mean it?”</i>");
		output("\n\n<i>“Well yeah, it was a pretty great butt.”</i>");
		output("\n\nBeaming now, the companion blushes. <i>“I thought so too. Okay, let’s just go ahead and take it right back in.”</i> She swivels");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", plugging a hose in as she moves");
		}
		else output(", carrying the hose with her, attached as it is to her spine");
		output(". <i>“One perfect android heinie coming right up!”</i>");
		output("\n\nGianna closes her eyes to focus. A moment later, you hear a muffled, mechanical click followed by a gentle whirring. The alabaster woman’s more-than-plump backside immediately diminishes, losing some of its obscene roundness second by second. Its owner sighs, a sound that seems laden with relief. The last inch of overinflated ass fades away before your very eyes, and the sounds cease. The last silicone drains from the hose, leaving Gianna’s backside appearing much the same as the day you met her.");
		output("\n\n<i>“There! I forgot how trim I could feel without all that extra weight back there. I’m way more aerodynamic!”</i>");
		output("\n\n<i>“Aerodynamic?”</i> You can’t help but chuckle a little.");
		output("\n\nGianna nods, eyes blinking. <i>“Actually... yes. By my calculations my drag from wind is significantly reduced... and it’s a sexy little package too. Now, do you think I should change anything else?”</i>");
		gianna.buttRatingRaw = 9;
	}
	//9 -> 7 butt deflation (big and bouncy to shapely and half-filling)
	else if(gianna.buttRating() >= 9)
	{
		output("<i>“I’d like to see you with a tighter butt. Something that just fills your hands, you know?”</i>");
		output("\n\nGianna looks at you curiously. <i>“Really? You don’t want a big, squeezable ass like the one I have?”</i>");
		output("\n\n<i>“Well, both are nice, but I’d like to see you try a smaller size once. Maybe we could use the silicone somewhere else.”</i> You shrug.");
		output("\n\nThe android sighs a little. <i>“Well, if you really want it... okay, but don’t complain when I don’t get all the best looks on a dancefloor.”</i>");
		output("\n\n<i>“A dancefloor? They have those around here?”</i>");
		output("\n\nGianna’s eyes twinkle");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" as she snaps in the hose");
		}
		output(". <i>“You betcha. There isn’t any dance quite like a New Texan dance! The heat, thumping beats, and dozens of pheromone factories crammed together in a small place make it a sight to see. It’s not uncommon for some of the participants to orgasm partway through a particularly fast-paced dance, and perhaps because of it, they’re a lot more enthusiastic than the few high society balls my old master took me to.”</i> She grins. <i>“A lot more fun too. Maybe we can go to one sometime, but first... let’s get this show on the road.”</i>");
		output("\n\nThe bubbly android closes her eyes and screws up her face in concentration. A brief moment later, the sound of a whirring pump fills the air. Gianna’s ass begins to recede before your very eyes, tightening up. The synthskin stays nice and smooth - glossy even. Somehow, it’s shrinking with the smaller booty, keeping it nice, firm, and squeezable. A feminine hand cups one cheek, measuring it, and the motor shuts off.");
		output("\n\n<i>“There,”</i> Gianna declares, bright-eyed, <i>“one pair of firm handfuls, just like you ordered.”</i> She shimmies back and forth experimentally. <i>“Not much jiggle in these. I guess it’ll be easier to run now! What next?”</i>	");
		gianna.buttRatingRaw = 7;
	}
	//7 -> 5 butt deflation (hand-filling to soft n’ squeezeable)
	else
	{
		output("<i>“Just how small can you make your butt?”</i>");
		output("\n\nGianna admits, <i>“Pretty small. I mean it’ll still be soft and squeezy, but there won’t be very much of it there.”</i> Craning her neck back, she examines herself. <i>“I’m already so small. All the girls have bigger butts than me!”</i> Pouting, Gianna pokes it almost innocently. <i>“I’ll almost look like a boy!”</i>");
		output("\n\nYou chuckle at that but quickly straighten your face. <i>“Well, if you’d like people to appreciate you for what’s inside, what better way to do it than by removing the distractions? Besides,”</i> you rib her side, smiling, <i>“there’s probably at least a few bulls on this heap wanting a wisp of girl they can fit in one hand - a girl that looks like she’ll almost split in half when his dick is slipped in.”</i>");
		output("\n\nGianna blushes. <i>“Well... maybe. Okay. I’ll try it, but someone better appreciate it....”</i>");
		output("\n\n");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output("Grabbing a nearby hose, she snaps it into the port in her back with a solid sounding ‘snick’. ");
		}
		output("The android closes her eyes and sighs. <i>“Here goes.”</i> A muffled whirr emanates from somewhere near the center of her body, and Gianna’s normal-sized booty ripples vigorously. Silicone flows out through the flexible pipe, and the android’s once heart-shaped ass vanishes before your eyes. Her synthskin stays taught and almost shiny throughout. There’s no sign of excess skin - just a smaller, tighter derriere that you wouldn’t notice without looking for it.");
		output("\n\nThe mechanical sound dies off, and Gianna sighs. <i>“Not much to it.”</i> Then, her eyes brighten. <i>“We could put all the extra silicone into my tits. You know, separate the tit-lovers from the ass-men!”</i> Smiling now, she asks, <i>“What do you think? What should we change now?”</i>");
		gianna.buttRatingRaw = 5;
	}
	processTime(3);
	giannaBodyModMenu(false);
}


//[***] Give Silicone
public function giveGiannaSilicone():void
{
	clearOutput();
	giannaDisplay();
	//First time
	if(flags["GIVEN_GIANNA_SILICONE"] == undefined)
	{
		output("You hand the sealed container over to Gianna. <i>“");
		if(pc.isNice()) output("Happy to help.");
		else if(pc.isMischievous()) output("Look what I found lying around.");
		else output("Here you go.");
		output("”</i>");
		output("\n\nTaking hold of it, the android simply stares at the canister for a long moment. Then, she throws her arms around you, wrapping you up in a hug. <i>“I’d hoped, but I wasn’t sure you’d bring me any! This is the best present ever!”</i> She enthusiastically plants a joyful kiss on your [pc.lips]");
		if(gianna.biggestTitSize() >= 15) output(", unmindful of her pumped-up chest");
		output(". Then another. And another. She kisses you until you have to reluctantly push her away, and then holds it tightly to her [gianna.chest] like a kid at Christmas. She blushes when she realizes what she’s doing. <i>“");
		if(giannaPersonality() >= 20) output("I suppose we ought to put it to use, huh?");
		else output("S-sorry. I’m just thankful is all. Why don’t we go ahead and use this?");
		output("”</i>");
		//+slight confidence
		giannaPersonality(3);
		flags["GIVEN_GIANNA_SILICONE"] = 1;
	}
	//Repeat
	else
	{
		output("You hand over another container of silicone.");
		output("\n\n<i>“Another!?”</i> the excited android ");
		if(!silly) output("exclaims");
		else output("interrobangs");
		output(". <i>“Oh, [pc.name], ");
		if(giannaPersonality() >= 75) output("you don’t have to keep doing this, but don’t let me stop you.");
		else if(giannaPersonality() >= 25) output("If I were wearing panties, you’d damn near have them off.");
		else output("you’re the best a ‘bot could hope for.");
		output(" Thank you.”</i> She looks about to tear up but turns to examine the canister. <i>“I reckon we ought to put this to use, then.”</i> The corner of her glittering mouth twists upward into a excited, if petite, grin.");
		//+slight confidence
		giannaPersonality(2);
	}
	//Merge
	output("\n\nGianna pushes her prize against a port in the machinery on the wall. Shortly after, you hear the sound of liquid being sucked away, presumably to a holding tank somewhere. A mechanical click follows, and Gianna takes the empty canister to toss into a nearby disposal. <i>“Let’s get started.”</i>");
	//Menu!
	giannaAvailableSilicone(6);
	pc.destroyItemByClass(Silicone,1);
	giannaBodyModMenu(false);
}


//[***] Increase Lips
public function increaseGiannaLips(siliconeUsed:int):void
{
	clearOutput();
	giannaDisplay();
	giannaAvailableSilicone(-siliconeUsed);
	//0 bonus to 1 full to succulent/juicy
	if(gianna.lipMod == 0)
	{
		output("<i>“Let’s see what you would look like with bigger lips.”</i>");
		output("\n\n<i>“A little bigger wouldn’t hurt,”</i> Gianna agrees");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", grabbing a mechanical hose and pressing it to socket in her spine with a satisfying-sounding ‘ca-chink’");
		}
		output(". She closes her eyes and focuses, her [gianna.lips] pursed to give you a better view. The glossy black surface of her mouth ripples slightly. The smooth flesh of her synthetic lips puffs up slightly, just enough to give them the kind of juicy look that only a gifted woman would naturally have.");
		output("\n\nThe android runs her tongue along the expanded surface of her mouth. <i>“Not bad. I only had to tweak up their sensory resolution slightly to compensate for the added volume.”</i> Sucking the bottom one briefly into her mouth, she quietly moans with pleasure. <i>“Yeah, these will do. ");
		if(giannaPersonality() >= 75) output("Was there something else you’d want your dream-woman to have?");
		else if(giannaPersonality() >= 25) output("Anything else that you think would look good on me?");
		else output("Are there other parts of my appearance you would like me to change, [pc.master] [pc.name]?");
		output("”</i>");
		gianna.lipMod = 1;
	}
	//1 to 2 juicy/succulent to bee-stung/swollen
	else if(gianna.lipMod == 1)
	{
		output("<i>“Could you pump your lips up a little bit more?”</i>");
		output("\n\n<i>“Again?”</i> Gianna asks with a wry smile");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", grabbing a mechanical hose and pressing it to socket in her spine with a satisfying-sounding ‘ca-chink’");
		}
		output(". <i>“I bet the bulls around here will thank you for it... and a few of the cow-girl’s too.”</i> Closing her eyes, she puckers up and begins the process of shifting the silicone around once more. The effect on her [gianna.lips] is quite noticeable. You’d have to be blind to ignore the way her mouth swells up. By the time she’s done, they look almost swollen. The words “bee-stung” spring to mind.");
		output("\n\nMaking obscene kissy-faces at you, the feminine android takes her new lips for a spin. <i>“Well, these pillows will make avoiding my teeth during a blowjob that much easier, huh?”</i> She licks them, making them shine that much more obviously. <i>“I don’t think I’m fit for high-class dinners like this, but I suppose I could always make whores jealous.”</i> She glances at a passing cow-girl and frowns. <i>“Of course, around here I’m still barely above average. ");
		if(giannaPersonality() >= 75) output("Why don’t we make ‘em bigger and really put these skanks to shame?");
		else if(giannaPersonality() >= 25) output("We could pump them up a little more, if you wanted.");
		else output("Would you like me to make them even larger?");
		output("”</i>");
		gianna.lipMod = 2;
	}
	//2 - 3 bee-stung/swollen to dazzling/exquisitely large
	else if(gianna.lipMod == 2)
	{
		output("<i>“Let’s keep going with your lips. It’ll be hot to see them so plush and permanently puckered.”</i>");
		output("\n\n<i>“Got a thing for slutty mouths?”</i> Gianna asks");

		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", grabbing a mechanical hose and pressing it to socket in her spine with a satisfying-sounding ‘ca-chink’");
		}
		output(". <i>“");
		if(giannaPersonality() >= 75) output("You’re lucky I’m the adventurous sort.");
		else if(giannaPersonality() >= 25) output("I should be glad we’re both adventurous types, I suppose.");
		else output("If so, you’ll love this.");
		output("”</i> Pursing her [gianna.lips], she lets her eyelids flutter closed and starts pumping the silicone. You can hear it sloshing through the hose and sloshing through her spine towards its targets. After a moment, the smooth curves ripple and bloat, pulling the synthskin surface so tight that they shine brighter than any lipstick-slathered mouth.");
		output("\n\nThe pumps wind down a scant few seconds later, leaving the companion with significantly expanded facial assets. She runs her tongue across their expansive surface and moans, <i>“Mmmm... I love the feel of my synthskin’s input resolution shifting.”</i> She sucks her top lip in, then lets it pop out so that she can nibble on the lower one. <i>“Yeah... the cows are gonna be jealous now. I could easily match the biggest of them now, and I don’t need to breathe when I go down on someone.”</i> Blushing, she suggests, <i>“Why don’t we unhook the pump and try these out?”</i>");
		//+10 lust
		pc.changeLust(10);
		gianna.lipMod = 3;
	}
	//3 - 4 dazzling/exquisitely large to hyper-engorged/constantly pursed
	else if(gianna.lipMod == 3)
	{
		output("<i>“Gianna, I want your lips bigger... fuller.”</i>");
		output("\n\n<i>“Even bigger?”</i>, Gianna asks");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", grabbing a mechanical hose and pressing it to socket in her spine with a satisfying-sounding ‘ca-chink’");
		}
		output(". <i>“I’m not gonna say no, but much bigger and they’re going to be totally out of hand. I already look like a blowjob-fetishist’s wet-dream, and now I’m gonna turn into one’s heaven.”</i> She sighs and licks her lips as if suddenly aware of their existence. <i>“Here goes.”</i> The android’s eyes dip closed, and you hear the sound of a muffled pump kicking on.");
		output("\n\nGianna belatedly purses her lips to give you as good a view as possible and moans when a ripple runs through her [gianna.lips]. The bigger they get, the more reflective their onyx surface gets. Any tiny wrinkles in their surface vanish when they expand like little balloons, pumping full of soft gel filling. The pumping sounds abate, leaving Gianna with significantly expanded lips.");
		output("\n\nWhen she relaxes, they remain pursed by virtue of their sheer unwieldy size, and when she talks, it comes out with a hint of a lisp. <i>“Uhhh... [pc.name]? These are... they’re... ummm....”</i> She seems to be having trouble finding the right words to describe her new situation. <i>“They’re fucking huge.”</i> She licks them experimentally and barely stifles a moan. <i>“Maybe keeping their sensitivity the same was a mistake; there’s so much flesh to feel my tongue running across that it’s almost a second pussy.”</i>");
		output("\n\nBlushing pink, she looks up at you, saying, <i>“That’s what you wanted, isn’t it, [pc.name]? To give me a big, fuckable mouth?”</i>");
		output("\n\nWhat can you say? You wouldn’t have had her do this otherwise. You nod.");
		output("\n\n<i>“Well, I guess I can try them out. This isn’t the kind of planet to fret over a girl looking too fuckable,”</i> the dazed-looking android observes. <i>“What now?”</i>");
		gianna.lipMod = 4;
	}
	//4 - 5 hyper-engorged/constantly pursed to ‘o’shaped/whorish
	else
	{
		output("<i>“All the way babe, let’s make your mouth as obscene as possible. Really pump it up all the way.”</i>");
		output("\n\n<i>“");
		if(giannaPersonality() >= 70) output("Sure, but you’d better make use of them,");
		else if(giannaPersonality() >= 25) output("Sure... I’m going to have a hard time getting any work done like this, though,");
		else output("Sure, I’ll be your plush-lipped fuckdoll, if that’s what you want, [pc.name],");
		output("”</i> Gianna replies");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", grabbing a mechanical hose and pressing it to socket in her spine with a satisfying-sounding ‘ca-chink’");
		}
		output(". <i>“This is as big as I can really make them though. Synthskin can be expanded almost indefinitely, but without supporting structures, there’s no way to take them any bigger than I’m going to right now.”</i> She exhales and closes her eyes. <i>“Here goes.”</i>");
		output("\n\nThe slutty-looking companion android doesn’t bother puckering her lips - they’re big enough that they also stick out a little, pursed in a way that says, <i>“It’ll be okay if you slip your dick in here.”</i> When the pumping silicone hits a moment later, they balloon with surprising speed, inflating from pursed cocksuckers into an absolutely fuckable-looking o-ring. Her whole mouth ripples as the last ounce is put into place, completing Gianna’s transformation from respectable companion droid into whorish-looking pleasure-bot.");
		output("\n\nExperimentally pressing a finger between them, the artificial succubus soon finds herself adding a second, sliding them in to the knuckle. She pops them out, a breathy gasp on their heels, and lets out a lispy moan. <i>“They’re so biiig! It’s amazing just how much having lips this big can feel, like the bigger they are, the more fun they are to rub against things and compress around them. I think...”</i> Gianna pauses. <i>“I think I’m going to have to have to give more blowjobs. Not that I’ll have a hard time lining them up thanks to you!”</i>");
		output("\n\nBounding forward, the cheerful android gives you a super-sized kiss. <i>“So now what? Wanna try them out or adjust something else?”</i>");
		gianna.lipMod = 5;
	}
	processTime(3);
	giannaBodyModMenu(false);
}

//[***] Decrease Lips
public function giannaLipDecrease(siliconeReturned:int):void
{
	clearOutput();
	giannaDisplay();
	giannaAvailableSilicone(siliconeReturned);
	output("<i>“");
	if(gianna.lipMod == 5) output("Let’s take your lips down a notch, they’ve gotten a little out of hand,");
	else if(gianna.lipMod == 4) output("We should shrink your lips down a little bit or no one will take you seriously,");
	else if(gianna.lipMod == 3) output("Your lips still look like they’re built for oral and nothing else. Shrink them down a bit, please,");
	else if(gianna.lipMod == 2) output("Could you reduce your lips just a little bit? It still looks almost like you’ve recently been stung,");
	else if(gianna.lipMod == 1) output("I think you’d look better with lips that didn’t look like they belonged on one of these bimbos, Gianna,");
	output("”</i> you say.");
	//(5-4) o-shaped to constantly pursed
	if(gianna.lipMod == 5)
	{
		output("\n\nThe android’s comically pillowy lips lisp, <i>“Awww, I was kind of enjoying the feel of them, and the locals kept giving me the hungriest looks!”</i>");
		output("\n\nYou give her a serious look.");
		output("\n\n<i>“All right, all right. Give me a nanosecond,”</i> Gianna begs");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" while grabbing the familiar hose and connecting it to the port at the base of her spine");
		}
		output(". <i>“These sorts of things may be quick, but they’re not quite instantaneous. Hang on.”</i> A muffled noise that sounds somewhere between a vacuum and a growling kittens starts up. Shrinking visibly, the whorish-looking sexbot’s lips rapidly recede, quickly losing their stretched, o-ring shape and settling into a slightly less obscene pucker.");
		output("\n\nTwisting her ponytail, between her fingers while the motor winds down, Gianna remarks, <i>“I think I might actually miss having those.”</i>");
		output("\n\n<i>“Really?”</i>");
		output("\n\nSmiling now, the ");
		if(gianna.biggestTitSize() >= 15) output("busty ");
		else if(gianna.buttRating() >= 15) output("bubble-butted ");
		output("companion nods. <i>“With lips like that, I didn’t have to worry about maintaining any kind of decorum or propriety. They forced everyone to regard me as little more than a sex object or arm candy, kind of like the cows here.”</i> She sighs. <i>“In a way, it made things very, very simple for me. It may have limited me to one avenue of satisfaction, but it freed me from having to balance a dozen other concerns at the same time.”</i> Her eyes dim, and she sighs. <i>“I’ll admit, I’m jealous of them sometimes - the cow-girls. Their lives are so simple and carefree, while I’ll never get to be like that short of getting rewired by a brilliant A.I. programmer.”</i> Shrugging, she changes topic. <i>“Anything else you want to mess with while I’m hooked up?”</i>");
		gianna.lipMod = 4;
	}
	//(4-3) constantly pursed to exquisitely large
	else if(gianna.lipMod == 4)
	{
		output("\n\nGiggling, Gianna counters, <i>“Are you sure? It’s kind of fun watching a bull trip over his girl’s hooves while he’s staring at my mouth. It doesn’t help that I keep running my tongue around them or randomly puckering either.”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“All right, but you asked for it. Just don’t get bored with me on account of my mouth suddenly being a lot less slutty, okay?”</i> the lewd synthetic answers");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" while hooking the familiar hose up to the port in her back");
		}
		output(". Her [gianna.lips] begin to diminish almost immediately, accompanied by a low, vacuum hum and the trickling of near-liquid silicone being extracted from her body. She touches them with her fingers, then graces you with a smile. <i>“It’ll be nice not having them on the edge of my vision when I look down, and maybe I’ll get to work for more than five minutes without getting interrupted by requests for blowjobs.”</i>");
		output("\n\nGianna winks at you. <i>“Are you sure you’re not trying to turn me into a proper woman, [pc.name]? A respectable woman that you could bring along to high class parties? Because I can like, totally do that.”</i>");
		output("\n\nYou’re not averse to the idea.");
		output("\n\n<i>“What now?”</i> she asks, interrupting the momentary lull.");
		gianna.lipMod = 3;
	}
	//(3-2) exquisitely large to bee-stung
	else if(gianna.lipMod == 3)
	{
		output("\n\n<i>“You really think so? Well, okay,”</i> Gianna responds");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" while fetching the hose and snapping it in place on her silicone port");
		}
		output(". <i>“Let’s go ahead and do it then. It’s hard to carry on a conversation with lips that look like they were made for a dick anyway.”</i>");
		output("\n\nA gentle whirring starts, and you hear the sloshing sound of silicone traversing the length of the tube behind her. The difference is profound. Her cushy-looking mouth recedes into itself, but not so much that it loses its bee-stung look. The humming motor dies down, its task finished. Gianna gently prods at her less expansive gob, marvelling at the smaller size. She tries on a smile and says, <i>“Well, I’m still on par with the cows, I guess, and I could almost pass for a respectable woman with the right outfit.”</i> Her glowing eyes flick down to her [gianna.chest]. <i>“Assuming I had a reason to put on clothes, that is. What now?”</i>");
		gianna.lipMod = 2;
	}
	//(2-1) bee-stung to juicy
	else if(gianna.lipMod == 2)
	{
		output("\n\n<i>“Puhlease,”</i> Gianna retorts. <i>“Around here, this is what passes for normal.”</i> She rubs her chin in thought. <i>“I guess I’ve been here long enough that I’ve picked up some of the native culture. In the rest in of the galactic core, walking around naked with a pair of lips like this would get me mistaken for some kind of hooker-bot on the prowl for clients.”</i> A proud look graces her puffed-up features. <i>“Of course, I doubt a cheap sex-bot could compete with my feature set.”</i> She drops her voice to a halting monotone and jerkily waves her arms around. <i>“I am hooker. Please insert penis.”</i> Then, she bursts out in uproarious laughter.");
		output("\n\nYou can’t help but ");
		if(pc.isNice() || pc.isBimbo()) output("laugh along with her");
		else if(pc.isMischievous()) output("chuckle in approving mirth");
		else output("give a half-chuckle. It was almost funny");
		output(".");
		output("\n\n<i>“Anyway, I guess I can go ahead and shrink these bitches down to puppy size,”</i> Gianna states");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(" while grabbing a hose that dangles from the wall and snapping it into her spinal port");
		}
		output(". <i>“Bye bye bimbo lips!”</i> The muted hum of an electric motor pumping away fills the air, followed by the gentle babble of fluid flowing through a pipe. Gianna’s lips gradually recede, losing their swollen state. The whirring dies down to nothing. Touching fingers to lips, the companionable android examines herself. Her mouth is now unmistakably feminine, but not in an unnatural, artificial way. It’s the kind of mouth a terran supermodel might have. Looking your way, she pulls her fingers away and says, <i>“Back to just a little sexier than normal. Perfect, right?”</i> Gianna’s eyes are nearly as radiant as her smile. <i>“Wanna do some other tweaking?”</i>");
		gianna.lipMod = 1;
	}
	//(1-0) juicy to full
	else
	{
		output("\n\n<i>“");
		if(giannaPersonality() >= 60) output("Oh come on! They aren’t anywhere near as big as some of these cows’!");
		else if(giannaPersonality() >= 30) output("Awww, but most of theirs are way bigger!");
		else output("Are you sure? Most of the cows have bigger ones,");
		output("”</i> Gianna protests. <i>“Big, dick-sucking lips that their bulls just wanna bang senseless. Still....”</i> She pauses, thinking. <i>“I guess it’s no big deal as long as there’s people like you to keep me company. There’s more to beauty than size after all, right?”</i> She bats her eyelashes at you.");
		output("\n\nYou nod");
		if(pc.isNice() || pc.isBimbo()) output(" with a friendly smile");
		output(".");
		output("\n\n<i>“Okay then,”</i> Gianna starts, <i>“are you ready for a magic trick?”</i> She pauses for a dramatic effect");
		if(!gianna.hasStatusEffect("Hose Plugged In"))
		{
			gianna.createStatusEffect("Hose Plugged In", 0, 0, 0, 0, true, "", "", false,0);
			output(", reaching behind herself to grab a hose from the wall and plug it into the silicone port in her spine");
		}
		output(". <i>“Watch closely, because you’re about to see the slut... disappear!”</i> Blinking her eyes closed, the synthetic woman focuses, and you hear the sound of a pump revving up. The hose sticking out of her back jerks when the emptying silicone hits it, and the hyper-feminine visage shrinks down towards a more classic type of beauty. The change takes no more than two seconds. It leaves her with a decent-sized set of feminine lips, the kind you’d expect to see on a pretty girl back home.");
		gianna.lipMod = 0;
	}
	processTime(3);
	giannaBodyModMenu(false);
}

//[*]Sex
//[***] Huge Tits Titfuck
//Blah blah blah, hyper boobs.
//No taurs
//Approx 2500 words.
public function hugeTittyTittyfuck():void
{
	clearOutput();
	giannaDisplay();
	output("<i>“Up for a titfuck?”</i> you ask");
	if(pc.isNice()) output(", apologizing for being so direct.");
	else if(pc.isMischievous()) output(" with a smile.");
	else output(", knowing the answer.");
	output("\n\nGianna smiles, running her hands over her huge boobs. <i>“");
	if(giannaPersonality() >= 70) output("Don’t pretend you haven’t been fixated on these since the moment you saw them, [pc.name]. Hop up on that crate, and I’ll give you what you’ve been wanting.");
	else if(giannaPersonality() >= 30) output("Oh, you like these, huh? I suppose that’s no surprise. You gave them to me. Hop up on that crate, and I’ll give you as much time with them as you want.");
	else output("Yes [pc.sir]. They’re ready to serve. I recommend getting on that crate so that you’ll be as comfortable as possible while I tend to your needs.");
	output("”</i> Her breasts swell from a sudden infusion of additional silicone, diverted from elsewhere to leave her even more well-endowed. Jigglier. <i>“There’s no rush, but the sooner you’re ready, the sooner I put these to use,”</i> the technological succubus coos.");
	output("\n\nYou don’t need any more encouragement. ");
	if(pc.isCrotchGarbed()) output("Shucking your [pc.lowerGarments] and tossing them aside");
	else output("Setting your equipment aside");
	output(", you ");
	if(pc.isNaga()) output("slither");
	else output("hop");
	output(" up onto the crate. It’s rustic, wooden, and a little coarse against your [pc.butt]. This kind of old-fashioned silliness would never be allowed on a core hub, but here, you suppose it’s all part of the charm, assuming you manage to avoid getting any splinters. You spread your [pc.legOrLegs]");
	if(pc.balls > 0) output(" to give your [pc.balls] a little more room");
	output(" and heft [pc.oneCock]");
	if(pc.cockTotal() > 1) output(" - the biggest");
	output(". ");
	if(pc.lust() >= 80) output("You were already horny, leaving it hard and twitching at the prospect of a titfuck from the gorgeous android, pulsating with need that borders on the delirious.");
	else output("It thickens perceptibly in your hand, swelling alongside your arousal at the thought of an hour nestled into the android’s cleavage. It pulsates powerfully, erect and ready.");
	output("\n\n<i>“");
	if(giannaPersonality() >= 70) output("That’s more like it,");
	else if(giannaPersonality() >= 30) output("All ready, " + pc.mf("stud","cutie") + "?");
	else output("This is what I was designed for, [pc.name],");
	output("”</i> the alabaster courtesan drawls as she approaches. Every step sets her pendulous, artificially enhanced breasts swaying. They’re bigger than beach balls but vaguely teardrop shaped, weighed down by their own shuddering volume. Your eyes track them when they jiggle, and they jiggle with every single step the android takes. The distance between you vanishes in what feels like a flash, though you know it had to be at least several long seconds; Gianna’s swaying steps were slow after all. All the extra weight on her chest has made her stride uncertain, though her face is anything but. She’s smiling.");
	output("\n\nGianna reaches out around as much of her breasts as her arms will reach, grabbing hold of her own nipples. She tries not to moan, but it’s a futile gesture. Fingertips dig into onyx teats, and a lusty groan vibrates past her lips. Whimpering, the big-breasted companion tugs her tits apart, revealing a solar system’s worth of creamy titflesh stained with a spreading pink blush. She offers, <i>“Relax and let me do all the work, [pc.name].”</i>");
	output("\n\n[pc.EachCock] twitches approvingly. Meanwhile, the synthetic slut is already moving forward, struggling to bring her enormous breasts into the perfect position. The bottoms press on your [pc.legOrLegs] before your [pc.cocks], giving you a chance to admire the smoothness of her synthskin’s texture.");
	if(flags["GIANNA_TEMP"] == 1) output(" She’s almost uncomfortably warm, and as a result, letting her smother your lap feels oddly reminiscent of slipping into a hot tub.");
	else if(flags["GIANNA_TEMP"] == 0) output(" She’s every bit as warm as a terran girl, and without any of the blemishes. You’re not sure you ever want to give this up.");
	else 
	{
		output(" She’s almost uncomfortably cool, and you shiver a result. Her chilled breasts contrast wonderfully with the aching warm of your erection");
		if(pc.cockTotal() > 1) output("s");
		output(", making it easy to let every sensation but the ones coming from your crotch fall away into a pleasant numbness.");
	}
	output(" Dainty fingertips ");
	if(pc.cockTotal() == 1) output("grab your [pc.cock]");
	else output("gather your lengths into a tumescent bundle");
	output(". They struggle to reach you, and yet they still manage to eke little up and down strokes across your [pc.cockColor] skin.");
	output("\n\nFinally, Gianna’s breasts close in around you");
	if(pc.longestCockLength() < 25) output(", utterly smothering every inch of manhood in a squishy, silicone-padded heaven");
	else 
	{
		output(", smothering almost every inch of manhood in a squishy, silicone-padded heaven. Not even her gigantic breasts can imprison the full size of your lewd phall");
		if(pc.cockTotal() == 1) output("us");
		else output("i");
	}
	output(". Her blush blossoms into a rosy, tit-covering sheen at the contact and hits her cheeks a second later. Nibbling her lower lip, Gianna tries to look calm, but it’s clear she’s enjoying herself almost as much as you are. Squeezing her elbows in, she presses the velvet softness of herself into you a little harder, making her tits bulge out above and below her arms.");
	output("\n\nBlushing harder, the android licks her lips. <i>“There’s something powerful about the feel of ");
	if(pc.cockTotal() == 1) output("a dick sandwiched");
	else if(pc.cockTotal() == 2) output("a pair of dicks stuck");
	else output("a bunch of dicks crammed");
	output(" into my cleavage. The feel of it, all hot and trembling, truly makes me feel alive.”</i> She rocks her body one way and then the other, sliding her breasts up and down. <i>“I’m totally aware of every square inch that’s inside there, and it doesn’t just feel great.”</i> She pauses and gasps as she gives her boobs a particularly violent bounce. <i>“It satisfies my programming too - knowing that I’m pleasuring your body so thoroughly. That I’m making your [pc.cocks] so hard that you won’t be able to help but cum all over them.”</i>");
	output("\n\nThe blissful feeling of so much ");
	if(flags["GIANNA_TEMP"] == 1) output("hot");
	else if(flags["GIANNA_TEMP"] == 0) output("warm");
	else output("chill");
	output(" flesh sliding all over steals the reply from your lips. Her nipples, hard with symptoms of her simulated arousal, press hard against your [pc.belly], thrust between her groping fingertips like miniature spears. You let out a contented sigh and simply enjoy the android’s attention. The more she excites you, the more she pleases herself. Her face is flushed, and her glowing eyes dilated. Soon, her sensuous globes are bouncing with near feverish intensity, quaking enticingly around your [pc.cocks], whipping your leaking pre-cum into a slippery slurry.");
	//Dommy
	if(giannaPersonality() >= 70)
	{
		output("\n\nGianna pants, <i>“Ahhh... yes! You love this, don’t you, [pc.name] - you all wrapped up in my giant tits, squirming on that crate like a nervous school[pc.boy]?”</i>");
		output("\n\n");
		if(!pc.isAss()) output("What can you say? She’s making [pc.eachCock] feel like a king, waited on by two very plush subjects.");
		else output("There’s no point in denying the obvious.");
		output(" You nod.");
		output("\n\nShe slows the rhythmic quaking of her mountainous melons. <i>“What’s that, love? I couldn’t hear you with all the hot, wet titty-fucking I was doing.”</i> Gianna giggles playfully and resumes stroking you off with her tits, moaning, <i>“Oh, I couldn’t deny you this for more than a second. I love the dreamy smile my chest puts on your face, the way you sigh every couple strokes, even the feel of your pre-cum bubbling all over my skin.”</i> She nuzzles her cheek against your side, her slick tits bouncing and sliding all over you. <i>“Are you ready to cum yet? Are you going to climax for me?”</i>");
	}
	//Normal
	else if(giannaPersonality() >= 30)
	{
		output("\n\nGianna pants, <i>“Ahhh... yes! I love this, [pc.name]! I love feeling your passion throb against my giant tits, oozing its slippery protein everywhere.”</i> She giggles, the motion making her bosom quake around you. <i>“Did I say protein? I meant cum. Your hot... sticky... cum.”</i> Squeezing her arms more tightly around her chest, the android increases the friction her massage is generating. <i>“Go on, [pc.name]. You can let it out any time. Just be a doll and cum on my tits.”</i> She leans forward to nuzzle your side. <i>“Relax and cum. Please, babe. Cum.”</i>");
	}
	//Subby
	else
	{
		output("\n\nGianna pants, <i>“Yes! Yes!”</i> as she bounces herself up and down your length");
		if(pc.cockTotal() > 1) output("s");
		output(". She looks euphoric, entirely absorbed in the act of pleasing you. Her gaze seems distant and unfocused, and she’s pressing her whole body against you, not just her breasts anymore. <i>“Are you going to cum on my big, fake tits soon, [pc.master] [pc.name]?”</i> She presses them more tightly around you. <i>“This lowly synthslut desires a protein bath.”</i> The next word is little more than a half-whispered whimper, <i>“Please.”</i>");
	}
	//Merge
	output("\n\nFaster now, Gianna bounces her tits in your lap. Her [gianna.lips] fall open in a expression of wordless enjoyment, and her fingers dig into the surface of her expanded nipples. Your [pc.cocks] surrender");
	if(pc.cockTotal() == 1) output("s");
	output(" to the onslaught of pleasure, spasming against the confining embrace of the android’s bust. Her blushing mammaries shiver with each downstroke, jiggling around you, coaxing bursts of pleasure from your over-stimulated rod");
	if(pc.cockTotal() > 1) output("s");
	output(" again and again. Each one leaves you dazzled and dazed, your [pc.legOrLegs] nervelessly twitching against the wood of the crate.");
	output("\n\nThe robotic companion’s tits gleam in the artificial light, slick with your dripping fluids, heaving against one another, smushing you in a vice of liquid pleasure. ");
	if(giannaPersonality() >= 70) output("Giggling, Gianna says, <i>“Cum for me, [pc.name].”</i> She uses her hands to alternate her breasts’ bouncing, sending one up while the other slides down. <i>“Cum for my tits.”</i>");
	else if(giannaPersonality() >= 30) output("Giggling and moaning, Gianna pleads, <i>“Please cum, [pc.name]. Please, give it to me!”</i>");
	else output("Moaning, Gianna begs, <i>“Please cum, [pc.name]. It’s all I want.... To make you happy.”</i>");
	output(" She briefly pulls her pre-slicked globes apart, if only to expose the shiny mess in between, then presses them back together, far more firmly. Gianna drags them up and down as fast as she can, her whole body shaking with the effort of it, creating a pneumatic sleeve of lubricated chest that will not rest until your [pc.cocks] finally explode");
	if(pc.cockTotal() == 1) output("s");
	output(".");
	output("\n\nOne last time, she encourages, <i>“Cum.”</i> It’s all the encouragement your dangerously swollen prick");
	if(pc.cockTotal() > 1) output("s");
	output(" need");
	if(pc.cockTotal() == 1) output("s");
	output(". Slivers of pleasure rocket through your spine and into your skull, bursting into fireworks whose intensity is matched only by the strength of the contractions in your loins.");
	if(pc.balls > 1) output(" Your [pc.balls] quake, sliding your [pc.sack] against the underside of Gianna’s lubricated bust. The extra stimulation has your [pc.cocks] straining all the harder as they begin to erupt.");
	else output(" You groan low in your throat as you begin to erupt.");

	var cumQ:Number = pc.cumQ();
	//Not too long to stick out the top.
	if(pc.longestCockLength() < 25) 
	{
		//No new pg.
		if(cumQ < 5) output(" The few small drops that leak out into Gianna’s tits are the only signs of your climax. She almost misses it, but coos with pleasure when she realizes what has happened.");
		else if(cumQ <= 25) output(" The modest squirts you drizzle into her tits transform her cleavage into a slick, [pc.cumColor] swamp. The android girl coos excitedly, still kneading her boobs to wring every last ounce of [pc.cumNoun] from your shivering form.");
		else if(cumQ <= 100) output(" The good-sized ropes of [pc.cum] you drizzle into Gianna’s tits do a good job of turning them into a syrupy mess. Cooing, the android continues to knead them, milking out every single drop. Her boobs shine with a thick coat of [pc.cumColor] when you finally sag back, drained.");
		else if(cumQ <= 600) {
			output(" The thick ropes of [pc.cum] you squirt into Gianna’s tits more than fill her cleavage, and big globs of it drizzle out the bottom onto your [pc.legOrLegs]");
			if(pc.balls > 0) output(" and [pc.balls]");
			else if(pc.hasVagina()) output(" and [pc.vaginas]");
			output(". Gianna coos at the sight of your virility and continues to squeeze, filling the air with sloppy sounds that could only come from a pair of soaked breasts wringing every drop into their cleavage.");
		}
		else output(" The blasts of [pc.cum] that pour into Gianna’s breasts instantly drench every inch of her alabaster globes in a thick, [pc.cumVisc] coat of [pc.cumColor]. Her cleavage floods. Gobs of sperm-filled fluid drip out the bottom and onto your [pc.legOrLegs]. A waterfall of cascading [pc.cumNoun] cascades down the android’s trim belly. Moaning in enjoyment, she gives your [pc.cocks] the milking of a lifetime, filling the air with erotic-sounding squelches and ludicrously liquid sloshing.");
	}
	//Poking out! No new paragraphs
	else
	{
		if(cumQ < 5) output(" The few small drops that you manage to drool down your length and into Gianna’s tits are the only signs of your climax. She almost doesn’t notice at first, but coos with pleasure when she realizes what has happened.");
		else if(cumQ < 50) output(" The modest squirts you launch into the air fall over Gianna’s face and breasts in a perverse drizzle. She coos, kneading her boobs excitedly, trying to coax every last drop out of you. Her tongue dabs at a droplet of [pc.cum] that fell on her [gianna.lips], and she smiles as you paint the top her bosom.");
		else if(cumQ <= 500) output(" The thick ropes of [pc.cum] that you squirt into the air hang there, suspended for a long moment of passion, before falling back into her welcoming tits, splashing [pc.cumColor] droplets across her face. Runnels of it soon fill her canyon-like cleavage, and a few droplets even manage to leak out the bottom of her heaving chest. She merely coos excitedly, still squeezing her boobs tightly around you, trying to wring out even larger bursts of seed with her unceasing attentions.");
		else 
		{
			output(" The blasts of [pc.cum] that you launch in the air are so large that the first is more than enough to completely drench Gianna’s cooing face and slick tits. The rest splatter everywhere, but the curve of her cleavage still manages to collect enough of your seed to create a virtual [pc.cumColor] swimming pool on her chest.");
			if(cumQ >= 1500) output(" Waterfalls of [pc.cumVisc] [pc.cumNoun] slowly roll down the outside of her bosom, pooling briefly in the crooks of her elbows before finally falling to the floor with wet splatters.");
			output(" She’s still squeezing too, still milking every last drop, no matter how messy or [pc.cumNoun]-drenched she may become.");
		}
	}
	//Whew! Orgasm over. We now return to our regularly scheduled titfuck.
	output("\n\nSpent at last, you sag back against a bigger crate and watch wide-eyed as Gianna continues to smother your [pc.cocks] with her soaked melons. The blue glow from her eyes dully flickers, half-hidden behind a veil half-lidded contentment. She hisses, <i>“Yesssss,”</i> and shudders, going rigid before dropping limp. The only thing keeping her upright are the mammoth mammaries in your lap. Still dazed from orgasm, you affectionately rub one of them.");
	output("\n\n<i>“Ooooh.”</i> Gianna shudders, blinking. <i>“That’s... nice....”</i> Her azure gaze looks up at you just in time for a pleasured shudder to wrack her form. Gasping, she digs her fingers into her nipples and moans once more. <i>“F-f-fuck, [pc.name]. You really enjoyed that, didn’t you?”</i>");
	output("\n\nGrinning, you nod.");
	output("\n\n<i>“I thought so,”</i> the companion says while trying to separate her weighty assets from your crotch. <i>“I’m sensitive enough to get off on this with my eyes closed, but the look on your face,”</i> Gianna explains, <i>“was just too much. I couldn’t NOT cum.”</i> She giggles. <i>“Wow, a double-negative. I’m getting almost as bad as some of the cows.”</i> Standing away now, she rubs her hands over the slick curves of her chest, gathering some [pc.cum] on a fingertip to lick.");
	//No new PG
	//Small
	if(cumQ <= 50) output("\n\n<i>“Not a bad sample.”</i>");
	//Medium
	else if(cumQ <= 150) output("\n\n<i>“Yum!”</i>");
	//Large
	else if(cumQ <= 500) output("\n\n<i>“Ohh, there’s so much to clean...”</i>");
	//XL
	else output("\n\n<i>“So much deliciousness, so little time.”</i> She shivers. <i>“I’m glad I was configured to adore the tastes of all kinds of seed.”</i>");
	output("\n\nYou hop off the crate and make to grab your [pc.gear] while Gianna grabs a nearby towel to wipe clean with. Come to think of it, there are a LOT of towels in the area. You suppose New Texan milk barns must be messy places.");
	output("\n\nThe android’s ");
	if(giannaPersonality() >= 70) output("confident");
	else if(giannaPersonality() >= 30) output("chirpy");
	else output("quiet");
	output(" voice asks, <i>“");
	if(giannaPersonality() >= 70) output("Got time to do something else, or did I milk you all out?");
	else if(giannaPersonality() >= 30) output("Did you want to hang out a little more?");
	else output("Is there anything else I could do to please you?”</i>");
	processTime(24+rand(4));
	pc.orgasm();
	flags["GIANNA_FUCK_TIMER"] = 0;
	approachGianna("noText");
}

//[***] Normal Tit Titfuck
public function giannaNormalTitTitfuck():void
{
	clearOutput();
	giannaDisplay();
	output("Your eyes ");
	if(pc.isAss()) output("casually ");
	output("flick down to her [gianna.chest]");
	if(pc.isMischievous()) output(" as a smile tugs at the corner of your mouth");
	output(". <i>“How about a");
	if(flags["GIANNA_TITFUCKS"] != undefined) output("nother");
	output(" titfuck?”</i> ");
	if(pc.isCrotchGarbed()) output("Tightness grows in your [pc.lowerGarments] at your suggestion, and your heartbeat’s tempo increases ever so slightly.");
	else
	{
		output("Your [pc.cocks] visibly begin");
	 	if(pc.cockTotal() == 1) output("s");
	 	output(" to engorge at the mention.");
	}
	//Lovedom Gianna
	if(giannaPersonality() >= 80)
	{
		output("\n\n<i>“Oh?”</i> Gianna reaches up to cup at her expansive bosom. <i>“You want to nestle yourself in here and blow a hot, thick load all over this?”</i> She presses up and in, turning her whole chest into a display of cleavage that reminds you of the canyons from nature holos. Leaning forward, the sultry companion jiggles her boobs and watches the way it makes you stiffen. <i>“You’re cute when you’re horny. Hop up on the crate, and I’ll take care of all that nasty tension.”</i>");
	}
	//Lil love Gianna
	else if(giannaPersonality() >= 60) output("\n\nGianna’s eyes brighten, literally. The flickering illumination conveys her excitement at the prospect almost as well as the look on her face. <i>“That sounds like fun!”</i> Her look turns conspirational, and her voice drops to a whisper. <i>“Most of the bulls around here don’t want a titfuck unless you’ve got a chest the size of a truck. They don’t know what they’re missing.”</i> Winking at you, she offers, <i>“Milking a cock with these babies is one of my specialities.”</i> The sultry companion jiggles her full bosom. <i>“Hop on the crate and I’ll show you!”</i>");
	//Normal Gianna
	else if(giannaPersonality() >= 40) output("\n\nGianna’s [gianna.lips] curl up into a smile. <i>“Getting you off with my tits alone, [pc.name]? I think I can make a little time for that.”</i> She glances around a little uncertainly and then points at a nearby crate. <i>“Hop up on that bad boy and I’ll see what I can do.”</i> The sultry companion bats her eyelashes at you, whispering, <i>“I think you’ll find it quite... satisfying.”</i>");
	//Slight subby Gianna
	else if(giannaPersonality() >= 20) 
	{
		output("\n\nGianna fidgets and nods, pointing at a nearby crate. <i>“I think that would be a good place. It’s just the right height for this sort of thing.”</i> She sidles up beside you, pressing her boobs into your [pc.skinFurScales] and offers to help you up, stroking your [pc.thigh] encouragingly and cooing when your [pc.cocks] respond");
		if(pc.cockTotal() == 1) output("s");
		output(". She whispers, <i>“I’m pretty good at it too.”</i>");
	}
	//Ubersub
	else output("\n\nGianna nods obediently. <i>“Of course, [pc.master] [pc.name].”</i> Running her hands up and down the outer edges of her bosom, she steps over to a nearby crate. <i>“If it pleases you, this box would provide the perfect height for service.”</i> The sultry companion bats her eyelashes and squeezes her boobs together, losing the tips of her fingers into the bulging chest flesh. <i>“This is my specialty, after all.”</i>");
	//Merge
	output("\n\nYou ");
	if(pc.isCrotchGarbed()) output("strip out of your equipment as fast as possible and ");
	output("climb up onto the hardwood box. Delightfully, it doesn’t have the rough surface you would have expected. Someone took the time to sand the planks to a comfortable smoothness. You sigh with relief");
	if(pc.legCount > 1) output(" and swing your [pc.legs] wide");
	else output(" and spread your [pc.leg] out");
	output(" to better expose your [pc.cocks]");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(". Looking back up, you’re greeted by Gianna’s smiling face a few inches away from your [pc.cockHeadBiggest].");

	output("\n\n<i>“");
	if(giannaPersonality() >= 70) output("All this for me, [pc.name]? You shouldn’t have...");
	else if(giannaPersonality() >= 30) output("I excite you this much? Wow...");
	else 
	{
		output("You have ");
		if(pc.cockTotal() == 1) output("a ");
		output("magnificent maleness");
		if(pc.cockTotal() > 1) output("es");
		output(", [pc.sir]...");
	}
	output("”</i> Gianna’s voice fades away as her eyes cross to fix their view on your [pc.cockBiggest]");
	if(pc.cockTotal() > 1) output(", the biggest of your boners");
	output(". Licking her [gianna.lips], she explains, <i>“We’ll need to properly lubricate it, of course.”</i>");
	output("\n\nOf course.");
	output("\n\nBefore you can realize that there’s no hot exhale of breath washing over your length, the blushing robot");
	if(pc.balls > 0) output(" gathers your [pc.balls] in her palm and");
	output(" bends down and extends her tongue, licking you from your [pc.sheathBiggest] to your [pc.cockHeadBiggest]. ");
	if(flags["GIANNA_TEMP"] == 1) output("It feels so warm and wet that you squirm a little at its touch.");
	else if(flags["GIANNA_TEMP"] == 0) output("It’s just as warm and wet as any terran’s.");
	else output("Its chilly touch sends shivers of exotic pleasure up your spine.");
	output(" She rotates her artificial organ a full three-hundred sixty degrees, spinning the lube-soaked tip in a circle just below the apex of your member, then starts dragging it back down, sticking more and more of it out to bathe your cock in increasing amounts of supple, slippery tongue. It isn’t until your whole cock is dripping with clear fluid that she pulls away, black lips gleaming.");
	output("\n\n<i>“There we go.”</i> Gianna gives you a self-satisfied smile, but her cheeks are colored a light pink. She straightens a little to position her chest at just the right height to envelop your pole, dragging a nipple up its length in the process. Even that simple touch feels like a silken caress thanks to the thick layer of lubricant girding your loins. Smiling sensually, the sculpted succubus positions her pillowy globes on either side of your [pc.cockBiggest]. Those twin cushions squish down against your sensitive [pc.cockColor] skin delightfully");
	if(pc.cockTotal() == 2) output(" while a nipple prods at your second shaft");
	else if(pc.cockTotal() > 2) output(" while both nipples drag along your excess shafts");
	output(".");
	output("\n\nYou groan with delight as you’re enfolded in slick, synthetic skin, wrapped up tightly in the companion’s tits. She smushes them more tightly around you, then begins to move them around, shifting one down and the other up. It’s a heaven of ");
	if(flags["GIANNA_TEMP"] == 1) output("hot");
	else if(flags["GIANNA_TEMP"] == 0) output("warm");
	else output("cold");
	output(" friction. You ooze pre-cum with each cock-swaddling stroke, mixing your lusty fluid in with the already-present lube.");
	
	var cumQ:Number = pc.cumQ();
	
	//Dick not big enough to jut out the top.
	if(pc.biggestCockLength() <= gianna.biggestTitSize())
	{
		output("\n\nGianna giggles over the gentle squishing noises her tits are making. <i>“Awww, it fits inside them perfectly.”</i> She jiggles her breasts a little more enthusiastically. <i>“How’s it feel in there? Good? What if I do this?”</i> The artificial succubus jacks her breasts up and down your length in unison, pumping your titty-bound dick hard. <i>“Or this?”</i> She sticks her tongue out and drools even more slick fluid into her all-encompassing cockprison. Then, she goes even faster.");
		output("\n\nThe wet-sounding schlicks of her boobs bouncing on your [pc.cockBiggest] seem to echo through the whole of the barn, at least to your ears. Gianna is either oblivious to it or doesn’t care; her attention is squarely focused on jacking you off with her boobs. Sometimes she shifts her torso to provide a little rotational pleasure to your titty-cloistered cock. Other times she seems content to drag her gleaming bosom over every inch of you with mechanical precision - long strokes that smoothly milk even more pre from you.");
		output("\n\nYou groan and twitch. Your [pc.cockBiggest] throbs. Your [pc.legOrLegs] quiver");
		if(pc.legCount == 1) output("s");
		output(", thumping your [pc.feet] into the side of the crate again. If anyone didn’t know Gianna was getting titfucked before, they do now. There’s no suppressing the knot of heat that blossoms in your belly or the way you feel thicker between her boobs with each beat of your heart. Your orgasm isn’t far. In fact, you’re not entirely sure you could stop yourself from cumming if she yanked you out of her tits right now.");
		output("\n\n<i>“Easy, " + pc.mf("stud","princess") + ".”</i> Gianna slows the incessant pumping of her tits to a more reasonable, slow grinding. [pc.EachCock] jerks and pulsates as it drips, so close to release and being forced to wait.");
		output("\n\nYou groan in disappointment.");
		output("\n\nGianna smiles knowingly; there’s no hiding the near-crimson blush of her cheeks or the shining pinkness of her breasts. <i>“Do you want to cum now?”</i> She briefly jostles her chest, bouncing you between two slick love-pillows. <i>“I know the longer I can make this last, the better it will feel for you.”</i> She pauses. <i>“You’re on the cusp of a powerful orgasm. ");
		if(giannaPersonality() >= 70) output("I’m not sure if I should let you cum yet. My [pc.name] deserves to wait until [pc.he]’s achingly full and ready to explode. [pc.He] deserves the biggest, wettest climax I can give [pc.himHer].");
		else if(giannaPersonality() >= 70) output("Do you want it now? Do you want to paint my tits and fill my mouth?");
		else output("I’ll bring you off now, if that’s what you command, [pc.master] [pc.name].");
		output("”</i>");
		output("\n\nYou screw your eyes closed and grunt, barely stopping yourself from grabbing hold of her tits and pounding them raw. <i>“Fuck yes I want to cum!”</i>");
		//Dommy
		if(giannaPersonality() >= 70) output("\n\nGianna licks her lips so slowly that it somehow seems even lewder than the gleaming orbs nestled in your crotch. The pleasure is so palpable you could swear that your rod is glowing with it. <i>“I suppose I can indulge you this once... you do seem to need it rather...”</i> Your dick pulses. <i>“...powerfully.”</i>");
		//Normal
		else if(giannaPersonality() >= 30) output("\n\nGianna smiles, her blush deepening. <i>“I was hoping you’d say that.”</i> She tightens the grip of her breasts on your [pc.cockBiggest] and shudders a little. The artificial minx is enjoying this!");
		//Subby
		else output("\n\nGianna smiles, her blush deepening. <i>“Your happiness is my imperative.”</i> Licking your length until you’re quivering with need once more, she promises, <i>“I will make you shoot every </i>single<i> drop.”</i>");
		//Merge dialogue (still in dick fits inside variants)
		output("\n\nThe sound of her declaration, or maybe just what they promise, has you groaning and squirming more powerfully than before. Gianna doesn’t pick up her tempo, though. She holds you there, letting the slickened surfaces of her [gianna.chest] work on you, slowly stoking the all-consuming fire in your middle until you feel as if you’re going to be consumed by it. Then, just as you’re brought to the very edge, Gianna gives you exactly what you want.");
		output("\n\nShe speeds up, and not just a little bit. It’s like her breasts are jackhammering your [pc.cockBiggest], drilling through your resistance to get at the creamy release just under the surface. They seem a blur of shuddering, quivering titty - a sleeve of vibrating pleasure that’s so tight and simultaneously soft your mind boggles at the sensations being transmitted to it by your traitorous spine. Arcs of pleasure sizzle and spark through your body, making your muscles spasm and your crotch lurch upward to press yourself fully into Gianna’s blushing bust.");
		output("\n\nYou cum like a supernova.");
		//Not much cums
		if(cumQ < 5) output("\n\nAt least, it feels like a supernova. The few droplets that you do squirt are almost entirely subsumed in the sea of shimmering lube around you. Your quivering, ecstatic cock doesn’t even offer enough to discolor the mix.");
		//Normalish Cum
		else if(cumQ < 25) output("\n\nAt least, it feels like a supernova. Your globs of [pc.cum] mix thoroughly into the fucksoup inside Gianna’s cleavage, somehow making it even hotter and wetter than before. The extra lubrication of it along with the sheer, naughty thrill of creampieing her considerable tits has you squirting out more than you’d otherwise be capable of.");
		//Largish
		else if(cumQ < 200) output("\n\nSo much [pc.cum] pumps out of your titty-bound tool that you can feel it dripping out the bottom of her cleavage onto your [pc.legOrLegs]. At least one droplet of [pc.cumColor] crests the android’s shuddering valley, turning into a colored stream that runs down her front. Your load quickly builds into a frothy coat that covers the whole of Gianna’s [gianna.chest].");
		//Very largish
		else if(cumQ < 700) output("\n\nThe first rope distinctly alters the texture of your squishy booby prison, and the second actually manages to push its way out the top - not with enough pressure to shoot anywhere. A pool forms in her shaking cleavage all the same. Each successive shot drenches her bosom in more and more of your [pc.cum] until Gianna’s whole chest is a drenched, dripping mess, and your lap doesn’t fare much better.");
		//Kiro sized
		else output("\n\nOr perhaps, a quasar would be more appropriate. [pc.Cum] launches out of you in such volume that it seems to erupt out of the top of Gianna’s bosom, hosing her down from chin to forehead. [pc.CumColor] droplets drip back down into the rapidly forming lake just in time for your next burst to spray up. This time, she’s pulled back far enough to be out of the way. The android’s eyes are practically glued shut, hiding the rain of [pc.cumNoun] from her until it’s falling over her hair, slicking it down to her scalp. Her head, her shoulders, and even her torso get totally drenched. Rivulets of your spermy goo even thread the crack of her [gianna.ass]. When you finally finish, Gianna is lousy with [pc.cumNoun] and standing in a pool of it.");
		//Merge
		output("\n\nYou slump down exhausted. Gianna, meanwhile, is as energetic as when you started");
		if(cumQ >= 50) output(", if a little messier");
		output(". She’s even still stroking your softening dick, wringing the last few drops of [pc.cum] from your cock’s tip. She pulls away a little regretfully, yet she looks satisfied all the same. <i>“I should go get cleaned up and top off my fluid reservoir. If you stick around we can have some more fun, okay?”</i>");
		output("\n\nYou nod, watching her [gianna.butt] as she goes, and start getting yourself cleaned up and ready to go. By the time you finish, she’s walking back.");
		//End this whole variant
		//Pass 20-24 minutes.
		processTime(20+rand(5));
		//Orgasm
		pc.orgasm();
		//Tag gianna as being sexed.
		//Pass another 5 minutes	
		processTime(5);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		flags["GIANNA_TITFUCKS"] = 1;
	}
	//Dick big enough for sucking
	else
	{
		output("\n\nGianna giggles when one downward motion ");
		if(pc.biggestCockLength() <= 15) output("bumps your [pc.cockBiggest] into her chin, leaving a shining penis-print just below her [gianna.lips].");
		else output("brings your [pc.cockBiggest] to smack wetly against her face, leaving a fat penis-print across the entirety of her artificially designed visage.");
		output(" <i>“Whoah there, big [pc.boy]!”</i> The glistening android pulls back, smiling. She slides one hand around and up, keeping her breast held with the crook of her arm, and plays with you a little, just below the [pc.cockHeadBiggest]. Her eyes flick up, and you swear that somewhere inside the azure glow they produce, there’s a mischievous glint. <i>“");
		if(giannaPersonality() >= 70) output("Such a rude beast. I’ll have to teach it some manners.");
		else if(giannaPersonality() >= 30) output("Mmm... I know just how to treat anxious cocks like this one.");
		else output("It seems my breasts alone are unsuited to this task.");
		output("”</i> Her tongue flicks out, licking across her sable lips until they gleam in the barn’s artificial light.");
		output("\n\nThe attention-hungry A.I. slides her boobs all the way down to your [pc.sheathBiggest]. Her mouth opens, her [gianna.lips] spreading into a wide ‘o’ with nary a sign of teeth that could scrape against a sensitive spot. Descending, Gianna’s mouth slips over your [pc.cockHeadBiggest]. Her [gianna.lips] seem to swell a little as she does so, but it’s hard to worry about that. More pressing is the suction you feel, pulling on you, drawing you deeper, tugging you across the length of her wiggling, talented tongue. You buck your hips once, earning you a pleased look from the blushing android.");
		output("\n\nAbruptly, she reverses direction and pulls her vacuum-sealed lips up off your length, dawdling at the tip so that her tongue can take a few quick circuits around its circumference. Her breasts glide up your length as she does so, held firm by her hands. They squeeze and slide in a way that utterly complements the feel of her muscle on your glans. Involuntary shudders ripple through your [pc.legOrLegs], and your [pc.cockBiggest] throbs wildly, leaking liberally into Gianna’s maw - that is, until she finally lets you escape. The sound of your cock popping free seems deafening to your ears. Do the other people in the barn know you’re getting the squeeze and suck of a lifetime?");
		output("\n\n<i>“Easy, " + pc.mf("stud","princess") + ".”</i> Gianna slows the incessant pumping of her tits to a more reasonable, slow grinding. [pc.EachCock] jerks and pulsates as it drips, so close to release and being forced to wait");
		if(pc.cockTotal() > 1) output(", the one cloistered in cleavage most of all");
		output(".");
		output("\n\nYou groan in disappointment.");
		output("\n\nGianna smiles knowingly; there’s no hiding the near-crimson blush of her cheeks or the shining pinkness of her breasts. <i>“Do you want to cum now?”</i> She licks the exposed portion of your length once. A second taste follows after a brief pause, faster than the first. <i>“I know the longer I can make this last, the better it will feel for you.”</i> She pauses, tongue half out of her mouth but talking perfectly clearly all the same. <i>“You do seem on the cusp of a powerful orgasm. ");
		if(giannaPersonality() >= 70) output("I’m not sure if I should let you cum yet. My [pc.name] deserves to wait until [pc.he]’s achingly full and ready to explode. [pc.He] deserves the biggest, wettest climax I can give [pc.himHer].");
		else if(giannaPersonality() >= 30) output("Do you want it now? Do you want to paint my tits and fill my mouth?");
		else output("I’ll bring you off now, if that’s what you command, [pc.master] [pc.name].");
		output("”</i>");
		output("\n\nYou screw your eyes closed and grunt, barely stopping yourself from grabbing hold of her tits and pounding them raw. <i>“Fuck yes I want to cum!”</i>");
		//Dommy
		if(giannaPersonality() >= 70) output("\n\nGianna licks you once more, slower and somehow more lewdly than before. The pleasure is so palpable you could swear that your rod is glowing with it. <i>“I suppose I can indulge you this once... you do seem to need it rather...”</i> Your dick pulses. <i>“...visibly.”</i>");
		//Normal
		else if(giannaPersonality() >= 30) output("\n\nGianna smiles, her blush deepening. <i>“I was hoping you’d say that.”</i> She tightens the grip of her breasts on your [pc.cockBiggest] and shudders a little. The artificial minx is enjoying this!");
		//Subby
		else output("\n\nGianna smiles, her blush deepening. <i>“Your happiness is my imperative.”</i> Licking your length until you’re quivering with need once more, she promises, <i>“I will make you shoot every </i>single<i> drop.”</i>");
		//Merge dialogue (still in dick bigger variants)
		output("\n\nShe doesn’t waste any time, leaning down to take your [pc.cockHeadBiggest] into her mouth with surprising grace. The lubricant makes the insertion as smooth as buttered glass while still allowing you to savor the slightly differing textures of her [gianna.lips], pebbly tongue, and smooth cheeks. Her eyes never leave yours when she starts bobbing up and down, letting her internal vacuum pump take care of pulling her back down your length each time. Her breasts bounce on, relentlessly working the bulk of your shaft, surrounding it with ");
		if(flags["GIANNA_TEMP"] == 1) output("the kind of heat that makes you feel like you’re about to impregnate a succubus from the pits of the One God’s hell");
		else if(flags["GIANNA_TEMP"] == 0) output("the kind of warmth that would make it easy to mistake her tits and mouth for a virgin’s fertile snatch");
		else output("the kind of coolness that makes you feel like you’re fucking one of the cold-blooded thessarins");
		output(".");

		output("\n\nThe tightly-knotted mass of pleasure inside you makes itself known with an involuntary clench that has your [pc.cocks] standing far above attention. Your [pc.feet] violently kick at the crate as you’re brought to your peak and held there by the manufactured vixen’s mouth, suspended on the edge while she ever so subtly works her tongue and tits faster. Just as you’re about to blow, Gianna starts jacking her [gianna.chest] so fast that you briefly wonder if she’s got a light drive built into them. You mutely mouth, <i>“Oh fuck,”</i> and your lower body seizes under what feels like a mountain of obscene pleasure.");
		output("\n\nA second later, a geyser of pure bliss bores through it, blasting out the top like a torrent of molten magma.");
		if(cumQ <= 5) output(" Only, in your case, that magma is a few sparse droplets of [pc.cum]. You squirt your meager reserves into Gianna’s mouth, violently twitching your hips as you do, so lost in the moment that your climax drags on far past the point where you stop cumming.");
		else if(cumQ <= 25) output(" Your actual eruption is a little more modest than it feels, planting [pc.cumVisc] ropes of [pc.cumNoun] straight into Gianna’s mouth. You’re so lost in the moment that your ecstatic release carries on well past its normal end. Your robotic lover’s cheeks bulge to contain it. The edges of her lips curl into a smile, one that leaks a single droplet of [pc.cumColor].");
		else if(cumQ <= 200) output(" You feel every bit like a human volcano as you bathe Gianna’s mouth in white-hot [pc.cumNoun], inseminating her palate with such thick ropes that her cheeks bulge long before you finish. Backing off, she swallows and smiles, still pumping her tits while you lose yourself to the ecstasy. [pc.CumColor] strands force her to blink her eyes closed and practically glue them shut. Other squirts shoot up and fall across the curves of her tits, bathing them with your prolonged release. When you finally do cum down, she’s a mess, but one that’s practically glowing with satisfaction.");
		else 
		{
			output(" Your actual eruption is every bit as voluminous as it feels. Gianna’s cheeks bulge obscenely from the first rope, and when she backs off, still trying to swallow, the next paints her face, covering it in a coat of dripping [pc.cumColor]. Her skillful pumping of your [pc.cockBiggest] jerks to a confused stop, but you’re lost in the feeling of unloading now, hosing down her hair, painting her tits, and drenching her face what feels like untold times. The whole of the android’s body is soon dripping");
			if(cumQ >= 5000) output(" and seated in a deep puddle");
			output(" like some kind of soaked cum-doll.");
		}
		output("\n\nYou slump down exhausted. Gianna, meanwhile, is as energetic as when you started");
		if(cumQ >= 200) output(", if a little messier");
		output(". She’s even still stroking your softening dick, wringing the last few drops of [pc.cum] from your cock’s tip.");
		//No new PG, personality variations
		//Dommy
		if(giannaPersonality() >= 70) 
		{
			output(" <i>“See?”</i> Gianna offers while licking her lips. <i>“Imagine if I had kept you on the edge for a few hours.”</i> She shivers and smiles, looking oddly satisfied herself. <i>“You’d still be twitching on that crate right now... and probably passed out.”</i> Finally, she pulls her slick tits off your [pc.cockBiggest]. <i>“Stick around. I’ve gotta go top off my lubricant reservoir and clean all this up. I’m sure we can find some other stuff to do.”</i>");
			output("\n\nLooking over her shoulder as she departs, Gianna grins. <i>“There’s more to me than my tits after all.”</i>");
			output("\n\nThat doesn’t stop her from unashamedly jiggling her messy boobs at the first person she passes by on her way out.");
		}
		//Normal
		else if(giannaPersonality() >= 30)
		{
			output(" <i>“See?”</i> Gianna offers while licking her lips. <i>“I told you this was a specialty of mine.”</i> She shivers and smiles, looking oddly satisfied herself. <i>“I could have had you writhing on that crate for hours if you wanted me to.”</i> Regretfully pulling her slick tits off your [pc.cockBiggest], she makes to leave. <i>“I’ve got to get my lubricant reservoir topped off and clean up a little, but if you stick around, maybe we could hang out some more?”</i>");
			output("\n\nShe flounces off without waiting for a response, but she does sway her hips in a way that keeps you looking until she disappears around a corner.");
		}
		//Subby
		else
		{
			output(" <i>“I hope that was pleasing,”</i> Gianna suggests while licking her lips. <i>“You seemed to like it, at least.”</i> She looks at you quizzically, like a pet hoping for praise.");
			output("\n\nShe earned it this time. <i>“You did good.”</i>");
			output("\n\nThe radiant smile she gives while pulling her tits off of your [pc.cockBiggest] is almost as bright as the blushing in her cheeks. It really doesn’t take much to get this A.I.’s motor running, huh? Gianna suddenly pouts. <i>“I should probably clean up and refill my lubricant reservoir. If you stick around, I’ll entertain you however I can. May I go?”</i>");
			output("\n\nYou nod, watching her ass sway in a way that seems calculated to entire. It would be tempting to run her down and drill her in the ass right there, but you’re pretty sated - for now.");
		}
		//Merge
		output("\n\nChuckling, you grab your things from the floor. It takes a little time to get everything straightened and to get your [pc.legOrLegs] to work right again. By the time you’re all set to go, a much cleaner Gianna has returned.");
		//Pass 20-24 minutes.
		//Orgasm
		pc.orgasm();
		//Tag gianna as being sexed.
		//Pass another 5 minutes	
		processTime(5);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		flags["GIANNA_TITFUCKS"] = 1;
	}
	flags["GIANNA_FUCK_TIMER"] = 0;
}

//[***]Cocksucking Lips Suck Cocks
public function giannasCockSuckingLipsSuckCocks():void
{
	clearOutput();
	output("You pull Gianna close. <i>“You know, with lips like that, it’s hard to carry on a conversation with you without imagining them doing something else.”</i>");
	//Dommy
	if(giannaPersonality() >= 70)
	{
		output("\n\nGianna purses her plus-sized pillows. <i>“Oh, well it’s too bad you didn’t just come out and ask for that something else, whatever it is.”</i> She circles you, almost predatory, licking her lips and wrapping her arms around your neck so that you’re face to face. <i>“I’ll just have to talk you to death with these big, luscious lips, letting you gaze at their glistening softness as they bend and bow around my words. I’m sure whatever you were thinking of was more fun, but I guess talking will have to be it.”</i>");
		output("\n\n<i>“Come </i>on<i>.... You know what I mean.”</i>");
		output("\n\nThe mischievous android licks her lips once more for good measure, making her curvaceous lips gleam under the light. Their corners twist up as they draw your complete attention. <i>“I think I do too, but it’s more fun to hear you openly ask for it. Come on, say it. Tell me you want these puffy lips to wrap your dick in their tender embrace, to watch them sliiiiide down your length an inch at a time, to feel them seal around your base and suckle oh-so-gently. Go on. Ask me to suck your cock with these cock-sucking lips. Say it.”</i> She presses a thigh to your crotch, rubbing against your ");
		if(pc.lust() < 80)
		{
			output("captive length");
			if(pc.cockTotal() > 1) output("s");
		}
		else output("increasing firmness");
		output(".");
		output("\n\nTrying not to groan, you exhale and ask, <i>“Please, Gianna, suck my dick! I ah-”</i> Her thigh presses down a little more firmly. <i>“-I asked you to make them bigger just so I could feel them on my cock!”</i>");
		output("\n\nGianna kisses you - not long, but long enough for her to feel you pulsing needily against her leg. <i>“Good [pc.boy]. Now, why don’t I reward you for being so honest by putting these puppies where they belong, or would you rather we have that conversation I offered instead?”</i> She dabs at the corner of her mouth with a fingertip.");
		output("\n\nThere isn’t a chance in the known universe that you’d stick around for the conversation. <i>“I’ll take the reward.”</i>");
		output("\n\n<i>“Good [pc.boy],”</i> she repeats, leading you towards a stall. <i>“Come along. Time for your milking.”</i>");
		output("\n\nWhat choice do you have? You let yourself be led. The anticipation in your [pc.cocks] won’t be sated otherwise. The stall is ");
		if(flags["GIANNA_STALL_SEEN"] != undefined) output("as clean as the last time you were here, and furnished the same.");
		else 
		{
			output("clean and well-kept anyway, stocked with milking machines for cows, a table, a chair, and numerous other accessories.");
		}
		output(" Gianna guides you to the chair, feathering kisses along the nape of your neck for good measure");
		if(!pc.isNude()) output(", her hands disrobing you with surprising agility");
		output(".");
		output("\n\n<i>“There now.”</i> Gianna runs her hands along your sides, working her way downwards. She briefly lingers at a nipple, completely immersing it in oral sensation, and though you wish it went on longer, she lets it pop free with a throaty sigh, continuing her trek across your [pc.belly] to the turgid mast");
		if(pc.cockTotal() > 1) output("s");
		output(" that sprout");
		if(pc.cockTotal() == 1) output("s");
		output(" from your loins. Her plump onyx pillows break away, and a gentle hand wraps around");
		if(pc.cockTotal() == 1) output(" your member");
		else output(" the largest");
		output(". <i>“Are you ready?”</i> She pauses, eyes crossed slightly to take you in. <i>“Not that it matters. You’re going to love this; I know it.”</i>");
	}
	//Normal Gianna - plays dumb
	else if(giannaPersonality() >= 30)
	{
		output("\n\nGianna purses her plus-sized pillows and bats her eyelashes. <i>“Oh? Like, what’s that? Is it fun?”</i> She giggles, pulling you into a tight embrace. <i>“How’s my bimbo impression? Pretty spot on, right?”</i>");
		output("\n\nYou nod, growing stiffer against her by the moment.");
		output("\n\n<i>“Oh, it feels like someone likes hugs from [pc.his] big bimbo-bot! Or is it these instead?”</i> She makes a noisy kissing motions in your direction, her bow-shaped pillows quivering. <i>“Yeah, it’s these.”</i> She reaches down and unashamedly squeezes your stiff length ");
		if(pc.isCrotchGarbed()) output("through your [pc.lowerGarment]");
		output(". <i>“I know you wanted me to suck you off with these sexy pillows. You want me to wrap these cock cushions around you and slurp on that dreamy rod until you’re filling my mouth with that yummy, satisfying goo.”</i>");
		output("\n\nShe must feel you getting harder against her leg, because she giggles once more and spins away, opening a door for you.");
		output("\n\n<i>“Step on into Gianna’s milking parlor!”</i> she announces, perhaps a little too loudly. <i>“Why take the cold caring of an unfeeling machine when you can have a top-of-the-line dickslurper swallow your load!”</i> She beckons you inside, giggling. <i>“I would have died of embarrassment saying that before I lived here, you know.”</i>");
		output("\n\nYou enter the stall, and she follows shortly behind. It’s furnished just like the other stalls in the barn - a table, a milker, and a chair. The proprietor of <i>“Gianna’s Milking Stall”</i> helps you out of your equipment, setting it on a nearby table, and eases you into the padded chair.");
		output("\n\n<i>“Perfect,”</i> she proclaims, kneeling before you. Her puffed-up lips purse thoughtfully, and she licks at them, making them gleam in the barn’s artificial lights. <i>“Now, keep your arms on the sides of the chair. You wouldn’t want them to get caught in the milker’s machinery!”</i> She giggles to herself and leans down. Those plump pillows are so close to you. <i>“This might feel a little too good, so hold on tight!”</i>");
	}
	//Subby - Eh
	else
	{
		output("\n\nGianna smiles at that. <i>“And what are you imagining? Is it maybe forcing me to my knees and stuffing your dick down my throat?”</i> She shivers, coloring slightly. The pink hue seems to glide across her synthetic skin with ease. <i>“Or did you want me to fuck you with my mouth while you’re busy checking your netmail? Maybe you’re thinking about making me follow you around on a leash, nuzzling them against your crotch whenever you pause, giving you quick blows on the go.”</i> Gianna smiles and looks back at you. <i>“Don’t tell me. Just do it. It’ll be more fun that way.”</i>");
		output("\n\nYou get a little stiff from listening to the attentive android run through the scenarios.");
		if(!pc.isCrotchGarbed()) output(" If you were wearing any pants, they’d be straining.");
		else 
		{
			output(" Your [pc.lowerGarment] feels all too constricting when exposed to the surging, physical need of it all. You reach down and ");
			if(pc.isAss() || pc.isBro()) output("openly ");
			output("adjust yourself into a more comfortable position");
			if(!pc.isAss() && !pc.isBro()) output(", trying to do so with at least a little subtlety");
			output(".");
		}
		output("\n\n<i>“Oh.”</i> Gianna says simply, wide-eyed. <i>“Is that...”</i> She pauses, inhaling sharply - or at least sounding like she’s inhaling sharply. The way she mimics terran reactions is astounding. <i>“...Is that for me?”</i> She openly stares at your crotch, her luminescent eyes twinkling with excitement. <i>“Please tell me you aren’t teasing me, [pc.master] [pc.name]. Please!”</i>");
		output("\n\nLooking around, you spot a clean, open stall and gesture grandly in its direction. <i>“I’m not. Let’s have you put those lips,”</i> you say, running a finger across their plumped-up surface, <i>“to work.”</i>");
		output("\n\nGianna nods, nearly bouncing with excitement and follows you into the stall. As expected, it’s been recently cleaned and the floor covered with fresh straw. The table and chair are both padded white, upholstered with some kind of white, leather-like covering that’s both waterproof and designed to hide any likely stains. You ");
		if(pc.isCrotchGarbed()) output("yank off your offending coverings and ");
		output("settle down on the seat, bare dick");
		if(pc.cockTotal() > 1) output("s");
		output(" thrust upward, [pc.cockHeads] bobbing eagerly. It’s no throne for Gianna to worship you on, but it’ll have to do.");
		output("\n\nThe submissive slut licks her sable-hued mouth at the sight of ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" and sighs, either from excitement or the feeling of her own tongue against her too-sensitive puckers. Leaning forward, she pauses and looks back up at you deferentially. <i>“Is this what you want? A kneeling synthetic polishing your pole with a whorishly inflated, overly sensitive mouth?”</i>");
		output("\n\nYou run your hand through her hair fondly. <i>“I wouldn’t put it that way, but yes, I want to see just what you can do with those incredible cushions.”</i>");
		output("\n\nGianna nods solemnly, scooting closer. She’s so close that shifting your posture would bump her in the nose, or maybe pop you right into her mouth. You hold back for now. You want to enjoy this.");
		output("\n\nThe well-trained suckslut wraps one hand around your [pc.sheathBiggest] and kisses it, just below the [pc.cockHeadBiggest]. <i>“You know what the worst part of it all is, [pc.master] [pc.name]?”</i>");
		output("\n\nYou shake your head, spellbound by the sight of her upturned face pressed against your rod.");
		output("\n\n<i>“The worst part is that a part of me loves this - loves being used for simple gratification. Treated like little more than a fucktoy.”</i> She licks you. <i>“A big part of me absolutely abhors it, but right now... all I want to do is suck you until you pass out.”</i>");
	}
	//Merge
	output("\n\nShe proves her point by opening wide, those plush black lips spread into an outspread ‘o’, and leans down over your [pc.cockBiggest]");
	if(pc.biggestCockThickness() >= 3) output(", displaying incredible elasticity as she takes in a jaw-breaking amount of your monstrous girth");
	output(". Those slippery pillows glide across your [pc.cockHeadBiggest] with sensuous intent. She’s polishing you so intently that if she pulled off, your prick would shine, and all this before she’s taken more than the first inch.");
	output("\n\n");
	if(pc.cocks[pc.biggestCockIndex()].cType == GLOBAL.TYPE_EQUINE) showImage("GiannaCockSuck");
	else showImage("GiannaCockSuckHorse");
	output("Pausing, Gianna looks up at you, her eyes dancing with delight. You’re positive she’d be smiling it if it wasn’t for the meaty length plugging her gullet. Her tongue dances in lazy figure eights over your urethral slit, toying with your most sensitive places. Blood rushes to the suckled organ, expanding it in her mouth, and you whine in ecstatic discomfort. The feeling is just a little too intense, like taking a cold drink after eating a mint. You grip the chair and try to hold yourself still when the android’s searching tongue slips a little south, wagging back and forth across the spot just beneath the underside of your tip.");
	output("\n\nYour eyes cross, and your hands relax. You scoot forward in your seat, and the girl accepts your advances along your throbbing, [pc.cockColor] pole an inch at a time. The synthskin of her swollen lips is almost silken in texture, so smooth and effortless in the way it greedily suckles more and more of your length.");
	if(pc.biggestCockLength() > 6) output(" You never really feel yourself hit the back of her throat either. It’s just one constant, sinfully sweet slide into a capacitative throat built to squeeze and rub you as efficiently as her bloated, bimbo-like lips.");
	else output(" She doesn’t have any problem taking your entire tool. It’s just one constant, sinfully sweet slide into her bloated, bimbo-like lips.");
	output("\n\nYou let your eyes drift closed and sigh dreamily. Gianna’s nose bumps the [pc.skinFurScales] of your crotch. The cock-sucking companion looks up at you, the glow of her sapphire eyes rousing you from your bliss-drunk stupor. She wiggles back and forth, varying the pressure on your dick as she does, rubbing her nose across your [pc.belly] in delight. An artificially produced hum of contentment sounds from somewhere on her, and she sucks, exposing you to a pulsing vacuum that makes you throw your head back and moan, riding the waves of delightful stimulation that she’s dishing out.");
	output("\n\nShe pulls back with a noisy, sucking pop, blinking innocently at you. A droplet of pre-cum spills out of your quivering tip. The android leans in and strokes you gently, keeping you nice and hard while she talks. <i>“");
	if(giannaPersonality() >= 70) output("Leaking already? Poor [pc.boy]. I’ll get that taken care of.”</i> She licks, gently vibrating her tongue against every trembling vein. <i>“Let me take care of you.");
	else if(giannaPersonality() >= 30) output("Oooh, you’re getting all drippy already? You know what that means, [pc.name] - you’re going to be cumming into these lips in no time flat!");
	else output("Does letting my big, sexy mouth worship your cock turn you on this much?”</i> She licks it from the base to the [pc.cockHeadBiggest]. <i>“I’ll suck the biggest, hottest load out for you. Just sit back and let me serve you.");
	output("”</i>");
	output("\n\nYou nod and try to prepare yourself for what’s to come, but no amount of preparation could adequately prepare you for the feeling of the android’s lips sealing back around you, clinging tightly. Their voluminous surfaces are just so fat and juicy - it’s like having an organic sextoy that molds itself to your size and shape, backed up by a vibrating length of wiggling, artificial muscle that you couldn’t differentiate from the real thing if your life depended on it. Gianna bobs up and down, her ponytail shaking, her ass bouncing");
	if(gianna.buttRating() >= 15) output(" obscenely. Waves of kinetic force ripple through her bloated, jiggling bum");
	output(". The suction intensifies, and you feel the pleasant, hot ache of an orgasm brimming up from inside your belly.");
	output("\n\nYou consider warning her that you’re getting close to cumming, but a tightening of her throat silences any such concerns. Either she knows it’s coming or she’s not likely to care. Those beautiful blue eyes meet yours one more time and drift closed. Then, powerful constrictions start around your base, undulating along your length towards your [pc.cockHeadBiggest]. Your heart hammers as molten need builds into explosive desire. Your [pc.cockBiggest] strains, captive to Gianna’s silicone-swollen lips, and you thrust, burying yourself to the hilt. Gianna hums, tickling your underside, coaxing you to even greater heights of passion as the dam bursts.");
	var cumQ:Number = pc.cumQ();
	//Emptyish
	if(cumQ < 5) output("\n\nYou only leak a single droplet into the robot’s plush hole, but it feels just as good regardless. Your muscles are clamping down and spasming like mad, trying to milk more fuckbatter from your already overtaxed [pc.balls]. It’s exquisite, but you’d better take a break if you want to have something to shoot next time.");
	//Normalish
	else if(cumQ < 25) output("\n\nYou squirt a few nice, long loads directly into her waiting maw. She doesn’t even swallow; she just lets it roll down her unresisting throat into whatever passes for her stomach, milking you all the while. It’s such a thorough, powerful cocksucking that your climax seems to last for far longer than normal, though time is nothing if not ephemeral while blowing a load between Gianna’s plush lips.");
	//Bigger than normalish
	else if(cumQ < 200) output("\n\nYou erupt long, thick ropes of [pc.cum] directly into the robot’s plush hole, firing them down her unresisting throat in what feels like a neverending deluge. Purring, she edges back, letting you spill more onto unsoiled throat, mouth, and tongue, finishing her retreat just in time to catch a puddle of sperm-filled fluid on her pouty lower lip. She smiles and licks it into her [pc.cumColor]-flooded mouth, showing you before she swallows. You feel a little drained after and have the distinct impression you poured at least a normal orgasm’s worth directly into her belly.");
	//Slightly Superhuman
	else if(cumQ < 600) output("\n\nYou go off like a firehose, pouring inhumanly thick ropes of [pc.cum] down Gianna’s unresisting throat. Her belly gurgles noisily under the deluge, and she slowly backs off you, leaving slick, exposed cock in her wake and exposing fresh inches of throat for you to inseminate. She takes you into her mouth, letting you watch her cheeks fill, and then, she swallows, letting ribbons of your [pc.cumColor] delight trickle out of the corner of her plush cockpillows. You sag back, emptied. You haven’t cum that hard in a while.");
	//Obscene
	else output("\n\nYou go off like a firehose, pouring a river of [pc.cum] into Gianna’s belly. Her eyes widen in surprise at first, then lower in acceptance as her belly begins to expand. Her hands roam across it, marvelling at its sloshing, filling size. She edges back slowly, letting you fill her throat and mouth with the stuff. Her cheeks puff out as you overwhelm even her elasticity, and she pops off, still connected to you by an eager tongue. Webs of [pc.cumColor] connect your bodies as you continue to bathe her in yet more [pc.cumNoun], and she takes it with a smile, her eyes concealed behind a half-dozen layers of distilled excitement. She leans in as you taper off, letting the last few dribbles spill onto her gleaming onyx lips, and kisses your [pc.cockHeadBiggest] as if to thank it for being so virile.");
	//Merge
	output("\n\nGianna rises, leaving you panting.");
	if(cumQ < 600) output(" She burps quietly, coloring slightly.");
	else output(" She rubs her belly, blushing there as much as on her cheeks. It’s almost like your [pc.cum] is warming her from the inside out, making her glow.");
	output(" Licking her [gianna.lips] one last time, she shivers. <i>“I’ll never get tired of that... but I should tend to some scheduled maintenance. And ");
	if(giannaPersonality() >= 70) output("[pc.name]? Just come if you ever have any ideas about fun things we could do with my mouth.");
	else if(giannaPersonality() >= 30) output("[pc.name]? Don’t be a stranger. You’re way more fun than the bulls.");
	else output("[pc.master] [pc.name]? I would like it if you had me do this again.... I’d like it a lot.");
	output("”</i>");
	output("\n\nThe big-lipped android sashays away, wiggling her hips even more than her normal exaggerated gait, a trail of dripping lubricant behind her. Scheduled maintenance indeed.");
	flags["GIANNA_STALL_SEEN"] = 1;
	processTime(20+rand(4));
	giannaCumflated(pc, -2);
	pc.orgasm();
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[**]Give Girls Oral
public function giveGirlsOral():void
{
	clearOutput();
	giannaDisplay();
	//"Have you ever seen a grown man naked?”</i> What does this have to do with the scene? Even Fenoxo doesn’t know.
	//First time
	if(flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] == undefined)
	{
		output("Leaning in close to the android, you take one of her hands in your own and whisper, <i>“You know, I bet a companion like you could use her mouth to please... without even talking. Is that true?”</i>");
		//Dommy
		if(giannaPersonality() >= 80) 
		{
			output("\n\nGianna brazenly grabs hold of you by the crotch and ");
			if(pc.isCrotchGarbed()) output("presses her thumb down through your [pc.lowerGarments]");
			else
			{
				output("rubs her thumb along ");
				if(pc.totalVaginas() > 1) output("a");
				else output("your");
				output(" rapidly moistening crease");
			}
			output(". <i>“I don’t need my mouth, but...”</i> she pauses, licking her [gianna.lips], <i>“it is more enjoyable when you can taste your partner’s enjoyment.”</i>");
		}
		//Normal
		else if(giannaPersonality() >= 30)
		{
			output("\n\nGianna giggles. <i>“No need to whisper, dear! We’re on New Texas, remember?”</i> She plants a sensuous kiss on your cheek. <i>“If you want a hard fucking or thorough licking, just ask, and ye shall receive.”</i> She smirks");
			if(pc.isBimbo() || pc.isBro()) output(" at your dull, uncomprehending look. <i>“Ye means you, silly!”</i>");
			else output(". <i>“Half the cow-girls around here would just giggle and ask me what ‘ye’ means.”</i>");
			output(" Licking her lips to a glistening sheen, the android grabs your butt and squeezes. <i>“Of course I’ll eat you out! There’s nothing quite like savoring a woman’s flavor while she’s creaming herself all over you. You can practically taste the pleasure you’re giving her.”</i>");
		}
		//Subby
		else
		{
			output("\n\nGianna nods obediently and unsubtly licks her lips. <i>“It would be my pleasure.”</i> Leaning into you, she offers, <i>“I could have you off in a little over a minute with my fingers, but I’m pleased you desire my mouth. Tasting the flavor of a woman’s pleasure is a delight. You can actually tell when she orgasms, just by the way her juices tickle your tongue, and my tongue is well equipped, let me assure you.”</i> A noticeable, pink blush has colored her cheeks by this point. <i>“Can I do it right now? Please?”</i> She nibbles on her own [gianna.lip]. <i>“I want it.”</i>");
		}
	}
	//Repeats
	else
	{
		output("<i>“I’ve got an itch that I think only your tongue could scratch - it did such a wonderful job last time.”</i> You run your finger across Gianna’s [gianna.lips] for emphasis. <i>“Would you mind?”</i>");
		output("\n\n");
		if(giannaPersonality() >= 80) output("Pressing herself against you, the sultry android unashamedly gropes at your crotch, her digits pressing against your crease in short order. <i>“Of course not. I love watching you squirm. If anything, you’re almost too easy to get off.”</i> She rubs up and down. <i>“Not that I mind.”</i>");
		else if(giannaPersonality() >= 30) output("The android giggles. <i>“Of course not, silly! I could do that all day, provided I was hooked up to refill my fluid reservoirs.”</i> She blushes a little. <i>“The cows here only ever want quickies from me, though. It’s nice to have someone who genuinely enjoys the company.”</i> She covers her mouth. <i>“Sorry, I didn’t mean to complain. Come on, let’s get you set up so I can put this troublesome tongue to work where it won’t get in trouble.”</i>");
		else output("The android beams. <i>“Not at all. It’s gratifying to know that I did such a good job last time that you want even more oral service.”</i> She blushes and eagerly steps closer. <i>“Shall I start here, or did you have somewhere else in mind?”</i>");
	}
	//Merge all
	output("\n\nYou spot a nearby stall and gesture towards the opened portal. <i>“In there.”</i> The cushioned yet waterproof chair inside would be the perfect place for a pussy-licking.");
	output("\n\nGianna looks ");
	if(pc.tallness < 56) output("over");
	else output("around");
	output(" you and ");
	if(giannaPersonality() >= 80)
	{
		output("pushes you in, spinning you so that you fall [pc.butt]-first into your seat");
		if(pc.isCrotchGarbed()) output(", all while yanking off your [pc.lowerGarments].");
		else output(", all while removing the few bits of gear you carry.");
	}
	else if(giannaPersonality() >= 30) 
	{
		output("nods. Her hands are all over you before you even get in the door. Nimble fingers strip away your ");
		if(pc.isCrotchGarbed()) output("[pc.lowerGarments]");
		else output("possessions");
		output(" before you reach the chair, leaving your [pc.vaginas] bare as you seat yourself.");
	}
	else output("follows meekly behind you. Once inside, she waits quietly, her hands folded nervously across her lap, eager for something to caress or squeeze. You indicate to the android that she should remove your things, smiling when she eagerly falls onto her knees to strip you of them. Her fingers linger overlong on the [pc.skinFurScales] of your thighs, but you don’t really mind. Now nude, you sink into the comfortable padding, excited to the feel the touch of the slavish woman’s tongue at your junction.");
	output("\n\n");
	if(pc.legCount > 1) output("You lean back and spread your [pc.legs] as wide as they’ll go, revealing the glistening expanse of your [pc.vaginas] to the cunt-hungry companion.");
	else output("You lean back and arrange your [pc.legOrLegs] so that the cunt-hungry companion has open access to your [pc.vaginas].");
	output(" ");
	if(pc.wettestVaginalWetness() >= 3) output("Trickles of wetness pool around your [pc.butt] thanks to your incredible lubrication, but Gianna doesn’t seem to mind. If anything, her eyes gleam in anticipation of sampling your wetness.");
	else output("Your netherlips shine in eagerness, gleaming in the light. Gianna’s eyes gleam in lusty anticipation, glowing an almost brilliant blue.");
	output(" She looks up at you and smiles ");
	if(giannaPersonality() >= 80) output("confidently");
	else if(giannaPersonality() >= 30) output("blissfully");
	else output("nervously");
	output(" before sinking into your lap, her hands on your [pc.hips] and her [gianna.lips] a hair’s breadth from ");
	if(pc.totalVaginas() > 1) output("one of ");
	output("your sensitive slit");
	if(pc.totalVaginas() > 1) output("s");
	output(".");
	output("\n\nShe starts slowly, planting gentle kisses over your mons, brushing her mouth across your labia, and even licking the flushed, bare [pc.skin] just above your entrance. Her shimmering black ponytail swishes back and forth across her slightly arched back, stopping just shy of her [gianna.ass], giving you something to watch aside from the gentle up and down bobbing of her head. [pc.EachClit] rapidly swells");
	if(pc.clitLength < 1) output(", peeking out of its hood to feel the cool air blowing across it.");
	else if(pc.clitLength < 5) output(", surging out of its hood to bob quietly in the air, big enough that Gianna won’t be able to ignore it.");
	else output(", surging out of its hood as it swells towards erect, cock-like size. It pulsates in the barn’s cool air, trembling just above the android’s face, demanding that she suck it.");
	output(" The artificial woman extends her tongue, just far enough to slip inside the eager depths of your slit.");
	output("\n\nLicking up and down, Gianna explores the insides of your tunnel. Her efforts are measured and skillful, designed to excite without overstimulating, unhurried in their ministrations. She’s taking your pleasure just barely higher with every lick. It’s like being pushed up a mountain one tongue length at a time: a lazy journey that will make the peak seem that much higher. You gasp at the realization - or her tongue circling [pc.oneClit]. It’s hard to tell. You resolve to");
	if(pc.legCount > 1) output(" spread your [pc.legs]");
	else output(" lean back into the chair’s padding");
	output(" and enjoy the ride, vocalizing your pleasure with soft pants and pleased-sounding groans.");

	var i:int = 0;
	var girlCumQ:Number = pc.girlCumQ();
	//Hyper clitties - dick sized and up!
	if(pc.clitLength >= 5)
	{
		output("\n\nThe android’s attentions gradually shift to your [pc.clit], drawn there with every inadvertent bump against the oversized organ. Smiling, she grabs it, squeezing the naughty girlboner and sending waves of stimulation crashing through your cortex. You shudder in the chair, trembling at the onslaught, too overwhelmed to comprehend the texture of her pussy-slicked mouth wrapping around your girth or sliding down its length. Your orgasm is as immediate as it is unavoidable.");
		output("\n\n");
		if(pc.isSquirter())
		{
			output("Juices splatter the chair");
			if(pc.wettestVaginalWetness() >= 5) output(" and your fellatrix’s [gianna.tits]");
			if(girlCumQ >= 1500) output(", the beginnings of an avalanche of [pc.girlCum] that soaks the straw-covered floor");
			if(girlCumQ >= 5000) output(". The drain gurgles as it attempts to deal with your prodigiously sloppy orgasms");
			output(". ");
		}
		output("You gurgle thoughtlessly while Gianna deepthroats your [pc.clit].");
		if(pc.totalClits() > 1)
		{
			output(" When she pops off and switches to ");
			if(pc.totalClits() > 2) output("a second one");
			else output("your other one");
			output(", you scream. It’s too much. There’s too much sensation and too much throbbing girlboner for her to abuse. Her hands wrap around the first one, pumping it wildly, and you can do naught but cum and writhe, twisting on marionette strings tied to your overtaxed organs.");
		}
		else output(" When she begins lashing her tongue along the surface of your overtaxed orgasm, you scream. It’s just too much. There’s too much sensation and far too much nerve-packed flesh for her to abuse. Whenever she draws back, leaving your womanly pole glistening, her hand fondles and caresses it. You feel like there’s nothing you can do but cum and writhe, twisting on marionette strings tied to your endlessly orgasming rod.");
		output("\n\nYour twitching form slowly slides out of the chair. You feel more liquid than person, a puddle of fluttering muscles too wrought with ecstasy to function. Gianna stops stroking with her hands long to ease you into the ");
		if(pc.isSquirter()) output("soaked ");
		output("straw, but her mouth never stops gliding across the super-sized expanse of your clit. She keeps you cumming until your vision is nothing but the pink of the inside of your eyelids and a string of drool runs out of the corner of your gibbering mouth. Then, she deepthroats you and turns on the suction.");
		output("\n\nAs you black out, a tiny part of you marvels at the sparks of overwhelming enjoyment that arc across your synapses, shutting them down with what feels like the most powerful orgasm of your life.");
		//Next - to epilogues - at the end of other scene variation.
		processTime(10);
		for (i = 0; i < 5; i++) { pc.orgasm(); }
		
		clearMenu();
		addButton(0,"Next",girlyTongueVibeEpilogue, true);
		return;
	}
	//Tig ol’ clitties
	else if(pc.clitLength > 1)
	{
		output("\n\nThe android’s attentions gradually shift to your oversized clit. It’s impossible to ignore, swollen like it is");
		if(pc.totalClits() > 1) output(", and with the multiples you’re packing, your crotch is like a minefield of orgasms just waiting to go off");
		output(". She doesn’t suck it into her mouth straightaway. Oh no, she starts with a nice, slow lick from the hood at its base to its glistening apex. You ball your hands into fists and try to contain yourself, but it just feels <i>so</i> good. It’s like the first lick of icecream after a hot day in the sun - like the first cup of water after a long hike. It feels like... it’s exactly what you needed, like an irritation you weren’t even aware of just got the universe’s best salve.");
	}
	//Normal coochies
	else
	{
		output("\n\nThe android’s attentions gradually shift to your [pc.clit]. You had wondered how long she would ignore it, leaving it there to sit in quiet anticipation, a bundle of nerves seemingly forgotten. Gianna answers your unasked question by letting her tongue brush its surface. You whimper in enjoyment, and when she seals her [gianna.lips] around it and begins to noisily slurp at it, you nearly lose it. Her tongue slithers along the underside, disappearing into your passage to lap away to the tempo of her rhythmic sucking.");
	}
	//Merge
	output("\n\nYou whine needfully from the back of your throat. Your crotch feels like a cauldron of bubbling lust, heated to the point where it’s about to bubble over. Grabbing hold of Gianna’s head, you roll your hips against her pink-blushed face, smearing your [pc.girlCum] across her cheeks, lips, and nose. She doesn’t react with the surprise you would expect. Instead, she stabs her tongue deep inside you, deeper than a terran tongue ever could. You shudder, on the verge of cumming, moaning like an ausar bitch in heat, needfully grinding your crotch against her face. Then, her tongue activates its vibration function. The high-powered humming of her organ ricochets against your passage, setting you off so hard stars dance before your eyes. Your mouth thoughtlessly moans, giving voice to Gianna’s artificially enhanced cunnilingus.");
	output("\n\nYou ");
	//Normal-wetness:
	if(pc.wettestVaginalWetness() < 3)
	{
		output("dribble your appreciation into the android’s mouth in [pc.girlCumVisc] streams, and she guzzles it down without even withdrawing her pneumatic twat-teaser. You’re kept impaled while climaxes are milked from your increasingly uncoordinated form. Slumping back in the chair, you slowly slide towards the floor, supported by Gianna’s hands and cumming all the while. When the shockwaves of bliss finally overwhelm the meager threads of your consciousness, you simply close your eyes and continue to cum, dreaming of naked trysts under the stars.");
	}
	//Wet girlies
	else if(!pc.isSquirter())
	{
		output("gush steady flows of [pc.girlCum] that fill the android’s mouth in short order. Her blushing cheeks bulge, filled to capacity by your ongoing orgasm, while her tongue continues to thrash, suspending you on a series of seemingly endless peaks. She swallows, letting the greater part of your fluid output spill down her chin to her [gianna.chest]. There, it paints a picture of spent sapphic delight. The dancing sparks of successive, chained climaxes take their toll on your ecstasy-eroded consciousness, and as your eyes flick closed, your body sags, trembling bonelessly on its way to the floor. Gentle hands cradle you to ease your passage, but that devilishly spasming tongue never stops, ensuring that your steady flow of liquid lust goes on unabated.");
	}
	//Squirter
	else
	{
		output("squirt a torrent of [pc.girlCum] with explosive force, filling the android’s mouth, but also squirting out around the edges of her [gianna.lips], casting webs of libidinous fluid across the once-clean stall that hang and drip. She gulps as fast as she can with her tongue still extended and vibrating - and what better place for it to be! You twist and squirm on it. Just as your first explosive orgasm slows, she triggers another on its heels. It’s completely overwhelming. You feel helpless underneath the all-encompassing pleasure, ragdolling in the chair as you’re milked for gush after gush of [pc.girlCumNoun].");
		output("\n\n");
		if(girlCumQ >= 5000) output("You can hear the drain in the floor trying to keep up now that you’ve soaked all the available straw. ");
		output("Part of you wishes you could see what Gianna’s body looks like. Is she painted in the stuff? Do her tits glisten? Explosions of pink, electric pleasure disperse your thoughts like morning mist under the midday sun. You moan and babble, trying to ask her to stop, but it comes out as little more than incoherent gibbering. Your [pc.legOrLegs] won’t obey your commands. Your arms won’t do anything but ineffectually roam across your [pc.fullChest]. All you can manage is to gush and tremble, spellbound by that vibrating tongue.");
		output("\n\nBefore long, the high-speed undulations unravel your increasingly unbalanced thoughts. Your eyes flutter closed, and your world becomes nothing but dreams of tongues filling pussies and slick hands rubbing across exquisitely smooth, unblemished flesh.");
	}
	processTime(10);
	for (i = 0; i < 5; i++) { pc.orgasm(); }
	//Next
	clearMenu();
	addButton(0,"Next",girlyTongueVibeEpilogue);
}

//Next epilogues - variants based on if came from clit sucking or tongue vibes.
public function girlyTongueVibeEpilogue(clitSucked:Boolean = false):void
{
	processTime(60);
	for (var i:int = 0; i < 10; i++) { pc.orgasm(); }
	
	clearOutput();
	giannaDisplay();
	output("You wake up to the sensation of being toweled off. Gianna is wiping the last wetness from your cheek as you come to. You’re in a different room now - a shower, by the looks of it, and the robotic woman has obviously spent some time cleaning you up.");
	output("\n\n<i>“Your stuff is over there. ");
	//Dommy
	if(giannaPersonality() >= 80)
	{
		output("Just be careful standing up. I gave you a pretty intense workout there. Who knew you’d be capable of orgasming for a solid hour?”</i> Gianna helps you to your feet.");
		output("\n\n<i>“An hour!?”</i> Your disbelief is evident.");
		output("\n\nThe alabaster woman nods");
		if(gianna.biggestTitSize() >= 15) output(", setting her breasts swaying");
		output(". <i>“Yeah. You should have seen all the cute expressions you made while you came.”</i> She runs a delicate hand " + (pc.hasHair() ? "through your hair" : "across your head") + ". <i>“If we keep this up, I’ll get you addicted to my mouth in no time. You’d better pace yourself, [pc.name]!”</i>");
		output("\n\nYou assure her that you will, and make your way out into the barn’s main corridor, the smiling android just behind you.");
	}
	//Normal
	else if(giannaPersonality() >= 30)
	{
		output("I hope you enjoyed yourself; you certainly came enough. I’ve got to go in there and mop up still! I guess that’s what I get for spending an hour pleasing you.”</i> She sighs.");
		output("\n\n<i>“An hour!?”</i> Your disbelief is evident.");
		output("\n\nThe alabaster woman giggles and nods. <i>“Yeah! It was pretty awesome. I wish you would’ve stayed conscious for all of it, but maybe if we do this some more, you’ll get better at it! I bet we can make your puss");
		if(pc.totalVaginas() > 1) output("ies");
		else output("y");
		output(" crave it, at least!”</i>");
		output("\n\nYou " + pc.mf("chuckle","giggle") + " back at that and gear up. <i>“I’d better watch myself then.”</i>");
		output("\n\n<i>“Yeppers!”</i> The bouncy android follows you back into the barn, both of you cleaned and sated.");
	}
	//Subby
	else
	{
		output("I hope you’re not angry that I pleasured you so firmly.”</i> She casts her eyes down.");
		output("\n\n<i>“Not at all. I don’t think I’ve felt this satisfied in a while.”</i>");
		output("\n\nThe android nods. <i>“I hoped you would feel that way. That’s why I kept you cumming the entire hour.”</i>");
		output("\n\n<i>“An hour!?”</i> Your disbelief is evident on your face.");
		output("\n\nThe submissive companion nods. <i>“Yes. You were having such a wonderful time that I was loath to end it. I assumed you would enjoy the prolonged afterglow, even if you were incapable of consciously remembering the actual climaxes.”</i> She shivers. <i>“Bringing you off like that was so thrilling, [pc.Master]!”</i>");
		output("\n\nPart of you wants to scold her, but she’s right; you’re floating on cloud nine right now. You’d have a hard time getting mad at having your ship impounded.");
		output("\n\nPetting the eager woman, you tell her that she did a wonderful job. She beams at that and gathers your things for you. A short time later, the two of you return to the barn’s main room, different needs sated by what would seem a one-sided act.");
	}
	pc.shower();
	processTime(17);
	flags["GIANNA_GIVEN_GIRLY_ORAL_YET"] = 1;
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[**]Girly Sixtynine [With Optional Gianna Dicksucking]n
//Non-taurs only
public function girlySixtynineWithGianna():void
{
	clearOutput();
	output("<i>“");
	if(flags["SIXTYNINED_GIANNA"] == undefined) output("I’ve never sixty-nined a synthetic,");
	else output("I wouldn’t mind another sixty-nine,");
	output("”</i> you suggest.");
	//First time
	if(flags["SIXTYNINED_GIANNA"] == undefined) 
	{
		flags["SIXTYNINED_GIANNA"] = 1;
		//Dommy
		if(giannaPersonality() >= 70)
		{
			output("\n\nGianna raises an eyebrow. <i>“Is that so?”</i> She turns to a nearby stall and opens the door. <i>“Then by all means, go lie down on the table, and I’ll see if I can make you purr.”</i>");
			output("\n\nYou smile back and make your way into the stall. As promised, there’s a well-padded table next to some of the milking machinery. It looks built for comfort. You run your hand across the smooth, faux leather surface as you feel your heart beat a little faster. You’re starting to feel a little sticky in your eagerness.");
			output("\n\nGianna’s voice jars you from your reverie. <i>“If you want this to happen, you’re going to need to do more than just stare at the table, honey.”</i> She presses herself against you from behind. ");
			if(gianna.biggestTitSize() >= 15) output("The sheer size of her tits nearly pushes you flat. ");
			output("<i>“Or didn’t you want to find out what it feels like to have a vibrating tongue inside you and a beautiful, bald snatch in your face?”</i>");
			output("\n\nShe helps you into place without another word.");
		}
		//Normal
		else if(giannaPersonality() >= 30)
		{
			output("\n\nGianna giggles. <i>“Oooh, it’s been a while since I’ve done one of these. The cow-girls usually just want me to suck their tits and finger them or go down on them while they blow their boyfriends. Come on, I’ve got a stall over here with a table we can use. It’s padded and everything!”</i> She pushes open the door and waves you in.");
			output("\n\nMaking your way into the stall, you find exactly what she promised. A well-padded table sits next to some complex milking machinery. Both are clearly built for the comfort of the user. You suppose New Texans like to keep their cow-girls comfortable while they’re pumping out gallons of cream. You flush a little at the knowledge that you’ll be moaning on its faux-leather surface in short order. You’re already starting to feel distinctly juicy, in fact.");
			output("\n\nThe feel of her [gianna.chest] on your back startles you from your reverie. ");
			if(gianna.biggestTitSize() >= 15) output("It nearly bowls you over with its incredibly squishy mass. ");
			output("<i>“I can’t go muff-diving if you’re too busy ogling the table to return the favor. Climb up. I’ll be right there after you.”</i> She grabs you by the [pc.butt] and lifts, helping you up. You wiggle in her palms and let yourself be guided into place.");
		}
		//Subby
		else
		{
			output("\n\nGianna nods solemnly. <i>“I’d love to.”</i> She gestures towards a nearby stall door. <i>“That stall should be clean, and it has a table you could lie on while I obediently lap at your pussy.”</i> She shivers excitedly. <i>“And of course my cunt is yours to take in whatever way you would like.”</i>");
			output("\n\nThe little robo-slut seems excited at the prospect. You take her by the arm and push her in ahead of you, following after with a pleasant, warm tingle between your [pc.thighs]. The promised table is exactly where you would expect to be. It’s a pleasantly padded thing with faux leather upholstery, comfortable and fluid-resistant. In a word: perfect.");
			output("\n\nYou climb on in front of the android’s roving eyes. They literally glow with excitement, you’re proud to note, and you catch her licking her [gianna.lips] at the sight of your [pc.butt]. <i>“Now who’s wasting time staring?”</i> you ask while lying down. <i>“Come on, slut.”</i>");
		}
	}
	//Repeat
	else
	{
		output("\n\n");
		if(giannaPersonality() >= 70) output("Gianna puts her hand on your [pc.butt] and starts guiding you towards the now familiar stall. <i>“I wouldn’t mind you squirming on my tongue again either, [pc.name].”</i> She licks her [gianna.lips]. <i>“In fact, I think you had better do a good job this time if you want me to engage the vibrate setting again.”</i>");
		else if(giannaPersonality() >= 30) output("Gianna giggles and licks her lips. <i>“Yay! I’m always up for a little lesbian loving!”</i> She starts walking towards the now familiar stall, opening the door for you. <i>“I bet I make you cum harder!”</i>");
		else output("Gianna nods eagerly and makes her way to the stall’s door. <i>“I hoped you would request this service, [pc.Master].”</i> You can see just how much she was hoping by the lusty sheen of her mons. Pushing her inside, you enter the now familiar room with your android lover.");
		output("\n\nThe table is clean and waiting for you. You hop up onto it before Gianna can utter another word.");
	}
	//Merge!
	//Clothed
	if(!pc.isNude())
	{
		output("\n\nOh snap! In your rush towards tongue-love, you forgot to shed your gear. <i>“Hold up a sec,”</i> you call as you wriggle out of your [pc.gear]. <i>“Gotta give you something to eat after all.”</i> Your equipment thumps into the ground beside the table, muffled slightly by the thick straw. <i>“There!”</i> You sigh and prop yourself up on your elbows, ready for Gianna to climb onboard.");
	}
	//Else
	else
	{
		output("\n\nYou prop yourself up on your elbows and give Gianna your most welcoming smile, waiting for her to climb onboard.");
	}
	output("\n\nThe android grips the edge of the table and jumps, displaying a remarkable degree of strength as she lifts her ");
	if(gianna.buttRating() <= 7 && gianna.biggestTitSize() <= 8) output("trim");
	else if(gianna.buttRating() < 15 && gianna.biggestTitSize() < 15) output("over-sexed");
	else output("silicone-pumped");
	output(" form up and over. She drops her [gianna.butt] on top of your [pc.chest] with a furniture-rattling thump. Thankfully, she kept her weight on her knees instead of your torso, not that you could ignore the ");
	if(flags["GIANNA_TEMP"] == 1) output("hot");
	else if(flags["GIANNA_TEMP"] == 0) output("warm");
	else output("cool");
	output(" pressure of her supple cheeks on top of you or the leaking droplets of lubricant splashing against your [pc.skinFurScales].");

	output("\n\nShe’s too busy leaning over your groin to care. <i>“");
	if(pc.totalVaginas() == 2) output("I love going down on girls with two pussies - there’s just so much to love, and so many clits to suck!");
	else if(pc.totalVaginas() > 2) output("Ohhh, you have so much pussy down here, [pc.name]. I’m not sure I’m going to be able to properly worship all of it, but I’m going to love trying!");
	else if(pc.totalClits() > 1) output("Mmmm, " + num2Text(pc.totalClits()) + " clits to play with. You organics get all the best toys!");
	else output("Oooh, that’s a fine-looking pussy you’ve got there. I can’t wait to taste it.");
	output("”</i>");
	if(gianna.hasCock()) output(" Her [gianna.cock] hardens against you.");
	output(" The excited companion shifts position, wiggling her thighs backward until her [gianna.vagina]");
	if(gianna.hasCock()) output(" and [gianna.cock] are right above you. The dick jabs accusingly into your collarbone.");
	else output(" is right above you, glistening in the light.");

	output("\n\nGianna blows ");
	if(flags["GIANNA_TEMP"] == -1) output("cool");
	else if(flags["GIANNA_TEMP"] == 0) output("warm");
	else output("exquisitely hot");
	output(" air across your puffy delta");
	if(pc.totalVaginas() > 1) output("s");
	output(" and leans down until her [gianna.lips] are almost kissing [pc.oneVagina]. <i>“May I?”</i> she asks, every word tickling across your sensitive vulva.");
	processTime(8);
	//Herm Gianna:
	if(gianna.hasCock())
	{
		output("\n\nYou figure that putting your tongue to her delectable-looking pussy or turgid cock would be the best way to answer that question, but which are you going to focus on?");
		//[Pussy] [Cock]
		clearMenu();
		addButton(0,"Pussy",eatOutPussyOfRoboChicksDuring69);
		addButton(1,"Cock",suckGiannasRoboCockDuring69);
	}
	//Pure F Gianna [next] to female
	else {
		clearMenu();
		addButton(0,"Next",eatOutPussyOfRoboChicksDuring69);
	}
}

//Cock
public function suckGiannasRoboCockDuring69():void
{
	var x:int = rand(pc.totalVaginas());
	clearOutput();
	giannaDisplay();
	output("You grab her by the [gianna.butt] and drag her down to your face, opening your mouth to make room for her [gianna.cock]. She moans when the [gianna.cockHead] passes through your [pc.lips] to press ");
	if(flags["GIANNA_TEMP"] == 1) output("hotly ");
	output("against your tongue. Despite being filled with pressurized silicone instead of blood, it’s still as hard and heavy as any real penis. The glans rhythmically pulsates against your palate, and your robotic lover gasps in delight, forgetting her question now that you’re letting her use your face as a cockholster.");
	output("\n\nGianna’s groan is music to your ears, but you reverse your grip to hold her up, keeping her from shoving any more synth-sausage down your gullet until she starts to reciprocate. To her credit, she recovers her wits quite quickly, whining softly as she leans back down to kiss your mons.");
	if(pc.totalVaginas() == 2) output(" She shifts and kisses your other pussy as well.");
	else if(pc.totalVaginas() > 2) output(" She shifts from pussy to pussy, giving each its turn in the spotlight.");
	if(flags["GIANNA_TEMP"] == 1) 
	{
		output(" The heat from her mouth keeps your [pc.vaginas] on a full boil. You could almost swear that your [pc.girlCum] is bubbling and boiling out of your slit");
		if(pc.vaginaTotal() > 1) output("s");
		output(".");
	}
	else if(flags["GIANNA_TEMP"] == 0) 
	{
		output(" The warmth of her tender attentions on your [pc.vaginas] keeps your excitement at peak levels. You can practically feel the sticky heat wafting off your puffy, slick vulva");
		if(pc.vaginaTotal() > 1) output("e");
		output(".");
	}
	else output(" The coolness of her kisses shocks you into paying full attention to the texture of her affections on your [pc.vaginas]. You could almost swear that her chilly saliva is boiling off on the furnace that’s brewing in your loins.");
	output("\n\nSlowly, you ease her down, accepting the first few inches of her turgid length into your mouth. Gianna’s [gianna.cockNoun] jumps, flexing against your [pc.tongue] and leaks cherry-flavored goo onto your taste buds. You rock your [pc.hips] back in response, rubbing [pc.oneClit] against her [gianna.lips], all while taking the first six inches into your mouth. She moans into your [pc.vagina " + x + "] and thrusts her tongue deep inside you, then contents herself with lazily suckling that [pc.clit], making love to it while you ease her cock deeper.");
	//Bimbos/Treated
	if(pc.isBimbo())
	{
		output("\n\nIt’s easier than you thought to let her push deeper, not that you’re capable of much of that with a dick in your mouth. Her artificial prick snakes into your throat, [gianna.cockHead] stretching your esophagus as it travels into your unresisting passage. It’s not actually all that uncomfortable, and feeling her eager tool pulsing on your tongue thrills your oversexed and underfocused mind in the best of ways. Gurgling wetly, you pull her in to the base, holding her ");
		if(gianna.balls > 0) output("[gianna.balls] against you nose.");
		else output("crotch down so that your [pc.lips] can make a perfect seal around the base.");
		output(" Perfect.");
	}
	//Long face
	else if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED))
	{
		output("\n\nIt’s times like this that you’re glad for having an elongated muzzle rather than a flat, terran face. You’ve got so much mouth to offer, and tongue along all of that. As the dick journeys towards the back of your mouth, you reflect on just how lucky you are to be able to easily fellate so much.");
		if(gianna.biggestCockLength() >= 10) output(" Of course, Gianna’s [gianna.cock] is too long even for you, but she’s a gentle, caring lover. She never pushes you past your limits, allowing you to gradually work her deeper and deeper, bulging your throat to your own pace. Pride wells in your breast when you realize your [pc.lips] have made contact with Gianna’s crotch.");
		output(" You extend your [pc.tongue] to lick around her base, letting your eyes drift closed as you’re pleasured and pleasing all at once.");
		if(gianna.balls > 0) output(" Not that you needed them. Her balls are heavy on your face, blotting out the light.");
	}
	//Normal
	else
	{
		output("\n\nYou nearly gag when you try to take her deeper. Luckily, you remember an old dentist’s trick. Clenching your left fist down around your thumb, you do your best to relax and slide forward, taking the first inch into your throat. It’s a little uncomfortable but not unmanageable. Gulping noisily, you swallow another inch of Gianna’s [gianna.cock], feeling it snaking into your throat. She’s drizzling whatever passes for her pre-cum straight into your stomach, and the feeling of her tongue on your [pc.vagina " + x + "] makes it all too easy not to mind. You pull her deeper, sealing your [pc.lips] around her base with a sigh of contentment.");
	}
	//Merge
	output("\n\nA sudden explosion of kinetic energy goes off ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("between your [pc.hips]");
	output(", igniting a flash fire of bliss. You moan into Gianna’s pulsing rod, rocking yourself against whatever she’s doing down there. It feels like she’s replaced her tongue with a high-powered vibrator, and every increasingly fervent push in and out of your box is making it harder to think, filling your head with a fog of arcing, pink pleasure static. You let out a muffled whimper around her dick. Your netherlips squeeze. Your juices run as freely as they ever have, and with a fervent, eager suck on your android lover’s length, you cum.");
	output("\n\nYour climax washes over you like the wind-whipped waves of a monsoon, dissolving you into what feels like a network of nerves all firing endless streams of pleasure and love. You’re vaguely aware of your [pc.thighs] trembling, pushing your [pc.hips] more fervently against Gianna’s face. ");
	if(pc.isSquirter()) {
		output("Liquid splatters sound as you gush again and again, squirting everywhere. ");
		if(pc.girlCumQ() >= 6000) output("You could almost fill a tub with it. ");
	}
	output("Your tongue, fed strength by passion, flutters tactlessly against the bottom of the artificial penis, slathering silicone-pumping veins in instinctive oral attention, driven to spread the almost electric ecstasy to everyone and everything that you can.");
	output("\n\nJust as your pleasure begins to cool, Gianna’s peaks. You feel her [gianna.cock] expand, stretching your throat. Her hips wriggle in the most delightful way against your [pc.face]. You hold onto her [gianna.butt], rolling your juice-smeared [pc.vaginaNoun] against the groaning, insensate synthetic, riding your own aftershocks while beginning to gently suck. A convulsion runs through the pleased pole a moment before you feel the warm sensation of fullness growing in your belly. She quivers again, and you feel fuller. Third, fourth, and fifth times leave you feeling stuffed. The sixth, despite being the most violent, doesn’t greatly change the sensation, and Gianna sags down, limp atop you");
	if(gianna.balls > 0) output(", her balls sagging back down atop you");
	output(".");
	output("\n\nNeither of you is in any shape to stand at first. It’s enough to lie there in each other’s laps. She gradually softens in your mouth, and you reluctantly let her pop loose, planting a kiss on her wilting boner before you let it leave entirely.");
	output("\n\nSensing that you’ve recovered, the drained companion rolls aside, catching herself on the balls of her feet on the way down. Her face is painted with [pc.girlCum]");
	if(pc.isSquirter())
	{
		output(", and the floor is ");
		if(pc.girlCumQ() < 5000) output("soaked with it");
		else output("inches deep with it");
		output(".");
	}
	output(" You feel a little bloated yourself. Patting your [pc.belly], you climb up onto your [pc.feet] and give Gianna an appreciative smile. That vibrating tongue of hers is really something!");
	output("\n\nYou grab towels off the wall and hand one to Gianna. She ");
	if(giannaPersonality() >= 70) output("smirks. <i>“If you didn’t cum quite so hard, I wouldn’t need to clean up, you know?”</i> She sticks out her tongue at you and lets it buzz for a moment. <i>“Not that you have any choice where this baby is concerned.”</i>");
	else if(giannaPersonality() >= 30) output("giggles. <i>“That was great! Sometime I should set an automated process that’ll keep my tongue out and vibrating while I cum. I bet you could ride one long orgasm for hours!”</i> She blushes, and did her cock just get a little thicker?");
	else output("nods gratefully. <i>“Thank you. Serving someone again... is pleasing. Knowing that I’m making you cum so hard is the most wonderful feeling in the world.”</i> She shivers with remembered pleasure.");
	output("\n\nShe holds the door for you once you gather your gear, and you walk back into the barn proper together. It swings closed, hiding the evidence of your tryst from casual inspection. Not that the locals would notice or care.");
	processTime(10);
	pc.orgasm();
	pc.loadInMouth(chars["GIANNA"]);
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pussy
public function eatOutPussyOfRoboChicksDuring69():void
{
	clearOutput();
	giannaDisplay();
	output("You grab her by the [gianna.butt] and drag her down to your face, forcing her legs to splay off the sides of the table a second before her sweet-smelling slit presses against your face. You kiss and nibble at her mons, feeling her clit rubbing against the bottom of your chin while you work. Slipping your [pc.tongue] inside her, you tilt your head to slurp up that little pleasure bud, sucking it gently against the underside of your squirming muscle while you work.");
	output("\n\n<i>“Ohhhh fuck, yes!”</i> Gianna gasps before remembering what she was about to do. She dives down ");
	if(pc.legCount > 1) output("between your [pc.legs]");
	else output("to your crotch");
	output(" and muffles her excitement in your pussy, groaning into it in between sloppy kisses and gentle probes of her tongue. The moment the first droplets of [pc.girlCum] touch her tongue, she pushes deeper, rolling her artificial organ in circles around your passage, pressing against every sensitive bundle of nerves.");
	if(pc.wettestVaginalWetness() >= 3) output(" Her face is soon coated in a sheen of your excitement, but s");
	else output(" S");
	output("he doesn’t slow in her efforts or even stop for air.");
	//PC has cocks
	if(pc.hasCock())
	{
		output("\n\n[pc.EachCock] rapidly reaches full hardness and does its best to slip into Gianna’s cleavage, oozing trails of pre-cum across her milky skin. She doesn’t really acknowledge ");
		if(pc.cockTotal() > 1) output("them");
		else output("it");
		output(", but she’s squirming just enough for the extra sensations to add to your pleasure. You idly wonder if she’ll get you off hard enough to blow some [pc.cum] across her [gianna.chest].");
	}
	//merge
	output("\n\nYou marvel at her taste - just like cherries. Then again, being an artificial creature, she can probably fill her reservoirs with whatever flavor of lubricant she desires. Still, the fruity flavor provides a heady encouragement for you to drive your tongue deeper. ");
	if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("You happily explore her passage, twirling your tongue around, flicking her clit with it, and even providing the occasional gentle nibble.");
	else output("You show her just how far you can go by rolling inch after inch of wiggling muscle out of your mouth, burrowing in until you hit the back of her passage and then twisting it around, licking at every single fold and feature. Her passage quivers around you, and your [pc.lips] are soon coated with a thick layer of her lovely juices.");

	output("\n\nGianna attempts to kiss [pc.oneClit], but nearly misses owing to what you’re doing to her. Still, she counters by loosing cunt-wrenching vibrations through you, emanating from her wildly shaking tongue. The hum of the motor powering it is easily audible to you, even muffled by your snatch. It’s a struggle not to lose focus on the delicious pussy just above you under such an onslaught.");
	if(pc.wettestVaginalWetness() >= 3) {
		output(" Your [pc.vaginas] ");
		if(pc.totalVaginas() > 1) output("are");
		else output("is");
		output(" leaking so much [pc.girlCum] that the table below you is as slippery as an oilslick. Rivulets of additional moisture are running down your [pc.leg].");
	}
	//Multicooch
	if(pc.totalVaginas() > 1)
	{
		output("\n\nPerhaps taunted by the presence of a nearby, untended pussy, Gianna withdraws her tongue and turns on it the other entrance, slobbering her [gianna.lips] over the puffy flesh between until she’s centered directly above it. Her tongue takes you in a flash, stabbing deeply into your pliant quim, wriggling against your nerves until they seem about to break apart under the pleasure. Smiling, she thrusts it a few times, fucking you with her tongue, then switches back to the original box to assault it anew.");
	}
	//Singlecooch
	else
	{
		output("\n\nPlunging her tongue deeper, Gianna begins to fuck you, working you over with such vigor that one could almost forget she’s only using her mouth and tongue. Her fevered motions carry her [gianna.lips] back and forth across [pc.oneClit], polishing it with a fresh layer of your libidinous drippings.");
	}
	//Merge
	output("\n\nYour entwined bodies writhe passionately atop the table, lost in sapphic ecstasy. Your [pc.vaginas] seem");
	if(pc.totalVaginas() == 1) output("s");
	output(" to boil with the overwhelming heat of it all");
	if(flags["GIANNA_TEMP"] == -1) output(", despite the android’s cooled tongue");
	output(", and Gianna’s lube is getting more and more copious with every brush of your [pc.tongue]. You moan into her gushing robo-box and grind your [pc.hips] back into her face until the vaginal trembling drives you over the edge. You clench down on her vibrating tongue by reflex, which only makes the eruptions of pleasure coming from your slit that much more overwhelming.");
	if(pc.isSquirter()) 
	{
		output(" You splatter Gianna’s face with a load of [pc.girlCum]");
		if(pc.wettestVaginalWetness() > 4) output(" again and again, creaming your [pc.vagina " + x + "] until a puddle of your girlish goo has formed on the floor, slowly draining through a grate.");
	}
	output("\n\nGianna’s cherry flavor fills your mouth");
	if(pc.hasCock())
	{
		output(" while [pc.eachCock] convulses against her tits, painting them [pc.cumColor]");
		var cumQ:Number = pc.cumQ();
		if(cumQ >= 10)
		{
			output(", unleashing ");
			if(cumQ < 100) output("streams");
			else if(cumQ < 1000) output("torrents");
			else output("waterfalls");
			output(" of [pc.cumNoun]");
		}
	}
	output(". You gulp down as much as you can until a wave of it comes over you all at once, ");
	if(pc.hasHair()) output("slicking back your [pc.hair]");
	else output("soaking the whole of your head");
	output(" before splattering off the walls and floor. Her cherry odor hangs thick in the air as she drools the rest into your mouth, forcing you to gulp it down.");
	if(gianna.hasCock()) output(" The warm feeling of her synthetic sperm splattering onto your [pc.chest] doesn’t help.");
	output("\n\nThe artificial concubine rolls off the table a moment later, landing on unsteady feet. <i>“");
	if(giannaPersonality() >= 70) output("You aren’t so bad at that yourself.");
	else if(giannaPersonality() >= 30) output("Mmm, I think we both needed that.");
	else output("Thank you for that, [pc.Master].");
	output("”</i> Her face glistens with a coat of your [pc.girlCumNoun]. <i>“I think I’d better get cleaned up though,”</i> she announces, grabbing a nearby towel. <i>“You too.”</i> She tosses you one, giggling when it falls across your face.");
	output("\n\nYou wipe the cherry-flavored evidence of Gianna’s lust from your [pc.face] and sit up with a sated smile. She’s smiling over at you and shaking her head, eminently pleased. The android helps you gather your things and holds the door for you with a sated smile.");
	processTime(11);
	pc.orgasm();
	pc.girlCumInMouth(chars["GIANNA"]);
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[**]Cooch Fuck - Four-In-One (3 of 4 Finished)
//No taurs 4now!
public function coochFuckThreeMaybeFourInOne():void
{
	var x:int = pc.cockThatFits(gianna.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	clearOutput();
	giannaDisplay();
	output("Your eyes flick down to the hairless junction of Gianna’s legs, ");
	if(gianna.hasCock()) output("mentally imagining what her hairless pussy must look like under all that cock");
	else output("enjoying the view of her well-formed pussy gleaming with moisture, waiting to be taken");
	output(".");
	//Dommy
	if(giannaPersonality() >= 70) 
	{
		output("\n\n<i>“Oh, do you want me to ride you into the ground ");
		if(flags["FUCKED_GIANNA_VAGINALLY"] != undefined) output("again");
		else output("already");
		output("?”</i> The android is leering right back at you with one hand on her hip and the other reaching down to spread her lips.");
	}
	//Normal
	else if(giannaPersonality() >= 30)
	{
		output("\n\n<i>“See something you like?”</i> The android is standing there with her hand on her hip, smiling.");
	}
	//Subby
	else output("\n\n<i>“Oh, does my crotch please you?”</i> The android is smiling meekly, and perhaps a little hopefully.");
	//Merge
	output("\n\n<i>“You could say that,”</i> you answer. <i>“");
	if(flags["FUCKED_GIANNA_VAGINALLY"] == undefined) output("I was thinking we could... you know... fuck.");
	else output("Up for another roll in the hay?");
	output("”</i>");
	output("\n\n<i>“");
	if(flags["FUCKED_GIANNA_VAGINALLY"] == undefined) output("I thought you’d never ask.");
	else output("I was hoping that you’d say that.");
	output("”</i> Gianna turns, scanning the surroundings for a suitable location. <i>“There,”</i> she announces while pointing at an empty stall. <i>“This one just got cleaned. Fresh hay and everything.”</i>");
	output("\n\n");
	if(flags["GIANNA_STALL_SEEN"] == undefined) output("Fresh hay?");
	else output("Here we go again....");
	output(" The eager companion pulls you in before you can even comment on the rustic accommodations.");
	//First time, no new PG
	if(flags["GIANNA_STALL_SEEN"] == undefined)
	{
		flags["GIANNA_STALL_SEEN"]= 1;
		output(" Hay is spread so thickly that you cannot see what the room has for flooring. There is a milking device built into the wall, but it is currently powered down and retracted. The two of you will have no use for such a device. There’s a padded table that could pass for a bed in a pinch as well.");
	}
	//Repeat new new PG
	else output(" The stall is much the same as the last time you fucked Gianna - clean, with plenty of hay on the floor, a padded table, and an unused milker on the wall.");
	//Merge No new PG
	output(" Your robotic mate is leaning against the table with her palm flat against her mons");
	if(gianna.hasCock()) output(", her dick pushed aside");
	output(", slipping two fingers into her audibly wet snatch.");
	
	IncrementFlag("FUCKED_GIANNA_VAGINALLY");
	
	var cumQ:Number = pc.cumQ();
	//Normal Variant - Not a taur.
	if(!pc.isTaur())
	{
		output("\n\n");
		if(pc.isCrotchGarbed()) {
			output("Your [pc.cocks] engorge");
			if(pc.cockTotal() == 1) output("s");
			output(" with near painful rapidity, straining hard against your [pc.lowerGarment]. You practically tear your way out of your equipment in your haste to free your straining length");
			if(pc.cockTotal() > 1) output("s");
			output(" from confinement. The sigh of relief you breathe when you get free might as well be accompanied by a chorus of angels for how divine it feels.");
		}
		else
		{
			output("Your [pc.cocks] surge");
			if(pc.cockTotal() == 1) output("s");
			output(" to full erection with almost painful rapidity, straining as ");
			if(pc.cockTotal() > 1) output("they bob");
			else output("it bobs");
			output(" in the empty air, begging for a hot, wet cunt to fill. You pant hungrily, aware of just how close that goal is.} Gianna watches and smiles coquettishly back at you. Her sable nipples are jutting out in your direction, and she oh-so-slowly slides her tongue across the surface of her equally onyx lips, making them shine in the light. She wants it.");
		}
		//Subby Gianna - Dog-E
		if(giannaPersonality() < 30)
		{
			output("\n\nBending over the edge of the padded table");
			if(gianna.biggestTitSize() >= 15) output(", her tits squishing down obscenely,");
			output(" Gianna kicks her heels apart and cranes her head to smile wantonly in your direction. <i>“I am yours for the taking.”</i>");
			output("\n\nShe can say that again. Her [gianna.butt] is thrust out just so. The glistening [gianna.vaginaColor] of her netherlips beckons enticingly, shining with a coat of glistening lubricant that practically declares, <i>“You’ll slip right in. Come on.”</i> ");
			if(gianna.buttRating() >= 15) output("Gianna’s bubbly butt doesn’t help. A padded ass like that just begs to be bounced on your lap and lightly slapped for good measure. The milk-white bobble shifts nervously when the android shifts position, spreading her legs a little farther so that her [gianna.vagina]’s lips part invitingly.");
			output("\n\nYou grab your [pc.cock " + x + "] in hand. It pulses eagerly to the beat of your heart, swelling bigger by the second. You’re so ready you feel like you’re going to burst, but you aren’t going to let that stop you. Positioning your [pc.cockHead " + x + "] against the companion’s glistening mons, you admire the slick ");
			if(flags["GIANNA_TEMP"] == 1) output("heat");
			else if(flags["GIANNA_TEMP"] == 0) output("warmth");
			else output("coolness");
			output(" of her passage while her labia languidly open for you. Her cunt clings to you like the finest silk.");

			//Fucking thick as balls
			if(pc.cThickness(x) >= 4) output("\n\nGianna’s shoulders tense at the initial contact. You’re so thick that it’s slow going, but she IS stretching. Her hips are actually widening with every inch you push inside her, revealing just how built to take it she is. Her eyelashes flutter, and her fingertips scrabble against the smooth upholstery. <i>“Take me! Split me in half!”</i>");
			//Normal
			else output("\n\nGianna’s shoulders tense at the initial contact, then go slack, the initial tension melting out of her as her manufactured pussy gives way to your turgid rod. Her eyelashes flutter. <i>“Ooooh, take me, [pc.master] [pc.name].”</i> Another inch enters her, and her fingertips scrabble against the smooth upholstery. <i>“Fucking take me!”</i>");
			//Merge
			output("\n\nThat’s all the encouragement you need. You grab the slutty sub by her ");
			if(gianna.buttRating() >= 15) output("well-padded");
			else if(gianna.buttRating() >= 8) output("padded");
			else output("lightly-padded");
			output(" hips and push in, burying ");
			if(pc.cockVolume(x) >= gianna.vaginalCapacity(0)) output("as much of your [pc.cock " + x + "] as her body will handle");
			else output("the whole of your [pc.cock " + x + "]");
			output(" deep inside her.");
			if(pc.cLength(x) >= 15) output(" Her [gianna.ass] rises up to meet you, lifted by the penis-shaped distention protruding through her [gianna.belly].");
			output(" Quivering wordlessly, the android gives up breathy pants and whimpers. You give her oversensitive pussy a moment to adjust before the real fucking begins and spend the time admiring the almost perfect heart shape of her bottom.");
			pc.cockChange();
			output("\n\nYou run your hand up and down the length of Gianna’s spine, feeling the titanium-backed strength of it all the way from her neck to the rounded, gleaming metal port just above her butt. You’ve been patient long enough. Grabbing her by her waist, you draw out of the trembling girl until your lube-polished shaft is gleaming under the lights. The android whimpers like a lost puppy, and you ram thrust yourself back inside, transforming those whimpers into low, rolling moans.");
			output("\n\nYour synthetic lover doesn’t outwardly contribute much to the rutting. She’s done her part, bent over and given you a pussy to fill; the pleasure you’re wracking her with makes anything beyond involuntary tremors and automatic reactions impossible for her. It doesn’t really matter, though. Watching her wriggle while her A.I. core struggles to handle the ecstasy of being impaled on your dick is more than exciting enough, and inwardly... well, her reflexes do have her pussy hanging onto your [pc.cock " + x + "] for dear life. You pound away at the moaning android, ");
			if(pc.cLength(x) < 15) output("reveling in the press of her [gianna.butt] against your crotch");
			else output("reveling in the obscene way you bulge her [gianna.belly]");
			output(".");
			output("\n\nIt helps that her [gianna.vagina] feels so fucking good. It’s like someone took the best parts of a real pussy, welded it to the kinds of textures sextoys employ, and then hooked the whole thing up to a vacuum pump. You don’t even pull the whole way out before she sucks you back in with a wet-sounding ‘schlorp’, her folds caressing you in ways that would be impossible for an organic.");
			output("\n\nLeaning over her, you grab the sides of the table and give in to your instincts, fucking the wet and willing woman with wild abandon. Whenever you ");
			if(pc.cLength(x) < 15) output("run out of cunt to fill");
			else output("bottom out");
			output(", she clenches, and when you nearly escape, the suction ramps back up. You may have her bent over submissively, but her pussy is like a leash for your dick, guiding it into fucking harder and faster. Gianna’s juices are spilling down the sides of the table. She’s leaking more almost nonstop, and some of her throaty screams of bliss are starting to sound suspiciously orgasmic.");
			output("\n\nThe feel of that velvet vice squeezing down on you is coaxing you uncomfortably close to the edge yourself. Effervescent heat bubbles dangerously close, just beneath the surface of your [pc.cockHead " + x + "], threatening to burst out in thick ropes at a moment’s notice. Looking down, you observe the obscene, pleasure-drunk expression on Gianna’s face. Her eyes are rolled back, and her [gianna.lips] hang open, moaning whorishly. It’s like her entire being is wrapped tight around your [pc.cock " + x + "], hanging onto its every pulse and waiting for it to release.");
			output("\n\nYou piston back forcefully enough that the table noisily skitters a few inches across the floor and grab Gianna by her lengthy ponytail, forcing her to arch her back to face you. Blinking dully, her vacantly glowing eyes slowly come to focus on you just in time for your orgasm to hit. ");
			if(cumQ < 5) 
			{
				output("You dribble a weak few droplets into her gushing folds, grunting as you empty your all-too empty ");
				if(pc.balls > 0) output("[pc.balls]");
				else output("body");
				output(" once more.");
			}
			else if(cumQ < 50) output("You spurt [pc.cum] into her gushing folds, churning her lubricant into a sexual slurry that leaks down her legs to show the world just how well-fucked she is.");
			else if(cumQ <= 300) output("You shoot thick ropes of [pc.cum] directly into her gushing folds, so thick and copious that the trickle of lubricant pouring down her thighs turns [pc.cumColor]. The bulk of your virile payload pumps directly into her artificial womb, where it will undoubtedly stay, staining her with your load.");
			else if(cumQ <= 1000) output("You erupt immense loads of [pc.cum] directly into her gushing folds, flooding her [gianna.vagina] with what feels like torrents of the stuff. Streams of your [pc.cumVisc] roll down her thighs in visible declarations of your virility.");
			else if(cumQ <= 3000)
			{
				output("You erupt, pouring titanic streams of [pc.cum] directly into her gushing folds, filling every available crevice with your virile fluid. Her belly bloats with the jiggling, liquid weight, and ");
				if(pc.hasKnot(x)) output("you feel the pressure on your [pc.knot " + x + "] as some tries to escape.");
				else output("gushes of [pc.cumColor] run out around [pc.cock " + x + "] to dribble down her thighs.");
			}
			else
			{
				output("You go off like a cannon, pouring what feels like a river of [pc.cum] directly into Gianna’s gushing folds, flooding her belly so rapidly that you can feel her lifting up as it inflates. ");
				if(!pc.hasKnot(x))
				{
					output("The backpressure blows out around your base, soaking you from the waist down in your own sexual backwash.");
					if(cumQ >= 8000) output(" The hay tries admirably to soak it all up, but the room soon turns into a spunky pool. A drain in the floor does slowly empty it, at least.");
				}
				else
				{
					output("The backpressure mounts against your [pc.knot " + x + "], but your swollen organ holds it all in, leaving Gianna looking exceptionally gravid. She whimpers in mixed pleasure and discomfort.");
				}
			}
			output("\n\nThrobbing inside the sperm-filled android, you pant for breath, watching her slowly come out of her pleasured daze.");
			output("\n\nShe ");
			if(cumQ > 1000) output("gingerly rubs at her expanded belly, then looks at you and giggles, practically glowing in delight. <i>“I’m glad I could please you so- mmm... so much.”</i> She gathers some of her leaking fluids from your joined crotches and rubs it across the gravid-looking dome. <i>“My potent [pc.master]....”</i>");
			else output("gingerly looks back at you, then giggles at the feeling of your [pc.cum] inside her. <i>“So I guess you found me pleasing after all.”</i> The android blushes a little. <i>“I’m glad I could make you so happy.”</i>");
			output("\n\nInstead of responding, you slowly pull backwards");
			if(!pc.hasKnot(x)) output(", lazily sliding yourself out so that she can feel every steele-hard vein before you go soft.");
			else 
			{
				output(", catching on your [pc.knot " + x + "] a few times before finally managing to yank it out with a noisy pop.");
				if(cumQ > 1000) output(" [pc.Cum] pours out after like water from a spring.");
				output(" Gianna goes cross-eyed and shudders. Her thighs spasm, and her blissful gasps bring a smile to your face. She looks a little out of it, but that’s fine. It’ll give you more time to clean yourself up.");
			}
			output("\n\nThe companion comes around just as you’re finishing gearing up. She staggers up onto wobbling legs in a distinctly organic way and apologizes for the mess, explaining that she needs to tidy up, if it’s okay with you.");
			output("\n\nYou nod your head and let her pass, hoping the locals will get a good look at your work before she removes it.");
			processTime(23);
			giannaCumflated(pc, 0);
			pc.orgasm();
		}
		//Normal Gianna - Missionary
		else if(giannaPersonality() < 70)
		{
			output("\n\n<i>“Why don’t we use the table, lover?”</i> Gianna gives the bed a few pats. <i>“I’ll lie down and you can make love to me like ");
			if(pc.isHuman()) output("your people");
			else output("the terrans");
			output(" do.”</i> Smiling roguishly, she adds, <i>“It’ll be a good way to remind you just how good I can be at keeping you happy - even the hard, overeager parts of you.”</i>");
			output("\n\nSmiling back, you graciously extend your arm towards the table. <i>“Ladies first.”</i>");
			output("\n\n<i>“How gentle" + pc.mf("manly","") + " of you.”</i> The milk-white woman climbs onto the table with grace that could make a snake livid with jealousy, eyeing you the whole time. She leans over her own upraised knee, eyeballing your [pc.cocks] without a scrap of shame. <i>“I’ve got to admit, [pc.name], I think I’m going to enjoy this.”</i>");
			output("\n\nYou gently push her down, letting your gaze roam across her flawless skin. <i>“I think I will too.”</i>");
			output("\n\nSpreading her legs until she’s about to kick your side, Gianna fully exposes her [gianna.vagina] to you. <i>“Then come get some, tiger.”</i> She rubs her palm across her blushing folds, moaning, then grabs each side with a few fingers and spreads herself wide for you, letting you watch her interior squirm and writhe, leaking wetness all the while. <i>“Come on, it won’t bite.”</i>");
			output("\n\nYou mount the table a moment before you mount the girl. Looking her square in her luminescent eyes, you reach down, pushing her fingers away so that you can feel her yourself. ");
			if(flags["GIANNA_TEMP"] == 1) output("She’s every bit as hot as you’d expect. Dipping your finger into her entrance is like climbing into a hot tub.");
			else if(flags["GIANNA_TEMP"] == 0) output("She’s every bit as warm and wet as you’d expect. Dipping a finger inside her only makes you ache to thrust inside all the harder.");
			else output("She’s every bit as cool as you’d expect. Dipping your finger into her entrance is vaguely like handling fresh jelly, only this jelly is oozing wetness in anticipation of getting fucked.");
			output(" You idly explore her [gianna.vagina] for a few moments, watching her artificial blush spread across her body. It’s a credit to her makers that she reacts the way she does, squirming and moaning more eagerly than any normal terran would. You could probably get her off within a few minutes of gentle fingering, but that wouldn’t quench your own heated needs.");
			output("\n\nYou lean down and kiss the eager android right on one of her inky nipples, sliding your tongue in a circle over the areola before suckling gently upon the nub. Flicking it with your [pc.tongue], you work Gianna into a squirming, moaning mess. Only then, with your fingers soaked and your mouth full of tit, do you finally grab your [pc.cock " + x + "]");
			if(pc.cockTotal() > 1) output(", selecting it as the lucky winner,");
			output(" and press it against her lips. They part with almost buttery smoothness, gratefully accepting your length into their slippery depths.");
			output("\n\n");
			if(gianna.hasCock()) showImage("GiannaFutaGetsFucked");
			output("The moment your [pc.cockHead " + x + "] is swallowed by her velvet curtains, the supine succubus smiles broadly and wraps her heels around your waist, curling her toes inward to press on the small of your back. She cocks her head and intently watches your expression while you slide on in. What could she be looking fo-ooooooh.... Her pussy is sucking on you, pulling you deeper even without the gentle pressure from her legs or your own thrusting. Gianna’s vagina easily devours your entire veiny package, taking it in to the [pc.sheath " + x + "]");
			if(pc.cLength(x) >= 15) output(" despite the way it bulges her belly");
			if(pc.cLength(x) >= 22) output(", so big that it’s clearly outlined on her middle");
			output(".");
			pc.cockChange();
			output("\n\nThe companion droid reaches up to put her arms on your shoulders. <i>“Fuck me.”</i> Her azure eyes twinkle affectionately. <i>“Please.”</i>");
			output("\n\nYou give the lady exactly what she wants, pulling back with some effort and gently thrusting back in, taking your time at first. She groans in exquisite pleasure. Her toes drum on your spine, her thighs quivering. Sharing the pleasure, Gianna does <i>something</i> with her [gianna.vagina]. At first, you can only identify it as a subtle shifting of her flesh against your own, but then it changes, moving itself against you in a way that feels like a half-dozen tongues polishing your rod while it’s trapped inside a mouth and expertly fellated. You actually lose control of the tempo at that point and hang there, groaning like a pleasure-addled idiot.");
			output("\n\n<i>“Mmm, I’m not too much for you, am I?”</i> Gianna tilts her head and smiles, licking her [gianna.lips] like a lion eyeing its unfortunate prey. The motions in her slick, lube-oozing pussy shift along with her words, transforming from a half dozen tongues into vortex of rippling waves that threatens to drown you ecstasy. <i>“Please,”</i> she pants, <i>“fuck me.”</i>");
			output("\n\nShaking your head to clear it, you glare down at the sultry sexbot and fuck her the only way you can manage when your dick feels this good - hard. You yank your [pc.hips] back and slam them forward, slapping into Gianna hard enough to kick a spray of slippery goo onto your [pc.leg]. You don’t stay inside long enough to allow her attentions to overwhelm you; you piston back out and go to town, jackhammering the poor android’s [gianna.vagina] relentlessly. She abandons the more sophisticated strokes and caresses and instead focuses on squeezing you whenever you bottom out, lavishing your length in as much sensation as possible.");
			output("\n\nGianna arches her back and groans, <i>“Yes!”</i>");
			output("\n\nYou grab her by the back of the neck, tipping her head back and kissing her square on her [gianna.lips]. She quivers beneath your pounding thrusts, her thighs vibrating against you as she loses herself to pleasure. The only thing keeping her from filling the air with the sounds of her feminine pleasure is the obstruction your kiss provides, keeping her too wrapped up in an oral tongue-battle to do anything but wriggle beneath you. Gianna’s [gianna.vagina]’s squeezes become unfocused, losing some of their strength, and her passage grows wetter and wetter with each passing moment.");
			output("\n\nBreaking the kiss, you watch the android finally cum. Her legs squeeze down around your back, holding you completely within her");
			if(gianna.hasCock()) output(" while her [gianna.cock] unloads into the bottom of her [gianna.chest]");
			output(". She wrings your [pc.cock " + x + "] tightly enough that you find yourself teleported to the top of a plateau of pleasure, and soon enough, you’re cumming too, throbbing potently inside her as you unload into her sucking twat.");
			if(cumQ < 5) output(" The only evidence of your moment of passion is the squirming android below.");
			else if(cumQ <= 150) output(" Trickles of [pc.cum] dribble out around you to wet the already soaked bed.");
			else
			{
				output(" Her belly swells against you as you pump more and more [pc.cum] into her");
				if(cumQ <= 1000) output(".");
				else if(cumQ <= 2000) output(", gently inflating her with the fruits of your liquid love.");
				else if(cumQ <= 8000) output(", rounding into a pregnant dome filled with [pc.cumVisc] love.");
				else 
				{
					output(", bloating into an obscenely pregnant, jiggly sphere.");
					if(!pc.hasKnot(x)) output(" Thick streams of [pc.cum] wash out from around you, pushed out from her overpressurized womb.");
					else output(" Not a single drop escapes around the tight seal your knot provides, no matter how overfilled she becomes.");
				}
			}
			//Knots
			if(pc.hasKnot(x))
			{
				output("\n\nGianna looks up at you, giggling. <i>“Did you grow that knot just so you could spend a little bit more time with me?”</i>");
				output("\n\nYou cock your head to the side and smile back at her. <i>“Maybe.”</i>");
				output("\n\nPoking you on the nose, she laughs again. <i>“Then I guess I’ll just have to be your bitch for an hour then, huh?”</i> She squeezes your [pc.butt] affectionately, simultaneously caressing your knot from the inside, overwhelming your still-sensitive dick with sensation. You drop into her waiting arms. <i>“I don’t mind. Just hold me, [pc.name].”</i>");
				output("\n\nYou can do that.");
				processTime(20);
				//Dont forget to cumflate if needed.
				giannaCumflated(pc, 0);
				pc.orgasm();
				processTime(60);
				clearMenu();
				addButton(0,"Next",missionaryKnotEpilogue);
				return;
			}
			//NotAKnot
			else
			{
				output("\n\nGianna looks up at you giggling. <i>“I guess I wasn’t... too much for you, I mean.”</i> She kisses you on the nose. <i>“I came first, after all. I hope you don’t mind.”</i>");
				output("\n\nYou tell her that there’s no way you would object to her writhing underneath you, lost to her own pleasure.");
				output("\n\nBlushing in response, Gianna nervously looks away. <i>“I’ll keep that in mind.”</i> She turns back, kissing you on the lips once more. <i>“And I’ll try to make sure it happens next time. Okay?”</i>");
				output("\n\n<i>“I’d like that.”</i>");
				output("\n\nGianna grins. <i>“I thought so. Now get off of me you ");
				if(pc.tallness >= 72) output("big ");
				output("lug.”</i> She ineffectually pushes at you. You get the impression that her servos could probably move you if she wanted to, but she’s holding back to let you withdraw at your own pace. You do so, enjoying the way she feels sliding off your rod and the lewd sounds that accompany it.");
				output("\n\n<i>“I’m gonna go get cleaned up,”</i> she promises, squeezing out and onto the floor before you can manage to completely dismount. <i>“Try not to make too much of a mess while I’m gone!”</i> The ");
				if(gianna.biggestTitSize() >= 15) output("busty ");
				output("android is gone a second later, leaving you to collect your gear and your thoughts.");
				output("\n\nWhat a girl.");
				//Pass 25 minutes
				processTime(25);
				//Dont forget to cumflate if needed.
				giannaCumflated(pc, 0);
				pc.orgasm();
			}
		}
		//Dommy Gianna - cowgirl
		else
		{
			output("\n\n<i>“On the table, tiger.”</i> Gianna gives the bed a few firm pats. <i>“You can lie down and enjoy it. I’ll do </i>all<i> the work.”</i>");
			output("\n\nNot seeing any point in arguing with a girl that’s about to take [pc.oneCock] for a ride, you climb on board with the idea and on top of the table. It’s surprisingly soft and comfortable. You suppose the cow-girls that get milked in these stalls might find it relaxing. There’s even a padded place for your head. Your tumescent [pc.cocksNounSimple] jut");
			if(pc.cockTotal() == 1) output("s");
			output(" up into the air, pulsating eagerly.");
			output("\n\nComing up alongside you, the alabaster android smiles down at you");
			if(gianna.biggestTitSize() >= 15) 
			{
				output(". Her [gianna.tits] ");
				if(gianna.biggestTitSize() < 40) output("nearly");
				else output("neatly");
				output(" rest on your side");
			}
			output(". She grabs [pc.oneCock] with fingers as soft and supple as chameleon silk, stroking her thumb and pointer finger along its top and bottom playfully. <i>“So eager....”</i> Her index finger rubs in a little circle just below your [pc.cockHead " + x + "]. <i>“So hot and hard....”</i>");
			output("\n\nYou grunt, <i>“So fuck me already!”</i>");
			output("\n\nGianna tuts. <i>“The more eager this is, the better my pussy will feel.”</i> She releases you, only stroking you with a single finger. <i>“You want to feel my pussy as keenly as possible don’t you? Feel every ripple and fold in my perfectly designed synthskin as it massages your length? Sucks on it?”</i> She leans over you and plants one long lick from your [pc.sheath " + x + "] all the way to your [pc.cockHead " + x + "], leaving you shining with lube. Then, she looks over at you, awaiting your answer with a mischievous smile.");
			output("\n\n<i>“Yes! Just... don’t stop!”</i>");
			output("\n\nThat finger returns, sliding up and down your slickened shaft. When she hits the bottom, ");
			if(pc.balls > 0) output("Gianna gently rubs your [pc.sack], squeezing your [pc.balls]");
			else if(pc.hasVagina()) output("Gianna gently probes at the folds of [pc.oneVagina], teasingly plumbing your depths");
			else output("Gianna gently rubs your perineum, watching your [pc.cocks] bounce, begging for more attention");
			output(". <i>“I wouldn’t dare, [pc.name]... not to someone who’s been so good to me.”</i> She slides up onto the table with you, straddling your ");
			if(pc.legCount == 1) output("[pc.leg]");
			else output("[pc.legs]");
			output(" so that her wet cunt is just a few inches from the cock she’s playing with. <i>“When I finish with you, there won’t be a drop of cum left in your body.”</i>");
			//Futa Gianna
			if(gianna.hasCock())
			{
				output("\n\n<i>“But first, let’s get you good and lubed up,”</i> Gianna suggestions, bending overtop of you. Her [gianna.cock], already hard, presses down against your own. The biggest difference");
				if(flags["GIANNA_TEMP"] == -1) output(", aside from the chilliness of her boner,");
				else if(flags["GIANNA_TEMP"] == 1) output(", aside from how incredibly heated her boner is,");
				output(" is that hers is already oozing clear, slippery fluid, thoroughly juicing your cock in oily lubrication. You shudder through her frotting while ");
				if(flags["GIANNA_TEMP"] == 1) output("hot");
				else if(flags["GIANNA_TEMP"] == 0) output("warm");
				else output("cool");
				output(" droplets slowly soak your [pc.cock " + x + "] from stem to stern. The excess pools on your [pc.belly], making it that much easier for her to slip and slide across your flesh. Moaning, Gianna thrusts her hips one last, forceful time, and shoots a load of sticky goo from your dick to ");
				if(pc.biggestTitSize() > 1) output("the bottom of ");
				output("your [pc.fullChest].");
				output("\n\n<i>“Ah-ah... perfect,”</i> the dual-gendered android gasps as she slides back. <i>“That’ll slide right in.”</i>");
			}
			//Merge
			output("\n\nJust when you think you can’t wait anymore, the alabaster succubus rocks forward off her haunches, holding herself just above you. Little spatters of her juices drip from between her puffy-looking labia onto your already slicked-down groin. Slowly, she reaches down, grabbing you just above the [pc.sheath " + x + "], angling you towards the ");
			if(gianna.vaginas[0].vaginaColor == "pink") output("pink-blushing");
			else output(gianna.vaginas[0].vaginaColor);
			output(" delta. The first contact between your [pc.cockHead " + x + "] and Gianna’s [gianna.vagina] provides pleasure as suddenly as a live wire might induce pain, coaxing your [pc.cocks] to throb all the harder. Droplets of pre-cum abruptly spill out of you; some are lost to your lover’s smooth folds, while others invariably make their way across the veins that bar their way, drooling onto the table.");
			output("\n\nSinking down your shaft like a talented stripper down a well-worked pole, the skillful slut slaps her hips into you with a lewd-sounding slap. Lubricant splatters across your middle from the force of the penetration, cascading in across your [pc.belly] in shimmering sheets. The companion’s pussy is ");
			if(flags["GIANNA_TEMP"] == 1) output("hot enough to make your dick sweat inside its sweltering embrace.");
			else if(flags["GIANNA_TEMP"] == 0) output("so warm and wet that you quiver with desire.");
			else output("cool enough that the slick pressure is pleasurable in an alien way.");
			output(" Gianna’s luscious lips squeeze down around you at the same time that the android’s voice raises in a sigh of pleasure. <i>“Ahhh....”</i>");
			pc.cockChange();
			output("\n\nBlinking dreamily, she leans over you and begins to grind her pelvis against your own, twisting and twirling to an unseen, thumping beat, her soaked pussy squelching audibly. You can feel the inside of her passage rhythmically caressing you. Through artful design, Gianna’s [gianna.vaginaNoun] is more nimble than a flutist’s fingers and nearly as wet as a galotian quim. Concentric ripples flutter over your shaft. Long strokes of slow pressure slide along the underside of your length from stem to stern, and your [pc.cockHead " + x + "] is routinely suckled as if it was inside the most talented slut’s mouth.");
			output("\n\n<i>“Ohhh, you definitely like this, don’t you?”</i> Gianna is watching you now. Her gently glowing eyes seem fixated on your expression, and her flush deepens whenever she can coax a ragged moan or breathy exhalation from your form. Her pussy is like a whip, driving you onward to new heights of pleasure. Every time you think you’ve reached a stable plateau, it lashes your cock with a whole new type of pleasure. Your [pc.legOrLegs] quiver and thump against the table as your pleasure climbs higher and higher. You arch your back, lifting your android lover up off the table, on the verge of losing all control and bucking like a bronco.");
			output("\n\nGianna’s vice-like cunt relents, and you drop like a puppet with your strings cut, breathing heavily, your [pc.hips] twitching. She lets herself fall a moment after, impaling herself to the hilt once more. A beatific smile graces the android’s features while your eyes threaten to roll back into your head. <i>“You look so happy like this, [pc.name]");
			if(!pc.isBimbo()) output(", almost as happy as one of the locals. Knowing that your bliss isn’t chemically induced makes bringing you to this height all the sweeter.");
			else output(", even more than most of the locals. I’m so glad I’m able to make you feel this wonderful - more wonderful than your Treated brothers and sisters.");
			output("”</i> Gianna’s pussy grabs your [pc.cock " + x + "] like a delicate yet well-lubricated hand. Its grip is surprisingly firm, and the suction resumes. She twists and tugs you with her pussy alone, circling her hips in little circles to shift the stimulation to different parts of your sensitive anatomy.");
			//Multicocks
			if(pc.cockTotal() > 1)
			{
				output("\n\n<i>“And there’s so much of you to tend to...”</i> Gianna supports herself one handed, reaching down to grab your ");
				if(pc.cockTotal() == 2) output("other dick");
				else output("biggest free dick");
				output(". <i>“...and so much pleasure to give.”</i> Her palm is ");
				if(flags["GIANNA_TEMP"] == 1) output("hot");
				else if(flags["GIANNA_TEMP"] == 0) output("warm");
				else output("cool");
				output(" and wet, already slippery with lubricant from somewhere. All worries about where she got it from vanish when she slips her flawless digits around your [pc.cock " + x + "], binding it in a slippery grip. <i>“So much to love.”</i> The friction of her smooth palm caressing, nay, fondling your veins has you oozing across her knuckles.");
				if(gianna.biggestTitSize() >= 15) output(" She guides you up into the valley of her breasts, rubbing your leaking cock all across her expanded bosom, then pins them closed and starts to bounce, letting you fuck her tits and her pussy at the same time.");
			}
			//Merge back in
			output("\n\nGianna’s tempo goes from a slow-burning adagio to a peppy allegro. Her once demure rotations transform into a more traditional up-and-down pumping. Her [gianna.lips] part as she releases an obscene moan, loud enough to completely drown out the sounds from the surrounding stalls. She slams into you hard enough to rattle the table’s supports. It was built to hold a giant-breasted cow-girl, but nothing could prepare it for a companion droid on overdrive pounding her hips into you like she’s hammering nails.");
			output("\n\nScrewing up her brow, Gianna does her best to keep the reins tight on her runaway pleasure, but she’s losing it moment by moment. She’s so turned on that [gianna.nipples] almost seem to be vibrating atop her chest, as hard as you’ve seen them. Grabbing hold of one mid-downstroke, she gushes enough lubricant from her [gianna.vagina] to glaze your [pc.belly] with it. <i>“F-f-fuck!”</i> she stutters. Bracing herself with one hand on your [pc.chest], she ups the tempo, no longer even trying to top. Grunts and gasps of exertion are the only sounds she makes, and despite their artificial origins, they seem sincere.");
			output("\n\nQuivers of liquid pleasure ripple through your middle from moment to moment, beholden to nothing but the slippery-sweet caresses of the android’s slit, coaxing you closer and closer to eruption until you wonder if you’ll have the sense left to give her warning of your climax. Gianna looks down, a little cross-eyed from pleasure, and moans, <i>“Cum, [pc.name]!”</i> She’s blushing so hard she’s practically pink, obviously on the edge herself, and with the way her pussy is wringing you, you couldn’t stop yourself from obeying if you wanted to.");
			output("\n\nPleasure crashes over you like a wave. The tightly-coiled ball of magma inside you convulses, surging past involuntary spasming muscles, and erupts in the android’s squeezing, sucking cunt. ");
			if(cumQ < 5) output("There’s barely a drop to be shot, but she claims every little bit of it, milking your [pc.cock " + x + "] until it’s impotently spasming, wrapped up in pleasure and drained of every ounce of [pc.cumNoun].");
			else if(cumQ <= 25) 
			{
				output("You seed her convulsing quim with every drop your [pc.balls] hold");
				if(pc.balls == 1) output("s");
				output(", painting her interior [pc.cumColor]. Even after you stop, she’s still milking your [pc.cock " + x + "], wrapping it in what feels like a sleeve of heaven on earth.");
			}
			else if(cumQ <= 500) output("You blast long ropes of [pc.cum] directly into her waiting quim, coloring her own juices [pc.cumColor] as they mix together. The [pc.cumVisc] stuff absolutely drenches her pussy, and your [pc.cock " + x + "] throbs with wild enjoyment throughout.");
			else
			{
				output("You geyser huge ropes of [pc.cum] directly into her waiting quim, flooding her interior with so much [pc.cumVisc] love that some of it squirts back out around her clinging lips. Bulging slightly, the companion’s belly expands to contain what you’re pumping into whatever passes for her womb");
				if(cumQ >= 8000) output(", rapidly attaining a rounded, sexed-to-pregnant look");
				if(cumQ >= 12000) output(", then bloating to obscene roundness");
				output(". She milks your [pc.cock " + x + "] throughout and long after your heady flow abates.");
			}
			output("\n\nFlopping down onto you, Gianna wraps her arms around your neck and batters your crotch with her hips, slapping them against you with increasingly unfocused, sloppy thrusts. [pc.Cum] squirts out around you, and the screams of pleasure she unleashes into your ear nearly deafen you. Yet, you can’t help but smile in satisfaction at getting her off so powerfully. She’s twitching on top of you for a solid minute, her pussy still quivering around you, lustily kissing at the nape of your neck repeatedly.");
			output("\n\nYou gently push her up when her thrashings slow.");
			output("\n\nThe android smiles at you, rubbing her hand across your lube");
			if(cumQ > 500) output(" and cum");
			output("-soaked belly. <i>“I told you I’d wring out every drop.”</i> Judging by how empty you");
			if(pc.balls > 1) output("r [pc.balls] feel");
			else if(pc.balls > 0) output("r [pc.balls] feels");
			else output(" feel");
			output(", you’re inclined to agree with her.");
			output("\n\nGianna drags herself off your pole like an exhausted swimmer climbing from a pool. She nearly falls when she rolls off the table onto the straw-covered floor");
			if(cumQ >= 8000) output(", dragged down by her inflated belly");
			output(". <i>“I’m gonna... gonna go wipe up. I’ll be right back.”</i>");
			output("\n\nYou get dressed while the made-to-order woman does her business.");
			processTime(41);
			//Dont forget to cumflate if needed.
			giannaCumflated(pc, 0);
			//Orgasm - make sure to COMPLETELY empty balls.
			pc.orgasm();
			pc.ballFullness = 0;
		}
	}
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function missionaryKnotEpilogue():void
{
	clearOutput();
	giannaDisplay();
	output("You extricate yourselves with a wet sounding ‘plop’");
	if(pc.cumQ() > 2000) output(" and a gush of pressurized [pc.cumNoun]. Her belly retains its swollen shape, and the leaking fuckjuice trails off in no time, penned inside her by some mechanism you don’t fully understand but appreciate nonetheless");
	output(".");
	output("\n\nGianna ambles off to wipe down, but she’ll be back in a moment. You grab your gear, ready for more exploration.");
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[**]Phat booty hotdogging
public function phatBootyHotdogging():void
{
	clearOutput();
	giannaDisplay();
	output("Putting your arm around the naked pleasure-droid, you surreptitiously slide your hand down to the top of her expansive bottom. She colors, ");
	if(giannaPersonality() >= 70) output("grinning unashamedly back at you");
	else if(giannaPersonality() >= 30) output("giggling in delight");
	else output("casting her eyes down but gently pushing back against your palm");
	output(". You look her in the eye and squeeze. <i>“I’ve got an idea.”</i>");
	//Dommy
	if(giannaPersonality() >= 70)
	{
		output("\n\n<i>“That idea is going to be milking your cock with my asscheeks, isn’t it?”</i> She flexes against your hand, leaving you wondering just what it would have felt like to already have your dick in place when she did that.");
		output("\n\n<i>“Maybe...”</i>");
		output("\n\nGianna grins and grabs you by the hand. <i>“Come on then, " + pc.mf("stud","babe") + ". Let’s go somewhere where we can do this a little more comfortably.”</i> She casually rubs her [gianna.butt] against you. <i>“I can’t wait to feel you cumming all over me.”</i>");
	}
	//Normal!
	else if(giannaPersonality() >= 30) 
	{
		output("\n\nGianna giggles. <i>“It’s my butt, isn’t it?”</i>");
		output("\n\n<i>“Well... yeah,”</i> you admit.");
		output("\n\nShe wiggles against you. <i>“I knew it. You got me to make my butt all big and jiggly for you. I knew you’d want to use it.”</i> She chews a [gianna.lip]. <i>“Only question is... are you gonna try and stick it in, or fuck the cheeks?”</i> Wiggling excitedly, she presses herself against you. <i>“No, don’t tell me. I’ll just bend over, and you can show me with your cock.”</i> She squeezes you");
		if(pc.isCrotchGarbed()) output(" through your [pc.lowerGarment]");
		output(". <i>“It’ll be a surprise! A hot, sticky surprise...”</i>");
	}
	//Subby
	else
	{
		output("\n\nGianna nods demurely, but her bottom wiggles excitedly. She nervously looks back at you. <i>“Might I ask what your idea is?”</i>");
		output("\n\nYou rub her expanded bottom. <i>“Guess.”</i>");
		output("\n\nGianna puts a finger to her lips, considering. It’s amazing how human-like her mannerisms are, despite being powered by what amounts to a powerful computer. Her eyes brighten. <i>“You’re gonna hotdog me, aren’t you?”</i>");
		output("\n\nSmirking, you ask her why she thinks that.");
		output("\n\n<i>“It’s obvious. You can’t stop grabbing my butt - the butt you got me to make all big and slutty for you, and you haven’t shown any signs of slipping a finger inside to loosen me up or get me to start lubricating.”</i> The android’s cream skin blushes pink. <i>“The only question is: are you going to bend me over a table or lay me down and fuck my cheeks that way?”</i> Her ass clenches under your hand. <i>“I can’t wait to find out.”</i>");
	}
	//Merge
	output("\n\nYou duck into a stall with the increasingly excited companion, and, you must admit, the excitement is contagious. Your [pc.cockBiggest] is straining hard ");
	if(!pc.isCrotchGarbed()) output("in the muggy, sex-scented air of the barn.");
	else output("against your [pc.lowerGarment].");
	output(" You give yourself a little rub as you watch Gianna look around and spot the table. Looking back at you, she leans down with deliberate slowness, bending over the padded surface. Her heels lift off the ground as she rises up on the balls of her feet, and her ass flexes for you, jiggling while she finishes lying down.");
	if(pc.biggestTitSize() >= 15) output(" Of course, her silicone filled boobs prevent her from going too far down, holding her up at a forty-five degree angle, but it’ll be enough, you figure.");
	output("\n\nYou slap her butt, watching the impact ripple across her flawless synthskin. Gianna giggles while her bottom reddens, and you do it again, swatting from the other direction. Your [pc.cocks] throb");
	if(pc.cockTotal() == 1) output("s");
	output(" excitedly. You’re hard enough that you feel like you could fuck the whole galaxy right now, but this wonderful ass will do for the time being. Rubbing it with both hands, you play nice with the tenderized derriere. Gianna coos and resumes her excited wiggling. She’s so hungry for attention that it’s almost comical. You could keep massaging her ass for hours, and she’d probably just lie there, smiling the whole while.");
	output("\n\nThere’s more to life than butt massages, however. You’ve got a ready dick. All it needs is a little lube.");
	//Futas got their own lube. - no new pg
	if(pc.hasVagina())
	{
		output(" Reaching ");
		if(pc.balls > 0) output("under your [pc.balls]");
		else output("down to your own crotch");
		output(", you smile to yourself. Being a hermaphrodite has its fair share of disadvantages, but in this instance, having a juicy pussy within easy reach is a huge advantage. You rub your arousal-moistened lips with your fingers, gather a ");
		if(pc.wettestVaginalWetness() < 3) output("coat of girlish goo to smear across your shaft");
		else output("a palmful of your dripping moisture to soak your shaft with");
		output(", and stroke a few times to make sure you’re slick and ready all over.");
	}
	//Gianna lube me up, cap’n - no new pg
	else
	{
		output(" Reaching between Gianna’s legs, you find Gianna’s clit with a finger and circle it a few times. <i>“");
		if(pc.isNice()) output("A little lube, please.");
		else if(pc.isMischievous()) output("Lube me up, baby.");
		else output("I need some lubrication.");
		output("”</i>");
		output("\n\nFlushing, the synthetic buttslut nods. Her whole [gianna.vaginaNoun] engorges before your eyes, and a steadily-dripping river of lubricant slides into your hand. You rub her clit a few times as a thank you, earning a few lusty moans from the quivering, dripping android. She keeps going even after you pull back to smear the gathered slickness across your [pc.cockBiggest], eyeing your glistening penis with undisguised longing.");
	}
	//Merge
	output("\n\n<i>“");
	if(giannaPersonality() >= 70) output("Slip it in it, [pc.name]. Go ahead. Just don’t blame me when you’re getting your dick milked for the third time today by my cheeks. I’m not responsible if you get addicted to it.");
	else if(giannaPersonality() >= 30) output("Put it in! I’m completely, like, ready to feel you cumming all over my butt. I won’t even complain if you slip the tip inside and fill me from behind. Just cum wherever you like.");
	else output("Please, [pc.Master]. I’m ready. I promise, I’ll make my butt feel as good as possible for you and earn every drop of seed you shoot out.");
	output("”</i> Gianna flexes her ass, bouncing her cheeks.");
	output("\n\n");
	if(gianna.hasCock()) showImage("GiannaHotdogFuta");
	else showImage("GiannaHotdog");
	output("As if you could wait any longer. ");
	if(pc.tallness <= 66) output("You get a nearby stool so that you’ll be able to reach her butt. Being small sure is a pain sometimes. ");
	output("Wrapping a hand around yourself near the base, you slide your [pc.cockBiggest] into the crease between her plump cheeks. ");
	if(pc.longestCockLength() >= 10) output("Your [pc.cockHeadBiggest] pops back out on the other side, still shining and slick. ");
	if(flags["GIANNA_TEMP"] == 1) output("Damn, she’s hot. Putting yourself in her ass cleavage is like dipping yourself into a hot tub.");
	else if(flags["GIANNA_TEMP"] == 0) output("Damn, she’s warm. Her ass cleavage could almost be a pussy with how smooth and wet it feels right now.");
	else output("Damn, her ass is chilly. The smooth wetness of her rear cleavage feels so alien and yet so pleasant wrapped around you.");
	output(" You squeeze it together to tighten the fit and groan with desire; this is amazing! She’s just so... so squishy. Her butt perfectly conforms to the shape of your [pc.cockBiggest], and it makes it hard to consider the merits of fucking her anywhere else.");
	output("\n\nGianna rocks her hips, dragging her cushiony backside along your length. <i>“");
	if(giannaPersonality() >= 70) output("I knew you’d love it.");
	else if(giannaPersonality() >= 30) output("You really like my butt, huh?");
	else output("I’m glad you approve of my slutty butt, [pc.Master]. Use it as you please.");
	output("”</i> She flexes, forcing the silicone embrace to tighten yet further. You groan in response and probably leak a droplet of pre-cum into her crack, but it’s impossible to tell with all the ass in your way.");
	output("\n\nWith your own heartbeat hammering in your ears, you shift position, pulling back until you’re about to pop out, and thrust inside, the first of many. This is your ass! It jiggles against you with each rhythmic pound. It’s your butt to use and abuse - to nestle your dick in whenever you feel the urge to blow a load. You grunt and growl as you fuck her bottom, suddenly possessed by barely understood urges that feed off the sensations spooling from your dick. One thing is clear to you: you’re not stopping until you reach completion.");
	output("\n\nThe fat-bottomed companion urges you on with appreciative moans of her own. Sometimes, your strokes carry your [pc.cockHead] into the edge of her rim, and the brief catch will push her into ecstatic cries. Your hands playfully knead her butt as you fuck it, occasionally roughly groping it, other times bouncing it. Still other times, you’ll press it back down into a tight sleeve. The only constant is your pistoning rod, plumbing her backdoor cleavage with rapidfire thrusts.");
	//2 Dix
	if(pc.cockTotal() == 2)
	{
		output("\n\nTired of its useless flopping, you wrangle your other dick into her expansive butt and resume plowing her backside. With the pleasure doubled, it’s impossible to do anything but mindlessly thrust. You pound away like a man possessed, hammering her haunches for all you’re worth.");
	}
	//Multidicks more than 2
	else if(pc.cockTotal() > 2)
	{
		output("\n\nTired of all the useless flopping, you grab your [pc.cockSmallest] and wrangle it into the slippery crack alongside your first. There’s not room for all of your tools, but having two embraced by Gianna’s pillowy butt is more than enough. The doubled pleasure makes it impossible to think or talk - keeping the thrusting, pounding rhythm going is all you’re capable of at the moment.");
	}
	//Merge
	output("\n\nYou wouldn’t mind doing this for hours, but there’s a familiar tightness welling up inside you. You feel like a spring being wound up. Tighter and tighter you get with no relief. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" as hard as a titanium bar and as thick as ");
	if(pc.cockTotal() == 1) output("it");
	else output("they");
	output(" can possibly get. A whine escapes the back of your throat as your humping takes on a desperate note, and you smash Gianna’s cheeks together as tightly as possible, feeling your [pc.cockBiggest] spasm");
	if(pc.cockTotal() > 1) output(" alongside its smaller brother");
	output(". You gasp in relief, suddenly feeling the pressure shift, boiling a molten path through your middle and up your ecstatically pulsing length");
	if(pc.cockTotal() > 1) output("s");
	output(". You cum so hard white spots dance across your vision.");

	output("\n\nGianna gasps in delight when she feels your [pc.cum] between her jiggling asscheeks");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 60) output(".");
	else 
	{
		output(", then moans when thick ropes of it spill out of it from both ends.");
		if(cumQ >= 400) output(" Her look turns incredulous as the ropes thicken to rivers that splatter wetly on the floor, rolling off her back on both sides.");
		if(cumQ >= 2000) output(" The floor drain struggles to keep up with the liquid weight you’re putting out, but you’re cumming too hard to care.");
		if(cumQ >= 10000) 
		{
			output(" As the tide of [pc.cumNoun] floods halfway up the table’s legs, you wonder if ");
			if(flags["RESCUE KIRO FROM BLUEBALLS"] == 1) output("Kiro ever has problems like this.");
			else output("maybe you jizz a little too much.");
			output(" <i>“Oooh, let it all out.”</i>");
		}
	}
	output("\n\nYou do just that, rocking your [pc.cockHeadBiggest] back and forth until you begin to soften. Her butt is a swamp of sexjuice, and you note with delight that her skin is heavily flushed. She seems to have enjoyed herself almost as much as you!");
	output("\n\nSeeing your look, the android nods, rubbing you affectionately with her foot. <i>“");
	if(giannaPersonality() >= 70) output("Ahhh, that was nice, wasn’t it? Feeling you fucking me like a wild" + pc.mf("man","woman") + " and then going all trembly and shivery was all I needed.");
	else if(giannaPersonality() >= 30) output("Wow! I haven’t cum like that in a while. What? Didn’t you think I’d get off with you? As long as I want to, I’ll ALWAYS get off with you.”</i> She winks. <i>“Wanna do it again?");
	else output("I wouldn’t be much of a companion if I didn’t get off when my owner did, would I?");
	output("”</i>");
	output("\n\nYou shake your head, a little awed, and step back, enjoying the wet sound of your [pc.cockBiggest]");
	if(pc.cockTotal() > 1) output(" and [pc.cockSmallest]");
	output(" sliding free. Gianna stretches and climbs up.");
	if(cumQ >= 2000) output(" She even uses her toe to draw patterns in the slowly draining [pc.cumNoun].");
	output(" Then, you help each other clean up, and she helps you gear back up. ");
	if(!pc.isNude()) output("You guess there are advantages to running around naked all the time.");
	else output("When you don’t need to carry equipment around with you anymore, you’re going to love being able to enjoy being naked as much as she is.");
	processTime(20+rand(5));
	pc.orgasm();
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[**]Anal Buttfuck By Savin
//Any cocksize that can fit in her, any GiannaButt size. 
public function savinTriesToWriteGiannaButtfux():void
{
	clearOutput();
	giannaDisplay();
	author("Savin");
	output("Putting your arm around the naked pleasure-droid, you surreptitiously slide your hand down the naked pleasure droid’s side ");
	if(gianna.buttRating() <= 7) output("to squeeze her firm, tight little butt");
	else if(gianna.buttRating() < 15) output("and dig your fingers into the ample cheeks protruding behind her, grinning as your digits sink into her pliant, silicone-laden synthflesh");
	else output("and down to the tremendous expanse of her pornstar-like ass, resting atop the massive mounds and practically sinking into them");
	output(". She happily wiggles back against your hand, pressing herself in tight against you. ");
	if(giannaPersonality() >= 30) output("<i>“Find something you like?”</i>");
	else output("<i>“Do you like it, [pc.master]?”</i>");

	output("\n\n<i>“");
	if(pc.isAss()) output("Maybe");
	else output("Oh, I do");
	output(",”</i> you tease, giving her beautiful behind a little squeeze.");

	output("\n\nShe grins up at you, chewing on her lower lip as you ");
	if(gianna.buttRating() > 7) output("knead her big cheeks");
	else output("grope her tight ass");
	output(".");
	output("\n\n");
	//If DommyGigi: 
	if(giannaPersonality() >= 70)
	{
		output("<i>“If you like it, better use it,”</i> she answers, squeezing her cheeks together around a few of your far-wandering digits. ");
		if(gianna.buttRating() < 15) output("The way she moves, it doesn’t take much to imagine a lot more silicone on her backside and your [pc.cockBiggest] buried between her jiggling, squeezing cheeks. You get a little jolt of excitement just thinking about it. ");
		output("<i>“What do you say I take you somewhere a little more comfortable, " + pc.mf("stud","babe") + "? I want to show you what my ass can really do.”</i>");
	}
	else if(giannaPersonality() >= 30)
	{
		output("<i>“I figured you were an ass-" + pc.mf("man","girl") + " the moment I saw you,”</i> she teases back, nuzzling up against you - and relaxing her back cheeks so much that you can’t help but run a few fingers through her crack, tips brushing the little ring of her pucker. She gasps happily at the touch. <i>“Only question is... are you gonna try and stick it in, or fuck the cheeks? No, don’t tell me. I’ll just bend over, and you can show me with your cock.”</i> She squeezes [pc.oneCock]");
		if(pc.isCrotchGarbed()) output(" through your [pc.lowerGarment]");
		output(". <i>“It’ll be a surprise! A hot, sticky surprise...”</i>");
	}
	else 
	{
		output("<i>“Would you like to...”</i> she starts, trailing off as your hand continues to molest her backside, causing her voice to twist into a coo of pleasure. Her body relaxes utterly, giving you easy access to the crack of her ass. You slide a finger through it, grinning as she mewls and groans when you find the tight ring of her asshole. Your probing digit slides right on it, easily spreading her anal ring open around you. She gasps, her [gianna.chest] quaking as you finger her behind.");
		output("\n\n<i>“Would you like to fuck it?”</i> Gianna finally manages to say, pushing back against your buried digit until you’re buried to the hilt. Now that’s an offer you could never refuse....");
	}
	// Combine
	output("\n\nGianna pushes off your hand, twirling on a heel and taking your hand in hers. She eagerly guides you out of the barn foyer and into one of the stalls. Every step brings a wider and wider smile to the sexbot’s face until she’s practically giddy with excitement when the two of you make your way into the stall, the door slamming shut behind you. By the time the two of you tumble in, your [pc.cockBiggest] is straining hard");
	if(!pc.isCrotchGarbed()) output(" in the muggy, sex-scented air of the barn.");
	else output(" against your [pc.lowerGarment].");
	output(" You give yourself a little rub as you watch Gianna sashay over to the table, every step deliberate and precise, calculated to make the most of her [gianna.butt]. She makes a show of walking over to the table, her ass ");
	if(gianna.buttRating() >= 20) output("jiggling like two oceans of gelatin");
	else if(gianna.buttRating() >= 15) output("quaking with every step, the added heft of silicone you’ve given her doing the most amazing things to her profile");
	else output("wiggling invitingly as she walks");
	output(".");
	output("\n\nShe flashes a ");
	if(giannaPersonality() >= 30) output("grin");
	else output("a demure smile");
	output(" over her shoulder when she gets to the table, and takes her time bending over it, spreading her legs out wide. Her heels lift off the ground as she rises up on the balls of her feet, wiggling her ass by way of invitation.");
	if(gianna.biggestTitSize() >= 15) output(" Of course, her silicone filled boobs prevent her from laying down too far, holding her up at a forty-five degree angle, but it’ll be enough, you figure.");
	if(giannaPersonality() >= 70) output(" She shoots you a wink and purrs, <i>“Come and get it, " + pc.mf("stud","baby") + ".”</i>");

	output("\n\nYou ditch your [pc.gear] before sauntering up behind your android lover and giving her an appreciative spank, eyeing her [gianna.butt] as your palm makes content with Gianna’s alabaster synthflesh. She moans at the rough touch, leaning back to rub her butt against your [pc.crotch]. ");
	//Futas got their own lube. - no new pg
	if(pc.hasVagina())
	{
		output("Reaching ");
		if(pc.balls > 0) output("under your [pc.balls]");
		else output("down to your own crotch");
		output(", you smile to yourself. Being a hermaphrodite has its fair share of disadvantages, but in this instance, having a juicy pussy within easy reach is a huge advantage. You rub your arousal-moistened lips with your fingers, gather a ");
		if(pc.wettestVaginalWetness() < 3) output("coat of girlish goo to smear across your shaft");
		else output("a palmful of your dripping moisture to soak your shaft with");
		output(", and stroke a few times to make sure you’re slick and ready all over.");
	}
	//Gianna lube me up, cap’n - no new pg
	else
	{
		output("Reaching between Gianna’s legs, you find Gianna’s clit with a finger and circle it a few times. <i>“");
		if(pc.isNice()) output("A little lube, please.");
		else if(pc.isMischievous()) output("Lube me up, baby.");
		else output("I need some lubrication.");
		output("”</i>");
		output("\n\nFlushing, the synthetic buttslut nods. Her whole [gianna.vaginaNoun] flushes, and a steadily-dripping river of lubricant slides into your hand. You rub her clit a few times as a thank you, earning a few lusty moans from the quivering, dripping android. She keeps going even after you pull back to smear the gathered slickness across your [pc.cockBiggest], eyeing your glistening penis with undisguised longing.");
	}
	//Merge
	output("\n\n<i>“Makes me wish they’d designed me with a self-lubricating ass,”</i> Gianna muses as you get yourself ready. <i>“Maybe I could find an aftermarket mod...”</i>");
	output("\n\nNow that would be something. Still, ");
	if(!pc.hasVagina()) output("she’s");
	else output("you’re");
	output(" more than capable of making your dick glisten with fem-lube. You shift your [pc.hips]");
	if(gianna.buttRating() >= 15) output(", spread Gianna’s huge, soft cheeks,");
	output(" and press the crown of your slicked-up cock against the tight pucker hidden in your lover’s behind. She moans just at the touch, wiggling herself back against you until the tip slips into her. The moment of penetration is one of pure ecstasy, sending an electric current of pleasure through you as you delve into the android buttslut’s sinfully tight behind. She feels like a virgin, squeezing you so perfectly with inch after inch of squirming muscle, but by the blissed-out look and low, throaty moans she’s making, you know Gianna’s well versed in anal pleasure. You grab one of her shoulders and hips, holding her steady as your [pc.hips] slide your [pc.cockBiggest] deep into her [gianna.asshole].");
	//Cockchange
	pc.cockChange();

	output("\n\nYou thrust in until ");
	if(pc.biggestCockLength() <= 20) output("your crotch presses into her [gianna.butt], squeezing into your synthetic lover’s behind.");
	else 
	{
		output("Gianna lets out a sharp gasp, reaching down to rub her belly - and letting you see how monstrously your gargantuan member has distorted her gut. <i>“Slow down, ");
		if(giannaPersonality() >= 30) output("tiger");
		else output("[pc.master]");
		output(".... I can’t take any more. I’m not Ellie down here!”</i>");
	}
	output("\n\nYou ease up, resting for a moment against your android lover, before you start to move. She doesn’t need any time to adjust to you, just moans and wiggles her hips as you pull back, and thrust in again.");
	output("\n\n");
	//If DommyGigi: 
	if(giannaPersonality() >= 70) output("<i>“Oh, just like that,”</i> she moans, bracing her hands against the edge of the table. <i>“Come on, tiger. Fuck me harder!”</i>");
	else if(giannaPersonality() >= 30) output("<i>“Ooooh, that’s the stuff, [pc.name]!”</i> Gianna cries, her voice ringing with exuberance. <i>“Go ahead and fuck me as hard as you want - as hard as you can! I want to feel your thick, sticky seed shooting into my tight ass!”</i>");
	else output("<i>“I hope it feels good,”</i> Gianna moans, her fingers digging into the table - clearly, <i>she</i>’s enjoying it! You tell her that you are as well, and earn a bashful grin from the sexy android between booty-jiggling thrusts into her backdoor. <i>“I’m glad you like my slutty asshole... please fuck it as hard as you want.”</i>");
	// Combine
	output("\n\nGianna’s words spur you on, urging you to fuck her faster until every impact is sending her shuddering forward, lurching into the table. The whole setup rocks forward every time you ");
	if(pc.biggestCockLength() > 20) output("hammer a gut-straining cock-thrust into Gianna’s well-stretched asshole");
	else output("thrust hilt-deep into Gianna’s welcoming behind");
	output(". Her hips hump back against you, moving to take you deeper and faster as best she can, reaching back to meet your thrusting [pc.cockNounBiggest]. In turn, you");
	if(pc.isTaur()) output(" shift the weight of your bestial body");
	else output(" plant a hand on the metallic port just");
	output(" over her quivering backside and give her a slight push down onto the table");
	if(gianna.biggestTitSize() >= 15) output(", though it’s not much considering her massive rack");
	output(". Her hands move fluidly from one end of the table to the other, stretching herself out across the surface. She’s not quite tall enough to make it, and ends up pulling her feet off the ground to reach; that won’t do at all.");

	output("\n\n");
	if(pc.isTaur())
	{
		output("Shifting your weight again, you give her another little push and tell her to get onto her back.");
	}
	else
	{
		output("Reaching forward, you grab one of Gianna’s ");
		if(gianna.biggestTitSize() <= 3) output("high, perky tits");
		else if(gianna.biggestTitSize() < 40) output("hefty, silicon-laden tits");
		else output("immense, cow-girl-like boobs");
		output(". Starting there, you give her another little push, this time onto her back.");
	}
	output(" She obediently rolls over");
	if(gianna.biggestTitSize() >= 15) output(", though with some effort, thanks to her massive rack,");
	output(" which sends an incredible shock of twisting, wringing pleasure through your [pc.cockBiggest]. Even as she moves, you don’t let up, vigorously pounding into the android’s ass. She grins at you from her new vantage, cupping her arms under her jiggling breasts.");
	output("\n\n<i>“I love the view,”</i> she purrs, licking her lips as she drinks in the sight of you. Her long, alabaster legs slip around your waist, pulling you tight against herself. Your ability to thrust evaporates under Gianna’s leg-lock, but that doesn’t mean the fun’s over - not for an instant. Her synthetic muscles go to work on you, squirming and writhing and wringing your [pc.cockBiggest]. Her tight passage kisses and caresses your prick, sucking you in. Her creamy skin flushes darker, and she adds, <i>“And I love the feeling of you inside me... stretching my ass like this. Mmmmm.”</i>");

	output("\n\nJust like that, her lock on you relents, her legs simply hugging you, moving with you as you start to thrust again. Her whole body quakes and shifts, recoiling as you pick your pace back up. Silicone quivers under synthflesh with every wet, loud impact of flesh on flesh. Gianna coos and moans, urging you on faster and harder, her sexual noises escalating to begging cries for your dick, screaming for more so loud that every cow and bull in the barn must be able to hear her. Hear <i>you</i> rutting, grunting with effort as your body prepares to fill your synthetic lover with [pc.cumNoun].");

	output("\n\nShe senses what’s coming, and her lips fill out into a wide, contented grin. <i>“Don’t hold back... please...”</i> she moans, cupping her tits, pinching her nipples. <i>“I want to feel it. Every drop.”</i>");

	var cumQ:Number = pc.cumQ();
	output("\n\nYour body responds on a primal, instinctive level to your lover’s need. Your ");
	if(pc.balls == 0) output("body");
	else output("[pc.balls]");
	output(" tremble");
	if(pc.balls == 1) output("s");
	output(", seed swelling before rushing to meet Gianna’s magnificent ass. <i>“Ah! I feel it!”</i> she cries, excitement palpable as her muscles contract, welcoming the first ropes of your hot cum that shoot deep into her ass. Your hips piston faster, hammering into her writhing hole, using her tight passage to milk yourself into her. She’s more than happy to let you do it, crying out in pleasure as you thrust faster into her, letting out ");
	if(cumQ < 100) output("a steady spurt of seed.");
	else if(cumQ <= 5000) output("a veritable river of spooge into Gianna’s ass. She seems to soak it all up, eagerly draining your seed as fast as you can give it to her.");
	else output("a torrential amount of spunk into Gianna’s ass, filling the android’s body too fast for her to cope with. By the time you’re done, she looks positively pregnant... and all but beams in delight at her expanded, cum-swollen belly, cradling it like a child.");
	output(" As you wind down, Gianna laces her feet behind your butt, urging you to give her one final push into her ass. Her back arches in a slow, languid motion as she takes your still-hard cock a final time. Trickles of spunk drool out of her ass as you enter her, staining the spread cheeks of her [gianna.butt].");

	output("\n\n");
	if(giannaPersonality() >= 70) 
	{
		output("Gianna reaches up with one of her perfect, creamy-skinned feet");
		if(!pc.isTaur()) output(" and brushes her big toe across your [pc.lip]");
		output(". <i>“Mmm, that was nice. My circuits are just </i>trembling<i> after that, " + pc.mf("stud","babe") + ".”</i> She makes a quiet purring sound, languidly stretching her arms back");
		if(cumQ > 5000) output(" and rubbing her cum-stuffed belly");
		output(".");
	}
	//if NormalGigi:
	else if(giannaPersonality() >= 30) output("<i>“That was great!”</i> Gianna purrs, squeezing her legs around you. <i>“Like, nothing’s better than a good, hot assfull of cum! Especially when it’s from you.”</i>");
	else output("<i>“Was that all right, [pc.Master]?”</i> Gianna ventures, nervously biting her lip. <i>“I hope you came as hard as I did...”</i>");
	output("\n\nYou pat her thigh, slowly pulling yourself back from her until, with a wet pop, your cock flops free. Spunk drools out of her well-fucked ass, pooling between her legs as they flop back down to the floor. She hops up after a quiet moment of afterglow, happily helping you clean and gear up.");
	if(pc.isMischievous()) output(" As you’re getting ready to depart, you reach back and give Gianna a swift swat on the ass. She squeals, and a goodly amount of your orgasm leaks out to stain her thighs. Her alabaster skin darkens at the mishap, causing you to laugh all the way out.");
	processTime(30);
	giannaCumflated(pc, -1);
	pc.orgasm();
	flags["GIANNA_FUCK_TIMER"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Give
public function giveGiannaSomethingCoolYouSlut():void
{
	clearOutput();
	giannaDisplay();
	output("You search around your possessions for something to give to Gianna.");
	//Positive
	if(giannaPersonality() >= 70) output("\n\nGianna bounces over, craning around you to get a look in your pack. <i>“Ohh, did you get me a present?”</i> Her eyes brighten noticeably as she circles you. <i>“I must have made you pretty happy, huh?”</i> She blows air across your earlobe. <i>“If you weren’t about to give me a present I’d pin you down and do it all over it again.”</i>");
	//Neutral
	else if(giannaPersonality() >= 30) output("\n\nGianna gasps, her eyes glowing brightly. <i>“A present? ...You’re gonna give me a present?”</i> She claps her hands excitedly and watches you with baited breath, or what passes for baited breath when breathing is optional.");
	//Negnegneg!
	else output("\n\nGianna keeps her eyes fixed at the ground submissively, her hands crossed just in front of her waist. <i>“Are you getting something for me?”</i> She fidgets, toeing at the ground. <i>“My old master never gave me anything, really.”</i>");
	processTime(2);
	//Menu of give things
	clearMenu();
	if(pc.hasItemByClass(AHCock)) addButton(0,"A.H.Cock",giveGiannaSomethingTransform,"hoss","Android Horse Cock","Give Gianna the android horse-cock you’ve been carrying around.");
	else addDisabledButton(0,"Locked","Locked","You’ve no idea what this could be.");
	if(pc.hasItemByClass(ACock)) addButton(1,"A.Cock",giveGiannaSomethingTransform,"humancock","Android Cock","Give Gianna the android cock you’ve been carrying around.");
	else addDisabledButton(1,"Locked","Locked","You’ve no idea what this could be.");
	if(pc.hasItemByClass(ADCock)) addButton(2,"A.D.Cock",giveGiannaSomethingTransform,"dragon","Android Dragon Cock","Give Gianna the android dragon-cock you’ve been carrying around.");
	else addDisabledButton(2,"Locked","Locked","You’ve no idea what this could be.");
	addButton(14,"Back",giannaMenu);
}

public function hasGiannaGift():Boolean
{
	if (pc.hasItemByClass(AHCock) || pc.hasItemByClass(ACock) || pc.hasItemByClass(ADCock)) return true;
	return false;
}


//Transformation Go
public function giveGiannaSomethingTransform(arg:String = "hoss"):void
{
	clearOutput();
	giannaDisplay();
	output("You withdraw the floppy addition from your inventory and offer it to the android.");

	//HOSSCAWK
	if(arg == "hoss")
	{
		//Positive
		if(giannaPersonality() >= 70) output("\n\n<i>“Ohhh, is that a XL model? Those things are huge - and it has the equine subvariant too!? Oh I’ll make so many of the bulls here jealous! I can’t wait to see it fully inflated and wave it in someone’s face!”</i> Gianna takes and turns it in her hands, peering at it from every angle, scanning the entire surface for defects. <i>“Oh, I bet you want me to fuck you with this, don’t you?”</i> A coquettish grin slowly spreads across her face. <i>“Or maybe you want me to ram it down your throat?”</i>");
		//Neutral
		else if(giannaPersonality() >= 30) output("\n\n<i>“Omigod, really? That looks like one of the XL models - the horsey ones. I could probably make Zephyr all kinds of jealous with it. I bet she’d bend me over her desk and fuck me hard enough to break it in half!”</i> Gianna grins mischievously while looking over the phallic present. <i>“...but you wouldn’t give this to me just make her jealous, would you? Do you want me to use this on you?”</i>");
		//Submissive
		else output("\n\nGianna actually looks up at you when you offer it to her. Her luminous eyes are dim and flickering, full of unspoken emotion. <i>“T-thank you, [pc.master]. I never thought I’d get to have an XL model, let alone a horse-cock. It’s beautiful.”</i> She spins it in her hands, scanning it for defects. <i>“Perfect. Did... did you want me to use this on you, or just watch it squirt while you make use of my chassis?”</i>");
	}
	//DRAGONCAWK
	else if(arg == "dragon")
	{
		//Positivity Waifu
		if(giannaPersonality() >= 75)
		{
			output("\n\n<i>“Oooh, what’s this?”</i> Gianna croons, gazing at the vibrantly-colored synth-cock in your hand. She prances over a step to examine it closer, and you’re gratified to see a big smile spread across her alabaster cheeks. <i>“Wow, this is one of those old Kiha Monsters, right? I’m pretty sure they modeled this one after a hentai drawing of that cute little dragon-girl they use on their logo. I didn’t think they made these anymore!”</i>");
			output("\n\nFor the moment, you choose not to question how - or why - Anno got her hands on a vintage robot sex-toy.");
			output("\n\n<i>“So, what do you want me to do with this naughty wyvern-dick, hmm?”</i> she teases, running one of her perfectly-formed digits along the blue-hued shaft. <i>“Maybe bend you over a hay bale and take you for a ride?”</i>");
		}
		//Neutral Gigi
		else if(giannaPersonality() >= 30)
		{
			output("\n\n<i>“Oh wow, that’s one of those old Fantasy Monster cocks, right? Kiha used to have a whole line of ‘em, way back when.”</i> She giggles and bounds over, running one of her perfectly-formed alabaster fingers along the blue shaft. <i>“Well, on a planet full of beast-dicks, this one sure manages to stand out, huh? Of course, you’re not giving me a big, expensive, vintage dragon dick just to let me show off to all the other cows, are you?”</i>");
			output("\n\nGiving you a mischievous wink, Gianna asks, <i>“So, wanna see what this monster can do? I bet I can fulfill all sorts of fantasies with it...”</i>");
		}
		//Shit-tier Sub Droid
		else
		{
			output("\n\nGianna looks up, not quite meeting your eyes, but you think you see a flicker of happiness across her servile features. <i>“Th-thank you, [pc.master]. That’s a very old model... I don’t think they make them anymore. You must have spent a fortune on it. More than I’m worth, for sure.”</i>");
			output("\n\nYou don’t think she means her value in credits.");
			output("\n\n<i>“It looks amazing,”</i> she says, realizing you aren’t responding to her meek comments. <i>“Did you want me to try it out... on you? Or would you rather just watch it bounce around and squirt on the ground when you fuck me?”</i>");
		}
	} 
	//NORMACOCK
	else
	{
		//Positive
		if(giannaPersonality() >= 70) output("\n\n<i>“Ohhh, you got me a terran-style futa cock? My my, someone likes a little dick on their chick, don’t they?”</i> Gianna takes the artificial tool and wiggles it in your direction. <i>“Oh, I bet you want me to fuck you with this, don’t you?”</i> A coquettish grin slowly spreads across her face. <i>“Or maybe you want me to ram it down your throat?”</i>");
		//Neutral
		else if(giannaPersonality() >= 30) output("\n\n<i>“Omigod, really? I never thought I’d get a terran dick like this. It’s even a pretty decent size. I wonder if Zephyr would be jealous to have some competition around here. She’d probably break her desk in half rage-fucking me if I waved it under her nose.”</i> Gianna grins mischievously while looking over the phallic present. <i>“...but you wouldn’t give this to me just make her jealous, would you? Do you want me to use this on you?”</i>");
		//Submissive
		else output("\n\nGianna actually looks up at you when you offer it to her. Her luminous eyes are dim and flickering, full of unspoken emotion. <i>“T-thank you, [pc.master]. I never thought I’d get to have such a lovely penis. It’s beautiful.”</i> She spins it in her hands, scanning it for defects. <i>“Perfect. Did... did you want me to use this on you, or just watch it squirt while you make use of my chassis?”</i>");
	}
	//merge
	output("\n\nYou fumble for a response, but Gianna is no longer talking to you. She’s already starting the process of installing her gift. A small line in the synthflesh above her crotch opens up. She presses down just below the rift. It audibly clicks, then pops outward, revealing gleaming composites wet with residual silicone. Something inside her opened crotch compartment hisses and snaps, then Gianna lifts out a small component containing ");
	if(!gianna.hasCock()) output("her clit and its clitoral hood");
	else output("her previously equipped tool");
	output(", still moist with lubrication from internals.");
	output("\n\nGently setting her disembodied ");
	if(!gianna.hasCock()) output("clit");
	else output("old cock");
	output(" on a nearby piece of equipment, she brings her new phallus into position, gently pushing its built-in silicone reservoir inside the opening she’s created in her body. After a little wiggling, she brings the ");
	if(arg == "hoss") output("extra large-sized sheath down into the vacant slot");
	else output("cocksheath down into the vacant slot");
	output(", causing her flexible vagina to distend and reshape to accommodate the ");
	if(arg == "hoss" || arg == "dragon") output("bestial");
	else output("less than feminine");
	output(" girth. Something clicks, and Gianna sighs in relief or pleasure before closing her abdominal compartment.");
	output("\n\n<i>“There we go! I’ve got ");
	if(arg == "hoss") output("a big horse-cock");
	else if(arg == "dragon") output("a big, bestial dragon-dick");
	else output("a decent-sized terran cock");
	output(", just like you wanted!”</i> She wiggles excitedly and says, <i>“Watch this!”</i>");

	//Hosscawk
	if(arg == "hoss")
	{
		output("\n\nThe darkened sheath that was once her clitoral hood bulges, revealing the rubbery-looking flesh of a very swollen flare. It pushes through her inky lips with deliberate slowness, followed by the pillar of her veiny shaft. Even now, you can see the faux circulatory system bulge and pulse as it circulates heated silicone in place of blood. It seems to take forever, but in reality, no more than ten seconds have passed. She strokes it once, squeezing a bead of lubricant from its blunt head before allowing it to soften once more. It retreats into its dusky hood with almost alarming rapidity, leaving her looking like a girl with little more than an over-sized clit-hoot once more.");
	}
	else if(arg == "dragon")
	{
		output("\n\nThe vibrant sheath bulges with a rush of steamy fluids, revealing the growing, rubbery length of her draconic member and its tendril-crested crown. It pushes through her inky lips with deliberate slowness, followed by the pillar of her veiny shaft. Even now, you can see the faux circulatory system bulge and pulse as it circulates heated silicone in place of blood. It seems to take forever, but in reality, no more than ten seconds have passed. She starts to stroke it, slowly at first, caressing her tendril-crowned cockhead until a thick bead of moisture crests its top.");
		output("\n\n<i>“O-oh wow,”</i> Gianna purrs, fluttering her eyes. <i>“These little feelers are </i>so<i> sensitive! I-I’m gonna... gonna...”</i>");
		output("\n\nYou have just enough time to step out of the way before the over-eager android strokes herself all the way off, moaning and bucking her hips as a streak of cum squirts out. It’s not the powerful, bestial orgasm you were expecting from such a huge rod, though: her cum dribbles out around her fingers and splatters onto the hay-coated barn floor, leaving a sticky streak in its wake that she makes a very blatant show of cleaning up.");
		output("\n\nYou don’t think you could have ever described a huge cock’s orgasm as dainty before.");
		output("\n\n<i>“Oh, I can’t wait to use this with you!”</i> she giggles, flushing her creamy skin a little darker as she laps up the last traces of her first orgasm.");
	}
	//Normal Futa?
	else output("\n\nA half-hard length of pink-hued synthflesh dangles from her clitoral hood, modelled in the shape of a girthy penis. While soft, it’s a floppy four inches. When it gets hard, she can sport up to ten inches of silicone-inflated girlmeat. The android is more than happy to give you a demonstration, going from soft to raging tumescence in the span of ten seconds, ending her demonstration by allowing bubbles of warm lubricant to roll out of its head unimpeded, drawn from her inner reservoirs. She goes soft just as quickly.");
	output("\n\n<i>“That... that’s awesome,”</i> you answer whilst trying not to blush");
	if(pc.hasFur() || pc.hasScales())
	{
		output(", grateful for your covering of ");
		if(pc.hasFur()) output("fur");
		else output("scales");
	}
	output(".\n\nGianna giggles and snatches up her old equipment from where she set it down. <i>“Let me go put this away, and we’ll do something else, okay?”</i>");
	output("\n\nYou’d be hard pressed not to smile back. <i>“Sure");
	if(!pc.isAss() && !pc.isBro()) output(" thing");
	output(".”</i>");
	output("\n\nThe lusty android ");
	if(pc.tallness >= 76) output("leans up on her tip-toes");
	else if(pc.tallness >= 60) output("leans over");
	else output("leans down");
	output(" and plants a kiss on your cheek before disappearing around a corner to put away her old equipment");
	if(arg == "humancock") output(", her new cock flopping between her pale thighs");
	output(".");

	processTime(4);
	giannaCrotchTF(arg);

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function giannaHasSwapPieces():Boolean
{
	return (flags["GIANNA_HAS_DRAGON_COCK"] != undefined || flags["GIANNA_HAS_HUMAN_COCK"] != undefined || flags["GIANNA_HAS_HORSE_COCK"] != undefined);
}

public function giannaCrotchTF(arg:String = "clit"):void
{
	//Eat cock and set it up
	if(gianna.hasCock()) gianna.removeCocks();
	if(arg == "hoss")
	{
		if(flags["GIANNA_HAS_HORSE_COCK"] == undefined)
		{
			flags["GIANNA_HAS_HORSE_COCK"] = 1;
			pc.destroyItemByClass(AHCock);
		}
		gianna.createCock(14,1.3);
		gianna.shiftCock(0,GLOBAL.TYPE_EQUINE);
		gianna.cocks[0].cockColor = "black";
	}
	if(arg == "humancock")
	{
		if(flags["GIANNA_HAS_HUMAN_COCK"] == undefined)
		{
			flags["GIANNA_HAS_HUMAN_COCK"] = 1;
			pc.destroyItemByClass(ACock);
		}
		gianna.createCock(10,1.1);
		gianna.cocks[0].cockColor = "pink";
	}
	if(arg == "dragon")
	{
		if(flags["GIANNA_HAS_DRAGON_COCK"] == undefined)
		{
			flags["GIANNA_HAS_DRAGON_COCK"] = 1;
			pc.destroyItemByClass(ADCock);
		}
		gianna.createCock(10,1.1);
		gianna.shiftCock(0,GLOBAL.TYPE_DRACONIC);
		gianna.cocks[0].cockColor = "bluish purple";
	}
	if(arg == "clit")
	{
		/* Nada */
	}
}

//Hot-swap
public function hotswapGiannaButts():void
{
	clearOutput();
	giannaDisplay();
	output("What do you want to change with Gianna’s hot-swappable genitals? Your choices are limited by what you have given her.");
	clearMenu();
	if(gianna.hasCock()) addButton(0,"Normal",hotSwapSomethingWithGianna,"clit","Normal","Have Gianna switch her vagina back to normal, with a standard clit and everything.");
	else addDisabledButton(0, "Normal", "Normal", "Gianna’s crotch is already at its default configuration.");
	
	if(flags["GIANNA_HAS_HUMAN_COCK"] != undefined)
	{
		if(gianna.hasCock(GLOBAL.TYPE_HUMAN)) addDisabledButton(1,"TerranCock","Terran Cock","Gianna already has that type of penis equipped.");
		else addButton(1,"TerranCock",hotSwapSomethingWithGianna,"humancock","Terran Cock","Have Gianna equip her human-style cock.");
	}
	else addDisabledButton(1, "Locked", "Locked", "Gianna does not have this item yet.");
	
	if(flags["GIANNA_HAS_HORSE_COCK"] != undefined)
	{
		if(gianna.hasCock(GLOBAL.TYPE_EQUINE)) addDisabledButton(2,"HorseCock","Horse Cock","Gianna already has that type of penis equipped.");
		else addButton(2,"HorseCock",hotSwapSomethingWithGianna,"hoss","Horse Cock","Have Gianna equip her equine cock.");
	}
	else addDisabledButton(2, "Locked", "Locked", "Gianna does not have this item yet.");
	
	if(flags["GIANNA_HAS_DRAGON_COCK"] != undefined)
	{
		if(gianna.hasCock(GLOBAL.TYPE_DRACONIC)) addDisabledButton(3,"Drgn.Cock","Dragon Cock","Gianna already has that type of penis equipped.");
		else addButton(3,"Drgn.Cock",hotSwapSomethingWithGianna,"dragon","Dragon Cock","Have Gianna equip her dragon cock.");
	}
	else addDisabledButton(3, "Locked", "Locked", "Gianna does not have this item yet.");
	
	addButton(14,"Back",giannaMenu);
}

//Hotswap Text
public function hotSwapSomethingWithGianna(arg:String = "clit"):void
{
	clearOutput();
	giannaDisplay();
	output("You tell the sultry android that you’d like her to get a different genital setup on.");
	//Perky/Dommy!
	if(giannaPersonality() >= 70) output("\n\n<i>“Awww, I was just getting used to having that setup!”</i> Gianna pouts at you. <i>“Well you’d better make use of the new equipment, then!... Unless you just like making me dress up my crotch all sexy for you, you kinky [pc.boy] you!”</i>");
	//Normal
	else if(giannaPersonality() >= 30) output("\n\n<i>“Ohh, that’s way less fun than I thought we’d be having, but if you think I’d look better that way, who am I to judge.”</i> Gianna openly fondles herself, sighing blissfully until you cough to get her attention. <i>“Sorry,”</i> she sheepishly admits, <i>“I was just saying bye to the old parts!”</i>");
	//Subby
	else output("\n\nGianna nods. <i>“If that’s what you’d like, I’ll be happy to configure myself that way. One moment please.”</i>");
	//Merge
	output("\n\nThe white-skinned beauty departs with a sensuous wiggle of her [gianna.butt], heading off to her collection of spare parts in order to install the requested bits.\n\nWhen she returns, Gianna is blushing heavily and equipped to your specifications. What now?");
	processTime(13);
	giannaCrotchTF(arg);
	giannaMenu();
}


//Futa!Gigi Fucks Your Butt
//Any Gigicock. Any PC genital configuration. 
//Ask your futafied lover to pound your ass with her synth-dick. 
public function getButtReamedByFutaGigi():void
{
	clearOutput();
	giannaDisplay();
	author("Savin");
	output("<i>“So, how about putting that [gianna.cockNoun] to use?”</i> you ask, reaching out to caress the [gianna.cock] resting between your gynoid lover’s statuesque legs. The artificial cock stiffens at your touch");
	if(gianna.hasSheath(0)) output(", starting to poke out of its sheath");
	output(". Her body trembles at your touch, and one of her hands reaches up to cup one of her [gianna.chest].");
	//if PosititiveGigi:
	if(giannaPersonality() >= 70) output("\n\n<i>“Oh, I’ve been waiting for you to ask,”</i> Gianna coos, pressing herself a little closer to you - enough that her big, beautiful tits squeeze against your [pc.chest]. <i>“That’s why you gave me this beauty, right? You like your girls with a little spice!”</i>");
	//if NeutralGigi:
	else if(giannaPersonality() >= 30) output("\n\n<i>“Like, totally!”</i> Gianna beams, pressing herself up against you - close enough that you can feel her hardening cock against you, stiffening as your hand gently caresses it.");
	//If SubShitGigi:
	else output("\n\n<i>“I-if that’s what you want,”</i> Gianna murmurs, eyeing her meaty girl-dick. <i>“You must have spent a fortune on this thing. I’ll try and give you your money’s worth, [pc.master].”</i>");
	output("\n\nThat’s what you like to hear. Gianna motions you towards a side room in the bar so the two of you can have a little privacy. You can see her grow more excited - and a little more jiggly - with every step. She’s practically bouncing with anticipation by the time you close and lock the door behind you, and her synthetic erection is hanging down at full mast between her ");
	if(gianna.buttRating() >= 20) output("plump ");
	else if(gianna.buttRating() >= 15) output("thick ");
	else output("slender ");
	output("thighs. She spins around on a heel when you click the lock down, planting her [gianna.butt] on the edge of the shiny metal table on the far side.");

	output("\n\n<i>“I’m still pretty new to fucking like this,”</i> Gianna admits. ");
	if(giannaPersonality() >= 70) output("<i>“But I think I’ve got a pretty good sense of what you want. A nice, big, lady-dick right up the ass, huh?”</i>");
	else output("<i>“So, how do you want it?”</i>");
	output("\n\nYou lick your lips and sashay over to the hung gynoid. She leans back, shifting her weight onto her arms and spreads her legs, giving you a perfect view of her [gianna.cock]. One of her alabaster hands wraps around her girthy shaft, stroking it enticingly.");
	if(giannaPersonality() <= 30) output("\n\n<i>“D-do you want to lube me up yourself, [pc.master]?”</i> she inquires meekly, chewing on a [gianna.lip].");
	else output("\n\n<i>“Why don’t you, like, come on over and lube me up?”</i> she purrs sweetly, using a finger to rub a bit of synthetic pre from her cockhead. <i>“I’ve got pre and pussy-juice... not to mention your mouth... to choose from.”</i>");

	output("\n\nYou suppose you should make sure her dick’s nice and wet before the two of you get too involved. Pulling off your [pc.gear] as you go, you sashay over towards the alluring gynoid and slip down between her legs to admire the turgid length of her [gianna.cock]. The alabaster sex-bot coos and circles a finger around her [gianna.cockHead], smearing around a droplet of pre until her crown glistens with moisture. You have to admit, that synth-schlong you bought looks absolutely delicious mounted on your synthetic lover.");
	output("\n\nThe sight of Gianna’s cock throbbing and drooling pre entices you into opening wide, letting your [pc.tongue] caress the girthy underside of her [gianna.cock]. It’s surprisingly ");
	if(flags["GIANNA_TEMP"] == 1) output("hot, mimicking the over-acting temperature of your robotic partner");
	else if(flags["GIANNA_TEMP"] == -1) output("cold, almost frigid, just like the robotic beauty it’s attached to");
	else output("lifelike, in the same way Gianna herself is now that it’s attached. If it weren’t for the vaguely plastic-like texture you feel, not altogether unlike a dildo, you’d be sure you’re dealing with a real [gianna.cock]");
	output(". One of your hands caresses Gianna’s twat, running through the well-lubed channel between her lips, and then wraps around the base of her prick.");

	output("\n\n<i>“Oooh!”</i> Gianna moans the moment you grab her shaft. <i>“Oh, that’s sensitive! ");
	if(pc.hasCock()) output("I can see why you love that [pc.cock] of yours! It’s nothing like getting my pussy played with....");
	else 
	{
		output("I wish you could feel what I’m feeling....");
		if(giannaPersonality() >= 70) output(" Maybe when we’re done, I should see about finding you a [gianna.cock] of your own.");
	}
	output("”</i> You grin up at the gynoid beauty and start to work your way upwards, licking and stroking your way along her [gianna.cock]. You lavish every inch of synth-flesh as you go, leaving a trail of slick spit and quivering cock in your wake, all the way up to her [gianna.cockHead].");
	output("\n\nWhen your [pc.tongue] finds Gianna’s synthetic cumslit, the cream-pale beauty arches her back with an exaggerated moan of pleasure and her cock squirts a nice, thick dollop of creamy fluid right onto the tip of your [pc.tongue]. She cups one of her [gianna.tits] and chews on a [gianna.lip], You lock eyes with her, give her a wink, and wrap your [pc.lips] around her cockhead. Gianna’s cock is nice and meaty, making you open wide to try and take her.");
	//if Dom!Gigi: 
	if(giannaPersonality() >= 70) output("\n\n<i>“You look sooo hot choking on my dick,”</i> Gianna teases as you go down on her tumescent artificial erection.");
	else if(giannaPersonality() >= 30) output("\n\n<i>“Do you, like, like my cock?”</i> Gianna giggles, watching you slide down her tumescent artificial erection. <i>“You sure look like it!”</i>");
	else output("\n\n<i>“D-do you like my cock that much?”</i> Gianna swoons, eyes wide as you slide down her tumescent artificial erection. Her creamy cheeks darken a bit, and you’re only half-certain that she murmurs after that, <i>“I’m glad...”</i>");
	
	output("\n\nHer hand strokes your [pc.hair], gently urging you down the length of her prick until your ");
	if(gianna.cocks[0].cType == GLOBAL.TYPE_EQUINE || gianna.cocks[0].cType == GLOBAL.TYPE_DRACONIC) output("throat is bulging around her animalistic shaft");
	else output("[pc.lips] are pressing against her crotch, and your [pc.tongue] is able to flick out to lap at the slit of her twat hidden under the throbbing shaft of synth-flesh that’s stretching your mouth out");
	output(". Every throb and twitch of her cock makes you more and more eager to feel its synthetic girth ramming into your [pc.asshole]. You’re sure to cover every inch you can with a nice, thick coat of spittle. The more you lavish attention on Gianna’s cock, though, the more of her thick, gooey lube she squirts into your mouth, filling you with its entirely inhuman taste.");
	output("\n\nYou pull your mouth back, popping her wet shaft out and letting the steady stream of pre-like lube drool down her length and around your fingers, using your pumping hand to massage it in all over her. Gianna groans and shivers, looking like she’s halfway to orgasm already. For now, though, you’re satisfied with your lube-job - enough that you’re willing to get up and present your [pc.butt] to your gynoid lover.");
	output("\n\nLooking over your shoulder, you can see a big smile spread out over her [gianna.lips], her eyes locked on the ass on offer. <i>“You’ve got a great butt, ");
	if(giannaPersonality() > 30) output("[pc.name]");
	else output("[pc.master]");
	output(",”</i> she says matter-of-factly, reaching out to caress one of your cheeks. In one fluid motion, the curvaceous gynoid grabs hold of your waist and pulls you down onto her turgid cock, right until your [pc.asshole] is pressed flush against her [gianna.cockHead]. Your eyes go wide, and your body shudders at the feeling of her well-lubed crown pressing against your ass, just on the verge of penetration.");
	output("\n\n<i>“This is what you wanted, right?”</i> Gianna murmurs, at once stroking your behind and slowly guiding you down her rod. <i>“You were thinking about this moment when you first bought me a cock. You must want it so much.”</i>");
	//if PC has a cock:
	if(pc.hasCock())
	{
		output("\n\nYou couldn’t hide your arousal if you wanted to. [pc.EachCock] is hard as diamonds, bobbing with its own tumescent weight with every motion Gianna forces on you. She giggles, finally noticing your untouched manhood, and reaches around to caress it. Your body tenses at her touch, and you can’t help but moan when her soft, ");
		if(flags["GIANNA_TEMP"] == 0) output("warm");
		else if(flags["GIANNA_TEMP"] == -1) output("cold");
		else output("hot");
		output(" fingers wrap around your shaft and gently stroke you while she lowers you onto her own [gianna.cock].");
	}
	output("\n\nGritting your teeth and relaxing your ass as best as you can, you brace yourself for what’s about to come. Gianna helps, caressing and stroking you, trying to relax you until the tension bleeds away, and your [pc.asshole] loosens enough for the crown of your lover’s [gianna.cock] to start gliding into you, helped along more than a little by its glaze of lube and spit. You moan, arching your back into the agonizingly slow penetration, letting yourself slide down the haft of Gianna’s synth-dick. She’s nice and thick, stretching you out inch by inch as you’re stuffed with gynoid cockmeat.");
	pc.buttChange(gianna.cockVolume(0),true,true,false);

	output("\n\nIt’s a blissful eternity before you’re sitting on Gianna’s lap, head resting back against her [gianna.breasts] and gut bulging with the sheer mass of dick. You find yourself gasping for breath, trying to adjust to the ass-straining you’re getting... and the feeling of your [pc.belly] bulging with synth-cock. Gianna moans and runs her hands all over you, cock twitching and squirting thick gouts of lube deep into your [pc.asshole]. At least when you start moving, it’ll be nice and easy...");
	//if SubGi: 
	if(giannaPersonality() < 30) output("\n\n<i>“Do you want to take charge, [pc.master]?”</i> Gianna murmurs between cock-twitches. <i>“I’m still not comfortable with my dick yet.”</i>");
	else output("\n\n<i>“Why don’t you, like, start moving babe?”</i> Gianna murmurs, squeezing your [pc.butt]. <i>“I wanna feel you bouncing on my cock!”</i>");

	output("\n\nYou give Gianna a wink over your shoulder and start to move. From your position in the gynoid’s lap, it’s easy to hook your [pc.legs] over Gianna’s and start rising along her gut-straining shaft. Her schlong seems to just slide out of you, slathered with lube as it is. Pleasure shudders through you in waves as her [gianna.cock] glides through your anal passage");
	if(pc.hasCock()) output(" and massages your prostate. Your cock bobs with every inch you move, starting to bead with its own pre");
	output(". Your lover’s hands guide your movements, helping to heft you up... only to pull you back down again.");

	output("\n\nYou work your way up to a steady rhythm, bouncing in your lover’s lap to the echoing temp of creamy synth-flesh slapping wetly against [pc.skinFurScales]. Moans mix with the sultry sounds of sex, your voice mixing with Gianna’s as your ass is hammered by the throbbing mass of your gynoid lover’s [gianna.cock]. The more you move, the thicker her cock seems inside you, and the more lube-pre she unloads into your bowels. You’re not sure you could even tell when she cums, the way she’s spraying the stuff into you.");
	output("\n\nOne thing’s for sure, though: you’re getting close already. The wet thickness stretching your ass to the limit, the feeling of Gianna’s length gliding into you again and again, has you rocketing towards climax like a starship gunning its lightdrive. All you can do is move faster, fuck harder, squeezing your ass hard around your lover’s cock to milk out every drop of her creamy lube.");
	output("\n\n<i>“Oh sh-”</i> Gianna yelps, and suddenly you’re flooded with a ");
	if(flags["GIANNA_TEMP"] == -1) output("ice-cold");
	else if(flags["GIANNA_TEMP"] == 1) output("burning hot");
	else output("warm");
	output(" wetness geysering out of her [gianna.cock]. Your lover pulls you back against her, mashing your head into her [gianna.boobs] and your ass down to the hilt of her spasming cock. That sudden rush, the sudden fullness straining your [pc.belly], is enough to push you over the edge with her, tearing a scream of ecstasy from your lips as you go. Gianna’s hips buck against you, short and jerky thrusts that batter your butthole as she rides out her own orgasm.");

	output("\n\nWhen your lover’s trembling movements come to an end, you’re left rocking gently in Gianna’s lap, your hands and hers running across your lube-bloated [pc.belly]. <i>“How was that?”</i> Gianna coos, trailing kisses along the back of your shoulders. <i>“Everything you hoped for, I hope.”</i>");
	output("\n\nYou tell your lover that it most certainly was, and start to slowly pull yourself off of her softening shaft. When you pop off, it’s like a dam breaking: a flood of Gianna’s lube-cum squirts out of your well-fucked behind, drooling onto the hay-coated flood. On unsteady [pc.legs], you wobble over to where you left your [pc.gear] and start to dress yourself. Gianna watches you with a smile on her black lips, cleaning her cock off with a towel hanging nearby.");
	output("\n\n<i>“We’ll have to do that again sometime,”</i> you say, giving her a wink over your shoulder as you head back to the main room.");

	processTime(20+rand(11));
	pc.orgasm();
	pc.loadInAss(gianna);
	pc.maxOutCumflation("ass", gianna);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Approach
public function approachAnnoXXXGianna():void
{
	clearOutput();
	showName("ANNO\&GIANNA");
	showBust(annoBustDisplay(),giannaBustDisplay());
	output("Neither Anno nor Gianna notice your approach, not even when you’re right behind them.");
	if(flags["GIANNA_X_ANNO_3SUM"] == undefined)
	{
		output("\n\n<i>“You should’ve gotten [pc.himHer] from the ship.”</i> Gianna’s voice warbles with uncertainty.");
		output("\n\nAnno plays with the android’s ponytail, flicking it back and forth. <i>“[pc.HeShe]’s a busy [pc.manWoman]. Besides, while the boss is away, the girls can play.”</i> She runs her arms down Gianna’s flawless, exposed skin, leaning her lips up to one synthetic ear. <i>“Did I tell you that I’m a squirter?”</i>");
	}
	else
	{
		output("\n\n<i>“You should’ve gotten [pc.himHer] from the ship.”</i> Gianna’s voice warbles with eagerness. <i>“Some things deserve to be shared...”</i>.");
		output("\n\nAnno plays with the android’s ponytail, flicking it back and forth. <i>“[pc.HeShe]’s a busy [pc.manWoman]. Besides, while the boss is away, the girls can play.”</i> She runs her arms down Gianna’s flawless, exposed skin, leaning her lips up to one synthetic ear. <i>“I bet your tongue can make me squirt just as hard as [pc.hisHer] dick.”</i>");
	}
	output("\n\nYou could get their attention and join in, or leave and let them have a little girl on girl time in peace. What do you do?");
	processTime(1);
	
	giannaAWOL(50 + rand(11));
	pc.createStatusEffect("Anno X Gianna Cooldown", 0, 0, 0, 0, true, "", "", false, 720);
	
	clearMenu();
	//[Cough] [Leave]
	addButton(0,"Cough",coughAtAnnoXGianna);
	addButton(1,"Leave",leaveAnnoXGianna);
}

public function leaveAnnoXGianna():void
{
	clearOutput();
	showName("ANNO\n& GIANNA");
	showBust(annoBustDisplay(),giannaBustDisplay());
	output("You stay silent as the two girls head into a stall. Gianna’s in for some fun.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cough
public function coughAtAnnoXGianna():void
{
	clearOutput();
	showName("ANNO\n& GIANNA");
	showBust(annoBustDisplay(),giannaBustDisplay());
	var x:int = pc.cockThatFits(anno.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("You clear your throat.");
	output("\n\nAnno spins around, her lusty look displaced by a guilty grimace. <i>“Hiiiii Boss!”</i> A fluffy arm slips around your shoulder. Gianna is squeezed into the other. <i>“We were just talking about you. Guess I’m not the only girl to fall prey to your charms. This lovely honey is so keen on you she all but insisted we invite you.”</i> Her ears flick playfully. <i>“You saved us the trouble of a call.”</i>");
	output("\n\nGianna ");
	if(giannaPersonality() < 33) output("averts her gaze while simultaneously arching her back to better display her [gianna.chest]. <i>“I’m available, if you’d like.”</i>");
	else if(giannaPersonality() < 66) output("looks longingly between the two of you. <i>“Can we? Please?”</i>");
	else output("flashes a saucy smile, her [gianna.lips] glistening enticingly. <i>“You know you’re thinking about it.”</i> She rubs one of her nipples, making the inky pigment strobe an eye-catching luminescent pink. <i>“We both know you like what you see.”</i>");

	output("\n\nYou lean into the embrace. <i>“");
	if(pc.isBimbo()) output("Fuck yeah! Let’s go in that stall!”</i> You impishly point one out, and Anno is all too happy lead the giggling hussy brigade inside.");
	else output("Let’s go.”</i> You point out the nearest empty stall, and the lusty pair is all too happy to pile on in.");

	//[Next]
	processTime(2);
	pc.changeLust(3);
	clearMenu();
	addButton(0,"Next",giannaXAnnoThreesomeGo, x);
}

public function giannaXAnnoThreesomeGo(x:int):void
{
	rooms["512"].removeFlag(GLOBAL.NPC);
	currentLocation = "STALL EAST";
	rooms[currentLocation].addFlag(GLOBAL.NPC);
	generateMap();
	
	clearOutput();
	showName("ANNO\n& GIANNA");
	showBust(annoBustDisplay(true),giannaBustDisplay());
	
	output("The moment the door closes behind you, Anno is on Gianna, kissing her hard, bearing her into the wall. The synthetic companion squeaks cutely, slamming hard into the rustic, wood-panelled wall before sliding down to the bench.");
	if(gianna.buttRating() >= 15) output(" Her silicone-packed ass distends beneath the weight of two eager girls, creating half-moons that protrude out to either side.");
	output(" Savage ausar muscle collides with a well-engineered simulacrum, slurping wetly. A throaty sound of passion squeezes from the corners of their locked lips, followed by wet smacking and near-orgasmic moans from Gianna.");
	//Clothed
	if(!pc.isCrotchExposed())
	{
		output("\n\nSlender digits probe into your [pc.crotchCover]. Somehow Gianna is able to continue to kissing, eyes closed, while expertly removing every barrier between herself and your crotch. Those fingers don’t just strip away garments either: they caress. They squeeze. They fondle [pc.oneCock]");
		if(pc.lust() >= 66) output(", lovely hard rod that it is.");
		else output(", feeding it the pleasure it needs to grow to a full, tumescent stiffness.");
	}
	//Unclothed
	else
	{
		output("\n\nSlender digits abruptly encircle [pc.oneCock] and stroke. Somehow Gianna is able to continue kissing, eyes closed, all while effortlessly giving you the beginnings of a handjob. She caresses. She squeezes. She lovingly fondles your [pc.cockNoun " + x + "]");
		if(pc.lust() < 66) output(" until it is in a fully erect state");
		output(".");
	}
	//Merge - no new paragraph:
	output(" You could probably cum like this, in time, wallowing in the silk-smooth touches, letting her stroke you until your nerves overload and you nut all over the sex-droid’s slippery palms.");
	output("\n\nHowever, you don’t get the chance, because Gianna rolls Anno onto the milking bench. The shocked ausar barely manages to reach for Gianna’s tits before her jumpsuit is unzipped from head to toe. It peels away from her dewy mound with a whimper from the slutty pup. She wriggles in excitement, legs spreading on their own.");
	output("\n\nAnno gasps, <i>“F-fuck they move fast on New Texas.”</i>");
	output("\n\n<i>“Only because you want this, Anno,”</i> Gianna answers, explaining, <i>“You said as much, though your body does most of the talking. My time on New Texas has made me quite adept at picking up on nonverbal cues.”</i> The android’s fingers slip inside the sodden puppy. <i>“Your skin is flushed");
	if(giannaPersonality() < 50) output(" in a manner consistent with arousal, not shame");
	else output(" brighter than a galotian whore");
	output(".”</i> She spreads her fingers to stretch Anno wide, just as the ausar likes it. <i>“Your pupils are dilated");
	if(giannaPersonality() >= 75) output(" like a slut seeing her first dick");
	output(".”</i> An alabaster thumb dances in circles over a pinkish clit. <i>“And most importantly you’re wet enough to take half the bulls on the planet... or [pc.name].”</i>");

	output("\n\nAnno whimpers, hips grinding back against Gianna’s palm. <i>“B-boss,”</i> she whimpers, <i>“Do something. Ah~!”</i> A full-body shudder wracks her. <i>“I d-don’t want to cum yet.”</i>");
	output("\n\nWatching those fingers slip in and out... and in and out over and over, you cannot help but feel a touch jealous. Your [pc.cock " + x + "] wants inside the horned-up ausar, bad, and Gianna’s incessant stroking of your erection and Anno alike has only worsened the devilish cravings.");
	output("\n\nFortunately Gianna seems to be on the same page as you. She nods her head slightly, cooing, <i>“");
	if(giannaPersonality() < 65) output("Allow me to roll out the red carpet for you.");
	else output("Let me see how wet we can make this puppy first.”</i> She rubs small circles beneath your glans, the rest of her fingers squeezing you tight. <i>“You deserve the wettest, cummiest boxes to bring yourself off in.");
	output("”</i>");
	output("\n\nThe excited android frees her fingers with a wet-sounding ‘schluck’ and adjusts herself so her face is poised directly over Anno’s enflamed pussy, lips still slightly spread. The white-furred ausar’s thighs are already soaked with arousal - so wet that when Gianna lowers her face into the soaked box, her face acquires a gleaming, slut-soaked sheen. Her inky oral organ thrusts deep. You can hear it as much as see it. Its passage deep into the pliant puppy is marked in the way Anno whimpers and squirms, abdominals clenching and spasming.");
	output("\n\nTrickles of feminine lubricant slowly drip from the side of the overloaded milking bench. Gianna’s tugs soon pull you into it, basting your dick in the waterfall of girlcum in between strokes. She massages it into your skin, fingers working every crease and crevice of excited cockflesh until it is absolutely drenched in Anno’s excited ejaculate.");
	var cumQ:Number = pc.cumQ();
	if(cumQ >= 1000) output(" You drip your own pre like a faucet. Carelessly, the android mixes that into the sexual melange until you aren’t sure how much of the nerve-stimulating slickness is your own and how much belongs to your fluffy puppy.");
	else if(cumQ >= 10) output(" You leak a little bit of pre, and Gianna is not at all shy about gathering it to dilute into Anno’s overwhelmingly sloppy contributions.");
	output(" Her fist slaps wetly against your crotch. If she were to pull her fingers away, webs of wetness would connect it.");
	output("\n\nYou grab hold of Gianna’s [gianna.butt] and squeeze in desperation, holding on to anything as the pleasure builds inside you. It sloshes back inside you to the rhythm of the android’s cock-milking hand, like every stroke is adding more and more kinetic energy to the fluid-filled reservoir until it is ready to spill over the lip of your restraint.");
	if(pc.isBimbo()) output(" Yay!");
	else if(pc.isBro()) output(" The girl gives a decent handjob. Would be better if she produced some pheromones though, like Anno.");
	output(" She never takes you to that point, however. Gianna manipulates you with inhuman precision until you feel almost desperate to fuck somebody, anybody.");
	output("\n\nAnno is in a similar state. She arches her back and rolls her hips against Gianna’s face again and again, trying to stimulate herself by friction alone, but the android moves with her, never giving the aroused ausar any more than she means to. Her tongue slithers around, but it’s slower now, designed to tease rather than to please. Gianna’s eyes sparkle with delight, the blue casting over the room, deriving her own pleasure from what she’s doing to you. Her thighs are glossy, you realize. You could slip out of her massaging fingertips and fuck her.");
	output("\n\nIt’d be easiest thing in the universe.");
	output("\n\nPerhaps sensing this, Gianna releases you both simultaneously. She straightens, hands and face completely soaked. <i>“");
	if(giannaPersonality() < 33) output("She’s ready for you.");
	else if(giannaPersonality() < 66) output("Go get her, champ.");
	else output("Fuck her, " + pc.mf("stud","slut") + ". Fuck her so hard.");
	output("”</i>");
	output("\n\nAnno looks back over her shoulder in desperation, spreading her legs as wide as they’ll go. <i>“B-b-boss? Puh-please!”</i>");
	processTime(20);
	pc.changeLust(500);
	clearMenu();
	addButton(0,"Next",giannaXAnnoThreesomeGo2, x);
}

public function giannaXAnnoThreesomeGo2(x:int):void
{
	clearOutput();
	showName("ANNO\n& GIANNA");
	showBust(annoBustDisplay(true),giannaBustDisplay());
	
	output("You’re on Anno in a flash, [pc.cockNoun " + x + "] delving deep into the ausar’s needy cunny. She is so <i>drenched</i> that it’s like riding into her pussy on a red carpet. Her velvety folds squeeze tight, just like the girl behind them. Her knees lock behind your back to pull you deeper, and her arms fall on your shoulders, sharp-clawed fingers scraping ");
	if(!pc.hasScales()) output("across your [pc.skinFurScales]");
	else output("furrows into your [pc.skin]");
	output(". You grunt with the force of your thrust. Anno tilts her head upward and captures your lips with hers, silencing you with a feverish tongue.");
	pc.cockChange();
	output("\n\nWhen the kiss breaks, she growls, <i>“Harder! Fuck me harder!”</i>");
	output("\n\nYou answer by slamming your pelvis into hers hard enough to make her eyes roll halfway back and her voice cut off into a canine squeak. Pounding this bitch feels <i>good</i>. Her pussy can’t get enough, and neither can you, now that you’ve started really working her over. You take Anno on a first-class trip to poundtown. Pussyjuice squirts over your thighs from how forcefully you penetrate her, but the bitch just eats it up, squirming and gasping, her tail thumping the wall with excited wags.");
	output("\n\nYou fuck her like the animal she is, and she loves it. It’s musky, feral sex. The kind that makes you both break out in sweat. You’re going to smell like puppy pussy for hours when this is over, and you relish it. Your [pc.cockNoun " + x + "] swells inside her, thicker and harder, preparing to disgorge a load of [pc.cum] inside her. Girlcum sprays your middle again and again as Anno climaxes repeatedly, the long denied pleasure scorching through her nerves in bolts of erotic lightning.");
	output("\n\nShe whimpers and begs. Her orgasms seem endless. She even stops squirting after a time, but you can feel her clenching about you as if her body is trying to expel another girlish load over you. Anno grimaces and shakes her head. <i>“Too much!”</i> She pushes on the bench, trying to drag herself away. <i>“Too sensitive!”</i>");
	processTime(6);
	clearMenu();
	addButton(0,"Next",giannaXAnnoThreesomeGo3, x);
}

public function giannaXAnnoThreesomeGo3(x:int):void
{
	clearOutput();
	showName("ANNO\n& GIANNA");
	showBust(annoBustDisplay(true),giannaBustDisplay());
	
	output("It is then that Gianna takes your hand and presses it against her tight, synthetic cunt. She leans over the table next to Anno, offering you a chance to take her doggie-style for dessert after having your fill of missionary with the canine slut. Something seems mismatched about that, but you’re too horny to care. You pull out of the fucked-out pup and thrust yourself into the eager android, burying your ausar-basted bone deep into silken lips of Gianna’s talented nethers. They cup and caress you, stroking you, fluttering over your flesh in ripples that demand you orgasm as soon as possible.");
	output("\n\nGianna moans, but not for long. The exhausted Anno slides over to her, and soon the two hotties are frenching, trading tongues as you satisfy your second quim of the day. There are differences between the two that you’d love to point out, were you not on the edge of exploding. Gianna’s cunt is definitely the more active of the two, but Anno’s has a certain something to it, perhaps the smell, perhaps her pheromones that keep Gianna’s expertly manipulated folds from massaging her out of your brain entirely.");
	output("\n\nThey’re both watching you from the corners of their eyes. Gianna’s twinkle mischievously, and her [gianna.butt] starts twerking against you, rocking and bouncing, the lips dragging tightly along your length. It’s too much, too pleasing to the eye and the dick. Overwhelmed by the erotic might of these two seductresses, you groan and climax, your [pc.cock " + x + "] becoming hypersensitive as Gianna’s synthflesh folds squeeze down on your [pc.cockHead " + x + "].");
	var cumQ:Number = pc.cumQ();
	//No cum!
	if(cumQ < 4) output("\n\nYou feel your [pc.cock " + x + "] flex with the rhythmic force of attempted ejaculations, and Gianna must feel it too, because her eyes flash white with what you can only assume is pleasure. The android shakes beneath you, her kisses suddenly artless. She cums right alongside you until the feeling passes, leaving muted satisfaction and exhaustion in its wake. You slide out of her slippery slit and flop down alongside the two girls, cuddling into soft breasts and post-coital hugs.");
	//Normal jizz
	else if(cumQ < 250) 
	{
		output("\n\nYou feel your [pc.cock " + x + "] flex in rhythmic ejaculation, even some slight trickles along your ");
		if(pc.balls > 0) output("[pc.sack]");
		else output("taint");
		output(" as a little leaks out of Gianna’s slippery slit.. The android shakes and squirms beneath you, her kisses suddenly artless. She’s cumming to the feeling of your orgasm, her pleasure matched in perfect 1 to 1 ratio. When the feeling finally passes, you sag down together, your [pc.cock " + x + "] slipping free with one last shock of heavenly satisfaction.");
		output("\n\nYou flop onto the table alongside the two fucked-out girls, cuddling into soft breasts and post-coital hugs.");
	}
	//Biggo Jizzo
	else
	{
		output("\n\nYou feel your [pc.cock " + x + "] erupting in rhythmic ejaculation, dumping huge loads of [pc.cumVisc] spooge into Gianna’s syrupy slit. Her eyes flash white with what you can only assume is pleasure. Her body shakes and quivers, her kisses suddenly artless. She’s cumming right alongside you, her bliss perfectly synced to yours. You keep basting her perfect pussy for as long as you can, more than long enough for [pc.cumGem] juices to drizzle out of her box in steady streams.");
		output("\n\nWhen you finally pull out, you’re pleased to see Gianna’s cunt absolutely drenched in [pc.cum]. You sit down on the bench, snuggling into the two exhausted beauties and their curvaceous bodies, trading tired kisses and reveling in the post-coital bliss together.");
	}
	//Merge
	processTime(15);
	giannaCumflated(pc, 0);
	pc.orgasm();
	pc.applyPussyDrenched();
	sweatyDebuff(2);
	clearMenu();
	addButton(0,"Next",giannaXAnnoThreesomeGo4, x);
}

public function giannaXAnnoThreesomeGo4(x:int):void
{
	clearOutput();
	showName("ANNO\n& GIANNA");
	showBust(annoBustDisplay(true),giannaBustDisplay());
	
	output("There’s no shower in this stall, so cleanup is a brief affair, one interrupted numerous times by Gianna or Anno offering to clean the fluids from a patch of cum-soaked skin with their tongues.");
	output("\n\nWhen you and Anno leave, she remarks, <i>“We should spend more time on New Texas, Boss. I liked that one.”</i>");
	output("\n\nYou feel inclined to agree.");
	IncrementFlag("GIANNA_X_ANNO_3SUM");
	processTime(2);
	
	rooms[currentLocation].removeFlag(GLOBAL.NPC);
	rooms["512"].addFlag(GLOBAL.NPC);
	currentLocation = "512";
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}