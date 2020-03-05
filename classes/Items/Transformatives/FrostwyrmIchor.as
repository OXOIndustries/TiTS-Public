package classes.Items.Transformatives
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.Creature;
	import classes.GameData.TooltipManager;
	import classes.Characters.PlayerCharacter;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.clearOutput;
	import classes.Engine.Utility.rand;
	import classes.Util.RandomInCollection;
	import classes.StringUtil;
	import classes.CockClass;
	import classes.VaginaClass;
	
	public class FrostwyrmIchor extends ItemSlotClass
	{
		public function FrostwyrmIchor()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Frst. Ichor";
			//Regular name
			this.longName = "Frostwyrm Ichor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen of Frostwyrm Ichor";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a medipen filled with an unusual glowing blue-green liquid and labeled with the Steele Tech logo, along with a disclaimer regarding its current trial status. Injecting it will cause the user to transform into a form based off the legendary frostwyrm of Uveto. It also comes with special dietary instructions, recommending that users should add a small amount of liquified savicite to their water.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 10000;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			var possibleChanges:Array = new Array();
			var i:int;
			
			if (!(target is PlayerCharacter))
			{
				output("<b>Item cannot be used on NPCs</b>");
				return false;
			}
			
			var pc:Creature = target;
			
			author("Couch");
			output("You put the medipen to your arm and inject its contents. A cold feeling washes through you, but soon passes as the changes begin.");
			
			if (pc.scaleColorUnlocked("white"))
			{
				//PC does not have scales:
				if (!pc.hasScales())
				{
					if (pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SCALES)) possibleChanges.push(gainScales);
				}
				//PC has scales that are not white:
				else if (pc.scaleColor != "white") possibleChanges.push(colorScales);
			}

			//PC’s skin is not pale blue or PC’s nipple color does not contain the string “blue”:
			if (pc.skinToneUnlocked("pale blue") && pc.skinTone != "pale blue") possibleChanges.push(colorSkin);
			else if (pc.nippleColor.indexOf("blue") < 0 && pc.nippleColorUnlocked("blue"))
				possibleChanges.push(colorSkin);
			//Extra
			else if (pc.lipColor.indexOf("blue") < 0) possibleChanges.push(colorSkin);
			else
			{
				var humanGinas:Boolean = false;
				for each (var vag:VaginaClass in pc.vaginas)
					if (vag.vaginaColor != "bluish-pink" && vag.type == GLOBAL.TYPE_HUMAN)
						humanGinas = true;
				if (humanGinas) possibleChanges.push(colorSkin);
			}

			//PC has eyes other than frostwyrm eyes:
			if (pc.eyeTypeUnlocked(GLOBAL.TYPE_FROSTWYRM) && pc.eyeColorUnlocked("glowing red"))
			{
				if (pc.eyeType != GLOBAL.TYPE_FROSTWYRM) possibleChanges.push(specialEyes);
				//Extra
				if (pc.eyeColor != "glowing red") possibleChanges.push(specialEyes);
			}

			//Has hair.
			if (pc.hasHair() && pc.hairLengthUnlocked(0)) possibleChanges.push(baldenize);
			
			if (pc.hornType != GLOBAL.TYPE_FROSTWYRM && pc.hornsUnlocked(2) && pc.hornLengthUnlocked(12) && pc.hornTypeUnlocked(GLOBAL.TYPE_FROSTWYRM)) possibleChanges.push(makePCHorny);

			//PC has non-frostwyrm legs or a different number of legs than two:
			if (pc.legTypeUnlocked(GLOBAL.TYPE_FROSTWYRM) && pc.legCountUnlocked(2))
			{
				if (pc.legType != GLOBAL.TYPE_FROSTWYRM) possibleChanges.push(giveThePCALegUp);
				else if (pc.legCount != 2) possibleChanges.push(giveThePCALegUp);
			}
			
			//PC has non-frostwyrm arms:
			if (pc.armTypeUnlocked(GLOBAL.TYPE_FROSTWYRM) && pc.armType != GLOBAL.TYPE_FROSTWYRM)
				possibleChanges.push(armThePC);

			//PC has non-frostwyrm ears:
			if (pc.earType != GLOBAL.TYPE_FROSTWYRM)
			{
				if (pc.earTypeUnlocked(GLOBAL.TYPE_FROSTWYRM)) possibleChanges.push(canYouEarMe);
			}
			//PC has frostwyrm ears and has a non-frostwyrm face:
			else if (pc.faceTypeUnlocked(GLOBAL.TYPE_FROSTWYRM) && pc.faceType != GLOBAL.TYPE_FROSTWYRM)
			{
				possibleChanges.push(noYourFaceIsAFrostwyrm);
			}

			//PC has non-frostwyrm tongue:
			//Or is missing one of the flags -LF
			if (pc.tongueTypeUnlocked(GLOBAL.TYPE_FROSTWYRM))
			{
				if (pc.tongueType != GLOBAL.TYPE_FROSTWYRM) possibleChanges.push(longTong);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) possibleChanges.push(longTong);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) possibleChanges.push(longTong);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_SQUISHY)) possibleChanges.push(longTong);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) possibleChanges.push(longTong);
			}

			//PC does not have a tail:
			//PC has non-frostwyrm tail(s):
			if (pc.tailCountUnlocked(1) && pc.tailTypeUnlocked(GLOBAL.TYPE_FROSTWYRM))
			{
				if (!pc.hasTail()) possibleChanges.push(taaaaail);
				else if (pc.tailType != GLOBAL.TYPE_FROSTWYRM) possibleChanges.push(taaaaail);
			}
			
			//PC does not have wings:
			//PC has non-frostwyrm wings:
			if (pc.wingTypeUnlocked(GLOBAL.TYPE_FROSTWYRM))
			{
				if (pc.wingCount != 2) possibleChanges.push(wingSwinging);
				if (pc.wingType != GLOBAL.TYPE_FROSTWYRM) possibleChanges.push(wingSwinging);
			}

			if (pc.hasCock())
			{
				//PC has a cock but does not have a genital slit:
				if (!pc.hasStatusEffect("Genital Slit")) possibleChanges.push(growSlit);
				else
				{
					var cockChange:Boolean = false;
					var cockGrowth:Boolean = false;
					var cockLength:int = 0;
					for (i = 0; i < pc.cocks.length; ++i)
					{
						//PC has a non-frostwyrm cock and a genital slit:
						if (pc.cocks[i].cType != GLOBAL.TYPE_FROSTWYRM && pc.cockTypeUnlocked(i, GLOBAL.TYPE_FROSTWYRM)) cockChange = true; //This cock's a go
						//PC’s cock is less than 12 inches in length and has a slit:
						cockLength = pc.cocks[i].cLength();
						if (cockLength < 12 && (pc.cockLengthUnlocked(i, Math.min(12, cockLength+1)) || pc.cockLengthUnlocked(i, Math.min(12, cockLength+1)))) cockGrowth = true;
					}
					//If we got a cock that's a go, go.
					if (cockChange) possibleChanges.push(dragonDick);
					if (cockGrowth) possibleChanges.push(lengthenDick);
				}
				if (pc.balls < 1 && pc.ballsUnlocked(2)) possibleChanges.push(growSomeBallsAlready);
			}
			else if (pc.cockTypeUnlocked(0, GLOBAL.TYPE_FROSTWYRM) && pc.createCockUnlocked(1))
			{
				possibleChanges.push(growADragonDick);
			}

			//PC has a non-frostwyrm vagina:
			if (pc.hasVagina())
			{
				var vaginaChange:Boolean = false;
				for (i = 0; i < pc.vaginas.length; ++i)
					if (pc.vaginaTypeUnlocked(i, GLOBAL.TYPE_FROSTWYRM) && (pc.vaginas[i].type != GLOBAL.TYPE_FROSTWYRM || pc.vaginas[i].vaginaColor.indexOf("pink") < 0 || pc.vaginas[i].clits != 1))
						vaginaChange = true;
				if (vaginaChange) possibleChanges.push(colorGina);
			}
			//is 1 the right argument for createVaginaUnlocked? 9999
			else if (pc.vaginaTypeUnlocked(0, GLOBAL.TYPE_FROSTWYRM) && pc.createVaginaUnlocked(1))
			{
				possibleChanges.push(growCunt);
			}

			//PC is less than 102 inches in height:
			if (pc.tallness < 102)
			{
				var grow:Boolean = false;
				//Check 2, 3, and 4 inches taller
				for (i = pc.tallness + 2; i < pc.tallness + 5 && i < 103; ++i)
					if (pc.tallnessUnlocked(i)) grow = true;
				if (grow) possibleChanges.push(growPCGrow);
			}

			if (possibleChanges.length > 0) RandomInCollection(possibleChanges)(pc);
			else dudResult();
			
			return false;
		}

		//Gain scales:
		private function gainScales(pc:Creature):void
		{
			output("\n\nYour [pc.skinFurScalesNoun] feels dry and flaky");
			if (pc.hasFur()) output(", your fur starting to fall out in clumps to reveal the bare [pc.skinColor] skin underneath");
			output(". You lift up your arm to watch as white patches begin to form on your skin, hardening into an interlocking pattern of snow-white scales. As you turn you see the scales shimmer a bit in the light with beautiful shades of silver and blue. <b>You have white scales!</b>");
			
			pc.clearSkinFlags();
			pc.skinType = GLOBAL.SKIN_TYPE_SCALES;
			pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
			pc.addSkinFlag(GLOBAL.FLAG_THICK);
			pc.scaleColor = "white";
		}

		//Bleach scales:
		private function colorScales(pc:Creature):void
		{
			output("\n\nThe chill seems to have left you looking a little pale. You watch as all the color slowly bleaches out of your scales, leaving them a flawless snowy white color that shimmers with silver and blue in the light. <b>You’ve got white scales now!</b>");
			
			pc.scaleColor = "white";
		}

		//Blue-ify skin: 
		private function colorSkin(pc:Creature):void
		{
			output("\n\nAn intense sensation of cold washes down your body");
			
			//Skin
			if (pc.skinTone != "pale blue" && pc.skinToneUnlocked("pale blue"))
			{
				output(", replacing all the skin");
				if (pc.hasFur() || pc.hasScales()) output(" under your " + (pc.hasFur() ? "fur" : "scales"));
				output(" with flawless pale blue flesh");
				pc.skinTone = "pale blue";
			}
			
			var bluepples:Boolean = false; //Nipples
			var blueps:Boolean = false; //Lips
			if (pc.nippleColor.indexOf("blue") < 0 && pc.nippleColorUnlocked("blue"))
			{
				bluepples = true;
				pc.nippleColor = "blue";
			}
			if (pc.lipColor.indexOf("blue") < 0)
			{
				blueps = true;
				pc.lipColor = "blue";
			}
			if (bluepples || blueps) output(". Your " + (bluepples ? (blueps ? "nipples and lips" : "nipples") : "lips") + " turn a darker shade of blue");
			
			//Human vags
			var blueginas:int = 0;
			for each (var vag:VaginaClass in pc.vaginas)
			{
				if (vag.vaginaColor != "bluish-pink" && vag.type == GLOBAL.TYPE_HUMAN)
				{
					++blueginas;
					vag.vaginaColor = "bluish-pink";
				}
			}
			if (blueginas > 0)
			{
				author("Couch & B");
				output(", spreading down to your " + (blueginas == 1 ? "vagina" : "vaginas") + " with a chilly blue hue");
			}
			
			output(", leaving you with a permanently frostbitten look.");
		}


		//Eyes:
		private function specialEyes(pc:Creature):void
		{
			author("B");
		
			output("\n\nYou feel your skull crack and shapeshift around your eyes, to accommodate your changing form. Your field of vision widens and deepens, making your farsight clearer. You bring up your codex and use its blank, glassy screen as a mirror to investigate yourself: your eyes have elongated very slightly, taking a more egg-like shape, and have deepened in color to a shocking, vibrant, ruby-red. You blink and wink them several times as you adjust to <b>your new Frostwyrm-like eyes.</b>");
			
			pc.eyeType = GLOBAL.TYPE_FROSTWYRM;
			pc.eyeColor = "glowing red";
		}

		//Hair:
		private function baldenize(pc:Creature):void
		{
			output("\n\nYour [pc.hair] falls out in clumps as you touch it, wicking away until <b>you’re completely bald</b>. Well of course, dragons don’t need hair.");
			
			pc.hairLength = 0;
		}
		
		//Gain Horns:
		//Change Horns:
		private function makePCHorny(pc:Creature):void
		{
			if (pc.horns == 0)
			{
				output("\n\nSuddenly, your forehead starts to itch, yet, despite the pain, you will yourself to keep from scratching. The itchiness splits into two, concentrated circles, and you can feel your skull expanding and growing heavier; the ordeal lasts for several moments. When it all winds down and the itchiness subsides, you cautiously feel at the protrusions now sticking out of your head: a pair of thick, ivory horns sprout from your forehead, arcing upward and over your head, making them useless for attacks, but they’d nonetheless add quite a bit to your imposing imagery. <b>You now have two horns, shaped just like a Frostwyrm’s.</b>");
			}
			else
			{
				if (pc.horns > 2) output("\n\nYou feel an unpleasant crackling in your skull, and you feel the weight of your horns shift about unnaturally on your head, but you resist the urge to touch and feel them as they change. Without a mirror, you can only surmise what’s happening as the ivory bones slowly meld together, until only two horns remain atop your head. ");
				else output("\n\n");
				output("Your horns begin to arc");
				if (pc.hornLength < 12) output(", lengthen,");
				else if (pc.hornLength > 12) output(", shorten,");
				output(" and curve slightly, bending themselves until they shift overtop your head, making them useless for attacks but they no doubt improve on your imposing image. <b>You now have two Frostwyrm horns.</b>");
			}

			if (kGAMECLASS.silly) pc.lust(33);

			pc.horns = 2;
			pc.hornLength = 12;
			pc.hornType = GLOBAL.TYPE_FROSTWYRM;
		}

		//Legs:
		private function giveThePCALegUp(pc:Creature):void
		{
			output("\n\nYour whole lower body suddenly feels weak, as if your [pc.legsNoun] had frozen solid, causing you to collapse. You can’t move, not until your body has finished reshaping itself, your old [pc.legsNoun] changing into a pair of thick, digitigrade legs coated in rough scales and sporting massive talons for toes. You stand up, getting used to balancing on <b>your new frostwyrm legs</b>. You could probably deliver a pretty nasty kick with them if you were trained for it.");
		
			pc.legCount = 2;
			pc.clearLegFlags();
			pc.legType = GLOBAL.TYPE_FROSTWYRM;
			pc.addLegFlag(GLOBAL.FLAG_DIGITIGRADE);
			pc.addLegFlag(GLOBAL.FLAG_SCALED);
		}

		//Arms: 
		private function armThePC(pc:Creature):void
		{
			output("\n\nYour arms feel frozen and stiff as" + (pc.hasScales() ? " they start to grow a thick layer of rough, jagged [pc.scaleColor] scales" : " their scales thicken, turning rough and jagged") + ". Your fingertips lengthen as they change, each tipped with a deadly-looking claw that nonetheless retains your usual level of dexterity. When the chill fades, you’re left to admire <b>your new frostwyrm-like arms</b>.");
			
			pc.clearArmFlags();
			pc.armType = GLOBAL.TYPE_FROSTWYRM;
			pc.addArmFlag(GLOBAL.FLAG_SMOOTH);
			pc.addArmFlag(GLOBAL.FLAG_SCALED);
		}

		//Ears:
		private function canYouEarMe(pc:Creature):void
		{
			output("\n\nYour ears stiffen with the cold, elongating and mutating into a set of almost fin-like ridges. They almost look more like a headdress than ears, but it’s just as easy as ever to hear out of <b>your new frostwyrm ears</b>.");
			
			pc.earType = GLOBAL.TYPE_FROSTWYRM;
			pc.clearEarFlags();
		}
		
		//Face: 
		private function noYourFaceIsAFrostwyrm(pc:Creature):void
		{
			author("B");
		
			output("\n\nThe chill seems to numb your face, making it thankfully painless as it stretches outward into a sharp snout. Two more rows of teeth grow in behind your first - no, they’re not teeth, they’re sharp, carnivorous <i>fangs</i>, ready to cut through metal as easily as meat. <b>You’ve got a face just like that of a frostwyrm</b>.");
			
			pc.clearFaceFlags();
			pc.faceType = GLOBAL.TYPE_FROSTWYRM;
			pc.addFaceFlag(GLOBAL.FLAG_MUZZLED);
			pc.addFaceFlag(GLOBAL.FLAG_ANGULAR);
			pc.addFaceFlag(GLOBAL.FLAG_LONG);
		}

		//Tongue:
		private function longTong(pc:Creature):void
		{
			output("\n\nYour tongue thickens, your jaw reflexively going slack to let it hang out of your mouth. Further and further it spills out, turning into a long, conical tube that you find you can twist and curl around objects almost like a tentacle. Oh, this is going to be fun. <b>You have a frostwyrm’s tongue</b>.");
			
			pc.clearTongueFlags();
			pc.tongueType = GLOBAL.TYPE_FROSTWYRM;
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
			pc.addTongueFlag(GLOBAL.FLAG_SQUISHY);
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
		}

		//Grow Tail:
		//Change Tail:
		private function taaaaail(pc:Creature):void
		{
			author("Couch & B");

			//9999 check tail correctly
			if (!pc.hasTail()) output("\n\nYou feel a pressure just above your [pc.ass], looking back to see a lump growing there. It soon bursts forth as a full-fledged tail,");
			else output("\n\nYou feel your [pc.tails] turn cold and stiff, drooping and thickening behind you. You look back to see a new tail forming, a thick tube of muscle");
			output(" covered in thick, rough scales and edged with short spikes along its top and bundled into a ball at its tip, better for bludgeoning than for piercing. You flick it back and forth, getting used to <b>your new frostwyrm tail</b>.");
			
			pc.clearTailFlags();
			pc.tailType = GLOBAL.TYPE_FROSTWYRM;
			pc.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTailFlag(GLOBAL.FLAG_TAPERED);
			pc.addTailFlag(GLOBAL.FLAG_SCALED);
			pc.addTailFlag(GLOBAL.FLAG_LONG);
			pc.tailCount = 1;
		}

		//Grow Wings:
		//Change Wings:
		private function wingSwinging(pc:Creature):void
		{
			if (pc.wingCount == 0) output("\n\nYou feel an urge to bare your back and keep it free of obstructions as the chill spreads there, followed by a thick pushing sensation from within. You double over, groaning as a pair of wings burst from your back. They’re huge, majestic, and undeniably draconic, their membranes shimmering with silver. <b>You have a frostwyrm’s wings</b>!");
			else output("\n\nYour [pc.wingsNoun] " + (pc.wingCount == 1 ? "stiffens" : "stiffen") + " with the chill, briefly losing all sensation. It’s not until you look back that you see they’ve started melting like wax, changing and reforming into a new set that’s absolutely massive. You give them a flap, watching the membranes of <b>your new frostwyrm’s wings</b> shimmer with silver.");

			pc.shiftWings(GLOBAL.TYPE_FROSTWYRM, pc.wingCount = 2);
		}
		
		//Grow Penis:
		private function growADragonDick(pc:Creature):void
		{
			author("B");
			
			output("\n\nYou feel your body change between your legs; like a sudden weight, followed by the feel of your skin stretching and contorting as it accommodates an entirely new appendage. You curiously run a hand along the area, and you freeze in pleasure, your palm hitting something particularly sensitive. What could only be <b>your new Frostwyrm penis</b> extends and grows beneath your belly, bloating and inflating, until it reaches an envious foot in length; its head is flat, and a number of small nubs line its underside. Whoever you use this battering ram of a cock on will sure to leave quite an impression.");
			
			pc.createCock((pc.hasPerk("Hung") ? 14 : (pc.hasPerk("Mini") ? 10 : 12)));
			pc.shiftCock(0, GLOBAL.TYPE_FROSTWYRM);
		}

		//Grow Balls:
		private function growSomeBallsAlready(pc:Creature):void
		{
			author("B");
			
			output("\n\nJust beneath your [pc.cock], you feel your body changing all the more, your new Frostwyrm genes working with your own to meld you into the perfect hybrid. Your skin beneath your dick rounds out and inflates, as your body mutates itself a pair of balls to hold all your fresh, virile cum. What cock wouldn’t be complete without <b>a set of Frostwyrm testicles</b>?");
			
			pc.balls = 2;
		}

		//Grow Slit:
		private function growSlit(pc:Creature):void
		{
			output("\n\nYou think the cold might be getting to you as [pc.eachCock] shrinks, before noticing the tugging inward sensation in your groin. You reach down in a panic, but discover that thankfully you haven’t lost your manhood. Instead, " + (pc.hasCocks() ? "they’re" : "it is") + " contained in a new internal slit that’s practically invisible when sealed shut. Well, that’s certainly going to open up some new clothing options. You take some time to ponder the possibilities as you get used to <b>your new genital slit</b>.");
			
			pc.createStatusEffect("Genital Slit");
		}

		//Change Dick, requires slit:
		private function dragonDick(pc:Creature):void
		{
			author("Couch & B");
			var validCocks:Array = new Array();
			for (var cIdx:int = 0; cIdx < pc.cocks.length; ++cIdx)
				if (pc.cocks[cIdx].cType != GLOBAL.TYPE_FROSTWYRM && pc.cockTypeUnlocked(cIdx, GLOBAL.TYPE_FROSTWYRM))
					validCocks.push(cIdx);
			cIdx = RandomInCollection(validCocks);
			
			output("\n\nThe chill settles inside your slit, wrapping its way around your [pc.cock " + cIdx + "]. You feel a delicious stretching feeling in your shaft, letting it spill out on reflex. What emerges is a pink, blunt tip with a ring of muscle at the edges of the flat glans, with a shaft that’s covered from root to crown with blue, pulsing veins and it has several nubs and pricks along the underside of its length. Is this really what a frostwyrm has between their legs? You rub your new malehood, giving a heady grin at just how good all that texture feels, and the thought of how good it’ll probably feel for any hole you stick it in. <b>You’ve got a frostwyrm dick</b>!");
			
			pc.shiftCock(cIdx, GLOBAL.TYPE_FROSTWYRM);
		}

		//Gain cock size, requires slit:
		private function lengthenDick(pc:Creature):void
		{
			var validCocks:Array = new Array();
			for (var cIdx:int = 0; cIdx < pc.cocks.length; ++cIdx)
				if (pc.cocks[cIdx].cLength() < 12
					&& (pc.cockLengthUnlocked(cIdx, Math.min(12, pc.cocks[cIdx].cLength()+1))
						|| pc.cockLengthUnlocked(cIdx, Math.min(12, pc.cocks[cIdx].cLength()+2))))
					validCocks.push(cIdx);
			cIdx = RandomInCollection(validCocks);

			//value to lengthen by
			var randL:int = rand(2) + 1;
			//No need to randomize it in this case
			if (pc.cocks[cIdx].cLength() == 11) randL = 1;
			// 2 ^ 3 = 1, and 1 ^ 3 = 2, so this is a complicated way to say "try the other"
			else if (!pc.cockLengthUnlocked(cIdx, pc.cocks[cIdx].cLength() + randL)) randL ^= 3;
			
			output("\n\nYou’ve heard of shrinkage when it gets cold, but never the opposite. But indeed, your [pc.cock " + cIdx + "] thickens and swells inside your slit, feeling noticeably larger overall. The perks of being an apex predator, you imagine. You’d estimate you’re " + (randL == 1 ? "one inch" : "two inches") + " bigger, and thicker to match.");
			
			pc.cocks[cIdx].cLength(randL);
		}

		//Grow vagina:
		private function growCunt(pc:Creature):void
		{
			author("B");
		
			output("\n\nYou feel what you can only describe as a new vacancy in between your " + (pc.legCount > 1 ? "[pc.legs]":"[pc.thighs]"));
			if (pc.hasCock()) output(", just beneath and a little behind your [pc.cock]");
			output(". You dip your fingers at where your taint once was, to find a new, wet, pliable hole that sends pleasurable shivers up your spine whenever you give it a little rub. Just a little bit north from it, you find a little nub of flesh that makes you gasp in delight with each flick. <b>You now have a vagina!</b>");
			
			pc.createVagina();
			pc.shiftVagina(0, GLOBAL.TYPE_FROSTWYRM);
		}
		
		//Change vaginal type and color:
		private function colorGina(pc:Creature):void
		{
			var validCunts:Array = new Array();
			for (var vIdx:int = 0; vIdx < pc.vaginas.length; ++vIdx)
				if (pc.vaginaTypeUnlocked(vIdx, GLOBAL.TYPE_FROSTWYRM)
					&& (pc.vaginas[vIdx].type != GLOBAL.TYPE_FROSTWYRM
						|| pc.vaginas[vIdx].vaginaColor.indexOf("blue") < 0
						|| pc.vaginas[vIdx].clits != 1))
					validCunts.push(vIdx);
			vIdx = RandomInCollection(validCunts);
			
			output("\n\nThe chill settles in your [pc.vagina " + vIdx + "], which squirms in response, muscles clenching and unclenching on their own as they strengthen and multiply. You pull your pussy lips apart to find the color has become tinged bluish-pink, filled with dozens of new folds to grab every little bump and ridge on a male’s cock. Nestled within your lips is a tight blue nub of a clit, perfectly angled for getting ground against while being fucked from behind. Is this what a frostwyrm has between their legs? You slip a finger inside and lick your lips at how hard it is to pull it out, those new muscles clamping down and refusing to let go. You can’t wait to get this bad girl milking someone’s dick. <b>You’ve got a frostwyrm cunt</b>.");
			
			pc.shiftVagina(vIdx, GLOBAL.TYPE_FROSTWYRM);
		}

		//Get Tall:
		private function growPCGrow(pc:Creature):void
		{
			var tallnesses:Array = new Array()
			for (var t:int = 2; t <= 4 && pc.tallness + t <= 102; ++t)
				if (pc.tallnessUnlocked(pc.tallness + t))
					tallnesses.push(t);
			t = RandomInCollection(tallnesses);
			
			output("\n\nYou feel the urge to stretch and work away the chill, feeling a soothing popping sensation as you do. Afterwards you notice that everything seems just a bit smaller than before. Are you taller? You check your Codex and confirm that you’ve gained " + ["two", "three", "four"][t-2] + " inches of height.");
			
			pc.tallness += t;
		}

		//Dud:
		private function dudResult():void
		{
			output("\n\nAfter about a minute, the feeling fades. You must be as close to a real frostwyrm as you can manage.");
		}
	}
}