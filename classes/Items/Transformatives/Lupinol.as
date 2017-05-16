package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.num2Text;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	
	public class Lupinol extends ItemSlotClass
	{
		public function Lupinol()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Lupinol";
			longName = "Lupinol";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a Lupinol medipen";
			tooltip = "One of Steele Tech’s newer forays into the transformatives market, Lupinol caters to those seeking a full-fledged werewolf transformation without the psychological side-effects common to previous versions of such transformatives. It’s quickly become wildly popular among members of ausar counterculture.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 500;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// The Idea: Walt’s custom TF item, producing a full anthro werewolf.
			
			if(!(target is PlayerCharacter))
			{
				clearOutput();
				output(target.capitalA + target.short + " drinks the bottle of Lupinol to no effect.");
			}
			else
			{
				clearOutput();
				kGAMECLASS.showName("\nLUPINOL");
				author("Couch");
				
				var i:int = 0;
				var tfList:Array = [];
				var select:int = 0;
				
				// Effects
				// Chosen at random, once per proc:
				
				// PC does not have fur:
				// Grow silver, gray, black, or white fur.
				if(target.skinType != GLOBAL.SKIN_TYPE_FUR) tfList.push(1);
				// PC has fur and PC’s fur is a color other than silver, gray, black, or white:
				// Fur becomes silver, gray, black, or white.
				if(target.hasFur() && !InCollection(target.furColor, lupinolFurColors)) tfList.push(2);
				// PC has hair other than standard type:
				// PC’s hair becomes standard hair.
				if(target.hairType != GLOBAL.HAIR_TYPE_REGULAR) tfList.push(3);
				// PC has non-canine legs or a different number of legs than two:
				// PC’s legs become two furred, digitigrade canine legs.
				if(target.legType != GLOBAL.TYPE_LUPINE) tfList.push(4);
				// PC has non-canine or non-furred canine arms:
				// PC gains furred, non-padded canine arms.
				if(target.armType != GLOBAL.TYPE_LUPINE) tfList.push(5);
				// PC has no tail:
				// Grow a canine tail.
				if(!target.hasTail()) tfList.push(6);
				// PC has a non-canine tail:
				// Change any tails to a single canine tail.
				if(target.hasTail() && target.tailType != GLOBAL.TYPE_LUPINE) tfList.push(7);
				// PC has non-canine ears:
				// PC gains canine ears.
				if(target.earType != GLOBAL.TYPE_LUPINE) tfList.push(8);
				// PC has canine ears, fur, and a non-canine face:
				// PC gains a canine face.
				if(target.earType == GLOBAL.TYPE_LUPINE && (target.faceType != GLOBAL.TYPE_LUPINE || target.faceType != GLOBAL.TYPE_WORG)) tfList.push(9);
				// PC has non-canine tongue:
				// PC gains canine tongue.
				if(target.tongueType != GLOBAL.TYPE_CANINE) tfList.push(10);
				// PC has no genitals:
				// PC grows a 6-inch red canine cock with sheath and balls. 25% chance for cock to be black instead.
				if(target.isSexless()) tfList.push(11);
				// PC has non-canine vagina:
				// PC’s vaginas become one pink canine vagina.
				var nonDogVaginas:int = 0;
				if(target.hasVagina())
				{
					for(i = 0; i < target.vaginas.length; i++)
					{
						if(target.vaginas[i].type != GLOBAL.TYPE_CANINE) nonDogVaginas++;
					}
				}
				if(nonDogVaginas > 0) tfList.push(12);
				// PC has non-canine cock:
				// Cock becomes a red or black canine cock with sheath and knot.
				var nonDogCocks:int = 0;
				if(target.hasCock())
				{
					for(i = 0; i < target.cocks.length; i++)
					{
						if(target.cocks[i].cType != GLOBAL.TYPE_CANINE) nonDogCocks++;
					}
				}
				if(nonDogCocks > 0) tfList.push(13);
				// PC has a cock less than ten inches in length:
				// Cock grows by 1-2 inches.
				if(target.cocks.length == 1 && target.cocks[0].cType == GLOBAL.TYPE_CANINE && target.cocks[0].cLengthRaw < (!target.hasPerk("Hung") ? 10 : 18)) tfList.push(14);
				// PC has a cock width multiplier higher than 1:
				// Reduce cock width multiplier towards 1, then if multiplier is less than 1, set it to 1.
				if(target.cocks.length == 1 && target.cocks[0].cType == GLOBAL.TYPE_CANINE && target.cocks[0].cThicknessRatioRaw > 1) tfList.push(15);
				// Tone below 70:
				// Increase tone.
				if(target.tone < 70) tfList.push(16);
				// Thickness above 0:
				// Decrease thickness.
				if(target.thickness > 0) tfList.push(17);
				// None of the above apply:
				// Gain perk “Alpha Scent”
				if(!target.hasPerk("Alpha Scent") && (tfList.length <= 0 || target.canineScore() >= 5)) tfList.push(18);
				
				if(tfList.length > 0) select = tfList[rand(tfList.length)];
				// None of the above apply:
				// Dud result.
				
				// Consumption Text
				output("As you inject yourself with the medipen, a hot sensation swells in the back of your throat like you’d just eaten a whole raw pepper, forcing you into panting in rather canine fashion as the transformations begin.");
				
				goTF(target, select);
			}
			return false;
		}
		
		private var lupinolFurColors:Array = ["silver", "gray", "black", "white"];
		
		private function tailTF(target:Creature, newTailCount:Number = 1):void
		{
			target.tailType = GLOBAL.TYPE_LUPINE;
			target.tailCount = newTailCount;
			target.tailFlags = [];
			target.addTailFlag(GLOBAL.FLAG_LONG);
			target.addTailFlag(GLOBAL.FLAG_FURRED);
			target.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		private function cockTF(target:Creature, makeBlack:Boolean = false):void
		{
			var i:int = 0;
			for(i = 0; i < target.cocks.length; i++)
			{
				target.shiftCock(i, GLOBAL.TYPE_CANINE);
				if(makeBlack) target.cocks[i].cockColor = "black";
				if(target.hasPerk("Mini")) target.cocks[i].cLengthRaw = 4;
				else if(target.hasPerk("Hung")) target.cocks[i].cLengthRaw = 8;
				else target.cocks[i].cLengthRaw = 6;
				target.cocks[i].cThicknessRatioRaw = 1;
			}
		}
		
		private function goTF(target:Creature, select:int = -1):void
		{
			var x:int = 0;
			var i:int = 0;
			var newFurColor:String = RandomInCollection(lupinolFurColors);
			var makeBlack:Boolean = false;
			
			// Grow black, gray, white or silver fur:
			if(select == 1) {
				if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
				{
					output("\n\n");
					if(target.hasScales() || target.hasChitin()) output("Your " + (target.hasScales() ? "scales" : "chitin") + " start to flake away as they heat up, revealing swathes of fresh smooth [pc.skinColor] skin beneath. You’re left confused - wasn’t this supposed to grow fur? - but a second wave of warmth follows just as you finish the thought. ");
					output("Swathes of new " + newFurColor + " fur begin to fill out across your skin, soon spreading to cover you completely in the warm pelt. It’s not quite thick enough to go without a heat belt on an ice world, but it should make you much more comfortable.");
					
					target.skinType = GLOBAL.SKIN_TYPE_FUR;
					target.furColor = newFurColor;
				}
				else output("\n\n" + target.skinTypeLockedMessage());
				return;
			}
			// Change existing fur color to black, gray, white or silver:
			if(select == 2) {
				if(target.furColorUnlocked(newFurColor))
				{
					output("\n\nStreaks of " + newFurColor + " paint themselves across your body like being worked over with a paintbrush, gradually overwriting your " + target.furColor + " fur entirely with a new " + newFurColor + " palette. <b>Your fur is now " + newFurColor + ".</b>");
					
					target.furColor = newFurColor;
				}
				else output("\n\n" + target.furColorLockedMessage());
				return;
			}
			// Standardize hair type:
			if(select == 3) {
				if(target.hairTypeUnlocked(GLOBAL.HAIR_TYPE_REGULAR))
				{
					output("\n\nYour [pc.hair] soon begins to molt; or perhaps melt is a better way to describe how it feels, wicking away under the heat of your scalp to leave your head bare. It doesn’t stay that way for long, as fresh [pc.hairColor] locks grow in in short order, taking the heat with them. In time, the sensation fully fades, leaving you with a new full head of hair.");
					
					target.hairType = GLOBAL.HAIR_TYPE_REGULAR;
					target.hairStyle = "null";
				}
				else output("\n\n" + target.hairTypeLockedMessage());
				return;
			}
			// Change leg type to digitigrade canine:
			if(select == 4) {
				if(target.legTypeUnlocked(GLOBAL.TYPE_LUPINE))
				{
					output("\n\nYour " + (target.legCount == 1 ? "[pc.leg] is" : "[pc.legs] are") + " peppered with shocks that force you to sit, your muscles spasming uncontrollably. You watch as your lower body twists and morphs, forming into");
					if(target.legCount <= 2) output(" a pair of");
					output(" digitigrade legs coated in silky [pc.furColor] fur. Each bears three large, thick toes tipped with distinctly lupine claws, further distinguishing them from an ausar’s legs. You soon get on your feet to get the hang of walking with <b>your new lupine legs.</b>");
					
					if(target.legCount < 2)
					{
						target.legCount = 2;
						target.genitalSpot = 0;
					}
					target.legType = GLOBAL.TYPE_LUPINE;
					target.legFlags = [];
					target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					target.addLegFlag(GLOBAL.FLAG_PAWS);
					target.addLegFlag(GLOBAL.FLAG_FURRED);
				}
				else output("\n\n" + target.legTypeLockedMessage());
				return;
			}
			// Change arm type to furred canine, no pads:
			if(select == 5) {
				if(target.armTypeUnlocked(GLOBAL.TYPE_LUPINE))
				{
					output("\n\nYour arms twitch and writhe as they’re covered in a sleek layer of [pc.furColor] fur, your fingernails transforming into thick, wolf-like clawtips.");
					
					target.armType = GLOBAL.TYPE_LUPINE;
					target.armFlags = [];
					target.addArmFlag(GLOBAL.FLAG_FURRED);
				}
				else output("\n\n" + target.armTypeLockedMessage());
				return;
			}
			// Grow canine tail:
			if(select == 6) {
				if(target.tailCountUnlocked(1))
				{
					output("\n\nYou feel a sudden urge to wag your non-existent tail, but your body soon sets to fixing that. Each twitch of your back muscles pushes a bit more of a nub out from your backside, filling in with a thick coating of fluffy fur to complete the emergence of your new wolf tail.");
					
					tailTF(target);
				}
				else output("\n\n" + target.tailCountLockedMessage());
				return;
			}
			// Change existing tails to single canine tail:
			if(select == 7) {
				if(target.tailTypeUnlocked(GLOBAL.TYPE_LUPINE))
				{
					output("\n\nYour " + (target.tailCount == 1 ? "tail feels" : "tails feel") + " the urge to wag back and forth, each time bringing a more and more distinctly canine appearance to your backside. By the time the wagging stops you’ve been left with a");
					if(target.tailCount != 1) output(" single");
					output(" fluffy wolf tail, thick and bushy. <b>You now have a wolf tail.</b>");
					
					target.removeTails();
					tailTF(target);
				}
				else output("\n\n" + target.tailTypeLockedMessage());
				return;
			}
			// Change ear type to canine ears:
			if(select == 8) {
				if(target.earTypeUnlocked(GLOBAL.TYPE_LUPINE))
				{
					output("\n\nYour ears perk upwards, higher and higher until they sit nearly at the top of your head. The tips continue to stretch upward as they streamline into a pair of triangular wolf ears, coated in a thin layer of fur.");
					
					target.earType = GLOBAL.TYPE_LUPINE;
				}
				else output("\n\n" + target.earTypeLockedMessage());
				return;
			}
			// Get canine face:
			if(select == 9) {
				if(target.faceTypeUnlocked(GLOBAL.TYPE_LUPINE))
				{
					output("\n\nYou feel the need to pant harder, your jaw hanging open as your face widens and elongates into a new lupine muzzle, <b>leaving you with a very wolf-like face</b>.");
					
					target.faceType = GLOBAL.TYPE_LUPINE;
					target.faceFlags = [];
					target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					//target.addFaceFlag(GLOBAL.FLAG_LONG);
				}
				else output("\n\n" + target.faceTypeLockedMessage());
				return;
			}
			// Gain canine tongue:
			if(select == 10) {
				if(target.tongueTypeUnlocked(GLOBAL.TYPE_CANINE))
				{
					output("\n\nYour tongue hangs out of your mouth as you pant, growing");
					if(!target.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" longer and");
					output(" flatter as new muscles take shape within it to give you much more control over your new asset. <b>You now have a canine tongue.</b>");
					
					target.tongueType = GLOBAL.TYPE_CANINE;
					target.tongueFlags = [];
					target.addTongueFlag(GLOBAL.FLAG_LONG);
				}
				else output("\n\n" + target.tongueTypeLockedMessage());
				return;
			}
			// No genitals, gain canine cock with sheath and balls:
			if(select == 11) {
				if(target.createVaginaUnlocked(1))
				{
					makeBlack = (rand(4) == 0);
					
					output("\n\nA bulge forms upon the featureless mound between your thighs as the skin starts to thicken, forming into a plump furry sheath. You feel an intense heat and churning sensation inside it, new organs taking shape one after another.");
					if(target.balls <= 0) output(" A sudden pressure makes you let out a yipe as a thick nut drops into your new ballsack, followed by another.");
					else if(target.balls == 1) output(" A sudden pressure in your ballsack makes you let out a yipe as another thick testicle drops into it.");
					output(" Finally the shaft that’s been taking shape within your sheath emerges");
					if(!makeBlack) output(", bloody red with pulsating veins visible just below the surface");
					else output(", sleek and black as pitch");
					output(", the tip coming to a nice sharp point perfect for penetrating any hole no matter how tight. The knot at your base is throbbing, eager and ready to plunge itself into an eager cunt and swell until it’s locked in tight. <b>You now have a canine dick.</b>");
					
					target.createCock();
					cockTF(target, makeBlack);
					if(target.balls < 2) target.balls = 2;
					if(!target.hasPerk("Bulgy"))
					{
						if(target.ballSizeRaw < 4) target.ballSizeRaw = 4;
					}
					else
					{
						if(target.ballSizeRaw < 8) target.ballSizeRaw = 8;
					}
				}
				else output("\n\n" + target.createVaginaLockedMessage());
				return;
			}
			// Convert existing vaginas to one pink canine vagina:
			if(select == 12) {
				if(target.removeVaginasUnlocked())
				{
					output("\n\n[pc.EachVagina] suddenly squirms as " + (target.vaginas.length == 1 ? "it reshapes itself" : "they reshape themselves, merging together") + ". What you’re left with can only be described as a bitch’s cunt, with lips that feel ready to swell invitingly for any cock ready to breed them. <b>You now have a canine cunt</b>.");
					
					target.removeVaginas();
					target.createVagina();
					target.shiftVagina(0, GLOBAL.TYPE_CANINE);
				}
				else output("\n\n" + target.removeVaginasLockedMessage());
				return;
			}
			// Convert existing cocks to one red or black canine cock with sheath:
			if(select == 13) {
				if(target.removeCocksUnlocked())
				{
					makeBlack = (rand(4) == 0);
					
					output("\n\nHeat pools within [pc.eachCock],");
					if(target.hasFullSheaths()) output(" making " + (target.cocks.length == 1 ? "it" : "them") + " retreat into your sheath");
					else output(" the skin thickening up around " + (target.cocks.length == 1 ? "it" : "them") + " into a fleshy container as you grow a sheath");
					output(". Within you feel your groin roiling with heat, your malehood reshaping until what emerges is a");
					if(target.cocks.length != 1) output(" single");
					output(" glorious spire,");
					if(!makeBlack) output(" bloody red with pulsating veins visible just below the surface");
					else output(" sleek and black as pitch");
					output(". The tip is a sharp point perfect for penetrating any hole no matter how tight, while the base throbs with a lump of flesh eager to swell until you’re good and tied, leaving you free to baste a cunt with your seed for minutes on end. You can’t help but feel a swell of pride at <b>your brand new wolf dick</b>.");
					
					target.removeCocks();
					target.createCock();
					cockTF(target, makeBlack);
				}
				else output("\n\n" + target.removeCocksLockedMessage());
				return;
			}
			// Grow towards 10 inches:
			if(select == 14) {
				var addCockLength:Number = (1 + rand(2));
				if(target.hasPerk("Hung")) addCockLength += (1 + rand(2));
				var newCockLength:Number = target.cocks[0].cLengthRaw + addCockLength;
				if(target.cockLengthUnlocked(0, newCockLength))
				{
					output("\n\nMore dick spills forth from your " + (target.hasSheath(0) ? "[pc.sheath]" : "groin") + ", leaving you with another " + num2Text(addCockLength) + " inch" + (addCockLength == 1 ? "" : "es") + " of dogmeat to play with.");
					
					target.cocks[0].cLengthRaw = newCockLength;
				}
				else output("\n\n" + target.cockLengthLockedMessage());
				return;
			}
			// Reduce cock thickness multiplier, floor at 1:
			if(select == 15) {
				var newCockThickness:Number = target.cocks[0].cThicknessRatioRaw - 0.5;
				if(newCockThickness < 1) newCockThickness = 1;
				if(target.cockThicknessUnlocked(0, newCockThickness))
				{
					output("\n\nYour cock compresses inward, losing some of its excess thickness as it changes to a more normal girth for its length.");
					
					target.cocks[0].cThicknessRatioRaw = newCockThickness;
				}
				else output("\n\n" + target.cockThicknessLockedMessage());
				return;
			}
			// Increase tone towards 70:
			if(select == 16) {
				var newTone:Number = target.tone + (2 + rand(4));
				if(target.toneUnlocked(newTone))
				{
					output("\n\n");
					if(newTone < 50) output("A bit of your softness seems to melt away, letting your muscles show through more clearly.");
					else output("Your muscles tighten, turning denser and heavier as they grow ever more defined.");
					
					if(newTone > 100) newTone = 100;
					target.tone = newTone;
				}
				else output("\n\n" + target.toneLockedMessage());
				return;
			}
			// Decrease thickness towards 0:
			if(select == 17) {
				var newThickness:Number = target.thickness - (2 + rand(4));
				if(target.thicknessUnlocked(newThickness))
				{
					output("\n\nYour body feels like it’s compacting,");
					if(newThickness >= 50) output(" making you significantly less wide-bodied.");
					else output(" getting sleeker and more agile-looking by the moment. Of course, a hunter should be nice and lean.");
					
					if(newThickness > 100) newThickness = 100;
					target.thickness = newThickness;
				}
				else output("\n\n" + target.thicknessLockedMessage());
				return;
			}
			// Gain “Alpha Scent” perk
			if(select == 18) {
				output("\n\nYou notice an odd scent in the air, before realizing it’s coming from your own body. It’s a mixture of " + target.mf("masculine musk", "feminine fragrance") + " with something like honey, and a third piece you can’t quite describe. It makes you feel confident and commanding, like you’re an alpha wolf, master of your pack. Oh, you could definitely get used to smelling like this.");
				output("\n\n(<b>Perk Gained: Alpha Scent</b> - Your body exudes pheromones that give you a distinctively commanding scent.)");
				// New Perk
				// Alpha Scent
				// Unlocks teases that require pheromones, counts as Pheromone Cloud for sex scenes and dialogue events.
				target.createPerk("Alpha Scent", 0, 0, 0, 0, "Your body produces pheromones that give you a distinctively commanding scent.");
				return;
			}
			
			// Dud result:
			output("\n\nEventually you stop panting, with no changes that you can detect. You must be as wolfy as they come.");
		}
	}
}

