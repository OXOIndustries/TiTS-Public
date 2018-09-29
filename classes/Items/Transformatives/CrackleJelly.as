package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.output;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Util.InCollection;
    import classes.Util.RandomInCollection;
	
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
			this.shortName = "Crackle Jelly";
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
			kGAMECLASS.clearOutput();
			author("Couch");
            var paleColors:Array = ["pale green", "pale blue"];
            var luminousColors:Array = ["luminous green", "luminous blue"];
            
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
            //This or any non-skin skin?
            if (pc.skinTypeUnlocked(GLOBAL.SKIN_TYPE_SKIN) && (pc.hasFur() || pc.hasScales()))
			{
                possibleChanges.push(skinChange);
			}
            
            // Skin color
            if (!pc.hasScales() && !pc.hasFur()) possibleChanges.push(paletteChange);
            
			//Eye color
			if (pc.eyeTypeUnlocked(GLOBAL.TYPE_JANERIA) && pc.eyeType = GLOBAL.TYPE_JANERIA)
			{
				possibleChanges.push(eyeChange);
			}
			else if (!InCollection(pc.eyeColor, luminousColors()))
			{
				for (tempColor in luminousColors())
				{
					if (pc.eyeColorUnlocked(tempColor) && pc.eyeColor != tempColor)
					{
						possibleChanges.push(eyeChange);
						break;
					}
				}
			}
			
            // Hair color
            if (pc.hasHair() && pc.hairTypeUnlocked(GLOBAL.TYPE_HUMAN))
            {
                for each (tempColor in luminousColors())
                {
                    if (pc.hairColorUnlocked(tempColor) && pc.hairColor != tempColor)
                    {
                        possibleChanges.push("hair");
                        break;
                    }
                }
            }
            
            if (pc.legTypeUnlocked(GLOBAL.TYPE_JANERIA) && pc.legType != GLOBAL.TYPE_JANERIA
				&& (pc.legCountUnlocked(2) || pc.legCount == 2))
            {
                possibleChanges.push(legsChange);
            }
            
            if ((pc.tongueTypeUnlocked(GLOBAL.TYPE_JANERIA) || pc.tongueType == GLOBAL.TYPE_JANERIA)
                && (pc.tongueFlagsUnlocked(GLOBAL.FLAG_PREHENSILE) || pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
                && (pc.tongueFlagsUnlocked(GLOBAL.FLAG_LONG) || pc.hasTongueFlag(GLOBAL.FLAG_LONG)))
            {
                possibleChanges.push(tongueChange);
            }
            
            if (pc.wingTypeUnlocked(GLOBAL.TYPE_JANERIA)
				&& (!pc.hasWings() || pc.wingType != GLOBAL.TYPE_JANERIA))
            {
                possibleChanges.push(wingChange);
            }
            
            if (pc.hasCock())
            {
                if (!hasStatusEffect("Genital Slit")) possibleChanges.push(slitChange);
                else
                {
                    for (i = 0; i < pc.cocks.length; ++i)
                    {
                        if (pc.cockTypeUnlocked(i, GLOBAL.TYPE_JANERIA) && pc.cocks[i].cockType != GLOBAL.TYPE_JANERIA)
                        {
                            possibleChanges.push(cockChange);
                            break;
                        }   
                    }
                }
            }
            
            if (pc.hasVagina())
            {
                for (i = 0; i < pc.vaginas.length; ++i)
                {
                    if (pc.vaginaTypeUnlocked(i, GLOBAL.TYPE_NALEEN) && pc.vaginas[i].vaginaType != GLOBAL.TYPE_NALEEN)
                    {
                        possibleChanges.push(cuntChange);
                        break;
                    }
                }
            }
            
            if (pc.WQ() < 100 || pc.IQ() < 100) possibleChanges.push(statChange);
            
            //Finally, actually select and apply
            if (possibleChanges.length > 0) RandomInCollection(possibleChanges)(pc);
			else dudResult();
            
			return false;
		}
		
		private function skinChange(pc:Creature):void
		{
			output("\n\nYour [pc.skinFurScalesNoun] feels prickly and hot as if being repeatedly shocked. Gradually it begins to flake away, revealing the [pc.skinColor] skin underneath. It still tingles a little as you rub your newly-bare arms.");
			pc.skinType = GLOBAL.SKIN_TYPE_SKIN;
		}
		
		private function paletteChange(pc:Creature):void
		{
			//Colors to use for the tf
			var paleColor:String = RandomInCollection(paleColors());
			var luminousColor = RandomInCollection(luminousColors());
			
			//Displays dud message
			var didChanges:Boolean = false;
			
			output("\n\nElectric charges crackle over your body, bleaching the color from the skin.");
			
			if (paleColor != pc.skinTone)
			{
				pc.skinTone = paleColor;
				output(" Each jolt turns your body a little more " + paleColor.split(" ").pop());
				didChanges = true;
			}
			
			var lipsChanged:Boolean = false;
			var nipplesChanged:Boolean = false;
			if (pc.nippleColorUnlocked(luminousColor) && pc.nippleColor != luminousColor)
			{
				pc.nippleColor = luminousColor;
				nipplesChanged = true;
			}
			if (pc.lipColor != luminousColor)
			{
				pc.lipColor = luminousColor;
				lipsChanged = true;
			}
			if (lipsChanged || nipplesChanged)
			{
				if (didChanges) output(", in particular your");
				else output(" In particular your");
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

			if (pc.skinFlagsUnlocked())
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
			//Filter for available colors
			var validColors:Array = new Array();
			for (var luminousColor:String in luminousColors())
				if (pc.eyeColorUnlocked(luminousColor) && pc.eyeColor != luminousColor)
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
			for (var luminousColor:String in luminousColors())
				if (pc.hairColorUnlocked(luminousColor) && pc.hairColor != luminousColor)
					validColors.push(luminousColor);
 
			output("\n\nElectric currents crackle down your [pc.hair],");
			if (pc.hairType != GLOBAL.TYPE_HUMAN) output(" setting it quaking and vibrating until it splits into a mass of thin filaments. The electric surges along your newly-human hair continue,");
			
			pc.hairType = GLOBAL.TYPE_HUMAN;
			pc.hairColor = RandomInCollection(validColors);
			
			output(" illuminating it in " + pc.hairColor.split(" ").pop() + " radiance until the glow takes over your hair completely. <b>You now have [pc.hairColor] hair!</b>");
		}

		private function legsChange(pc:Creature):void
		{
			pc.legCount = 2;
			pc.legType = GLOBAL.TYPE_JANERIA;
			
			output("\n\nYour legs start to quake uncontrollably, prompting you to quickly sit before you lose control altogether. Gradually your legs lengthen and thin out until they look almost impossibly slender, all visible definition vanishing before new lines etch themselves down your legs, contours and bends forming that can’t correspond to any sort of muscles but rather make it look like your legs are made of several tentacles woven and pressed together. Even your feet streamline into diamond-shaped slippers, arched to provide a shape not unlike platform pumps. You can still feel some sort of bones inside, but from the outside it looks like you have a mass of tentacles contorted into the shape of legs.");
		}
	
		private function tongueChange(pc:Creature):void
		{
			output("\n\nYour tongue thickens");
			if (pc.tongueType != GLOBAL.TYPE_JANERIA) output(" and turns blue");
			output(", your jaw reflexively going slack to let it hang out of your mouth. Further and further it spills out, turning into a long, conical tube that you find you can twist and curl around objects almost like a tentacle. Oh, this is going to be fun. <b>You have a long, tentacle-like tongue</b>");
			
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
		}
	
		private function wingChange(pc:Creature):void
		{
			output("\n\nYou cry out as your spine is rocked with huge surges of lightning, sending you to the ground. Gradually the sensation pools higher, near your shoulders, the flesh roiling as if coming to a boil.");
			if (pc.hasWings()) output(" Your wings seemingly <i>do</i> boil, wicking away into nothingness.");
			output(" Just before you can’t take it anymore, a thick surging feeling replaces the shocks as one, two, three, four [pc.skinColor] tentacles erupt from your back. They’re absolutely enormous, at least as long as you are tall and two inches thick apiece, each ending in a diamond-shaped pad. What’s more, as they sway and lash about you feel something forming inside each one, a tiny channel that goes from the tip of each tentacle to somewhere inside you. Are they <i>cocks</i>?");
			output("\n\nYou make your way to your feet as your spine recovers, still feeling sore and not quite in the mood to test out your newfound back tentacles... at least, not yet.");
			
			pc.wingType = GLOBAL.TYPE_JANERIA;
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
			for (var cIdx:int = 0; i < pc.cocks.length; ++i)
				if (pc.cockTypeUnlocked(cIdx, GLOBAL.TYPE_JANERIA) && pc.cocks[cIdx].cockType != GLOBAL.TYPE_JANERIA)
					validCocks.push(cIdx)
			cIdx = RandomInCollection(validCocks);
			
			//Apply TF
			pc.cocks[cIdx].cockType = GLOBAL.TYPE_JANERIA;
			pc.cocks[cIdx].cockColor = RandomInCollection(luminousColors());
		
			output("\n\nYour [pc.cock " + cIdx + "] spasms within you, twisting about in ways that feel strange and alien as electric heat races up and down the squirming shaft. Soon it’s too much to bear, and your dick thrusts forcefully out from within your slit. It looks like a miniature tentacle emerging, uniform " + pc.cocks[cIdx].cockColor + " from base to tip and flexing about as if gifted with a mind of its own. The tip is shaped like a diamond, with your cumslit tucked along the underside so that someone would have to be underneath you to be sure it was a cock at all. You’re pretty sure the janeria didn’t have a tentacle like <i>this</i>, did it?");
			output("\n\nIt takes you some time to learn how to control <b>your new tentacle dick</b>, but you’re sure the possibilities for how to use it will present themselves soon enough.");
		}
		
		private function cuntChange(pc:Creature):void
		{
			//Pick suitable vagina at random
			var validCunts:Array = new Array();
			for (var vIdx:int = 0; i < pc.cocks.length; ++i)
				if (pc.vaginaTypeUnlocked(vIdx, GLOBAL.TYPE_SNAKE) && pc.vagina[vIdx].vaginaType != GLOBAL.TYPE_SNAKE)
					validCunts.push(vIdx)
			vIdx = RandomInCollection(validCunts);
		
			//TF
			pc.vaginas[vIdx].clits = 1;
			pc.vaginas[vIdx].vaginaType = GLOBAL.TYPE_SNAKE;
			pc.vaginas[vIdx].vaginaColor = RandomInCollection(luminousColors());
			
			output("\n\nElectric charges crackle down the whole length of your [pc.vagina " + vIdx + "], setting your pussy squirming even as all exterior definition seems to vanish. It takes you a few moments of searching with your fingers to figure out where your entrance even is, but when the lips peel apart your fingers are lit by the " + pc.vaginas[vIdx].vaginaColor + " of your new interior. <b>Your pussy has become a discreet, almost completely concealed slit</b>.");
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