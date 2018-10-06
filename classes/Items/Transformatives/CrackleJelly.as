package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Utility.rand;
	
	public class CrackleJelly extends ItemSlotClass
	{
		
		//constructor
		public function CrackleJelly()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Crk. Jelly";
			//Regular name
			this.longName = "Crackle Jelly";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a tube of Crackle Jelly";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a glowing blue-green gelatin that reminds you rather frighteningly of the monster you defeated on the ocean floor of Uveto. You've been assured that the gel poses no threat, but rather is a skin-applied transformative that will cause you to take on a form based off the janeria’s appearance, though it’s a thematic copy rather than an exact recreation. The tube is labeled with the Steele Tech logo, along with a disclaimer regarding its current trial status.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 8500;
			
			this.version = this._latestVersion;
		}
		
		private function paleColors():Array
		{
			return ["pale green", "pale blue"];
		}
		private function luminousColors():Array
		{
			return ["luminous green", "luminous blue"];
		}
		
		//METHOD ACTING!
		override public function useFunction(pc:Creature, usingCreature:Creature = null):Boolean
		{
			//processTime(1+rand(2));
			kGAMECLASS.clearOutput();
			author("Couch");
			
			//PC only
			if (!(pc is PlayerCharacter))
			{
				output("<b>Item cannot be used on " + pc.short + ".</b>");
				
				return false;
			}
			//Bunch of variables to use later
			var i:int;
			var tempColor:String;

			output("You put the medipen to your arm and inject its contents. A cold feeling washes through you, but soon passes as the changes begin.");
			
			//  Gather transformations
			var possibleChanges:Array = new Array();
			
			// Skin
			//Type
			if (pc.skinType != GLOBAL.SKIN_TYPE_SKIN) possibleChanges.push(skinChange);
			//Check lips, nipples, skin and then every single vagina
			else if (pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN))
			{
				if (!InCollection(pc.lipColor, luminousColors())) possibleChanges.push(paletteChange);
				else if (!InCollection(pc.nippleColor, luminousColors())) possibleChanges.push(paletteChange);
				else if (!InCollection(pc.skinTone, paleColors())) possibleChanges.push(paletteChange);
				else
				{
					var doSkinColor:Boolean = false;
					for (i = 0; i < pc.vaginas.length; ++i)
						if (!InCollection(pc.vaginas[i].vaginaColor, luminousColors()))
							doSkinColor = true;
					if (doSkinColor) possibleChanges.push(paletteChange);
				}
			}
			
			// Eyes
			//Eye type
			if (pc.eyeTypeUnlocked(GLOBAL.TYPE_JANERIA) && pc.eyeType != GLOBAL.TYPE_JANERIA) possibleChanges.push(eyeChange);
			//Each eye color
			else if (!InCollection(pc.eyeColor, luminousColors()))
			{
				var doEyeChange:Boolean = false;
				for each (tempColor in luminousColors())
					if (pc.eyeColorUnlocked(tempColor) && pc.eyeColor != tempColor)
						 doEyeChange = true;
				if (doEyeChange) possibleChanges.push(eyeChange);
			}
			
			// Hair
			if (pc.hasHair())
			{
				//Hair type
				if (pc.hairTypeUnlocked(GLOBAL.TYPE_HUMAN) && pc.hairType != GLOBAL.TYPE_HUMAN) possibleChanges.push(hairChange);
				//Hair color
				else if (!InCollection(pc.hairColor, luminousColors()))
				{
					var doHair:Boolean = false;
					for each (tempColor in luminousColors())
						if (pc.hairColorUnlocked(tempColor))
							doHair = true;
					if (doHair) possibleChanges.push(hairChange);
				}
			}
			
			// Legs
			if (pc.legTypeUnlocked(GLOBAL.TYPE_JANERIA) && pc.legType != GLOBAL.TYPE_JANERIA)
			{
				if (pc.legCountUnlocked(2)) possibleChanges.push(legsChange);
				else if(pc.legCount == 2) possibleChanges.push(legsChange);
			}
			
			// Tongue
			if (pc.tongueTypeUnlocked(GLOBAL.TYPE_FROSTWYRM))
			{
				if (pc.tongueType != GLOBAL.TYPE_FROSTWYRM) possibleChanges.push(tongueChange);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE)) possibleChanges.push(tongueChange);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) possibleChanges.push(tongueChange);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_LUBRICATED)) possibleChanges.push(tongueChange);
				else if (!pc.hasTongueFlag(GLOBAL.FLAG_SQUISHY)) possibleChanges.push(tongueChange);
			}
			
			// Wings
			if (pc.wingTypeUnlocked(GLOBAL.TYPE_JANERIA) && pc.wingType != GLOBAL.TYPE_JANERIA)
				possibleChanges.push(wingChange);
			
			// Cocks
			if (pc.hasCock())
			{
				if (!pc.hasStatusEffect("Genital Slit")) possibleChanges.push(slitChange);
				else
				{
					var doCocks:Boolean = false;
					for (i = 0; i < pc.cocks.length; ++i)
						if (pc.cockTypeUnlocked(i, GLOBAL.TYPE_JANERIA) && pc.cocks[i].cType != GLOBAL.TYPE_JANERIA)
							doCocks = true;
					if (doCocks) possibleChanges.push(cockChange);
				}
			}
			
			// Vags
			for (i = 0; i < pc.vaginas.length; ++i)
			{
				if (pc.vaginaTypeUnlocked(i, GLOBAL.TYPE_SNAKE) && pc.vaginas[i].type != GLOBAL.TYPE_SNAKE)
				{
					possibleChanges.push(cuntChange);
					break;
				}
			}
			
			// Stats
			if (pc.WQ() < 100 || pc.IQ() < 100) possibleChanges.push(statChange);
			
			//Finally, actually select and apply
			if (possibleChanges.length > 0) RandomInCollection(possibleChanges)(pc);
			else dudResult();
			
			return false;
		}
		
		private function skinChange(pc:Creature):void
		{
			output("\n\nYour [pc.skinFurScalesNoun] feels prickly and hot as if being repeatedly shocked. Gradually it begins to flake away, revealing the [pc.skinColor] skin underneath. It still tingles a little as you rub your newly-bare arms.");
			
			pc.clearSkinFlags();
			pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
		}
		
		private function paletteChange(pc:Creature):void
		{
			//Colors to use for the tf
			var paleColor:String = RandomInCollection(paleColors());
			var luminousColor:String = RandomInCollection(luminousColors());
			
			//Displays dud message
			var didChanges:Boolean = false;
			
			output("\n\nElectric charges crackle over your body, bleaching the color from the skin.");
			
			if (!InCollection(pc.skinTone, paleColors()))
			{
				pc.skinTone = paleColor;
				output(" Each jolt turns your body a little more " + paleColor.split(" ").pop());
				didChanges = true;
			}
			
			var lipsChanged:Boolean = false;
			var nipplesChanged:Boolean = false;
			if (pc.nippleColorUnlocked(luminousColor) && !InCollection(pc.nippleColor, luminousColors))
			{
				pc.nippleColor = luminousColor;
				nipplesChanged = true;
			}
			if (!InCollection(pc.lipColor, luminousColors))
			{
				pc.lipColor = luminousColor;
				lipsChanged = true;
			}
			if (lipsChanged || nipplesChanged)
			{
				if (didChanges) output(", in particular your ");
				else output(" In particular your ");
				output((nipplesChanged ? (lipsChanged ? "nipples and lips" : "nipples") : "lips") + ", which turn a contrasting " + luminousColor.split(" ").pop() + " and start to practically glow as if the shocks were charging them up with new energy.");
				didChanges = true;
			}
				
			var vaginasChanged:int = 0;
			for (var i:int = 0; i < pc.vaginas.length; ++i)
			{
				if (pc.vaginas[i].vaginaColor != luminousColor)
				{
					pc.vaginas[i].vaginaColor = luminousColor;
					vaginasChanged++;
				}
			}
			if (vaginasChanged > 0)
			{
				output(" You can feel it in your");
				if (vaginasChanged == 1) output(" pussy");
				else output(" pussies");
				if (didChanges) output(" too");
				output(", a little bit of light starting to peek out from between your nether lips as your tunnel turns luminous.");
				didChanges = true;
			}

			//All skin flags to be removed unlocked? 9999
			if (pc.skinFlagsUnlocked(GLOBAL.FLAG_SMOOTH))
			{
				pc.clearSkinFlags();
				pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
				if (didChanges) output(" It’s not just the color that changes, though: the");
				else output(" The");
				output(" shocks seem to make your skin smoother, springier, practically rubbery. By the time the color finishes sweeping across your body, it’s absolutely flawless.");
				didChanges = true;
			}
			
			if (!didChanges) pc.skinToneLockedMessage();
		}
		
		private function eyeChange(pc:Creature):void
		{
			//Filter for available colors (none if it's good)
			var validColors:Array = new Array();
			if (!InCollection(pc.eyeColor, luminousColors()))
				for each (var luminousColor:String in luminousColors())
					if (pc.eyeColorUnlocked(luminousColor))
						validColors.push(luminousColor);
 
			if (pc.eyeTypeUnlocked(GLOBAL.TYPE_JANERIA)) pc.eyeType = GLOBAL.TYPE_JANERIA;
			
			output("\n\nYour vision jumps and crackles with sudden sensory overload, as if there were tiny bolts of lightning jumping about inside your eyes. The sensation passes after a few moments, but everything feels somehow brighter. You think to check your reflection, and discover it’s not the world around you that’s gotten brighter, but rather your eyes themselves");
			if (validColors.length > 0)
			{
				pc.eyeColor = RandomInCollection(validColors);
				output(", which have turned [pc.eyeColor].");
			}
			else output(".");
		}
		
		private function hairChange(pc:Creature):void
		{
			//Filter for available colors
			var validColors:Array = new Array();
			if (!InCollection(pc.hairColor, luminousColors()))
				for each (var luminousColor:String in luminousColors())
					if (pc.hairColorUnlocked(luminousColor) && pc.hairColor != luminousColor)
						validColors.push(luminousColor);
 
			output("\n\nElectric currents crackle down your [pc.hair],");
			if (pc.hairType != GLOBAL.TYPE_HUMAN && pc.hairTypeUnlocked(GLOBAL.TYPE_HUMAN)) output(" setting it quaking and vibrating until it splits into a mass of thin filaments. The electric surges along your newly-human hair continue,");
			
			if (pc.hairTypeUnlocked(GLOBAL.TYPE_HUMAN)) pc.hairType = GLOBAL.TYPE_HUMAN;
			if (validColors.length > 0) pc.hairColor = RandomInCollection(validColors);
			
			output(" illuminating it in " + pc.hairColor.split(" ").pop() + " radiance until the glow takes over your hair completely. <b>You now have [pc.hairColor] hair!</b>");
		}

		private function legsChange(pc:Creature):void
		{
			pc.legCount = 2;
			pc.legType = GLOBAL.TYPE_JANERIA;
			pc.clearLegFlags();
			pc.addLegFlag(GLOBAL.FLAG_SMOOTH);
			pc.addLegFlag(GLOBAL.FLAG_AMORPHOUS);
			pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
			
			output("\n\nYour legs start to quake uncontrollably, prompting you to quickly sit before you lose control altogether. Gradually your legs lengthen and thin out until they look almost impossibly slender, all visible definition vanishing before new lines etch themselves down your legs, contours and bends forming that can’t correspond to any sort of muscles but rather make it look like your legs are made of several tentacles woven and pressed together. Even your feet streamline into diamond-shaped slippers, arched to provide a shape not unlike platform pumps. You can still feel some sort of bones inside, but from the outside it looks like you have a mass of tentacles contorted into the shape of legs.");
		}
	
		private function tongueChange(pc:Creature):void
		{
			output("\n\nYour tongue thickens, your jaw reflexively going slack to let it hang out of your mouth. Further and further it spills out, turning into a long, conical tube that you find you can twist and curl around objects almost like a tentacle. Oh, this is going to be fun. <b>You have a long, tentacle-like tongue.</b>");
			
			pc.clearTongueFlags();
			pc.tongueType = GLOBAL.TYPE_FROSTWYRM;
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTongueFlag(GLOBAL.FLAG_LUBRICATED);
			pc.addTongueFlag(GLOBAL.FLAG_SQUISHY);
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
		}
	
		private function wingChange(pc:Creature):void
		{
			output("\n\nYou cry out as your spine is rocked with huge surges of lightning, sending you to the ground. Gradually the sensation pools higher, near your shoulders, the flesh roiling as if coming to a boil.");
			if (pc.wingType != 0) output(" Your " + (pc.wingCount == 1 ? "[pc.wings] seemingly <i>does</i>" : "[pc.wings] seemingly <i>do</i>") + " boil, wicking away into nothingness.");
			output(" Just before you can’t take it anymore, a thick surging feeling replaces the shocks as one, two, three, four [pc.skinColor] tentacles erupt from your back. They’re absolutely enormous, at least as long as you are tall and two inches thick apiece, each ending in a diamond-shaped pad. What’s more, as they sway and lash about you feel something forming inside each one, a tiny channel that goes from the tip of each tentacle to somewhere inside you. Are they <i>cocks</i>?");
			output("\n\nYou make your way to your feet as your spine recovers, still feeling sore and not quite in the mood to test out your newfound back tentacles... at least, not yet.");
			
			pc.shiftWings(GLOBAL.TYPE_JANERIA, 4);
		}
		
		private function slitChange(pc:Creature):void
		{
			pc.createStatusEffect("Genital Slit");
			output("\n\nYou feel aflutter with tingles and jitters at the crackling sensation that pools around your groin. It feels like the electricity is digging inward, until you realize that it’s actually the sensation of your " + (pc.hasCocks() ? "cocks" : "cock") + " sinking into your crotch. Your hands spasm as you try to reach for your groin, filling you with panic, but soon the sensation fades and you’re left with an odd inner fullness. You reach down to find that [pc.eachCock] is hidden inside you, packed into a glowing green slit that’s practically invisible when sealed shut. <b>You now have a genital slit</b>.");
		}
		
		private function cockChange(pc:Creature):void
		{
			//Pick suitable cock
			var validCocks:Array = new Array();
			for (var cIdx:int = 0; cIdx < pc.cocks.length; ++cIdx)
				if (pc.cockTypeUnlocked(cIdx, GLOBAL.TYPE_JANERIA) && pc.cocks[cIdx].cType != GLOBAL.TYPE_JANERIA)
					validCocks.push(cIdx)
			cIdx = RandomInCollection(validCocks);
			
			output("\n\nYour [pc.cock " + cIdx + "] spasms within you, twisting about in ways that feel strange and alien as electric heat races up and down the squirming shaft. Soon it’s too much to bear, and your dick thrusts forcefully out from within your slit.");
			
			//Apply TF
			pc.shiftCock(cIdx, GLOBAL.TYPE_JANERIA);
			pc.cocks[cIdx].cockColor = RandomInCollection(luminousColors());
		
			output(" It looks like a miniature tentacle emerging, uniform " + pc.cocks[cIdx].cockColor + " from base to tip and flexing about as if gifted with a mind of its own. The tip is shaped like a diamond, with your cumslit tucked along the underside so that someone would have to be underneath you to be sure it was a cock at all. You’re pretty sure the janeria didn’t have a tentacle like <i>this</i>, did it?");
			output("\n\nIt takes you some time to learn how to control <b>your new tentacle dick</b>, but you’re sure the possibilities for how to use it will present themselves soon enough.");
		}
		
		private function cuntChange(pc:Creature):void
		{
			//Pick suitable vagina at random
			var validCunts:Array = new Array();
			for (var vIdx:int = 0; vIdx < pc.vaginas.length; ++vIdx)
				if (pc.vaginaTypeUnlocked(vIdx, GLOBAL.TYPE_SNAKE) && pc.vaginas[vIdx].type != GLOBAL.TYPE_SNAKE)
					validCunts.push(vIdx);
			vIdx = RandomInCollection(validCunts);
			
			output("\n\nElectric charges crackle down the whole length of your [pc.vagina " + vIdx + "], setting your pussy squirming even as all exterior definition seems to vanish.");
			
			//TF
			pc.shiftVagina(vIdx, GLOBAL.TYPE_SNAKE);
			pc.vaginas[vIdx].vaginaColor = RandomInCollection(luminousColors());
			
			output(" It takes you a few moments of searching with your fingers to figure out where your entrance even is, but when the lips peel apart your fingers are lit by the " + pc.vaginas[vIdx].vaginaColor + " of your new interior. <b>Your pussy has become a discreet, almost completely concealed slit</b>.");
		}
		
		private function statChange(pc:Creature):void
		{
			pc.physique(-2-rand(1));
			pc.reflexes(-2-rand(1));
			pc.intelligence(2+rand(1));
			pc.willpower(2+rand(1));
			
			output("\n\nYour mind alights with sudden energy, as if the energy from your muscles was being redirected straight to your brain. The sense of focus and clarity is sublime, cutting through a haze you didn’t even realize was there before. Your limbs feel a bit like jelly, but hey, mind over matter, right?");
		}
		
		private function dudResult():void
		{
			output("\n\nAside from a pleasant crackling all through your body, nothing changes. You're as charged up as you can be.");
		}
	}
}