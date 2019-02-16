package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Miscellaneous.Ovilium;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	
	
	public class Siegwulfe extends Creature
	{
		public function Siegwulfe()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = false;
			
			short = "Siegwulfe";
			originalRace = "robot";
			a = "";
			capitalA = "";
			long = "Siegwulfe model seven, serial number X33897-28";
			customDodge = "Dodge Placeholder";
			customBlock = "Block Placeholder";
			isPlural = false;
			
			meleeWeapon.longName = "hardlight wrist blade";
			meleeWeapon.attackVerb = "slash";
			meleeWeapon.attackNoun = "slash";
			meleeWeapon.hasRandomProperties = true;
			
			armor.longName = "polysteel plates";
			armor.defense = 15;
			armor.hasRandomProperties = true;
			
			shield = new ReaperArmamentsMarkIShield();
			
			physiqueRaw = 35;
			reflexesRaw = 25;
			aimRaw = 30;
			intelligenceRaw = 4;
			willpowerRaw = 4;
			libidoRaw = 75;
			HPMod = 30;
			shieldsRaw = shieldsMax();
			HPRaw = HPMax();
			energyRaw = 100;
			lustRaw = 15;
			
			level = 5;
			XPRaw = normalXP();
			credits = 0;
			
			femininity = 95;
			eyeType = GLOBAL.TYPE_SYNTHETIC;
			eyeColor = "glowing red";
			tallness = 112;
			hairType = GLOBAL.HAIR_TYPE_REGULAR;
			hairLength = 40;
			hairStyle = "ponytail";
			
			skinType = GLOBAL.SKIN_TYPE_SKIN;
			skinFlags = [GLOBAL.FLAG_SMOOTH];
			faceType = GLOBAL.TYPE_HUMAN;
			faceFlags = [GLOBAL.FLAG_SMOOTH];
			tongueType = GLOBAL.TYPE_HUMAN;
			tongueFlags = [];
			earType = GLOBAL.TYPE_CANINE;
			armType = GLOBAL.TYPE_HUMAN;
			armFlags = [];
			wingType = GLOBAL.TYPE_HUMAN;
			legType = GLOBAL.TYPE_CANINE;
			legCount = 4;
			legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS];
			
			genitalSpot = 2;
			
			tailType = GLOBAL.TYPE_SYNTHETIC;
			tailCount = 1;
			tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_PREHENSILE];
			
			tailGenitalArg = 0;
			tailGenital = 0;
			
			elasticity = 2;
			
			nippleColor = "black";
			milkMultiplier = 0;
			milkType = GLOBAL.FLUID_TYPE_MILK;
			milkRate = 0;
			
			ass.wetnessRaw = 0;
			ass.bonusCapacity += 75;
			ass.loosenessRaw = 2;
			ass.vagooFlags = [GLOBAL.FLAG_LUBRICATED, GLOBAL.FLAG_RIBBED, GLOBAL.FLAG_PUMPED];
			
			_isLoading = false;
		}
		
		public function configNormal():void
		{
			hairColor = "black";
			skinTone = "pale";
			lipMod = 0;
			tone = 60;
			thickness = 30;
			hipRatingRaw = 6;
			buttRatingRaw = 9;
			breastRows[0].breastRatingRaw = 3;
			
			removePerk("Ditz Speech");
			removePerk("Mega Milk");
		}
		
		public function configBimbo():void
		{
			hairColor = "dark blonde";
			skinTone = "tanned";
			lipMod = 3;
			tone = 30;
			thickness = 60;
			hipRatingRaw = 12;
			buttRatingRaw = 18;
			breastRows[0].breastRatingRaw = 30;
			
			createPerk("Ditz Speech", 0, 0, 0 ,0 , "");
			createPerk("Mega Milk", 0, 0, 0 ,0 , "");
		}
		
		public function configDom():void
		{
			if (!isBimbo()) configBimbo();
			if (!hasCock())
			{
				createCock(25);
				shiftCock(0, GLOBAL.TYPE_CANINE);
			}
			createPerk("Fixed CumQ", 2500); //Ball stats? No, fuck da police.
		}
		
		//Removes 10 ovilium from eggDonorInv, set it to null if no ovilium should be removed
		public function configEggs(eggDonorInv:Array = null):void
		{
			if (eggDonorInv && !kGAMECLASS.infiniteItems())
			{
				var i:int = eggDonorInv.length;
				var eggs:int = 10;
				//No need to stop if eggs is 0 because then it'll just remove no eggs which is fine
				while (0<--i)
				{
					//Not ovilium, no good
					if (!(eggDonorInv[i] is Ovilium)) continue;
					if (eggDonorInv[i].quantity > eggs) eggDonorInv[i].quantity -= eggs;
					else
					{
						eggs -= eggDonorInv[i].quantity;
						eggDonorInv[i].quantity = 0;
					}
					if (eggDonorInv[i].quantity == 0) eggDonorInv.splice(i,1);
				}
			}
			this.impregnationType = "SiegwulfeEggnancy";
		}
		
		public function isDom():Boolean
		{
			return hasCock();
		}
		
		public function isEggWulfe():Boolean
		{
			return impregnationType == "SiegwulfeEggnancy";
		}
		
		override public function get bustDisplay():String
		{
			var bustName:String = "SIEGWULFE";
			
			if(isBimbo()) bustName += "_BIMBO";
			
			return bustName;
		}
		
		override public function getDescription(arg:String, arg2:*):String
		{
			if (arg != "pcname") return super.getDescription(arg, arg2);
			else if (kGAMECLASS.flags["WULFE_PCNAME"] == undefined) return kGAMECLASS.pc.nameDisplay();
			else return kGAMECLASS.flags["WULFE_PCNAME"];
		}
		
		override public function lust(amount:Number = 0, apply:Boolean = false):Number
		{
			// do what regular lust does
			var lust:Number = super.lust();
			var lustDif:Number = super.lust(amount, apply) - lust;

			// Too soon to queue scene? Do nothing.
			if (!isDom() || kGAMECLASS.pc.hasStatusEffect("Wulfe Lust Cooldown")) return lust;

			// WULFE_LUST_STAGE: 0 -> hasn't said a thing, 1 -> did 10-32 scene, 2 -> did 33-74 scene, 3 -> did 75-89 scene
			if (kGAMECLASS.flags["WULFE_LUST_STAGE"] == undefined) kGAMECLASS.flags["WULFE_LUST_STAGE"] = 0;

			var queuedScene:Boolean = true;
			// "Might be good if every scene is done at least once (or at least the 75-89 scene)
			// so she doesn’t suddenly spring the rut scene on you? Not hugely bothered about this though."
			if (lust >= 90)
			{
				if (kGAMECLASS.flags["WULFE_LUST_STAGE"] == 3) kGAMECLASS.eventQueue.push(kGAMECLASS.siegwulfeStalking);
				else kGAMECLASS.eventQueue.push(kGAMECLASS.siegwulfeIsHorny);
			}
			// Poisson distribution, lambda = 1 horny bimbo scene/30 lust. If k == 0 happens, no scene.
			// Rut scene gets to skip this check and forces siegwulfeIsHorny if it needs to.
			else if (100*Math.exp(-lustDif/30) > rand(100)) queuedScene = false;
			// Other scenes
			else if (lust >= 75 && kGAMECLASS.flags["WULFE_LUST_STAGE"] < 3) kGAMECLASS.eventQueue.push(kGAMECLASS.siegwulfeIsHorny);
			else if (lust >= 33 && kGAMECLASS.flags["WULFE_LUST_STAGE"] < 2) kGAMECLASS.eventQueue.push(kGAMECLASS.siegwulfeInterest);
			else if (lust >= 10 && kGAMECLASS.flags["WULFE_LUST_STAGE"] < 1) kGAMECLASS.eventQueue.push(kGAMECLASS.siegwulfeCheckup);
			else queuedScene = false;
			
			// At least 30 min pass between scenes
			if (queuedScene)
			{
				kGAMECLASS.pc.createStatusEffect("Wulfe Lust Cooldown");
				kGAMECLASS.pc.setStatusMinutes("Wulfe Lust Cooldown", 30);
			}
			
			return lust;
		}
	}
}