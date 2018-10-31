package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	
	public class SlamwulfeDrone extends Creature
	{
		public function SlamwulfeDrone()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = false;
			
			short = "slamwulfe drone";
			originalRace = "robot";
			a = "the ";
			capitalA = "The ";
			long = "This quadrupedal, canine-style defense drone is decked out in armor plating. It’s maw is packed with an assortment of razor-sharp teeth, but even without them, its bulk makes for an imposing presence on the battlefield.";
			customDodge = "It lumbers aside!";
			customBlock = "Block Placeholder";
			isPlural = false;
			isLustImmune = true;
			
			meleeWeapon.longName = "jaw full of razor-sharp teeth";
			meleeWeapon.description = "a jaw full of razor-sharp teeth";
			meleeWeapon.attackVerb = "bite";
			meleeWeapon.attackNoun = "bite";
			meleeWeapon.hasRandomProperties = true;
			meleeWeapon.baseDamage.kinetic.damageValue = 2;			
			armor.longName = "alloy plates";
			armor.defense = 5;
			armor.hasRandomProperties = true;
			
			shield = new ReaperArmamentsMarkIShield();
			shield.shields = 50;
			shield.shieldDefense = 1;

			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -100.0;
			baseHPResistances.burning.damageValue = 50.0;
			
			physiqueRaw = 20;
			reflexesRaw = 20;
			aimRaw = 20;
			intelligenceRaw = 20;
			willpowerRaw = 4;
			libidoRaw = 50;
			HPMod = 40;
			shieldsRaw = shieldsMax();
			energyRaw = 100;
			lustRaw = 0;
			
			level = 5;
			HPRaw = HPMax();
			XPRaw = normalXP();
			credits = 0;
			
			femininity = 0;
			eyeType = GLOBAL.TYPE_SYNTHETIC;
			eyeColor = "glowing red";
			tallness = 4*12+1;
			hairType = GLOBAL.HAIR_TYPE_REGULAR;
			hairLength = 0;
			hairStyle = "";
			
			skinType = GLOBAL.SKIN_TYPE_FUR;
			skinFlags = [GLOBAL.FLAG_SMOOTH];
			faceType = GLOBAL.TYPE_CANINE;
			faceFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_MUZZLED];
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
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			isUniqueInFight = true;
			btnTargetText = "SlamWulfe";
			_isLoading = false;
		}
		override public function get bustDisplay():String
		{
			var bustName:String = "SLAMWULFE";	
			return bustName;
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			for(var x:int = 0; x < alliedCreatures.length; x++)
			{
				if(alliedCreatures[x].hasStatusEffect("LustModeEngaged") && meleeWeapon.longName != "needles")
				{
					lustConfigure();
					return;
				}
			}
			CombatAttacks.SingleMeleeAttackImpl(this, target);
		}
		public function lustConfigure():void
		{
			meleeWeapon.longName = "needle-filled maw";
			meleeWeapon.description = "a needle-filled maw";
			meleeWeapon.attackVerb = "bite";
			meleeWeapon.attackNoun = "bite";
			meleeWeapon.baseDamage.drug.damageValue = 2;
			output("The slamwulfe, following its owner’s example, retracts its deadly teeth. Dripping, aphrodisiac-tipped needles pop out to replace them. <i>“NONLETHAL SUBROUTINES ENGAGED.”</i>”");
			long = "This quadrupedal, canine-style defense drone is decked out in armor plating. It’s maw is packed with an assortment of needle-shaped injectors, prepped to subdue you with a mix of illegal aphrodisiacs.";
		}
	}
}