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
	
	public class Holstaria extends ItemSlotClass
	{
		public function Holstaria()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "Holstaria";
			longName = "Holstaria";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bottle of Holstaria";
			tooltip = "This is a small bottle the size of an energy drink, labeled with the Steele Tech logo, along with a warning label about its prototype status. The drink contains an abundance of highly dense proteins and microsurgeons used to produce transformation into a tall, muscular and curvaceous cowgirl.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 500;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			// The Idea: Cynthia’s custom TF item, producing a heavily muscular and curvaceous furry cowgirl.
			
			if(!(target is PlayerCharacter))
			{
				clearOutput();
				output(target.capitalA + target.short + " drinks the bottle of Holstaria to no effect.");
			}
			else
			{
				clearOutput();
				kGAMECLASS.showName("\nHOLSTARIA");
				author("Couch");
				
				var i:int = 0;
				var tfList:Array = [];
				var select:int = 0;
				
				// Effects
				// Chosen at random, once per proc:
				
				// PC has non-black skin, lips, or nipples:
				// Change skin, lips, and nipples to black.
				if(target.skinTone != "black" || target.lipColor != "black" || target.nippleColor != "black") tfList.push(1);
				// PC does not have fur:
				// Grow brown, black, or black and white fur.
				if(target.skinType != GLOBAL.SKIN_TYPE_FUR) tfList.push(2);
				// PC has fur and PC’s fur is a color other than brown, black, or black and white:
				// Fur becomes brown, black, or black and white.
				if(target.hasFur() && !InCollection(target.furColor, holstariaFurColors)) tfList.push(3);
				// PC has hair other than standard type:
				// PC’s hair becomes standard hair.
				if(target.hairType != GLOBAL.HAIR_TYPE_HAIR) tfList.push(4);
				// PC has non-bovine legs or a different number of legs than two:
				// PC’s legs become two furred bovine legs.
				if(target.legType != GLOBAL.TYPE_BOVINE) tfList.push(5);
				// PC has non-human or non-furred human arms:
				// PC gains furred human arms.
				if(target.armType != GLOBAL.TYPE_HUMAN || !target.hasArmFlag(GLOBAL.FLAG_FURRED)) tfList.push(6);
				// PC has no tail:
				// Grow a cow tail.
				if(!target.hasTail()) tfList.push(7);
				// PC has a non-cow tail:
				// Change any tails to a single cow tail.
				if(target.hasTail() && target.tailType != GLOBAL.TYPE_BOVINE) tfList.push(8);
				// PC has non-cow ears:
				// PC gains cow ears.
				if(target.earType != GLOBAL.TYPE_BOVINE) tfList.push(9);
				// PC has cow ears and a non-bovine face:
				// PC gains a bovine face.
				if(target.earType == GLOBAL.TYPE_BOVINE && target.faceType != GLOBAL.TYPE_BOVINE) tfList.push(10);
				// PC does not have horns:
				// Grow a pair of one-inch cow horns.
				if(target.horns == 0) tfList.push(11);
				// PC has non-cow horns:
				// Change horns to a pair of one-inch cow horns.
				if(target.hasHorns() && target.hornType != GLOBAL.TYPE_BOVINE) tfList.push(12);
				// PC has cow horns less than 12 inches long:
				// Grow horns 1-3 inches, then reduce horn length to 12 if over 12
				if(target.hasHorns(GLOBAL.TYPE_BOVINE) && target.hornLength < 12) tfList.push(13);
				// PC has no genitals:
				// PC grows a black gabilani vagina with one level of pumping.
				if(target.isSexless()) tfList.push(14);
				// PC has non-gabilani vagina, vagina is not black, or vagina is not pumped:
				// PC’s vaginas become one black gabilani vagina with one level of pumping.
				var nonCowVaginas:int = 0;
				var slightlyPumpedVaginas:int = 0;
				if(target.hasVagina())
				{
					for(i = 0; i < target.vaginas.length; i++)
					{
						if(target.vaginas[i].type != GLOBAL.TYPE_GABILANI || target.vaginas[i].vaginaColor != "black" || (!target.vaginas[i].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !target.vaginas[i].hasFlag(GLOBAL.FLAG_PUMPED))) nonCowVaginas++;
					}
				}
				if(nonCowVaginas > 0) tfList.push(15);
				// PC’s vagina is pumped once:
				// Pump vagina.
				if(target.vaginas.length == 1 && target.vaginas[0].type == GLOBAL.TYPE_GABILANI && target.vaginas[0].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) && !target.vaginas[0].hasFlag(GLOBAL.FLAG_PUMPED)) tfList.push(16);
				// PC has a cock:
				// Shrink cock by 2-4 inches. Remove cock once below 3 inches, remove balls and grow one black pumped gabilani vagina if this leaves the PC with no genitals.
				if(target.hasCock()) tfList.push(17);
				// PC is below 100 femininity:
				// Increase femininity.
				if(target.femininity < 100) tfList.push(18);
				// Breasts below size 22:
				// Increase bust size.
				if(target.bRatingRaw(target.biggestTitRow()) < 22) tfList.push(19);
				// Breasts above size 4, not lactating:
				// Begin lactation, change milk to normal milk.
				if(target.bRatingRaw(target.biggestTitRow()) > 4 && !target.isLactating()) tfList.push(20);
				// Lactating:
				// Increase lactation.
				if(target.isLactating() && target.milkMultiplier < 200) tfList.push(21);
				// Milk type not milk:
				// Change to milk.
				if(target.milkType != GLOBAL.FLUID_TYPE_MILK) tfList.push(22);
				// Height below 96:
				// Increase height.
				if(target.tallness < 96) tfList.push(23);
				// Tone below 100:
				// Increase tone.
				if(target.tone < 100) tfList.push(24);
				// Thickness below 100:
				// Increase thickness.
				if(target.thickness < 100) tfList.push(25);
				// Hips below size 20:
				// Increase hip size.
				if(target.hipRatingRaw < 20) tfList.push(26);
				// Ass below size 16:
				// Increase ass size.
				if(target.buttRatingRaw < 16) tfList.push(27);
				// Ass above size 10 and tone above 70:
				if(target.buttRating() > 10 && target.tone >= 70) {
					// Gain “Bubble Butt” perk.
					if(!target.hasPerk("Bubble Butt") && !target.hasPerk("Buns of Steel")) tfList.push(28);
					// Lose “Buns of Steel” perk.
					if(target.hasPerk("Buns of Steel")) tfList.push(29);
				}
				
				if(tfList.length > 0) select = tfList[rand(tfList.length)];
				// None of the above apply:
				// Dud result.
				
				//Consumption Text
				output("You gulp down the thick, sticky drink, its milky flavor clinging to your throat. Soon your stomach grows warm, followed by the rest of your body as the microsurgeons set to work.");
				
				goTF(target, select);
			}
			return false;
		}
		
		private var holstariaFurColors:Array = ["brown", "black", "black and white"];
		
		private function tailTF(target:Creature, newTailCount:Number = 1):void
		{
			target.tailType = GLOBAL.TYPE_BOVINE;
			target.tailCount = newTailCount;
			target.tailFlags = [];
			target.addTailFlag(GLOBAL.FLAG_LONG);
			target.addTailFlag(GLOBAL.FLAG_FLUFFY);
		}
		private function hornTF(target:Creature, newHorns:Number = 2, newHornLength:Number = 1):void
		{
			target.removeHorns();
			target.hornType = GLOBAL.TYPE_BOVINE;
			target.hornLength = newHornLength;
			target.horns = newHorns;
		}
		private function vaginaTF(target:Creature):void
		{
			var i:int = 0;
			for(i = 0; i < target.vaginas.length; i++)
			{
				target.shiftVagina(i, GLOBAL.TYPE_GABILANI);
				target.vaginas[i].vaginaColor = "black";
				target.vaginas[i].addFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
			}
		}
		
		private function goTF(target:Creature, select:int = -1):void
		{
			var x:int = 0;
			var i:int = 0;
			var newFurColor:String = RandomInCollection(holstariaFurColors);
			
			// Change skin, lips and nipples to black:
			if(select == 1) {
				if(target.skinToneUnlocked("black") && target.nippleColorUnlocked("black"))
				{
					output("\n\nThe heat concentrates in your skin");
					if(target.hasScales() || target.hasChitin()) output(" under your [pc.skinFurScalesNoun]");
					output(", seeming to scorch the color out of it. Even your lips and nipples darken as they turn pure black, providing you with an inhumanly uniform coloration");
					if(target.hasFur()) output(" that goes perfectly with your [pc.furColor] coat");
					else output(" that you imagine is preparing your body for a fur coat");
					output(".");
					
					target.skinTone = "black";
					target.lipColor = "black";
					target.nippleColor = "black";
				}
				else if(!target.skinToneUnlocked("black")) output("\n\n" + target.skinToneLockedMessage());
				else output("\n\n" + target.nippleColorLockedMessage());
				return;
			}
			// Grow fur:
			if(select == 2) {
				if(target.skinTypeUnlocked(GLOBAL.SKIN_TYPE_FUR))
				{
					output("\n\n");
					if(target.hasScales() || target.hasChitin()) output("Your " + (target.hasScales() ? "scales" : "chitin") + " start to flake away as they heat up, revealing swathes of fresh smooth [pc.skinColor] skin beneath. You’re left confused - wasn’t this supposed to grow fur? - but a second wave of warmth follows just as you finish the thought. ");
					output("Swathes of new " + newFurColor + " fur begin to fill out across your skin, soon spreading to cover you completely in the warm pelt. It’s not quite thick enough to go without a heat belt on an ice world, but it should make you much more comfortable.");
					
					target.skinType = GLOBAL.SKIN_TYPE_FUR;
					target.furColor = newFurColor;
					target.clearSkinFlags();
				}
				else output("\n\n" + target.skinTypeLockedMessage());
				return;
			}
			// Fur color:
			if(select == 3) {
				if(target.furColorUnlocked(newFurColor))
				{
					output("\n\nYour fur tingles as a drop of bovine " + newFurColor + " forms at your chest, flowing outward to cover your entire body in the new palette. <b>Your fur is now " + newFurColor + ".</b>");
					
					target.furColor = newFurColor;
				}
				else output("\n\n" + target.furColorLockedMessage());
				return;
			}
			// Standardize hair type:
			if(select == 4) {
				if(target.hairTypeUnlocked(GLOBAL.HAIR_TYPE_HAIR))
				{
					output("\n\nYour [pc.hair] soon begins to molt; or perhaps melt is a better way to describe how it feels, wicking away under the heat of your scalp to leave your head bare. It doesn’t stay that way for long, as fresh [pc.hairColor] locks grow in in short order, taking the heat with them. In time, the sensation fully fades, leaving you with a new full head of hair.");
					
					target.hairType = GLOBAL.HAIR_TYPE_HAIR;
					target.hairStyle = "null";
				}
				else output("\n\n" + target.hairTypeLockedMessage());
				return;
			}
			// Change leg type:
			if(select == 5) {
				if(target.legTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("\n\nYour " + (target.legCount == 1 ? "[pc.leg] quakes" : "[pc.legs] quake") + " under you, prompting you to hurry and sit down before you collapse. You watch as your lower body twists and morphs, forming into");
					if(target.legCount <= 2) output(" a pair of");
					output(" unguligrade legs each capped with a thick, powerful hoof. A layer of [pc.furColor] fur soon grows in over the skin, <b>leaving you with a decidedly bovine " + (target.legCount <= 2 ? "pair" : "set") + " of legs.</b>");
					
					if(target.legCount < 2)
					{
						target.legCount = 2;
						target.genitalSpot = 0;
					}
					target.legType = GLOBAL.TYPE_BOVINE;
					target.legFlags = [];
					target.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
					target.addLegFlag(GLOBAL.FLAG_HOOVES);
					target.addLegFlag(GLOBAL.FLAG_FURRED);
				}
				else output("\n\n" + target.legTypeLockedMessage());
				return;
			}
			// Change arm type:
			if(select == 6) {
				if(target.armType == GLOBAL.TYPE_HUMAN || target.armTypeUnlocked(GLOBAL.TYPE_HUMAN))
				{
					output("\n\nYour arms feel sluggish as they warm up, making it a struggle to lift them. You watch as they shift into a form identical to a human’s, but coated with a thin layer of [pc.furColor] fur.");
					
					target.armType = GLOBAL.TYPE_HUMAN;
					target.armFlags = [];
					target.addArmFlag(GLOBAL.FLAG_FURRED);
				}
				else output("\n\n" + target.armTypeLockedMessage());
				return;
			}
			// Grow cow tail:
			if(select == 7) {
				if(target.tailCountUnlocked(1))
				{
					output("\n\nThe heat concentrates just above your ass, at the base of your spine. Heat soon begets pressure that prompts you to groan, straining with muscles you didn’t know you had. Each push makes the lump forming at your tailbone jut out a little further, until finally you feel a satisfying pop and look behind you to see the last of <b>your new long, ropy cow tail</b> slide out into place.");
					
					tailTF(target);
				}
				else output("\n\n" + target.tailCountLockedMessage());
				return;
			}
			// Change existing tails to single cow tail:
			if(select == 8) {
				if(target.tailTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("\n\nYour " + (target.tailCount == 1 ? "tail feels" : "tails feel") + " hot, twisting and reshaping into a thin, ropy strand. A thin layer of fur grows over the new tail, expanding into a proper puff at the tip. <b>You now have a cow tail.</b>");
					
					target.removeTails();
					tailTF(target);
				}
				else output("\n\n" + target.tailTypeLockedMessage());
				return;
			}
			// Change ear type to cow ears:
			if(select == 9) {
				if(target.earTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("\n\nYour ears migrate to the sides of your head and stretch like warm putty, moulding into <b>a pair of floppy cow ears</b>. A thin layer of fur soon completes the look.");
					
					target.earType = GLOBAL.TYPE_BOVINE;
				}
				else output("\n\n" + target.earTypeLockedMessage());
				return;
			}
			// Get bovine face:
			if(select == 10) {
				if(target.faceTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("\n\nYour face flushes with warmth, so much heat that it numbs all other sensations. You hardly feel a thing as your face pulls outward into a new muzzle to match your ears, <b>leaving you with a very minotaur-like face</b>.");
					
					target.faceType = GLOBAL.TYPE_BOVINE;
					target.faceFlags = [];
					target.addFaceFlag(GLOBAL.FLAG_MUZZLED);
					target.addFaceFlag(GLOBAL.FLAG_LONG);
				}
				else output("\n\n" + target.faceTypeLockedMessage());
				return;
			}
			// Gain cow horns:
			if(select == 11) {
				if(target.hornsUnlocked(2))
				{
					output("\n\nA pair of spots at the top of your head begin to bulge outward as they grow warm. The skin soon splits around a pair of one-inch cow horns");
					if(target.hasHair()) output(", just long enough to peek out from under your [pc.hair]");
					output(". They’re pretty cute.");
					
					hornTF(target);
				}
				else output("\n\n" + target.hornsLockedMessage());
				return;
			}
			// Change horns to two one-inch cow horns:
			if(select == 12) {
				if(target.hornTypeUnlocked(GLOBAL.TYPE_BOVINE))
				{
					output("\n\nYour " + (target.horns == 1 ? "[pc.hornNoun] starts" : "[pc.hornsNoun] start") + " to pull inward, filling your head with an aching pressure that’s relieved by the two new nubs forming on the top of your scalp. Soon enough you’re sporting a new pair of cute little cow horns");
					if(target.hasHair()) output(", just long enough to peek out from under your [pc.hair]");
					output(".");
					
					hornTF(target);
				}
				else output("\n\n" + target.hornTypeLockedMessage());
				return;
			}
			// Grow cow horns by 1-3 inches if below 12, then reduce to 12 if above 12:
			if(select == 13) {
				var addHornLength:Number = 1 + rand(3);
				var newHornLength:Number = target.hornLength + addHornLength;
				if(target.hornLengthUnlocked(newHornLength))
				{
					output("\n\nPressure builds in the base of your horns, prompting you to let out a shuddering moo as they push gradually outwards");
					if(target.hornLength == 1) output(" and curl as they do, changing from cute little cow nubs into proper steer horns");
					output(". ");
					if(newHornLength < 12) output(" By the time the pressure fades, you’ve gotten " + num2Text(addHornLength) + " new inch" + (addHornLength == 1 ? "" : "es") + " of horn.");
					else output(" Finally they emerge at their full magnificent length, standing proudly as foot-long steer horns.");
					
					if(newHornLength > 12) newHornLength = 12;
					target.hornLength = newHornLength;
				}
				else output("\n\n" + target.hornLengthLockedMessage());
				return;
			}
			// Gain black pumped gabilani vagina:
			if(select == 14) {
				if(target.createVaginaUnlocked(1))
				{
					output("\n\nThe featureless mound between your thighs bulges outward ever so slightly as the warmth in your body concentrates there. Just below the surface you feel your insides shifting about, filling you with an odd feminine feeling. Finally your pubic mound creases sharply inward even as the surrounding lips grow bigger and puffier still, spreading apart of their own volition to reveal a black interior glistening with fresh feminine juices. At the touch of your fingers your puffed-up lips start sucking unbidden, laden with hidden muscles that give them perfect suction to go with their silky softness. <b>You’re sporting a brand-new pussy.</b>");
					
					target.createVagina();
					vaginaTF(target);
				}
				else output("\n\n" + target.createVaginaLockedMessage());
				return;
			}
			// Convert existing vaginas to one black pumped gabilani vagina:
			if(select == 15) {
				if(target.removeVaginasUnlocked())
				{
					output("\n\nHeat pools between your legs, [pc.eachVagina] squirming as " + (target.vaginas.length == 1 ? "it reshapes" : "they reshape") + " into an increasingly plump slit. Your pubic mound grows fat and puffy, coming to a sharp inward crease in the middle. Soon your new nether lips spread unbidden as the fresh dick-sucking muscles set to work, revealing the glorious ebony within. <b>You now have a lewdly fat, steamy black cunt</b>.");
					
					target.removeVaginas();
					target.createVagina();
					vaginaTF(target);
				}
				else output("\n\n" + target.removeVaginasLockedMessage());
				return;
			}
			// Double pump pussy:
			if(select == 16) {
				output("\n\nYour cunt engorges as heat floods your mons, pushing ever more lewdly outward. It’s so fat that you can feel your thighs rubbing against the sides of your pussy, the crease getting so deep that you’ll never be able to wear a swimsuit or even tight pants again without giving everyone around you a perfect view of your inhumanly puffy cameltoe.");
				
				target.vaginas[0].delFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED);
				target.vaginas[0].addFlag(GLOBAL.FLAG_PUMPED);
				return;
			}
			// Shrink cock, remove, genderswap:
			if(select == 17) {
				var subCockLength:Number = 2 + rand(3);
				if(target.hasPerk("Mini")) subCockLength += 1 + rand(2);
				var newCockLength:Number = 0;
				var needShrinks:Array = [];
				var penisBegone:Array = [];
				for(i = 0; i < target.cocks.length; i++)
				{
					if(subCockLength > target.cocks[i].cLengthRaw) subCockLength = Math.floor(target.cocks[i].cLengthRaw);
					newCockLength = target.cocks[i].cLengthRaw - subCockLength;
					if(newCockLength >= 3 && target.cockLengthUnlocked(i, newCockLength)) needShrinks.push([i, newCockLength]);
					if(newCockLength < 3 && target.removeCockUnlocked(i, 1)) penisBegone.push(i);
				}
				if((needShrinks.length + penisBegone.length) > 0)
				{
					output("\n\nHeat pools within [pc.eachCock], along with a feeling of slow inward suction. You look down to see your " + (target.cocks.length == 1 ? "cock is" : "cocks are" ) + " being drawn into your body, ");
					if(needShrinks.length > 0) output(" leaving you with " + num2Text(subCockLength) + " fewer inch" + (subCockLength == 1 ? "" : "es") + " by the time the heat fades");
					else output(" until finally disappearing outright");
					output(".");
					if(needShrinks.length > 0 && penisBegone.length > 0) output(".. not only that, but <b>you find you have fewer penises than before</b>...");
					
					for(i = 0; i < needShrinks.length; i++)
					{
						target.cocks[needShrinks[i][0]].cLengthRaw = needShrinks[i][1];
					}
					for(i = (penisBegone.length - 1); i >= 0; i--)
					{
						target.removeCock(penisBegone[i]);
					}
					
					if(!target.hasCock() && target.balls > 0)
					{
						output(" Including the disappearance of your [pc.sack]...");
						target.balls = 0;
					}
					
					// New pussy:
					if(needShrinks.length <= 0 && (!target.hasCock() || target.removeCocksUnlocked()) && !target.hasVagina() && target.createVaginaUnlocked(1))
					{
						output("\n\nBut you’re not done yet. As the last bit of your male endowment vanishes, a new feminine feeling wells up in its place. Your pubic mound puffs outward with new fatness, coming to a sharp inward crease as if sporting tight cameltoe. You marvel as the puffy petals part to reveal a black interior glistening with fresh juices. <b>You’ve grown a pussy!</b>");
						
						if(target.hasCock()) target.removeCocks();
						target.createVagina();
						vaginaTF(target);
					}
					return;
				}
			}
			// Increase femininity towards 100:
			if(select == 18) {
				var newFem:Number = target.femininity + (1 + rand(2));
				if(target.femininityUnlocked(newFem))
				{
					output("\n\nYour face softens, ");
					if(newFem < 50) output("a little of its masculine edge melting away");
					else if(newFem < 85) output("growing less angular and more feminine by the moment");
					else output("making you moan with delight at just how gorgeously girly you’re getting");
					output(".");
					
					if(newFem > 100) newFem = 100;
					target.femininity = newFem;
				}
				else output("\n\n" + target.femininityLockedMessage());
				return;
			}
			// Increase breast size towards 22:
			if(select == 19) {
				var addCups:Number = 1 + rand(3);
				var newCups:Number = 0;
				var bustUp:Array = [];
				for(i = 0; i < target.breastRows.length; i++)
				{
					newCups = target.breastRows[i].breastRatingRaw + addCups;
					if(target.breastRatingUnlocked(i, newCups)) bustUp.push(i);
				}
				if(bustUp.length > 0)
				{
					output("\n\n");
					if(!target.hasBreasts()) output("You feel a budding pressure within your chest as it rounds outwards, forming into a pair of feminine bulges. ");
					
					for(i = 0; i < bustUp.length; i++)
					{
						target.breastRows[bustUp[i]].breastRatingRaw += addCups;
					}
					
					output("You let out a reflexive moo as your breasts expand, feeling light and fluffy as they settle at " + target.breastCup(target.biggestTitRow()) + "s.");
				}
				else output("\n\n" + target.breastRatingLockedMessage());
				return;
			}
			// Start lactation, minimum bust size 4:
			if(select == 20) {
				output("\n\nYour nipples feel oddly hot, a sensation that compels you to reach up and massage them. Soon your fingers are greeted with squirts of fresh cow’s milk. <b>You’ve started lactating, albeit slowly.</b>");
				
				target.boostLactation(50);
				target.milkFullness += 15;
				
				return;
			}
			// Increase lactation:
			if(select == 21) {
				output("\n\nYou let out a lusty moo as [pc.milkNoun] squirts from your nipples unbidden, your breasts growing ever more deliciously full.");
				
				target.boostLactation(5);
				target.milkFullness += 15;
				
				return;
			}
			// Change milk type to milk:
			if(select == 22) {
				if(target.milkTypeUnlocked(GLOBAL.FLUID_TYPE_MILK))
				{
					output("\n\nYou yelp as a sudden hot pressure builds in your chest, forcing your [pc.milkNoun] to start gushing out in massive sprays. You can only hold on to your breasts and watch as the [pc.milkColor] streams gradually turn pure white. Finally the spraying stops when the last of the old color is gone, leaving you with aching nipples that continue to leak small trickles of your new milk for several minutes afterward.");
					
					target.milkType = GLOBAL.FLUID_TYPE_MILK;
				}
				else output("\n\n" + target.milkTypeLockedMessage());
				return;
			}
			// Increase tallness towards 96:
			if(select == 23) {
				var addTallness:Number = 2 + rand(4);
				var newTallness:Number = target.tallness + addTallness;
				if(target.tallnessUnlocked(newTallness))
				{
					output("\n\nYour muscles feel tight, prompting you to stretch. As you do you feel your body expand as if decompressing a spring, raising your viewpoint noticeably higher off the ground. Your Codex confirms that you’ve gotten " + num2Text(addTallness) + " inch" + (addTallness == 1 ? "" : "es") + " taller.");
					
					target.tallness = newTallness;
				}
				else output("\n\n" + target.tallnessLockedMessage());
				return;
			}
			// Increase tone towards 100:
			if(select == 24) {
				var newTone:Number = target.tone + (2 + rand(4));
				if(target.toneUnlocked(newTone))
				{
					output("\n\n");
					if(newTone < 50) output("A bit of your softness seems to melt under the heat, letting the muscles underneath show through more clearly.");
					else output("Heat pools in your muscles, making them surge and sharpen with new definition. You’re looking more ripped by the second.");
					
					if(newTone > 100) newTone = 100;
					target.tone = newTone;
				}
				else output("\n\n" + target.toneLockedMessage());
				return;
			}
			// Increase thickness towards 100:
			if(select == 25) {
				var newThickness:Number = target.thickness + (2 + rand(4));
				if(target.thicknessUnlocked(newThickness))
				{
					output("\n\nYou feel the need to roll your shoulders as they broaden together with your midsection, making you wider and more heavyset.");
					
					if(newThickness > 100) newThickness = 100;
					target.thickness = newThickness;
				}
				else output("\n\n" + target.thicknessLockedMessage());
				return;
			}
			// Increase hip size towards 20:
			if(select == 26) {
				var newHipRating:Number = target.hipRatingRaw + (1 + rand(3));
				if(target.hipRatingUnlocked(newHipRating))
				{
					output("\n\nYou briefly stumble as your stance widens, your hips");
					if(newHipRating < 10) output(" losing some of their former narrowness");
					else if(newHipRating < 15) output(" starting to turn nice and hourglassy");
					else output(" getting so wide that you’re starting to feel like a real breeding cow");
					output(".");
					
					if(newHipRating > 20) newHipRating = 20;
					target.hipRatingRaw = newHipRating;
				}
				else output("\n\n" + target.hipRatingLockedMessage());
				return;
			}
			// Increase ass size towards 16:
			if(select == 27) {
				var newButtRating:Number = target.buttRatingRaw + (1 + rand(3));
				if(target.buttRatingUnlocked(newButtRating))
				{
					output("\n\nYour ass thickens with new girth, stretching outward with each breath you take.");
					if(newButtRating > 12)
					{
						if(!target.hasSoftButt()) output(" It feels nice, but a thought of it being soft and jiggly instead of hard like this flashes through your mind. That would be so much better, wouldn’t it?");
						else output(" It’s huge and fat and oh-so-slappable, just like it should be. Just the thought of getting spanked with an ass like this makes you let out an eager moo.");
					}
					
					if(newButtRating > 16) newButtRating = 16;
					target.buttRatingRaw = newButtRating;
				}
				else output("\n\n" + target.buttRatingLockedMessage());
				return;
			}
			// Gain Bubble Butt perk, requires at least 70 tone and ass above size 10:
			if(select == 28) {
				output("\n\nYour ass tightens, the muscles compacting inward over and over again until they settle in at a perfectly trim, tight shape. You’re confused: isn’t it supposed to make you bigger?");
				output("\n\nA moment later, bigger is exactly what you get. A new layer of fat forms over your ass and only your ass, ballooning outwards until your backside is just as huge as before, maybe even bigger. You reach back to give it an experimental spank and are rewarded with the absolute delight of a big, <i>fat</i> booty quaking under your palm. You flex your other arm, delighting in the contrast between your well-toned muscles and your newly soft backside.");
				output("\n\n(<b>Perk Gained: Bubble Butt</b> - Ass remains soft regardless of muscle tone.)");
				// New Perk
				// Bubble Butt
				// Causes the PC’s ass to be considered soft even when they have high muscle tone.
				target.createPerk("Bubble Butt", 0, 0, 0, 0, "Your ass is always soft, regardless of tone.");
				return;
			}
			// Lose Buns of Steel perk:
			if(select == 29) {
				output("\n\nA shiver runs across your [pc.butts] and suddenly they don’t feel as extra tight and firm as they did before... You suppose this is one of the side effects of the Holstaria drink....");
				output("\n\n(<b>Perk Lost: Buns of Steel</b>)");
				
				target.removePerk("Buns of Steel");
				return;
			}
			
			// Dud result:
			output("\n\nHeat courses through your frame, then eventually fades out. You must be as beefy as you can be.");
		}
	}
}

