package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.num2Text;
	
	public class NaleenNip extends ItemSlotClass
	{
		//constructor
		public function NaleenNip()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.FOOD;
			//Used on inventory buttons
			this.shortName = "NaleenNip";
			//Regular name
			this.longName = "pouch of naleen nip";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a pouch of naleen nip";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This small pouch has a few dried leaves inside. The codex indicates that they’re locally referred to on Mhen’ga as naleen nip. When chewed by the aliens of the same name, they supposedly introduce a state of mild euphoria. The feline snake-women love them. You’re fairly certain the foreign plant matter <b>will</b> transform you if you chew on it.\n\n<b>Known to cause slight amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			//Information
			this.basePrice = 5;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			var changes:int = 0;
			var changeLimit:int = 1;
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			if(rand(3) == 0) changeLimit++;
			if(rand(3) == 0) changeLimit++;
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter) {
				kGAMECLASS.output("Grabbing the leaves and rolling them together, you pop the half-formed ball into your mouth and start chewing. They have a relatively mild spiciness to them that doesn’t quite compare to any pepper you’ve ever tried, just enough to make your [pc.tongue] tingle a little bit. The longer you chew, the more the leaves dissolve, and the more you salivate, forcing you to swallow some of the mixture. You don’t really get much of a buzz; the euphoric effect must only work on ");
				if(target.race() == "naleen") kGAMECLASS.output("full-blooded ");
				kGAMECLASS.output("naleen.");
				kGAMECLASS.processTime(3);
				target.taint(1);
				
				//Stat TFs
				//Increase libido to 60
				//Decrease intelligence up to 6x maximum with no minimum.
				//Decrease intelligence if above 20
				//Decrease willpower once
				//Decrease willpower if above 25
				//Increase physique to 10

				choices = new Array();
				if(target.hasCock()) choices[choices.length] = dudeNaleenTfs;
				if(target.hasVagina()) choices[choices.length] = chickNaleenTfs;
				while(choices.length > 0) {
					x = rand(choices.length);
					changes = choices[x](target,changes,changeLimit);
					choices.splice(x,1);
				}

				//Generic TFs
				//Naga tail TF - req 6' tall
				if(target.tallness >= 72 && changes < changeLimit && rand(3) == 0 && target.legCount != 1 && target.legType != GLOBAL.TYPE_NAGA)
				{
					if (target.legTypeUnlocked(GLOBAL.TYPE_NAGA))
					{
						//Single leg!
						if(target.legCount == 1) kGAMECLASS.output("\n\nYour [pc.leg] abruptly goes weak, dropping you flat on your [pc.butt], and just in time, by the looks of things. Your lower limb is twisting and writhing");
						//Multileg!
						else kGAMECLASS.output("\n\nYour [pc.legs] abruptly go weak, dropping you flat on your [pc.butt], and just in time by the looks of things. Your lower limbs have knotted together into one fused mass of writhing flesh");
						//Both:
						kGAMECLASS.output(", though all you feel is a slightly achy throb and the occasional twinge of a new bone forming. Over time, the singular extremity becomes longer and longer, tapered down to a pointed tip. It tingles when tiny, iridescent plates emerge to cover it. <b>You’re growing a tail that’s just like a naleen’s!</b> The growing scales even ");
						if(target.hasHair()) kGAMECLASS.output("match your [pc.hair]");
						else kGAMECLASS.output("match the hair you used to have");
						kGAMECLASS.output(".");
						//Naleen scales = hair color as per codex.
						target.scaleColor = target.hairColor;
						target.legCount = 1;
						target.genitalSpot = 0;
						target.clearLegFlags();
						target.addLegFlag(GLOBAL.FLAG_PREHENSILE);
						target.addLegFlag(GLOBAL.FLAG_TAPERED);
						target.addLegFlag(GLOBAL.FLAG_SMOOTH);
						target.addLegFlag(GLOBAL.FLAG_TENDRIL);
						target.addLegFlag(GLOBAL.FLAG_SCALED);
						target.legType = GLOBAL.TYPE_NAGA;
						kGAMECLASS.output("\n\nSlithering back up atop it is practically second nature to you, as easy as walking or running ever was.");
						
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.legTypeLockedMessage());
					}
				}
				//Increase height to 6' then rarely to 6'5"
				if (changes < changeLimit && ((target.tallness < 72 && rand(3) == 0) || (target.tallness < 77 && rand(10) == 0))) {
					if (target.tallnessUnlocked(77))
					{
						kGAMECLASS.output("\n\nVertigo plays tricks with your balance, making the ground seem to drift a little further away as you nearly lose your balance. You do your best to keep upright until the sensation passes, but something isn’t quite right. You... are you taller? You check the codex’s scanners and confirm that you’ve grown ");
						x = 1 + rand(5);
						if(x == 1) kGAMECLASS.output("an inch.");
						else kGAMECLASS.output(num2Text(x) + " inches.");
						target.tallness += x;
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.tallnessLockedMessage());
					}
				}

				//Grow claw-arms - req fur
				if (target.armType != GLOBAL.TYPE_FELINE && changes < changeLimit && rand(3) == 0 && target.skinType == GLOBAL.SKIN_TYPE_FUR) {
					if (target.armTypeUnlocked(GLOBAL.TYPE_FELINE))
					{
						kGAMECLASS.output("\n\nYour fingertips clench involuntarily, digging into your palms with painful pricks of sharpness. Reluctantly prying them open, you watch in shock as your nails gradually shift closer to your fingertips. They narrow even as they lengthen, resulting in a set of sharp, feline-looking claws. <b>You could give someone quite the nasty scratch with your new claws!</b>");
						target.armType = GLOBAL.TYPE_FELINE;
						target.clearArmFlags();
						target.addArmFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.armTypeLockedMessage());
					}
				}
				//Grow fur - req cat ears and naleen face!
				if (target.skinType != GLOBAL.SKIN_TYPE_FUR && target.earType == GLOBAL.TYPE_FELINE && target.faceType == GLOBAL.TYPE_NALEEN_FACE && rand(3) == 0 && changes < changeLimit) {
					if (target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
					{
						kGAMECLASS.output("\n\nHairs erupt from the [pc.skinFurScales] of your right bicep, then your left.");
						if(target.skinType == GLOBAL.SKIN_TYPE_SCALES || target.skinType == GLOBAL.SKIN_TYPE_CHITIN) {
							kGAMECLASS.output(" They’re emerging with such speed and rapidly that they pry away the ");
							if(target.skinType == GLOBAL.SKIN_TYPE_SCALES) kGAMECLASS.output("scales");
							else kGAMECLASS.output("chitin");
							kGAMECLASS.output(" to expose your [pc.skin] even as they grow in overtop of it.");
						}
						//Set fur color!
						if(target.furColor != "orange" && target.furColor != "black" && target.furColor != "white") {
							if(rand(3) == 0) target.furColor = "orange";
							else if(rand(2) == 0) target.furColor = "black";
							else target.furColor = "white";
						}
						//orange, black, white
						kGAMECLASS.output(" The coat of fur thickens and spreads as you watch, moving to your shoulders while a new patch appears on your [pc.belly]. The fur there is softer than elsewhere but growing just as forcefully. Most of your body, even your [pc.butt], is soon covered with the stuff. The layer of fluff thickens and lengthens until <b>your skin is hidden under the " + target.furColor + " coat.</b>");
						target.skinType = GLOBAL.SKIN_TYPE_FUR;
						target.clearSkinFlags();
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.skinTypeLockedMessage());
					}
				}
				//Cat ears - req naleen face
				if (target.faceType == GLOBAL.TYPE_NALEEN_FACE && target.earType != GLOBAL.TYPE_FELINE && changes < changeLimit && rand(3) == 0) {
					if (target.earTypeUnlocked(GLOBAL.TYPE_FELINE))
					{
						kGAMECLASS.output("\n\nAll sound vanishes in an instant. You clap your hands to your [pc.ears], wondering if you’ve gone deaf, but they come up against nothing! Your ears have vanished! Just as you start considering learning a form of sign language or finding a back alley geneticist, the sounds you were hearing before come back with an oddly directional twist. You feel around the sides and top of your head to quickly find your new ears. They’re triangular and perched atop your head, swiveling this way and that to help you easily identify the source of any noise. <b>You’ve grown cat-like naleen ears!</b>");
						target.earType = GLOBAL.TYPE_FELINE;
						target.clearEarFlags();
						target.addEarFlag(GLOBAL.FLAG_TAPERED);
						target.addEarFlag(GLOBAL.FLAG_FURRED);
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.earTypeLockedMessage());
					}
				}
				//Naleen Face - human but never has fur/scales/whatevs
				if (target.faceType != GLOBAL.TYPE_NALEEN_FACE && changes < changeLimit && rand(5) == 0) {
					if (target.faceTypeUnlocked(GLOBAL.TYPE_NALEEN_FACE))
					{
						//Muzzle intro
						if(target.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) kGAMECLASS.output("\n\nYour face goes numb as nerves uncouple and your nose begins to receed back towards your eyes, the muscles of your jaw creaking as your mouth is realigned into a more human-like visage.");
						//Nonhuman intro
						else if(target.faceType != GLOBAL.TYPE_HUMAN) kGAMECLASS.output("\n\nYour [pc.face] goes numb for a few seconds as it adjusts into a perfectly normal-looking human visage.");
						//Human
						else kGAMECLASS.output("\n\nYour [pc.face] briefly goes numb, but so far as you can tell, nothing changes, at least not at first.");
						//Anything other than skin for covering && no SMOOTH face tag!
						if(target.skinType != GLOBAL.SKIN_TYPE_GOO && target.skinType != GLOBAL.SKIN_TYPE_SKIN) kGAMECLASS.output(" You can feel the [pc.skinFurScales] fading into your [pc.skin] until nothing remains but your uncovered dermis, at least on your face.");
						//Add SMOOTH face tag!
						target.clearFaceFlags();
						target.addFaceFlag(GLOBAL.FLAG_SMOOTH);
						kGAMECLASS.output("\n\nThen, your canines elongate into sharp, retractable fangs. They don’t feel hollow to you, so perhaps they don’t quite work like a proper naleen’s. Still, <b>your face looks almost exactly like a naleen’s now.</b>");
						target.faceType = GLOBAL.TYPE_NALEEN_FACE;
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.faceTypeLockedMessage());
					}
				}
				//Naleen eyes: No prereq
				if (rand(5) == 0 && target.eyeType != GLOBAL.TYPE_NAGA && changes < changeLimit) {
					if (target.eyeTypeUnlocked(GLOBAL.TYPE_NAGA))
					{
						if(target.eyeColor != "green" && target.eyeColor != "blue" && target.eyeColor != "gold") {
							if(rand(3) == 0) target.eyeColor = "green";
							else if(rand(2) == 0) target.eyeColor = "blue";
							else target.eyeColor = "gold";
						}
						kGAMECLASS.output("\n\nEverything is suddenly too bright then too dark. You rapidly blink your bleary eyes closed to try to keep from crying at the massive fluctuations in luminance. Finally, your vision stabilizes, and you can see just fine again, though the shadows seem a touch less oppressive than before. A quick check using your codex’s camera identifies the source of your enhanced vision: <b>you have vertically-slit, " + target.eyeColor + " eyes, like a cat, a snake, or more specifically, a naleen.</b>");
						//Green, blue, gold - set before above mention!
						target.eyeType = GLOBAL.TYPE_NAGA;
						changes++;
					}
					else
					{
						kGAMECLASS.output("\n\n" + target.eyeTypeLockedMessage());
					}
				}
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " eats the rations to no effect.");
			}
			return false;
		}
		protected function rand(max:Number):Number
		{
			return int(Math.random()*max);
		}
		protected function chickNaleenTfs(target:Creature,changes:int,changeLimit:int):Number {
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			//Female TFs
			choices = new Array();
			for(x = 0; x < target.totalVaginas(); x++) {
				if(target.vaginas[x].type != GLOBAL.TYPE_NAGA && target.vaginaTypeUnlocked(x, GLOBAL.TYPE_NAGA)) choices[choices.length] = x;
			}
			if(choices.length == 0) x = -1;
			else x = choices[rand(choices.length)];
			//Cunt -> Naleenslit TF
			if(x >= 0 && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nA hot flash assaults your body, leaving you panting, sweating, and drooling from your [pc.vaginas]. ");
				if(target.vaginaTotal() > 1) kGAMECLASS.output("Each");
				else kGAMECLASS.output("It");
				kGAMECLASS.output(" is near-instantly engorged and wanting");
				if(target.totalClits() > 0) kGAMECLASS.output(", your [pc.clits] hard and easy to spot");
				kGAMECLASS.output(". You gasp and double over, bringing your hand up to start masturbating when you see [pc.oneVagina] changing before your eyes. It’s getting longer vertically while the vulva, even aroused, become less noticeable.");
				if(target.vaginas[x].clits <= 0) kGAMECLASS.output(" A sensitive nub grows from the top, forming a pulsing, needy clit.");
				else if(target.vaginas[x].clits > 1) {
					if(target.vaginas[x].clits == 2) kGAMECLASS.output(" A clit vanishes");
					else if(target.vaginas[x].clits == 3) kGAMECLASS.output(" A couple of clits vanish");
					else if(target.vaginas[x].clits == 4) kGAMECLASS.output(" A few clits vanish");
					else if(target.vaginas[x].clits == 5) kGAMECLASS.output(" Some clits vanish");
					else kGAMECLASS.output(" A number of clits vanish");
					kGAMECLASS.output(", leaving only the one at the top.");
				}
				if(target.totalVaginas() == 2) kGAMECLASS.output(" Your other entrance soon follows after the first, reshaping to match.");
				else if(target.totalVaginas() > 2) kGAMECLASS.output(" Your other entrances soon follow after the first, reshaping to match.");
				if((target.hasCock() && target.hasStatusEffect("Genital Slit")) || target.vaginaTotal(GLOBAL.TYPE_NAGA)) kGAMECLASS.output(" With more than one slit in your groin, you hope any future partners can find their target.");
				kGAMECLASS.output("<b> You have a vagina that looks just like a naleen’s");
				if(target.skinType != GLOBAL.SKIN_TYPE_SCALES && target.legType != GLOBAL.TYPE_NAGA) kGAMECLASS.output(", minus the scales around it");
				kGAMECLASS.output(".</b>");
				//Loop through and set 'em all, baby!
				for(x = 0; x < target.totalVaginas(); x++)
				{
					target.shiftVagina(x, GLOBAL.TYPE_NAGA);
				}
				changes++;
			}
			//See if any vaginas have less than 100 bonus capacity!
			choices = new Array();
			for(x = 0; x < target.totalVaginas(); x++) {
				if(target.vaginas[x].bonusCapacity < 100) choices[choices.length] = x;
			}
			if(choices.length == 0) x = -1;
			else x = choices[rand(choices.length)];
			//Bonus capacity up to 100 in increments of 25 - req's naleencunt and nagatail
			if(target.legCount == 1 && target.legType == GLOBAL.TYPE_NAGA && x >= 0 && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nYour lengthy snake-body undulates nervously underneath you when a slight cramp works through you, right around ");
				if(target.vaginaTotal() > 1) kGAMECLASS.output("one of your wombs");
				else kGAMECLASS.output("your womb");
				kGAMECLASS.output(". It fades after five or ten seconds of discomfort, but you just have to figure out what changed inside you! You pry yourself open and guide your fingers inside, finding that you can fit a little bit more inside than ever before. If you contort around and hold your lips apart, you can even tell that you’ve gotten a good bit deeper. <b>You can handle slightly bigger insertions without worry.</b>");
				target.vaginas[x].bonusCapacity += 25;
				if(target.vaginas[x].bonusCapacity > 100) target.vaginas[x].bonusCapacity = 100;
				target.lust(3);
				changes++;
			}
			//Grow Breasts to DD then rarely up to F (rare version requires naleen tail and cunt)
			if(target.breastRows[0].breastRatingRaw < 5 && target.breastRatingUnlocked(0, 5) && rand(3) == 0 && changes < changeLimit) {
				kGAMECLASS.output("\n\nOhhh, your [pc.fullChest] feels warm! You reach up to idly rub at the affected area, but your fingers make contact sooner than you anticipated. ");
				if(target.breastRows[0].breastRating() < 1) {
					kGAMECLASS.output("There’s a small, budding breast there, and it’s growing bigger! <b>You palm your swelling chest as it grows into a B-cup bosom.</b> You guess there must be some good reason why naleen are so top-heavy.");
					target.breastRows[0].breastRatingRaw += 2;
				}
				else {
					kGAMECLASS.output("There’s an extra heft to your breasts as you contact them, and you realize that your fingers can sink just a little deeper into the pliant flesh than before. They feel extra weighty in your hands, jiggling a bit as you estimate their size. <b>They must have grown to ");
					target.breastRows[0].breastRatingRaw += 2 + rand(3);
					kGAMECLASS.output(target.breastCup(0) + "s.</b> Now you’re looking more like a naleen!");
				}
				changes++;
			}
			//rarely grow upup to F (rare version requires naleen tail and cunt)
			if(target.breastRows[0].breastRatingRaw < 11 && target.breastRatingUnlocked(0, 11) && rand(6) == 0 && changes < changeLimit && target.isNaga() && target.hasVaginaType(GLOBAL.TYPE_NAGA)) {
				kGAMECLASS.output("\n\nOhhh, your [pc.fullChest] feels warm! You reach up to idly rub at the affected area, but your fingers make contact sooner than you anticipated. They’re way bigger than before and still going! Maybe letting yourself change this much has made your breasts more receptive to the naleen mutations. ");
				target.breastRows[0].breastRatingRaw += 3 + rand(3);
				kGAMECLASS.output("Whatever the case, <b>you’re left with two, big pillowy " + target.breastCup(0) + "s.</b>");
				changes++;
			}
			//Widen hips to 12
			if (target.hipRatingRaw < 12 && target.hipRatingUnlocked(12) && changes < changeLimit && rand(3) == 0) {
				target.hipRatingRaw += 1 + rand(3);
				kGAMECLASS.output("\n\nThere’s a little bit of extra shake whenever you shift position. A glance down to your waist reveals that your gait has widened with your [pc.hips]. You aren’t sure why a race that doesn’t have legs would have such wide hips anyway, but they do look nice on you.");
				changes++;
			}
			else if (!target.hipRatingUnlocked(12))
			{
				kGAMECLASS.output("\n\n" + target.hipRatingLockedMessage());
			}
			//Lengthen hair to ass-length!
			if (target.hasHair() && target.hairLength < target.tallness/2 && target.hairLengthUnlocked(target.tallness / 2) && changes < changeLimit && rand(3) == 0)	{
				x = 1 + rand(4);
				kGAMECLASS.output("\n\nYour scalp tickles a little when your [pc.hair] lengthens, gaining ");
				if (x == 1) kGAMECLASS.output("an inch");
				else if (x == 2) kGAMECLASS.output("two inches");
				else if (x == 3) kGAMECLASS.output("three inches");
				else kGAMECLASS.output("four inches");
				kGAMECLASS.output(" of new length. Well, that’s nothing you can’t get changed at a salon, at least.");
				target.hairLength += x;
				changes++;
			}
			else if (!target.hairLengthUnlocked(target.tallness / 2))
			{
				kGAMECLASS.output("\n\n" + target.hairLengthLockedMessage());
			}
			return changes;
		}
		//Male TFs
		protected function dudeNaleenTfs(target:Creature,changes:int,changeLimit:int):Number {
			var x:int = 0;
			var y:int = 0;
			var choices:Array;
			
			//Hemipenis - Reqs slit
			if (target.hasStatusEffect("Genital Slit") && target.cockTotal() == 1 && target.cockTotal(GLOBAL.TYPE_NAGA) == 1 && target&& changes < changeLimit && rand(3) == 0) {
				if (target.createCockUnlocked())
				{
					kGAMECLASS.output("\n\nA sudden, hot throb in your slit is the only you get before you feel the start of ");
					if (changes > 1) kGAMECLASS.output("another ");
					else kGAMECLASS.output("a ");
					kGAMECLASS.output("change. It feels like your [pc.cock] is getting thicker inside you, fattening up so nicely that you wonder just how much dick you can bear, even soft and unaroused. That question is answered by the momentary pain of something separating inside you. You can feel your dick being rubbed from above and below at the same time, both places feeling as phallic as the source of your sensation. It’s then that <b>you pull open your slit to reveal a newly grown pair of naleen dicks where once there was one.</b>");
					target.createCock();
					target.cocks[1].cLengthRaw = target.cocks[0].cLengthRaw;
					target.cocks[1].cThicknessRatioRaw = target.cocks[0].cThicknessRatioRaw;
					target.cocks[1].knotMultiplier = target.cocks[0].knotMultiplier;
					target.shiftCock(1,GLOBAL.TYPE_NAGA);
					target.lust(5);
					target.slowStatGain("libido",2);
					changes++;
				}
				else
				{
					kGAMECLASS.output("\n\n" + target.createCockLockedMessage());
				}
			}
			//Naleen cock tf
			if (changes < changeLimit && target.hasStatusEffect("Genital Slit") && target.cockTotal() > target.cockTotal(GLOBAL.TYPE_NAGA) && rand(3) == 0)
			{
				//Find an appopriate cock first!
				choices = new Array();
				for(x = 0; x < target.cockTotal(); x++)
				{
					if(target.cocks[x].cType != GLOBAL.TYPE_NAGA && target.cockTypeUnlocked(x, GLOBAL.TYPE_NAGA)) choices[choices.length] = x;
				}
				
				if (choices.length > 0)
				{
					x = choices[rand(choices.length)];
					
					kGAMECLASS.output("\n\nInside your genital slit");
					if(target.hasVagina()) {
						kGAMECLASS.output(", the one that holds your masculine endowment");
					}
					if(target.cockTotal() > 1) kGAMECLASS.output("s");
					kGAMECLASS.output(", you feel a sudden shifting. [pc.oneCock] is half hard and tingling all over, but it won’t come out. The feeling is pleasurable but at the same time disconcerting, like the interior of your sheath is fellating you while your length reshapes to accommodate it better. You lower yourself down to the ground before the exotic pleasure strips the strength from your [pc.legOrLegs], just in time to feel your [pc.cock " + x+ "] start spasming in ecstasy, dragging a moan from your throat as it suddenly rams its way up and out of your slit.");
					if(target.cumQ() < 5) kGAMECLASS.output("\n\nDribbles of [pc.cum] leak from your twitching length, the only seed your body is able to eject in your spasms of pleasure.");
					else kGAMECLASS.output("\n\nArcs of [pc.cum] fly from you twitching length out in front of you, launched in thick, wet volleys.");
					kGAMECLASS.output(" Your [pc.hips] wildly hump the air against an invisible lover as the abrupt bliss works its way through you. Hanging out of your [pc.lips], your [pc.tongue] drools down your chin in satisfaction. The surprise climax ends, leaving you panting and regarding the source of it all.");
					kGAMECLASS.output("\n\n<b>In place of your [pc.cock " + x + "], you have a purple, snake-like length, somewhat bulbous up to its tapered tip.</b>");
					target.orgasm();
					target.shiftCock(x,GLOBAL.TYPE_NAGA);
					changes++;
				}
				else
				{
					kGAMECLASS.output("\n\n" + target.cockTypeLockedMessage());
				}
			}
			
			//Genital slit
			if(!target.hasStatusEffect("Genital Slit") && changes < changeLimit && rand(3) == 0) {
				kGAMECLASS.output("\n\nA ripple of pleasant heat radiates out from your stomach and down a little deeper to your loins, manifesting in the form of ");
				if(target.cockTotal() == 1) kGAMECLASS.output("a rising erection");
				else kGAMECLASS.output("rising erections");
				kGAMECLASS.output(".");
				if(target.isCrotchGarbed()) {
					kGAMECLASS.output(" You immediately pull your ");
					if(target.lowerUndergarment.shortName != "") {
						kGAMECLASS.output("[pc.lowerUndergarment.longName]");
						if(target.armor.shortName != "") kGAMECLASS.output(" and ");
					}
					if(target.armor.shortName != "") kGAMECLASS.output("[pc.armor.longName]");
					kGAMECLASS.output(" to free yourself from the constricting pressure.");
				}
				if(target.cockTotal() == 1) kGAMECLASS.output(" It’s");
				else kGAMECLASS.output(" They’re");
				kGAMECLASS.output(" pulsating and achingly hard, already drooling a steady trickle of pre-cum along ");
				if(target.cockTotal() == 1) kGAMECLASS.output("its underside");
				else kGAMECLASS.output("their undersides");
				kGAMECLASS.output(". Then, the sinking sensation starts.");
				kGAMECLASS.output("\n\n[pc.EachCock] is slowly drifting backwards, ");
				if(target.hasASheath()) kGAMECLASS.output("folding into your sheath at first, then taking it along with your dick, ");
				kGAMECLASS.output("disappearing further into your middle with each passing moment. In a fit of desperation, you grab hold");
				if(target.cockTotal() > 1) kGAMECLASS.output(" of one");
				kGAMECLASS.output(" and tug, trying to keep your [pc.cocks] from going away, but you’re too slick with pre! The length slides right through your grip and up inside you. With barely half of ");
				if(target.cockTotal() == 1) kGAMECLASS.output("its length remaining");
				else kGAMECLASS.output("their lengths remaining");
				kGAMECLASS.output(" exposed, you’re forced to watch ");
				if(target.cockTotal() == 1) kGAMECLASS.output("it");
				else kGAMECLASS.output("them");
				kGAMECLASS.output(" completely recede, leaving only a single slit in its place.");
				kGAMECLASS.output("\n\nThe arousal fades as quickly as it came, leaving you there to consider your new genital slit. A quick, probing fingertip finds that your [pc.cocks] ");
				if(target.cockTotal() == 1) kGAMECLASS.output("hasn’t");
				else kGAMECLASS.output("haven’t");
				kGAMECLASS.output(" vanished - ");
				if(target.cockTotal() > 1) kGAMECLASS.output("they’re");
				else kGAMECLASS.output("it’s");
				kGAMECLASS.output(" just hiding inside the warm, wet channel. Oh... it feels kind of nice, and [pc.eachCock] starts to emerge. You stop before you wind up masturbating with <b>the new, snake-like slit that holds your [pc.cocks] when unaroused.</b>");
				target.lust(5)
				changes++;
				target.createStatusEffect("Genital Slit",0,0,0,0);
			}
			//Increase dick length to 10"	
			x = target.shortestCockIndex();
			if(target.shortestCockLength() < 10 && target.cockLengthUnlocked(target.shortestCockIndex(), 10) && changes < changeLimit && rand(3) == 0) {
				//Slit vers
				if(target.hasStatusEffect("Genital Slit")) {
					kGAMECLASS.output("\n\nA slight twitch from your [pc.cock " + x+ "] inside your slit pulls your attention southward, but it ends almost as soon as it starts. Just when you’re about to move on, it happens again, this time more strongly. The [pc.cockHead " + x+ "] slips through the lips of your entrance, emerging briefly before it subsides a second later. Once more, the process repeats, this time reaching out perhaps a");
					if(target.hasPerk("Hung")) kGAMECLASS.output(" couple inches");
					else kGAMECLASS.output("n inch");
					kGAMECLASS.output(" before withdrawing. You reach a hand inside to check on it and discover that it’s grown bigger - big enough to be a full");
					if(target.hasPerk("Hung")) kGAMECLASS.output(" two inches");
					else kGAMECLASS.output(" inch");
					kGAMECLASS.output(" longer when hard.");
				}
				//Noslit version
				else {
					kGAMECLASS.output("\n\nA twitch runs through your [pc.cock " + x + "]");
					if(target.hasSheath(x)) kGAMECLASS.output(", drawing it out of its sheath to hang in the open air.");
					else kGAMECLASS.output(", causing it to swell a bit as it hangs in the open air.");
					kGAMECLASS.output(" It stops as soon as it starts, but a few moments later, your penis shudders once more, looking a little bigger than before. The odd, expanding sensation returns one last time, making you big enough to be a full");
					if(target.hasPerk("Hung")) kGAMECLASS.output(" two inches");
					else kGAMECLASS.output(" inch");
					kGAMECLASS.output(" bigger when hard. Perhaps being more like a planet’s apex predator isn’t such a bad idea.");
				}
				target.cocks[x].cLengthRaw += 1;
				if(target.hasPerk("Hung")) target.cocks[x].cLengthRaw += 1;
				kGAMECLASS.output(" You’re thicker to match, too.");
				changes++;
			}
			//10" to 16" growth - slitted naleen cocks only
			else if(target.hasStatusEffect("Genital Slit") && target.shortestCockLength() < 16 && target.cockLengthUnlocked(target.shortestCockIndex(), 16) && changes < changeLimit && rand(6) == 0) {
				x = target.shortestCockIndex();
				kGAMECLASS.output("\n\nYour nicely-filled, interior cock-sheath shifts pleasantly around your [pc.cock " + x + "] as you chew, and you can’t help but feel a shiver of excitement run through you at that. Your length engorges noticeably but doesn’t emerge, stretching out your interior with its expanding length and width. You shudder, whining softly under your breath as the growth continues. Then, it stops, leaving you feeling a tad warm and a little sore, with a newly expanded [pc.cock " + x + "] snugly packed inside you.");
				target.cocks[x].cLengthRaw += 1 + rand(3);
				if(target.hasPerk("Hung")) target.cocks[x].cLengthRaw += 1 + rand(3);
				kGAMECLASS.output(" You’re thicker to match, too.");
				changes++;
			}
			//Reduce breasts to flat if uncunted.
			if(!target.hasVagina() && target.biggestTitSize() >= 1 && target.breastRatingUnlocked(target.biggestTitRow(), 0) && changes < changeLimit && rand(2) == 0) {
				kGAMECLASS.output("\n\nAs you’re waiting ");
				if(changes > 0) kGAMECLASS.output("for the changes to finish");
				else kGAMECLASS.output("for any mutations to manifest");
				kGAMECLASS.output(", your [pc.fullChest] tightens. There’s no warning, no slow heat or mounting change, just the sudden and abrupt loss of a cup size");
				if(target.bRows() > 1) {
					y = 0;
					for(x = 0; x < target.bRows(); x++) {
						if(target.breastRows[x].breastRatingRaw >= 1) {
							y++;
							if(target.breastRows[x].breastRatingRaw >= 6) target.breastRows[x].breastRatingRaw -= 2;
							else target.breastRows[x].breastRatingRaw--;
						}
					}
					if(y > 1) kGAMECLASS.output(" across every row bigger than a bee-sting");
				}
				else {
					if(target.breastRows[0].breastRatingRaw >= 6) target.breastRows[0].breastRatingRaw -= 2;
					else target.breastRows[0].breastRatingRaw--;
				}
				if(target.biggestTitSize() < 1) kGAMECLASS.output(", leaving you as flat as a board");
				kGAMECLASS.output(".");
				changes++;
			}
			return changes;
		}
	}
}

