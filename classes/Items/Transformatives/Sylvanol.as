package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
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
	
	public class Sylvanol extends ItemSlotClass
	{
		
		//constructor
		public function Sylvanol()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.PILL;
			//Used on inventory buttons
			this.shortName = "Sylvanol";
			//Regular name
			this.longName = "medipen labeled “Sylvanol”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a medipen labeled “Sylvanol”";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a light gray medipen with an unusual teardrop-like shape. Very popular among fans of fantasy fiction, it’s a targeted transformative which causes the user’s ears to become pointed like those of a fantasy elf. Repeated doses will cause the ears to lengthen outward. Users with particularly long ears often experience them becoming an erogenous zone. Unlike most medipens, there is an adjustable dial which, when spun, causes the surface of the medipen to cycle between several different color schemes. The labeling notes that each of these flavors will adjust the type of fantasy creature that the Sylvanol will transform you towards. A small pamphlet included with the medipen details the various settings.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2000;
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
		
		protected function rand(max: Number): Number {
 			return int(Math.random() * max);
 		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			author("Couch");
			if(target is PlayerCharacter) {
				kGAMECLASS.output("You take a look at the dial on the medipen and compare with the small instruction pamphlet. It looks like there’s six different settings available:\n\n");
				kGAMECLASS.clearMenu();
				output("(Franc) The default gray setting, for simple ear growth.");
				output("\n(Au Lait) A milk-white setting, for various light elf palettes.");
				output("\n(Au Chocolat) A dark brown setting, for various dark elf palettes.");
				output("\n(Au Myrtille) A bright blue setting, for various fairy traits.");
				output("\n(Au Ronce) A misty black setting, for various shadowy fairy traits.");
				addButton(0,"Franc",Franc,target,"Franc","The default gray setting, for simple ear growth.");
				addButton(1,"Au Lait",auLaitSylvabutts,target,"Au Lait","A milk-white setting, for various light elf palettes.");
				addButton(2,"AuChocolat",chocolateSylvabutts,target,"Au Chocolat","A dark brown setting, for various dark elf palettes.");
				addButton(3,"AuMyrtille",sylvanolAuMyrtille,target,"Au Myrtille","A bright blue setting, for various faerie traits.");
				addButton(4,"Au Ronce",sylvanolAuRonce,target,"Au Ronce","A misty black setting, for various shadow-faerie traits.");
				return true;
			}
			else {
				kGAMECLASS.output(target.capitalA + target.short + " injects the Sylvanol to no effect.");
			}
			return false;
		}
		//Utility shit
		public function sylvanolEarTF(pc:Creature):void
		{
			output("\n\nYou feel your ears contort, ");
			//Ugh I probably missed like, a million
			if(InCollection(pc.earType, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE, GLOBAL.TYPE_VULPINE, GLOBAL.TYPE_KANGAROO, GLOBAL.TYPE_MOUSE, GLOBAL.TYPE_PANDA)) output("adjusting to");
			else output("remaining at");
			output(" the sides of your head and changing shape to a form very much like a human’s save for the pointed tips. <b>You have elven ears!</b>");
			pc.earType = GLOBAL.TYPE_SYLVAN;
			pc.clearEarFlags();
			pc.addEarFlag(GLOBAL.FLAG_TAPERED);
			
			if(pc.earLength != 0)
			{
				// Limit for overly-long ears
				if(pc.earLength > 12) pc.earLength = 12;
				output("\n\n This isn’t your first time having this kind of ears, and they seem to have remembered the experience, coming out at the " + pc.earLength + " inches they used to be instead of the standard short ears for a first-time user. Nice.");
			}
		}
		public function sylvanolEarGrow(pc:Creature):void
		{
			//Grow ears, initial value of 1 inch:
			if(pc.earLength == 0 && pc.earType == GLOBAL.TYPE_SYLVAN)
			{
				pc.earLength = 1;
				output("\n\nWhile formerly your ears could have been mistaken for a human’s at a glance, that soon fades as they stretch outward, gaining a much more visibly triangular shape that’s distinctively elven and much more sensitive to the air when it blows across them. <b>You now have one-inch elf ears!</b>");
			}
			//Grow ears, initial value != 1 inch:
			else if(pc.earLength < 12)
			{
				var newEarGrow:int = (1 + rand(4));
				pc.earLength += newEarGrow;
				output("\n\nYou shudder in pleasure as the Sylvanol works over your ears, making them stretch out another " + num2Text(newEarGrow) + " inches before they stop growing, tingling with delicious new sensitivity.");
				//New length 12 inches:
				if(pc.earLength >= 12) output("\n\nYou have a feeling they won’t be able to grow much more than this, though.");
			}
		}
		public function sylvanolEyeTF(args:Array):void
		{
			var pc:Creature = args[0];
			var color:String = args[1];
			output("\n\nA sparkling flash of " + pc.eyeColor + " fills your vision, leaving you briefly stunned. When you recover and check your vision, you discover that your eyes have shed their old hue in favor of " + color + ".");
			pc.eyeColor = color;
		}
		public function sylvanolHairTF(args:Array):void
		{
			var pc:Creature = args[0];
			var color:String = args[1];
			output("\n\nA liquid feeling flows down your hair from the roots as if someone had poured a bucket of water over your head. You’re able to catch the trail end of the transformation that goes with this sensation, the last vestiges of " + pc.hairColor + " disappearing from your hair in favor of a new lovely " + color + " shade.");
			pc.hairColor = color;
		}
		public function sylvanolSkinTF(args:Array):void
		{
			var pc:Creature = args[0];
			var color:String = args[1];
			output("\n\nA delicious tingle washes across your whole body, a splotch of " + color + " forming at the center of your chest before sweeping all across your body, replacing your old skin color entirely");
			//human cock:
			if(pc.hasCock())
			{
				var cockColorChange:Boolean = false;
				for(var cockCount:int = 0; cockCount < pc.cockTotal(); cockCount++)
				{
					if(pc.cocks[cockCount].cockColor != color && pc.cocks[cockCount].cType == GLOBAL.TYPE_HUMAN)
					{
						cockColorChange = true;
						pc.cocks[cockCount].cockColor = color;
					}
				}
				if(cockColorChange) output(", even on [pc.eachCock]");
			}
			output(".");

			pc.skinTone = color;

			var nipColor:String = "pink";
			var cuntColor:String = "pink";
			
			if(pc.skinTone == "white")
			{
				nipColor = "silver";
				cuntColor = "silver";
			}
			else if(pc.skinTone == "fair" || pc.skinTone == "tanned" || pc.skinTone == "pale") 
			{
				nipColor = "pink";
				cuntColor = "pink";
			}
			else if(pc.skinTone == "chocolate") 
			{
				nipColor = "dark";
				cuntColor = "pink";
			}
			else if(pc.skinTone == "dark") 
			{
				nipColor = "brown";
				cuntColor = "pink";
			}
			else if(pc.skinTone == "ebony") 
			{
				nipColor = "onyx";
				cuntColor = "onyx";
			}
			else if(pc.skinTone == "pale blue") 
			{
				nipColor = "indigo";
				cuntColor = "indigo";
			}
			else
			{
				nipColor = "indigo";
				cuntColor = "indigo";
			}
			if(pc.nippleColor != nipColor)
			{
				output(" Your nipples change to match, becoming a complementing " + nipColor + " shade");
				pc.nippleColor = nipColor;
				if(pc.hasVagina())
				{
					var cuntColorChange:Boolean = false;
					for(var cuntCount:int = 0; cuntCount < pc.totalVaginas(); cuntCount++)
					{
						if(pc.vaginas[cuntCount].vaginaColor != cuntColor && pc.vaginas[cuntCount].type == GLOBAL.TYPE_HUMAN)
						{
							cuntColorChange = true;
							pc.vaginas[cuntCount].vaginaColor = cuntColor;
						}
					}
					if(cuntColorChange) output(", and an inspection of [pc.eachVagina] reveals that your nethers are packing a new " + cuntColor + " hue of their own");
				}
				output(".");
			}
		}
		public function sylvanolSmoothSkinTF(pc:Creature):void
		{
			output("\n\nYou can feel your skin ");
			//PC has fur/scales:
			if(pc.hasFur() || pc.hasScales()) output(" underneath your " + pc.skinNoun(false) + " ");
			output("being swept over by the Sylvanol, fixing every blemish and smoothing out every wrinkle beyond what’s even natural. By the time it’s done, <b>you’re left with flawless smooth skin</b>.");
			pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
		}
		public function sylvanolWingGrow(pc:Creature):void
		{
			if(pc.wingType == 0)
			{
				output("\n\nThere’s a budding sensation at your back, an odd pressure that soon leads you to gasp at the sensation of something along your back splitting open like a cocoon to allow a quartet of light blue wings to unfold. Each is a magnificent gossamer beauty, together forming a set of radiant butterfly-like wings. <b>You now have fairy wings!</b>");
			}
			//Change wings to fairy wings:
			else
			{
				output("\n\nYour [pc.wings] feel strange, and you look behind you to see them melting into a new, delicate-looking form. By the time they finish transforming they’ve become a quartet of light blue gossamer wings, together forming a set of radiant butterfly-like wings. <b>You now have fairy wings!</b>");
			}
			pc.shiftWings(GLOBAL.TYPE_SYLVAN, 4);
		}
		public function sylvanolShadowWingGrow(pc:Creature):void
		{
			if(pc.wingType == 0)
			{
				output("\n\nThere’s a budding sensation at your back, an odd pressure that soon leads you to gasp at the sensation of something along your back splitting open like a cocoon to allow a quartet of glittering black wings to unfold. Each is a magnificent gossamer beauty, together forming a set of butterfly-like wings coated in what looks like wisps of shadow. <b>You now have shadowy fairy wings!</b>");
			}
			//Change wings to fairy wings:
			else
			{
				output("\n\nYour [pc.wings] feel strange, and you look behind you to see them melting into a new, delicate-looking form. By the time they finish transforming they’ve become a quartet of glittering black gossamer wings, together forming a set of butterfly-like wings coated in what looks like wisps of shadow. <b>You now have shadowy fairy wings!</b>");
			}
			pc.shiftWings(GLOBAL.TYPE_DARK_SYLVAN, 4);
		}
		public function sylvanolVanaeMarkings(args:Array):void
		{
			var pc:Creature = args[0];
			var tarColor:String = args[1];
			output("\n\nYou feel a tingle like the medipen is going to change your skin, but suddenly it concentrates into just a few places. You watch in amazement as " + tarColor + " markings begin to flow across your [pc.skinFurScalesNoun] like a liquid paint, covering every inch of your body in the intricate tattoos. The lines stand out clear as day thanks to their glow, forming a beautiful contrast with your [pc.skinFurScales]. <b>You now have " + tarColor + " body markings!</b>");
			//pc.createStatusEffect("Vanae Markings");
			var patternType:int = 0;
			pc.createStatusEffect("Body Markings", patternType, 0, 0, 0);
			pc.skinAccent = tarColor;
		}
		public function fuckinShadowHairTF(pc:Creature):void
		{
			//Hair type becomes transparent:
			output("\n\nYou feel an odd tingle in your hair, feeling as if it’s being blown about by an invisible wind and slowly dissolving. At first you think you’re going bald, but inspection reveals that your hair has instead been replaced by an aerogel-like material, retaining its former color but with a translucent, gaseous appearance and practically no weight to it at all. <b>You have ethereal hair!</b>");
			pc.hairType = GLOBAL.HAIR_TYPE_TRANSPARENT;
		}
		//Sylvanol Au Ronce
		public function sylvanolAuRonce(pc:Creature):void
		{
			/*Effects
			Proc all 100% events, then a 75% chance of procing one High event, then a 50% chance of procing one Mid event, then a 25% chance of procing one Low event.
			100%:
			PC gains elven ears if ear type is not elven.
			Change skin to smooth.
			High:
			Add 1-3 inches to ear length, maximum 12 inches.
			Gain shadow fairy wings.
			Change existing wings into shadow fairy wings.
			Hair type becomes transparent.
			Mid:
			Gain shadow fairy arms.
			Gain shadow fairy legs, set number of legs to 2.
			Change hair color to black, violet, or glowing violet.
			Change eye color to red, ruby, crimson, indigo, violet, or silver.
			Low:
			Change skin color to gray and nipple color to silver. Also change color of any human cocks to gray and any human vaginas to silver.
			Change skin color to pale violet and nipple color to indigo. Also change color of any human cocks to pale violet and any human vaginas to indigo.
			Change skin color to pale and nipple color to pink. Also change color of any human cocks to pale and any human vaginas to pink.
			Gain glittering black, glowing red, glowing violet, or luminous silver vanae markings.*/
	
			kGAMECLASS.clearOutput();
			//Consumption Text
			output("You apply the medipen to the base of your neck, as instructed, and feel the Sylvanol Au Ronce’s payload get to work.");
			//Get elf ears:
			var elvenEars:Boolean = (pc.earType == GLOBAL.TYPE_SYLVAN);
			var changed:Boolean = false;
			var highEvents:Array = new Array();
			var mediumEvents:Array = new Array();
			var lowEvents:Array = new Array();
			var highEventsArgs:Array = new Array();
			var mediumEventsArgs:Array = new Array();
			var lowEventsArgs:Array = new Array();
			//Get elf ears:
			if(!elvenEars)
			{
				sylvanolEarTF(pc);
				changed = true;
			}
			//Change skin to smooth:
			if(!pc.hasSkinFlag(GLOBAL.FLAG_SMOOTH))
			{
				sylvanolSmoothSkinTF(pc);
				changed = true;
			}
			//Grow ears
			if(pc.earLength < 12) 
			{
				highEvents.push(sylvanolEarGrow);
				highEventsArgs.push(pc);
			}
			//Gain fairy wings:
			if(pc.wingType != GLOBAL.TYPE_DARK_SYLVAN) 
			{
				highEvents.push(sylvanolShadowWingGrow);
				highEventsArgs.push(pc);
			}
			//Transparo hair
			if(pc.hairType != GLOBAL.HAIR_TYPE_TRANSPARENT && pc.hairLength > 0)
			{
				highEvents.push(fuckinShadowHairTF);
				highEventsArgs.push(pc);
			}
			//Mid:
			//Change hair color to black, violet, or glowing violet.
			var hairColors:Array = ["black", "violet", "glowing violet"];
			var tarColor:String = RandomInCollection(hairColors);
			if(!InCollection(pc.hairColor, hairColors)) 
			{
				mediumEvents.push(sylvanolHairTF);
				mediumEventsArgs.push([pc,tarColor]);
			}
			//Change eye color to red, ruby, crimson, indigo, violet, or silver.
			var eyeColors:Array = ["red", "ruby", "crimson", "indigo","violet","silver"];
			tarColor = RandomInCollection(eyeColors);
			if(!InCollection(pc.eyeColor, eyeColors)) 
			{
				mediumEvents.push(sylvanolEyeTF);
				mediumEventsArgs.push([pc,tarColor]);
			}
			
			//Change skin/nipple/cock/vagina color:
			var skinColors:Array = ["gray", "pale violet", "pale"];
			tarColor = RandomInCollection(skinColors);
			if(!InCollection(pc.skinTone, skinColors))
			{
				lowEvents.push(sylvanolSkinTF);
				lowEventsArgs.push([pc,tarColor]);
			}
			//Gain glittering black, glowing red, glowing violet, or luminous silver vanae markings.
			var vanaeColors:Array = ["glittering black", "glowing red", "glowing violet","luminous silver"];
			tarColor = RandomInCollection(vanaeColors);
			if(!pc.hasAccentMarkings()) 
			{
				lowEvents.push(sylvanolVanaeMarkings);
				lowEventsArgs.push([pc,tarColor]);
			}
			//Lets roll!
			if(highEvents.length > 0 && rand(4) != 0)
			{
				var x:int = rand(highEvents.length)
				highEvents[x](highEventsArgs[x]);
				changed = true;
			}
			if(mediumEvents.length > 0 && rand(2) != 0)
			{
				var y:int = rand(mediumEvents.length);
				mediumEvents[y](mediumEventsArgs[y]);
				changed = true;
			}
			if(lowEvents.length > 0 && rand(4) == 0)
			{
				var z:int = rand(lowEvents.length)
				lowEvents[z](lowEventsArgs[z]);
				changed = true;
			}
			//Dud result:
			if(!changed) output("\n\nDespite applying the medipen correctly, nothing happens aside from a brief tingle in your ears. It must have been a dud.");
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		//Sylvanol Au Myrtille
		public function sylvanolAuMyrtille(pc:Creature):void
		{
			clearOutput();
			/*Effects
			Proc all 100% events, then a 75% chance of procing one High event, then a 50% chance of procing one Mid event, then a 25% chance of procing one Low event.
			100%:
			PC gains elven ears if ear type is not elven.
			Change skin to smooth.
			High:
			Add 1-3 inches to ear length, maximum 12 inches.
			Gain fairy wings.
			Change existing wings into fairy wings.
			Mid:
			Gain fairy arms.
			Gain fairy legs, set number of legs to 2.
			Change hair color to blue, teal, white, pink, or rose gold.
			Change eye color to blue, sapphire, green, emerald, silver, or gold.
			Low:
			Change skin color to pale blue and nipple color to indigo. Also change color of any human cocks to blue and any human vaginas to indigo.
			Change skin color to white and nipple color to blue. Also change color of any human cocks to white and any human vaginas to blue.
			Gain luminous blue, luminous green, luminous pink, luminous silver or glowing gold vanae markings.*/

			//Consumption Text
			output("You apply the medipen to the base of your neck, as instructed, and feel the Sylvanol Au Myrtille’s payload get to work.");
			//Get elf ears:
			var elvenEars:Boolean = (pc.earType == GLOBAL.TYPE_SYLVAN);
			var changed:Boolean = false;
			//Get elf ears:
			if(!elvenEars)
			{
				sylvanolEarTF(pc);
				changed = true;
			}
			//Change skin to smooth:
			if(!pc.hasSkinFlag(GLOBAL.FLAG_SMOOTH))
			{
				sylvanolSmoothSkinTF(pc);
				changed = true;
			}

			var highEvents:Array = new Array();
			var mediumEvents:Array = new Array();
			var lowEvents:Array = new Array();
			var highEventsArgs:Array = new Array();
			var mediumEventsArgs:Array = new Array();
			var lowEventsArgs:Array = new Array();
			//Grow ears
			if(pc.earLength < 12) 
			{
				highEvents.push(sylvanolEarGrow);
				highEventsArgs.push(pc);
			}
			//Gain fairy wings:
			if(pc.wingType != GLOBAL.TYPE_SYLVAN) 
			{
				highEvents.push(sylvanolWingGrow);
				highEventsArgs.push(pc);
			}
			

			//Change hair color
			var hairColors:Array = ["blue", "teal", "white", "pink","rose gold"];
			var tarColor:String = RandomInCollection(hairColors);
			if(!InCollection(pc.hairColor, hairColors)) 
			{
				mediumEvents.push(sylvanolHairTF);
				mediumEventsArgs.push([pc,tarColor]);
			}
			

			//Chhange eye color
			var eyeColors:Array = ["blue", "sapphire", "green", "emerald","silver","gold"];
			tarColor = RandomInCollection(eyeColors);
			if(!InCollection(pc.eyeColor, eyeColors)) 
			{
				mediumEvents.push(sylvanolEyeTF);
				mediumEventsArgs.push([pc,tarColor]);
			}

			//Change skin/nipple/cock/vagina color:
			var skinColors:Array = ["pale blue", "white"];
			tarColor = RandomInCollection(skinColors);
			if(!InCollection(pc.skinTone, skinColors))
			{
				lowEvents.push(sylvanolSkinTF);
				lowEventsArgs.push([pc,tarColor]);
			}

			//Gain vanae-style markings:
			var vanaeColors:Array = ["luminous blue", "luminous green", "luminous pink","luminous silver","glowing gold"];
			tarColor = RandomInCollection(vanaeColors);
			if(!pc.hasAccentMarkings()) 
			{
				lowEvents.push(sylvanolVanaeMarkings);
				lowEventsArgs.push([pc,tarColor]);
			}

			//Lets roll!
			if(highEvents.length > 0 && rand(4) != 0)
			{
				var x:int = rand(highEvents.length)
				highEvents[x](highEventsArgs[x]);
				changed = true;
			}
			if(mediumEvents.length > 0 && rand(2) != 0)
			{
				var y:int = rand(mediumEvents.length)
				mediumEvents[y](mediumEventsArgs[y]);
				changed = true;
			}
			if(lowEvents.length > 0 && rand(4) == 0)
			{
				var z:int = rand(lowEvents.length)
				lowEvents[z](lowEventsArgs[z]);
				changed = true;
			}
			//Dud result:
			if(!changed) output("\n\nDespite applying the medipen correctly, nothing happens aside from a brief tingle in your ears. It must have been a dud.");
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		//Sylvanol Au Chocolate
		public function chocolateSylvabutts(pc:Creature):void
		{
			/*Effects
			PC’s ear type is not elven:
			100% chance that PC gains 1-inch elven ears.
			100% chance to change hair to one of the values listed in Dark Elf Palettes.
			100% chance to change eyes to one of the values listed in Dark Elf Palettes.
			100% chance to change skin and nipples to one of the values listed in Dark Elf Palettes. If PC’s cock type is human, change cock color to skin color. If PC’s vagina type is human, change vagina color as listed.
			100% chance to change skin type to smooth.


			PC has elven ears:
			50% chance to add 1-3 inches to ear length, maximum 12 inches.
			50% chance to change hair to one of the values listed in Dark Elf Palettes.
			50% chance to change eyes to one of the values listed in Dark Elf Palettes.
			50% chance to change skin and nipples to one of the values listed in Dark Elf Palettes. If PC’s cock type is human, change cock color to skin color. If PC’s vagina type is human, change vagina color as listed.
			50% chance to change skin type to smooth.
			*/
			clearOutput();
			var changed:Boolean = false;
			output("You apply the medipen to the base of your neck, as instructed, and feel the Sylvanol Au Chocolat’s payload get to work.");

			var elvenEars:Boolean = (pc.earType == GLOBAL.TYPE_SYLVAN);

			//Get elf ears:
			if(!elvenEars)
			{
				sylvanolEarTF(pc);
				changed = true;
			}
			//Grow ears - 50% chance
			else if(pc.earLength < 12 && rand(2) == 0)
			{
				sylvanolEarGrow(pc);
				changed = true;
			}
			var hairColors:Array = ["black", "silver", "purple", "white"];
			var tarColor:String = RandomInCollection(hairColors);
			var haveElfHair:Boolean = InCollection(pc.hairColor, hairColors);
			//Change hair:
			if(!haveElfHair && (rand(2) == 0 || !elvenEars))
			{
				sylvanolHairTF([pc,tarColor]);
				changed = true;
			}
			//Eye color TFs
			var eyeColors:Array = ["red", "ruby", "crimson", "purple","green","yellow","gold","silver"];
			tarColor = RandomInCollection(eyeColors);
			var haveElfEyes:Boolean = InCollection(pc.eyeColor, eyeColors);
			//Change eyes:
			if(!haveElfEyes && (rand(2) == 0 || !elvenEars))
			{
				sylvanolEyeTF([pc,tarColor]);
				changed = true;
			}
			//Change skin/nipples/cock/vagina:
			var skinColors:Array = ["chocolate", "dark", "ebony", "pale blue"];
			tarColor = RandomInCollection(skinColors);
			var haveElfSkin:Boolean = InCollection(pc.skinTone, skinColors);
			if(!haveElfSkin && (rand(2) == 0 || !elvenEars))
			{
				sylvanolSkinTF([pc,tarColor]);
				changed = true;
			}
			//Change skin to smooth:
			if(!pc.hasSkinFlag(GLOBAL.FLAG_SMOOTH) && (rand(2) == 0 || !elvenEars))
			{
				sylvanolSmoothSkinTF(pc);
				changed = true;
			}
			//Dud result:
			if(!changed)
			{
				output("\n\nDespite applying the medipen correctly, nothing happens aside from a brief tingle in your ears. It must have been a dud.");
			}
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}

		//Sylvanol Au Lait
		public function auLaitSylvabutts(pc:Creature):void
		{
			/*Effects
			PC’s ear type is not elven:
			100% chance that PC gains 1-inch elven ears.
			100% chance to change hair to one of the values listed in Light Elf Palettes.
			100% chance to change eyes to one of the values listed in Light Elf Palettes.
			100% chance to change skin and nipples to one of the values listed in Light Elf Palettes. If PC’s cock type is human, change cock color to skin color. If PC’s vagina type is human, change vagina color as listed.
			100% chance to change skin type to smooth.

			PC has elven ears:
			50% chance to add 1-3 inches to ear length, maximum 12 inches.
			50% chance to change hair to one of the values listed in Light Elf Palettes.
			50% chance to change eyes to one of the values listed in Light Elf Palettes.
			50% chance to change skin and nipples to one of the values listed in Light Elf Palettes. If PC’s cock type is human, change cock color to skin color. If PC’s vagina type is human, change vagina color as listed.
			50% chance to change skin type to smooth.
			*/
			clearOutput();
			var changed:Boolean = false;
			output("You apply the medipen to the base of your neck, as instructed, and feel the Sylvanol Au Lait’s payload get to work.");

			var elvenEars:Boolean = (pc.earType == GLOBAL.TYPE_SYLVAN);

			//Get elf ears:
			if(!elvenEars)
			{
				sylvanolEarTF(pc);
				changed = true;
			}
			//Grow ears - 50% chance
			else if(pc.earLength < 12 && rand(2) == 0)
			{
				sylvanolEarGrow(pc);
				changed = true;
			}
			var hairColors:Array = ["blonde", "brown", "red", "white"];
			var tarColor:String = RandomInCollection(hairColors);
			var haveElfHair:Boolean = InCollection(pc.hairColor, hairColors);
			//Change hair:
			if(!haveElfHair && (rand(2) == 0 || !elvenEars))
			{
				sylvanolHairTF([pc,tarColor]);
				changed = true;
			}
			//Eye color TFs
			var eyeColors:Array = ["blue", "sapphire", "green", "emerald","yellow","gold","silver"];
			tarColor = RandomInCollection(eyeColors);
			var haveElfEyes:Boolean = InCollection(pc.eyeColor, eyeColors);
			//Change eyes:
			if(!haveElfEyes && (rand(2) == 0 || !elvenEars))
			{
				sylvanolEyeTF([pc,tarColor]);
				changed = true;
			}
			//Change skin/nipples/cock/vagina:
			var skinColors:Array = ["fair", "tanned", "pale", "white"];
			tarColor = RandomInCollection(skinColors);
			var haveElfSkin:Boolean = InCollection(pc.skinTone, skinColors);
			if(!haveElfSkin && (rand(2) == 0 || !elvenEars))
			{
				sylvanolSkinTF([pc,tarColor]);
				changed = true;
			}
			//Change skin to smooth:
			if(!pc.hasSkinFlag(GLOBAL.FLAG_SMOOTH) && (rand(2) == 0 || !elvenEars))
			{
				sylvanolSmoothSkinTF(pc);
				changed = true;
			}
			//Dud result:
			if(!changed)
			{
				output("\n\nDespite applying the medipen correctly, nothing happens aside from a brief tingle in your ears. It must have been a dud.");
			}
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
		public function Franc(pc:Creature):void
		{
			clearOutput();
			kGAMECLASS.showName("SYLVANOL\nAU FRANC");
			author("Couch");
			//Consumption Text
			output("You apply the medipen to the base of your neck, as instructed, and feel the Sylvanol’s payload get to work.");
			
			//Get elf ears:
			if(pc.earType != GLOBAL.TYPE_SYLVAN)
			{
				// Maybe lengthen long, non-elf-like eartypes
				if(pc.hasLongEars() && rand(2) == 0)
				{
					sylvanolEarGrow(pc);
				}
				else sylvanolEarTF(pc);
			}
			//Grow ears
			else if(pc.earLength < 12)
			{
				sylvanolEarGrow(pc);
			}
			//Dud result:
			else
			{
				output("\n\nDespite applying the medipen correctly, nothing happens aside from a brief tingle in your ears. You must have hit the limit of what Sylvanol can do for you.");
			}
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}

