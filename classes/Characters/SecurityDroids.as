package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SecurityDroids extends Creature
	{
		
		public function SecurityDroids() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "security droids";
			this.originalRace = "Automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "These security bots are old and outmoded, but that doesn't make them any less dangerous. They fearlessly march forward through all the fire you and Anno can pour at them, lighting up the corridor with laser fire as they advance over the shattered remains of their fallen comrades. ";
			this.customDodge = "Somehow, the drones manage to skirt out of the way of your fire.";
			this.customBlock = "The hardened exterior of the drones absorbs your attack.";
			this.plural = true;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "laser emitters";
			this.rangedWeapon.attack = 0;
			rangedWeapon.baseDamage.electric.damageValue = 1;
			rangedWeapon.baseDamage.burning.damageValue = 1;
			rangedWeapon.addFlag(DamageFlag.LASER);
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel plates";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new JoyCoPremiumShield();
			
			this.physiqueRaw = 14;
			this.reflexesRaw = 4;
			this.aimRaw = 19;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 20;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.XPRaw = 250;
			this.level = 4;
			this.credits = 0;
			this.HPMod = 20;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 24;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.TYPE_HUMAN;
			this.skinTone = "steel gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 3;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 2;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var combatGunTurrets:SecurityDroids = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("DROID_SECURITY","DROID_SECURITY","DROID_SECURITY");
			kGAMECLASS.userInterface.showName("FIGHT:\nS. DROIDS");
			
			//combatGunTurrets.sexualPreferences.setRandomPrefs(2 + rand(3));
			
			kGAMECLASS.foes.push(combatGunTurrets);
		}
		
	}

}