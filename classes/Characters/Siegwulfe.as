package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
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
			
			if(hasCock()) removeCocks();
			configEggs(false);
			
			removePerk("Ditz Speech");
			removePerk("Mega Milk");
			
			lustRaw = 15;
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
			
			if(hasCock()) removeCocks();
			configEggs(false);
			
			createPerk("Ditz Speech", 0, 0, 0 ,0 , "");
			createPerk("Mega Milk", 0, 0, 0 ,0 , "");
			
			lustRaw = 15;
		}
		
		public function configDom():void
		{
			if(!isBimbo()) configBimbo();
			if(!hasCock())
			{
				createCock(25);
				shiftCock(0, GLOBAL.TYPE_CANINE);
			}
			createPerk("Fixed CumQ", 25000); //Ball stats? No, fuck da police.
		}
		
		//Removes 10 ovilium from eggDonorInv, set it to null if no ovilium should be removed
		public function configEggs(bEnable:Boolean = true):void
		{
			impregnationType = (bEnable ? "SiegwulfeEggnancy" : "");
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
			if(arg != "pcname") return super.getDescription(arg, arg2);
			else if(kGAMECLASS.flags["WULFE_PCNAME"] == undefined) return kGAMECLASS.pc.nameDisplay();
			else return kGAMECLASS.flags["WULFE_PCNAME"];
		}
		
		override public function lust(amount:Number = 0, apply:Boolean = false):Number
		{
			// do what regular lust does
			var oldLust:Number = super.lust();
			var newLust:Number = super.lust(amount, apply);
			
			// Lust caps at 100 but siegwulfeLustScene should acknowledge attempted lust increases
			if(!apply) newLust = oldLust + amount;

			kGAMECLASS.siegwulfeLustScene(newLust, newLust-oldLust);

			return newLust;
		}
	}
}