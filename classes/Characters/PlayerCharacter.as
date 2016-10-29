package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.GetGameTimestamp;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.Items.Accessories.LeithaCharm;
	import classes.RoomClass;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.ItemSlotClass;
	import classes.Engine.Interfaces.logTimeStamp;
	import classes.Engine.Interfaces.ParseText;
	import classes.Engine.Utility.num2Text;
	import classes.Util.InCollection;
	
	/**
	 * Yeah this is kinda bullshit, but it also means we can version the PC data structure like NPCs.
	 * Might be useful, but its mainly here to do some proper error checking.
	 * @author Gedan
	 */
	public class PlayerCharacter extends Creature
	{
		public function PlayerCharacter() 
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			this._isLoading = false;
			
			isUniqueInFight = true;
		}
		
		// Level up stuff
		public var unspentStatPoints:int = 0;
		public var unclaimedClassPerks:int = 0;
		public var unclaimedGenericPerks:int = 0;
		
		public function levelUpAvailable():Boolean
		{
			if (unspentStatPoints > 0) return true;
			if (unclaimedClassPerks > 0) return true;
			//if (unclaimedGenericPerks > 0) return true; // Placeholder for possible future usage.
			return false;
		}
		
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			kGAMECLASS.mimbraneFeed("vagina");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			if (cumFrom != null)
			{
				if(!cumFrom.hasStatusEffect("Ovilium Effect") && hasStatusEffect("Ovilium"))
				{
					kGAMECLASS.oviliumEggBump(cumFrom, vagIndex);
				}
				if(cumflationEnabled()) cumflationHappens(cumFrom,vagIndex);
				return this.tryKnockUp(cumFrom, vagIndex);
			}
			
			return false;
		}
		
		override public function loadInAss(cumFrom:Creature = null):Boolean
		{
			kGAMECLASS.mimbraneFeed("ass");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			if(hasPerk("Buttslut"))
			{
				HP(level);
				if(cumFrom != null) HP(Math.round(cumFrom.cumQ()/1000));
			}
			if (cumFrom != null)
			{
				if(cumflationEnabled()) cumflationHappens(cumFrom,3);
				return this.tryKnockUp(cumFrom, 3);
			}
			
			return false;
		}
		
		override public function milkInMouth(milkFrom:Creature = null):Boolean
		{
			if(milkFrom != null) fluidInMouthEffects(milkFrom, milkFrom.milkType, milkFrom.lactationQ(), "milk");
			
			kGAMECLASS.mimbraneFeed("face");
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(milkFrom != null) addBiomass(milkFrom.lactationQ());
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(milkFrom != null)
				{
					if(milkFrom.lactationQ() >= 500) kGAMECLASS.honeyPotBump(true);
					if(milkFrom.lactationQ() >= 1000) kGAMECLASS.honeyPotBump(true);
					if(milkFrom.lactationQ() >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			return false;
		}
		
		override public function girlCumInMouth(cumFrom:Creature = null):Boolean
		{
			if(cumFrom != null) fluidInMouthEffects(cumFrom, cumFrom.girlCumType, cumFrom.girlCumQ(), "girl-cum");
			
			kGAMECLASS.mimbraneFeed("face");
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.girlCumQ());
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(cumFrom != null)
				{
					if(cumFrom.girlCumQ() >= 500) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.girlCumQ() >= 1000) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.girlCumQ() >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			return false;
		}
		
		override public function loadInMouth(cumFrom:Creature = null):Boolean
		{
			if(cumFrom != null) fluidInMouthEffects(cumFrom, cumFrom.cumType, cumFrom.cumQ(), "cum");
			
			kGAMECLASS.mimbraneFeed("face");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(cumFrom != null)
				{
					if(cumFrom.cumQ() >= 500) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.cumQ() >= 1000) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.cumQ() >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			if(hasPerk("Dumb4Cum"))
			{
				kGAMECLASS.dumb4CumReset();
			}
			if(cumFrom != null && cumflationEnabled()) cumflationHappens(cumFrom,4);
			if(cumFrom != null)
			{
				if(hasPerk("Autofellatio Queen") && cumFrom is PlayerCharacter) this.energy(35);
			}
			return false;
		}
		// *shrug*
		override public function loadInNipples(cumFrom:Creature = null):Boolean
		{
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			kGAMECLASS.mimbraneFeed("boobs");
			return false;
		}
		
		override public function loadInCuntTail(cumFrom:Creature = null):Boolean
		{
			if (this.hasTailCunt()) 
			{
				if(cumFrom is Flahne) kGAMECLASS.feedCuntSnake(false);
				else kGAMECLASS.feedCuntSnake();
			}
			if (cumFrom != null)
			{
				return this.tryKnockUp(cumFrom, 4);
			}
			
			return false;
		}
		
		// For swallowing liquids!
		private function fluidInMouthEffects(fluidFrom:Creature = null, fluidType:int = -1, fluidQ:Number = 0, fluidSource:String = "none"):void
		{
			if(fluidQ <= 0) return;
			
			var fxMult:int = 1;
			// Increase effect magnitude by every liter consumed
			if(fluidQ > 1000) fxMult += Math.round((fluidQ - 1000) / 1000);
			
			// Natural source bonuses
			switch(fluidSource)
			{
				case "milk":
					energy(10 * fxMult);
					if(fluidFrom.hasPerk("Treated Milk")) energy(10 * fxMult);
					if(fluidType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) modThickness((1 * fxMult), false);
					break;
				case "cum":
					/* Nothing yet! */
					break;
				case "girl-cum":
					/* Nothing yet! */
					break;
			}
			
			// Energy effects
			switch(fluidType)
			{
				case GLOBAL.FLUID_TYPE_MILK:
				case GLOBAL.FLUID_TYPE_EGGNOG:
					energy(10 * fxMult);
					break;
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
				case GLOBAL.FLUID_TYPE_VANILLA:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
					energy(15 * fxMult);
					break;
				case GLOBAL.FLUID_TYPE_HONEY:
				case GLOBAL.FLUID_TYPE_NECTAR:
				case GLOBAL.FLUID_TYPE_MILKSAP:
				case GLOBAL.FLUID_TYPE_CUMSAP:
					energy(20 * fxMult);
					break;
			}
			
			// Alcoholic content
			switch(fluidType)
			{
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
					imbibeAlcohol(10 * fxMult);
					break;
				case GLOBAL.FLUID_TYPE_EGGNOG:
					imbibeAlcohol(5 * fxMult);
					break;
			}
		}
		
		public var ShipStorageInventory:Array = [];
		public function hasItemInStorage(arg:ItemSlotClass,amount:int = 1):Boolean
		{
			if(ShipStorageInventory.length == 0) return false;
			var foundAmount:int = 0;
			for(var x:int = 0; x < ShipStorageInventory.length; x++)
			{
				if(ShipStorageInventory[x].shortName == arg.shortName) foundAmount += ShipStorageInventory[x].quantity;
			}
			if(foundAmount >= amount) return true;
			return false;
		}
		public function destroyItemInStorage(arg:ItemSlotClass,amount:int = 1):void
		{
			if(ShipStorageInventory.length == 0) return;
			var foundAmount:int = 0;
			for(var x:int = 0; x < ShipStorageInventory.length; x++)
			{
				//Item in the slot?
				if(ShipStorageInventory[x].shortName == arg.shortName) 
				{
					//If we still need to eat some, eat em up!
					while(amount > 0 && ShipStorageInventory[x].quantity > 0) 
					{
						ShipStorageInventory[x].quantity--;
						amount--;
						if(ShipStorageInventory[x].quantity <= 0) ShipStorageInventory.splice(x,1);
					}
				}
			}
			return;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			var res:Array = d.resistances;
			var bRes:Array = d.bonusResistances;
			
			// Convert resistance perks.
			var toughLevel:uint = 0;
			
			if (d.perks)
			{
				for (var i:uint = 0; i < d.perks.length; i++)
				{
					if (d.perks[i] && d.perks[i].storageName)
					{
						if (d.perks[i].storageName == "Tough" && toughLevel == 0) toughLevel = 1;
						if (d.perks[i].storageName == "Tough 2" && toughLevel <= 1) toughLevel = 2;
					}
				}
			}
			
			var toughVal:Number = 0;
			if (toughLevel == 1) toughVal = 10;
			if (toughLevel == 2) toughVal = 15;
			
			var nBaseHP:TypeCollection = new TypeCollection();
			nBaseHP.kinetic.resistanceValue = toughVal;
			
			var nBaseShield:TypeCollection = new TypeCollection();
			nBaseShield.kinetic.resistanceValue = toughVal;
			
			d.baseHPResistances = nBaseHP.getSaveObject();
			d.baseShieldResistances = nBaseShield.getSaveObject();			
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
		
		override public function getCombatName():String
		{
			return "you";
		}
		
		override public function processTime(deltaT:uint, doOut:Boolean):void
		{	
			var totalDays:int = ((GetGameTimestamp() + deltaT) / 1440) - kGAMECLASS.days;
			
			if (!hasCock() && balls == 0 && hasStatusEffect("Blue Balls"))
			{
				removeStatusEffect("Blue Balls");
			}
			
			if (totalDays >= 1)
			{
				if (hasCuntTail())
				{
					if (flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined)
					{
						flags["DAYS_SINCE_FED_CUNT_TAIL"] = totalDays;
					}
					else
					{
						flags["DAYS_SINCE_FED_CUNT_TAIL"] += totalDays;
					}
				}
				
				var aaf:StorageClass = getPerkEffect("Auto-Autofellatio");
				if (aaf && aaf.value2 >= 1)
				{
					aaf.value2 -= 1 * totalDays;
					if (aaf.value2 < 0) aaf.value2 = 0;
				}
				
				if (hasPerk("Mane"))
				{
					maneHairGrow(totalDays);
				}
				
				if (hasPerk("Buttslut"))
				{
					buttslutBootyGrowth(totalDays);
				}
				
				if (hasPerk("Fecund Figure"))
				{
					fecundFigure(totalDays);
				}
				
				if (hasStatusEffect("Nyrea Eggs") && fertility() > 0)
				{
					nyreaEggStuff(totalDays);
				}

				myrVenomUpdate(totalDays);
			}
			
			updateVaginaStretch(deltaT, doOut);
			updateButtStretch(deltaT, doOut);
			updateGooState(deltaT, doOut);
			
			super.processTime(deltaT, doOut);
		}
		
		private function myrVenomUpdate(totalDays:uint):void
		{
			if(kGAMECLASS.flags["VENOM_ADDICTION"] != undefined)
			{
				//Not yet uber-addict:
				if(hasPerk("Venom Slut"))
				{
					if(hasStatusEffect("Myr Venom Withdrawal")) kGAMECLASS.myrAddiction(-2 * totalDays);
				}
			}
			//Non addicts not under the effects of venom lose progress to addiction
			else if(flags["VENOM_ADDICTION"] == undefined && !hasStatusEffect("Red Myr Venom"))
			{
				kGAMECLASS.venomProgress(-2 * totalDays);
			}
		}
		
		private function updateGooState(deltaT:uint, doOut:Boolean):void
		{
			if (!hasStatusEffect("Goo Crotch")) return;
			
			var totalHours:int = ((kGAMECLASS.minutes + deltaT) / 60);
			
			if (totalHours < 1) return;
			
			var unflaggedGenital:Array = [];
			for (var i:int = 0; i < cocks.length; i++)
			{
				if (!hasCockFlag(GLOBAL.FLAG_GOOEY, i)) unflaggedGenital.push(i);
			}
			
			if (unflaggedGenital.length > 0)
			{
				if (unflaggedGenital.length == cocks.length)
				{
					if(cockTotal() == 1) kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", deltaT) + " The " + cockColor() + " skin of your " + simpleCockNoun(0) + " is vanishing into a slowly creeping wave " + kGAMECLASS.gooColor() + " goo, losing cohesion in exchange for infinitely morphic possibilities. <b>Your penis is now gelatinous.</b>";
					//Multischlongs
					else kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", deltaT) + " The skin of your " + cocksDescript() + " tingles like mad as waves of translucent goo slowly replaces their skin, transforming them from fleshy wieners into semi-solid, shape-shifting pricks. <b>Your penises are now gelatinous.</b>";
				}
				else
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", deltaT) + " Your gooey, ever-slick crotch spreads down the length";
					if(unflaggedGenital.length > 1) kGAMECLASS.eventBuffer += "s of your rogue, solid dicks, transforming them into drippy, inexplicably jellied boners.";
					else 
					{
						kGAMECLASS.eventBuffer += " of your rock, solidified dick, transforming it to be just as drippy and jelly-like as";
						if(cockTotal() == 2) kGAMECLASS.eventBuffer += " its brother.";
						else kGAMECLASS.eventBuffer += " its brothers.";
					}
					kGAMECLASS.eventBuffer += " <b>All of your penises are now gelatinous.</b>";
				}
				
				for (i = 0; i < unflaggedGenital.length; i++)
				{
					cocks[unflaggedGenital[i]].addFlag(GLOBAL.FLAG_GOOEY);
					cocks[unflaggedGenital[i]].cockColor = kGAMECLASS.gooColor();
				}
			}
			
			var unflaggedVagNum:int = 0;
			for (i = 0; i < vaginas.length; i++)
			{
				if (!vaginas[i].hasFlag(GLOBAL.FLAG_GOOEY))
				{
					unflaggedVagNum++;
					vaginas[i].addFlag(GLOBAL.FLAG_GOOEY);
					vaginas[i].vaginaColor = kGAMECLASS.gooColor();
				}
			}
			
			if (unflaggedVagNum > 0)
			{
				if (unflaggedVagNum == vaginas.length)
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", deltaT) + " You're getting incredibly wet";
					if(legCount > 1) kGAMECLASS.eventBuffer += " between the [pc.legs]";
					else kGAMECLASS.eventBuffer += "... down there";
					kGAMECLASS.eventBuffer += ". Moisture seems to be dripping everywhere, transforming your puss";
					if(totalVaginas() == 1) kGAMECLASS.eventBuffer += "y into a slipperier, gooier version of itself. <b>Your entire vagina has become semi-solid, like the rest of your crotch.";
					else kGAMECLASS.eventBuffer += "ies into slipperier, gooier versions of themselves. <b>All of your vaginas are now semi-solid, goo-cunts, just like the rest of your crotch.";
				}
				else
				{
					kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", deltaT) + " Unsurprisingly, the slime that surrounds your multiple mounds trickles in, remaking the more solid flesh into an even wetter, slicker parody of itself. <b>All of your vaginas are made of goo.</b>";
				}
			}
		}
		
		private function nyreaEggStuff(totalDays:uint):void
		{
			var effect:StorageClass = getStatusEffect("Nyrea Eggs");
			
			effect.value1 += Math.round(10 * effect.value2 * fertility()) * totalDays;
			if (hasPerk("Fertility"))
			{
				for (var i:int = 0; i < totalDays; i++)
				{
					effect.value1 += 10 + rand(11);
				}
			}
			
			if (effect.value1 > 1000 && rand(2) == 0)
			{
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", 1440 - (GetGameTimestamp() % 1440)) + " You feel completely bloated with your production of nyrean eggs... Perhaps you should make some time to expel them?";
			}
		}
		
		private function fecundFigure(totalDays:uint):void
		{
			var numPreg:int = totalPregnancies();
			if(isPregnant(3)) numPreg--; // No buttpregs
			
			// Cap the total days that this can be applied based on the current longest potential pregnancy
			totalDays = Math.min(Math.round(PregnancyManager.getLongestRemainingDuration(this) / 1440), totalDays);
			
			// Longevity of growth based on number of current pregnant wombs.
			if (numPreg > 0) addPerkValue("Fecund Figure", 4, numPreg * totalDays);
			
			if(perkv4("Fecund Figure") > 0)
			{
				// 20 days for 1 hips/butt size gain
				addPerkValue("Fecund Figure", 1, (0.05 * totalDays)); // Hips
				addPerkValue("Fecund Figure", 2, (0.05 * totalDays)); // Butt
				addPerkValue("Fecund Figure", 4, -(totalDays)); // Gains
			}
			
			if(perkv4("Fecund Figure") < 0) setPerkValue("Fecund Figure", 4, 0);			
		}
		
		private function buttslutBootyGrowth(totalDays:int):void
		{
			var bootyMin:Number = 18;
	
			// If butt is max size or is currently filled, no need to grow.
			if (buttRatingRaw >= bootyMin || statusEffectv1("Anally-Filled") > 0) return;
			
			var baseDShift:uint = 1440 - (GetGameTimestamp() % 1440);
			
			for (var i:int = 0; i < totalDays; i++)
			{
				var oldBooty:Number = buttRatingRaw;
				var addBooty:Number = 1 + rand(9);
				if (buttRatingRaw + addBooty > bootyMin) addBooty = bootyMin - buttRatingRaw;
				if (addBooty < 0) return;
				
				kGAMECLASS.eventBuffer += "\n\n" + logTimeStamp("passive", baseDShift + (i * 1440)) + " You notice some extra weight and jiggle when you go to move or stand. Looking behind you, you find that your ass has gained";
				if (addBooty > 5) kGAMECLASS.eventBuffer += " an epic amount of cheek";
				else if (addBooty > 4) kGAMECLASS.eventBuffer += " a massive surge in size";
				else if (addBooty > 3) kGAMECLASS.eventBuffer += " a much larger circumference";
				else if (addBooty > 2) kGAMECLASS.eventBuffer += " a few sizes";
				else if (addBooty > 1) kGAMECLASS.eventBuffer += " a another size or two";
				else kGAMECLASS.eventBuffer += " some mass";
				kGAMECLASS.eventBuffer += ParseText("... It seems your bubbly booty refuses to be any smaller" + (buttRatingRaw < 10 ? " than that." : "--not that you’d complain!") + " <b>Your [pc.butts] have grown bigger!</b>");
				
				buttRatingRaw += addBooty;
				
				if(hairType == GLOBAL.HAIR_TYPE_GOO && addBooty > 0)
				{
					var gooCost:Number = (20 * addBooty);
					if(gooCost > 0 && kGAMECLASS.gooBiomass() >= gooCost)
					{
						kGAMECLASS.eventBuffer += " Although, the growth took up some of your gooey biomass in the process...";
						kGAMECLASS.gooBiomass(-1 * gooCost);
					}
				}
			}
		}
		
		private function maneHairGrow(totalDays:uint):void
		{
			var lengthMin:Number = 3;
	
			if (hairLength >= lengthMin) return;
			
			var deltaShift:uint = 1440 - (GetGameTimestamp() % 1440);
	
			for (var i:int = 0; i < totalDays; i++)
			{
				kGAMECLASS.eventBuffer += "\n\n" + kGAMECLASS.logTimeStamp("passive", deltaShift + (i * 1440)) + " Your scalp tingles and you";
				if (hairLength <= 0)
				{
					kGAMECLASS.eventBuffer += ParseText(" reach up to scratch it. Instead of [pc.skinFurScalesNoun], your fingers run across");
					if(hairType == GLOBAL.HAIR_TYPE_REGULAR)
					{
						kGAMECLASS.eventBuffer += " patches of growing hair.";
						hairLength = 0.125;
					}
					else
					{
						kGAMECLASS.eventBuffer += ParseText(" a growing patch of tiny [pc.hairsNoun].");
						hairLength = 0.5;
					}
					kGAMECLASS.eventBuffer += ParseText(" <b>You now have [pc.hair]!</b>");
				}
				else
				{
					var hairGain:Number = 1 + rand(2);
					if (hairLength <= 2)
					{
						kGAMECLASS.eventBuffer += ParseText(" reach up to touch your short [pc.hairNoun]. <b>It seems longer than it did before, growing out about " + num2Text(hairGain) + " more inch");
						if(hairGain != 1) kGAMECLASS.eventBuffer += "es";
						kGAMECLASS.eventBuffer += ".</b>";
					}
					else
					{
						kGAMECLASS.eventBuffer += ParseText(" see your [pc.hairNoun] grow out, right in front of your eyes. <b>Your hair has lengthened by " + num2Text(hairGain) + " inch");
						if(hairGain != 1) kGAMECLASS.eventBuffer += "es";
						kGAMECLASS.eventBuffer += "!</b>";
					}
					hairLength = Math.round(hairLength + hairGain);
				}
				if(!InCollection(hairStyle, ["null", "tentacle"]))
				{
					kGAMECLASS.eventBuffer += " It seems the growth has messed up your hairdo in the process... You might have to get it restyled later.";
					hairStyle = "null";
				}
			}
		}
	}
}
