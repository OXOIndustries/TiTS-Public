//Upon Consumption always try to do three transformations:
//If 0 cocks always grow one
//If has cock and not maximum number gives a 10% chance of growing another cock
//If failure to grow cock or already has 10 cocks do:
//* If any cock is less than 4.1 inches do "Length+Thick" on that cock.
//* Else do either one or more of: increase cum quality, cock length, thickness.

package classes.Items.Transformatives {
	import classes.CockClass;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.Util.InCollection;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	
	public class Virection extends ItemSlotClass {
		public function Virection() {
			this._latestVersion = 1;
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.DRUG;
			
			this.shortName = "Virection";
			this.longName = "virection pill";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a small box containing a single Virection pill";
			
			this.tooltip = "Virection was originally developed and marketed by a small company as a phalic enlargement and virility enhancer, but due to a glitch in production it caused some of its consumers to spontaneously grow disfigured penises. In order to survive the subsequent legal action by disgruntled customers it sold the patent to Tamami Corp. They reworked the product and stabilized the glitch so that penile growth became a feature rather than an error. This product is in constant high demand, suffering through many changes in price and name, like CockUp, Penismightier and the BigD.\n\n The microsurgeons and chemicals in this blue pill are advertised to solve a myriad of problems related to male genitalia or lack of thereof. This product will always grow a penis if its consumer lacks one, a feature so potent that it can cause supernumary penis. Otherwise it will increase the length, thickness, or virility.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 6000;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean {
			clearOutput();
			author("Lashcharge");
			
			if ((target is PlayerCharacter)) {
				output("You enjoy the blueberry-flavored pill, swirling it around with your [pc.tongue], before swallowing it down.");
				
				//can create another cock
				if (target.createCockUnlocked(target.cocks.length+1)) {
					
					//if target has no cock - grow one
					if(!target.hasCock()) {
						_growFirstCock(target);
					
					//target has already at least 1 cock -try grow one more
					} else {
						var random:int = rand(9);
						//10% chance to grow a new dick
						if(random == 0) {
							//grow second dick
							if(target.cocks.length == 1) {
								_growSecondCock(target);
							//grow a third, fourth, fifth ... cock
							} else {
								_growAnotherCock(target);
							}
						//if no new cock is grown, try to increase length/thickness/cumquantity
						} else {
							_tryToIncreaseLengthOrThicknessOrCumQuality(target);
						}
					}
				//if no cock can be grown because max amount was reached, try to increase length/thickness/cumquantity also
				} else {
					_tryToIncreaseLengthOrThicknessOrCumQuality(target);
				}
				
			}
			else {	
				kGAMECLASS.output(target.capitalA + target.short + " consumes the pill to no effect.");
			}
			
			return false;
		}
		
		//get the index of all cocks of a creature with a length of x or less
		private function _getCocksBelowLength(target:Creature, length:int):Array {
			var cocks:Array = new Array();
			
			for (var i:int = 0; i < target.cocks.length; i++) {
				if(target.cocks[i].cLength() <= length) {
					cocks.push(i);
				}
			}
			return cocks;
		}
		
		//get the index of all cocks of a creature with a thickness of x or less
		private function _getCocksBelowThicknessRatio(target:Creature, thickness:int):Array {
			var cocks:Array = new Array();
			
			for (var i:int = 0; i < target.cocks.length; i++) {
				if(target.cocks[i].cThicknessRatio() <= thickness) {
					cocks.push(i);
				}
			}
			return cocks;
		}
		
		//calculate thicknessRatioRaw based on length and a desired end thickness
		private function _calculateThicknessRatio(length:Number, desiredThickness:Number):Number {
			var thicknessRatio:Number = desiredThickness / (length / 6);
			return thicknessRatio;
		}
		
		private function _growFirstCock(target:Creature):void {
			output("\n\nYour heart starts beating much faster as your body heats up, and you begin to sweat. After a few moments, your entire body is drenched, and your veins are visibly throbbing; almost like they are going to burst. You're both exhausted and uncomfortable as a new rippling sensation manifests in your loins. You decide it's best to sit down.");
			output("\n\nSlowly, you can feel the palpitations all over your body dissipating, except for those on your crotch, which is turning reddish with the excess blood pooling there. Seems like the microsurgeons were collecting blood from the rest of your body. The throbbing continues until a tiny lump begins to form");
			if(target.hasVagina()) output(" just above your vagina");
			else output(" on your crotch");
			output(". You touch the ever-expanding length and feel a wave of ecstasy assault your body. You can't help but to start masturbating midway through the transformation. After the cockhead twists into shape, a sudden dribble of pre-cum emerges from the newly-formed urethra, slipping between your fingers, slicking your length and making the masturbation far easier. It doesn't take long after to reach your peak, ejaculating a few meager, pathetic strings onto your [pc.belly]. You take a few breaths as you revel in your afterglow.");
			
			//grow new cock
			target.cocks[0] = new CockClass();
			//set type dependent on race
			target.setNewCockValues(0);
			//set length to 4 inches
			target.cocks[0].cLengthRaw = 4;
			
			//do some adjusting for hung/mini
			if(target.hasPerk("Hung")) target.cocks[0].cLengthRaw += 2 + rand(4);
			if (target.hasPerk("Mini")) target.cocks[0].cLengthRaw -= 1 + rand(1);
			
			//set a cThicknessRatio of a value resulting in 1 inch thickness
			target.cocks[0].cThicknessRatioRaw = _calculateThicknessRatio(target.cocks[0].cLengthRaw, 1);
			
			//set a slightly higher/lower value if target has perk hung/mini
			if (target.hasPerk("Hung")) target.cocks[0].cThicknessRatioRaw = _calculateThicknessRatio(target.cocks[0].cLengthRaw, 1.2);
			if (target.hasPerk("Mini")) target.cocks[0].cThicknessRatioRaw = _calculateThicknessRatio(target.cocks[0].cLengthRaw, 0.8);
			
			output("\n\nYou almost fall into a post-orgasmic slumber, but you keep yourself focused enough to stave the fatigue off. Cleaning your sweat and [pc.cumNoun]-coated hands proves to be a more difficult task than you thought it would be, and after you’re done, you carefully examine your new phallus.");
			output("<b>");
			
			var pcRace:String = target.race();
			
			//if some kind of horse, rabbit, ovir, minotaur variant
			if(InCollection(pcRace, "horse-morph", "part horse-morph", "laquine", "ovir", "half-ovir", "minotaur", "centaur", "horse-taur", target.mlpRace())) {
				output(" Your [pc.cockColor] cock has a medial ring and flares like a horse's");
			
			//if some kind of ausaur, canine, fox, kitsune variant
			} else if(InCollection(pcRace, "ausar", "half-ausar", "canine-morph", "canine-taur", "vulpine-morph", "vulpine-taur", "kitsune", "kitsune-morph", "kitsune-taur")) {
				output(" Your [pc.cockColor], veiny cock has a tapered head and a knot like");
				if (InCollection(pcRace, "ausar", "half-ausar")) output(" an ausar's");
				else if (InCollection(pcRace, "vulpine-morph", "vulpine-taur", "kitsune", "kitsune-morph", "kitsune-taur")) output(" a fox's");
				else output(" canine's");
			
			//if some kind of keirith, feline, neko, chakat variant
			} else if (InCollection(pcRace, "kaithrit", "half-kaithrit", "feline-morph", "feline-taur", "nekomata", "nekomata-taur", "chakat")) {
				output(" Your [pc.cockColor] cock is ringed in soft, nubby 'barbs,' like a kaithrit");
			
			//if some kind of leithan, naleen, naga, snake variant
			} else if(InCollection(pcRace, "leithan", "half-leithan", "naleen", "naga", "snake-morph")) {
				output(" Your [pc.cockColor] cock is glossy smooth and tapers towards the tip");
			
			//if a zill
			} else if (pcRace == "zil") {
				output(" Your glossy [pc.cockColor] dick is much like the one of a human, but with a longer, stretchier foreskin");
			
			//if some kinf of Kui-tan variant
			} else if(InCollection(pcRace, "kui-tan", "half kui-tan")) {
				output(" Your [pc.cockColor] dick has one large knot at the base followed by two smaller ones");
			
			//if some kind of raskvel variant
			} else if(InCollection(pcRace, "raskvel", "raskvel-morph", "rask-morph")) {
				output(" Your [pc.cockColor] cock is pointed and hides inside a sheath most of the time");
			
			// some kind of dragon, fafnir variant
			} if(InCollection(pcRace, "fanfir", "dragon-morph", "dragon-taur", "dragonne", "dragonne-taur")) {
				output(" Your [pc.cockColor] dick is tapered with a knot like bulb at its base");
			
			//if syndian
			} else if(pcRace == "sydian") {
				output(" Your [pc.cockColor] cock is covered in tiny brushes");
			
			//if demon
			} else if(pcRace == "demon-morph") {
				output(" Your [pc.cockColor] cock is shiny, covered in sensitive nodules and the head has rubbery protrusions, like the one of a demon");
			
			//if some kind of tentacke or cock-vine variant
			} else if(InCollection(pcRace, "tentacle beast", "cockvine-morph", "plant-morph", "treant")) {
				output(" Your [pc.cockColor] cock is constantly moist and moving with a slightly over-sized mushroom-like head");
			
			//future variant if some kind of anemone or siren cock is added to the game
			} else if(InCollection(pcRace, "anemone", "siren")) {
				output(" Your [pc.cockColor]-colored cock is covered in tentacles riddled with poisonous aphrodisiac");
			
			//if kangaroo
			} else if(pcRace == "kangaroo-morph") {
				output(" Your [pc.cockColor] dick is much like a taproot that undulates gently and tapers to a point when erect");
			
			//if daynar
			} else if(pcRace == "daynar") {
				output(" Your [pc.cockColor] cock has thick enough skin to obscure the veins and a tapered tip");
				
			//if some kind of gabilani or goblin
			} else if(InCollection(pcRace, "gabilani", "goblin")) {
				output(" Your [pc.cockColor] cock is much like a human's with the exception of having an extra cockhead stacked on top of the other");
			
			//future variant for sionachs
			} else if(InCollection(pcRace, "sionach", "sionach-morph")) {
				output(" Your [pc.cockColor] cock has a pyramid-shaped head and the curved shaft is covered in reptilian bulbs");
			
			//future variant for siels
			} else if(pcRace == "siel") {
				output(" Your cock looks like a lumpy caterpillar with a small [pc.cockColor] tip");
			
			//if race is simii
			} else if(pcRace == "simii") {
				output("Your dick has a [pc.cockColor] mushroom-like head and the shaft is covered in [pc.skinColor] [pc.skinNoun]");
			
			//if race is saurian
			} else if(pcRace == "saurian") {
				output("Your [pc.cockColor]-colored dick is gigantic and massively thick, like that of a prehistoric thunder lizard");
			
			//if race is venus pitcher
			} else if(pcRace == "venus pitcher") {
				output("Your [pc.cockColor] cock appears very vine-like, moving to and fro like some kind of sentient plant");
			
			//if some form of gryvain variant
			} else if(InCollection(pcRace, "gryvain", "half-gryvain")) {
				output("Your dick is knotted at the base, ribbed along the shaft, and covered in [pc.cockColor] scales");
				
			//for humans
			} else {
				output("Your dick has a [pc.cockColor] mushroom-like head and the shaft is covered in [pc.cockColor] [pc.skinNoun]");
			}
			output("!</b>");
			
			target.orgasm();
		}
		
		private function _growSecondCock(target:Creature):void {
			//make second cock
			target.cocks[1] = new CockClass();
			//copy values first cock to the new one
			target.copyCock(1, 0);
			//not sure if this is ever important, but... make this new cock virginal again
			target.cocks[1].virgin = true;
			
			output("\n\nStrange ripples begin to crawl up your [pc.cock], slowly stimulating its flaccid length into full mast. As your arousal grows, so does your lightheadedness. Feeling faint, you try to sit down but end up falling on your ass instead, your. Gently, you rub your sore bum, only stopping when you realize you're already stroking your rock-hard member with the other hand.");
			output("\n\nYou follow suit by wrapping your other hand around its growing girth and resume stroking. The prickly ripples feel amazing, specially when pressed against the shaft by your firm grip. Your [pc.cockHead] grows hotter as the ripples intensify there. Pre-cum begins to copiously stream down from its slits... its two slits?");
			output("\n\nBut before you can pay any mind to your swollen [pc.cockHead], the waves of lust climbing through your shaft grow stronger. Your hands can barely contain its newfound girth, already twice its original size. A tiny gap forms between the cumslits, before splitting into two cockheads on top of an extremely engorged shaft. The undulations slow down as the gap grows wider, then your sole cock divides into two. With one on each hand, you languidly pump them up and down until you orgasm, coating your hands in [pc.cum]. You wipe your fingers clean, finishing <b>just as they fully separate into two identical [pc.cocks]!</b>");
			
			target.orgasm();
		}
		
		private function _growAnotherCock(target:Creature):void {
			//get last cock index
			var lastIndex:int = target.cocks.length - 1;
			//make new dick
			target.cocks[lastIndex+1] = new CockClass();
			//copy last cock properties to new cock
			target.copyCock(lastIndex+1, lastIndex);
			//set the new cock to be virginal
			target.cocks[lastIndex+1].virgin = true;

			output("\n\nYou feel something warm touching your [pc.hips], but a quick look shows nothing is actually there. The sensation, almost like the hands of a masseuse, runs across your body like a rolling wave. When you feel those hands reach into your crotch, the feeling suddenly stops. You wonder for a moment if anything is going to change, but it reappears in your crotch and quickly tightens around your");
			if (target.cocks.length == 2) output(" pair");
			else output(" collection");
			output(" of [pc.cocks]. The shafts answer back by becoming harder than ever before, pre-cum copiously gushing from the slits. Whatever semblance of resistance you had disappears as you wrap each of your hands around their slickened girths.");
			output("\n\nYou barely manage to remain standing as you start thrusting into your hands, drool slipping from your [pc.lipsChaste] and ecstasy flooding throughout your body. Your ");
			if(target.hasKnees()) output("knees begin to weaken,");
			else 
			{
				if(target.legCount == 1) output("[pc.leg] begins to weaken,");
				else output("[pc.legs] begin to weaken,");
			}
			output(" but you steel yourself, pushing your [pc.hips] ever harder into your hands. You continue thrusting as the lowest of your dicks begins to swell within your grasp, a tiny gap forming in the base of your bottom [pc.cock " + (lastIndex + 1) + "]. It’s splitting in half! Your left hand leaves your other dicks to help the right with stroking your bloated organ. You even slip a finger into the gap, probing its sensitive insides. Cum flows through the dual cum-veins before joining together and shooting out from the single, conjoined cockhead, straining the slit with a shot twice as large as you are used to. Suddenly, your [pc.cockHead " + (lastIndex + 1) + "] snaps apart in two, slinging jizz at your [pc.hair] and [pc.feet].");
			output("\n\n<b>You’ve got " + num2Text(target.cocks.length) + " cocks now.</b> You clean yourself, hoping to find a mate with enough holes that can take you in... or at least someone with a gaped enough one for all of them.");
			
			target.orgasm();
		}
		
		private function _tryToIncreaseLengthOrThicknessOrCumQuality(target:Creature):void {
			//try to get all cocks below 4 inches long
			var validCockIndexes:Array = _getCocksBelowLength(target, 4);
			
			//if any found increase length and thickness of one of them
			if (validCockIndexes.length > 0) {
				var randomCockIndex:int = validCockIndexes[rand(validCockIndexes.length - 1)];
				
				output("\n\nYour smaller-than-average [pc.cock " + randomCockIndex + "] grows warm and quickly stiffens into a firm, throbbing erection. You");
				if(target.hasLowerGarment()) output(" slip a hand into your [pc.lowerGarments]");
				else output(" stare down at your crotch");
				output(", grab your rock hard dick and give it a few languid strokes. It fills with blood as it grows within your grip, not only in length, but in thickness too! Eventually the growth stops, and the warmth fades. Before your erection can soften, you take a good measure of it and find out it <b>has doubled in length, and its girth has increased as well!</b>");
				
				//set length depending on perks
				if (target.hasPerk("Hung")) target.cocks[randomCockIndex].cLengthRaw *= 2.2;
				else if (target.hasPerk("Mini")) target.cocks[randomCockIndex].cLengthRaw *= 1.8;
				else target.cocks[randomCockIndex].cLengthRaw *= 2;
				
				//set thickness depending on perks
				if (target.hasPerk("Hung")) target.cocks[randomCockIndex].cThicknessRatioRaw *= 1.15;
				else if (target.hasPerk("Mini")) target.cocks[randomCockIndex].cThicknessRatioRaw *= 1.1;
				else target.cocks[randomCockIndex].cThicknessRatioRaw *= 1.05;
				
				target.orgasm();
				
			//if no cock is smaller than 4 inches - these are the options, when
			//no cock could be grown for whatever reason and the player doesn't have a
			//dick smaller than 4 inches
			} else {
				//gather options into array
				var options:Array = new Array();
				var shortCocks:Array = _getCocksBelowLength(target, 30);
				var thinCocks:Array = _getCocksBelowThicknessRatio(target, 1.8);
				if (shortCocks.length > 0) options.push(_increaseCockLength);
				if (thinCocks.length > 0) options.push(_increaseCockThickness);
				if (target.cumQualityRaw < 50) options.push(_increaseCumQuality);
				
				//if no valid options, print virection failed text
				if(options.length == 0) {
					output("\n\nAfter waiting a long while, you realize that your [pc.cocks]");
					if(target.cocks.length == 1) output(" isn't");
					else output(" aren't");
					output(" going to transform. Virection probably can't grow");
					if(target.cocks.length == 1) output(" it");
					else output(" them");
					output(" any further.");
				} else {
					//do 1 to max options options
					for (var i:int = 0; i < rand(options.length)+1; i++) {
						//use random option available
						var random:int = rand(options.length);
						options[random](target);
						//remove option after use
						options.splice(random, 1);
					}
				}
			}
		}
		
		private function _increaseCockLength(target:Creature):void {
			//get a random dick below 30 inches length
			var validCockIndexes:Array = _getCocksBelowLength(target, 30);
			var randomCockIndex:int = validCockIndexes[rand(validCockIndexes.length - 1)];
			
			output("\n\nYou can feel the famous warmth of Virection spreading throughout your groin, slowly focusing on your [pc.cock " + randomCockIndex + "]. The temperature is not the only thing rising though, as");
			if (target.cocks.length == 1) output(" your dick begins");
			else output(" all of your dicks begin");
			output(" to throb with lust. You can’t help but rub your unusually hot dick");
			if(!target.isCrotchExposed()) {
				output(" through the");
				if (target.hasArmor() && (target.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) || target.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN))) output(" material of your [pc.armor]");
				else output(" fabric or your [pc.lowerGarment]");
			}
			output(" as it begins to swell, each burst of growth assaulting your thoughts with unnatural lust. The first inch spouting forth leaves you shuddering in orgasm and the last one throws you to the ground");
			if(target.hasKnees() && target.hasToes()) output(", your knees giving in and your toes curling in pleasure.");
			
			//increase by 2-3 inches, and store change for use in text
			var increase:int = 2 + rand(1);
			
			//do some adapting for hung/mini perked pcs
			if(target.hasPerk("Hung")) increase += 1 + rand(2);
			if(target.hasPerk("Mini")) increase -= 1;
			
			//actually set value
			target.cocks[randomCockIndex].cLengthRaw += increase;
			
			output(" It takes a long time for you to recover, weakly stroking your length. By measuring your");
			if(target.cocks[randomCockIndex].cLength() < 10) output(" average-sized [pc.cockNounSimple " + randomCockIndex + "] with your hand");
			else if(target.cocks[randomCockIndex].cLength() >= 10 && target.cocks[randomCockIndex].cLength() < 20) output(" larger-than-average [pc.cockNounSimple " + randomCockIndex + "] and comparing it to your forearm");
			else output(" chin-hitting [pc.cock " + randomCockIndex + "] across your chest");
			
			output(", you confirm <b>that your surprisingly ejaculate-free cock has grown " + num2Text(increase) + " inch");
			if (increase > 1) output("es")
			output(" in length!</b> ");
			
			target.orgasm();
		}
		
		private function _increaseCockThickness(target:Creature):void {
			//get a random dick below 15 inches thickness
			var validCockIndexes:Array = _getCocksBelowThicknessRatio(target, 1.8);
			var randomCockIndex:int = validCockIndexes[rand(validCockIndexes.length - 1)];
			
			//set a thickness adaping for hung and mini
			if(target.hasPerk("Hung")) target.cocks[randomCockIndex].cThicknessRatioRaw += 0.15;
			else if (target.hasPerk("Mini")) target.cocks[randomCockIndex].cThicknessRatioRaw += 0.1;
			else target.cocks[randomCockIndex].cThicknessRatioRaw += 0.05;
			
			output("\n\nA strange sensation surges through your [pc.cock " + randomCockIndex + "]. You");
			if(target.legs.length == 1) output(" stretch out your [pc.leg]");
			else output(" spread your [pc.legs]");
			
			output(". Taking a deep breath, you look down and see it slowly engorging. The changes are barely visible to the eye, but you imagine it might have gained some extra girth.");
			output(" As the heat dissipates, you find yourself tempted to touch it. Carefully, you do so, slowly passing your fingers over the shaft, before taking full hold of your [pc.cock " + randomCockIndex + "].");
			
			if(target.cocks[randomCockIndex].thickness() < 7) output(" Your hand easily wraps around it, <b>but it definitely feels thicker than before.</b>");
			else if(target.cocks[randomCockIndex].thickness() >= 7 && target.cocks[randomCockIndex].thickness() < 13) output(" You need two hands to fully measure its girth, and after a few strokes, <b>you realize it’s even thicker than before.</b>");
			else output(" Even with both your hands, you can't fully encompass its monstrous girth. <b>You can hardly believe it, but it's even thicker than before!</b>");
		}
		
		public function _increaseCumQuality(target:Creature):void {
			//increase quality by 1
			target.cumQualityRaw += 1;
			
			output("\n\nYour [pc.balls] quickly warm");
			if (target.balls <= 1) output("s");
			output(" up, before gradually cooling down. You pass a finger through your sweaty crotch and sniff it. Your man musk is much stronger than before, alerting you of the changes happening to your body. A quick check with your codex confirms it. <b>You've gotten much more virile!</b>");
		}
	}
}