package classes.Characters 
{
	import classes.GLOBAL;
	import classes.Creature;
	import classes.Engine.Interfaces.output;
	import classes.Items.Armor.VoidPlateArmor;
	import classes.Items.Armor.WeavemailCoat;
	import classes.Items.Guns.Stormbull;
	import classes.Items.Guns.WardenShield;
	import classes.Items.Melee.Fists;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.blindMiss;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.rangedCombatMiss;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class AkanequestSlaver extends Creature 
	{
		
		public function AkanequestSlaver() 
		{
			super();
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.a = "";
			this.capitalA = "";
			this.short = "Slaver Attendant";
			this.long = "";
			this.originalRace = "human";
			this.customDodge = "The slaver just about dodges to the side, avoiding the hit!";
			this.customBlock = "The slaver knocks your arms to the side, forcing the blow to miss!";
			btnTargetText = "Slaver"
			this.isPlural = false;
			
			//this.meleeWeapon = new Fists();//Change to whip
			rangedWeapon = new Stormbull();
			
			shield = new ReaperArmamentsMarkIShield();
			this.shield.shields = 80;
			armor = new WeavemailCoat();
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 20;
			this.aimRaw = 35;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 25;
			this.libidoRaw = 45;
			this.energyRaw = 100;
			this.level = 8;
			this.XPRaw = 50;
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			var baseHPResistances:TypeCollection = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = -10.0;
			baseHPResistances.freezing.damageValue = -10.0;
			baseHPResistances.psionic.damageValue = 1.0;
			baseHPResistances.drug.damageValue = 1.0;
			baseHPResistances.pheromone.damageValue = 1.0;
			baseHPResistances.tease.damageValue = 1.0;
			
			this.femininity = 0;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "black";
			this.hairLength = 0;
			this.tallness = 80;
			this.tone = 70;
			this.thickness = 35;
			
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			
			this.lipMod = 0;
			this.lipColor = "peach";
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			
			this.breastRows[0].breastRatingRaw = 0;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "pink";
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			
			isUniqueInFight = false;
			_isLoading = false;
			
			CombatAttacks.applyBlind(this, 1);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			//These guys are lame, I'm only really making a separate function to keep things standard
			if (hostileCreatures[0] == null) return;
			shootMahShotgun(hostileCreatures[0]);
		}
		
		private function shootMahShotgun(target:Creature):void
		{
			output("The slaver levels his shotgun at you and fires!");
			if (rangedCombatMiss(this, target) || blindMiss(this, target))
			{
				output(" Somehow, the shot doesn’t land!");
			}
			else
			{
				output(" You’re hit with the full blast of the shotgun!");
				applyDamage(damageRand(rangedDamage(), 20), this, target, "minimal");
			}
		}
	}

}