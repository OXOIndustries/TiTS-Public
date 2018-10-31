package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	
	//**************************************************
	//Listed as chars["AUTOTURRETS"] in code elsewhere!
	//**************************************************
	public class RaskTurretA extends Creature
	{
		//constructor
		public function RaskTurretA()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "MG turret";
			this.originalRace = "automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This security turret is armed with a high-caliber machinegun, designed to mow down large-bodied soft targets.";
			this.customDodge = "Somehow, the turret’s swivelling moves it out of the way.";
			this.customBlock = "The armor plates soak up your attack.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			
			this.rangedWeapon.longName = "machinegun";
			this.rangedWeapon.attack = 15;
			rangedWeapon.baseDamage.kinetic.damageValue = 5;
			//rangedWeapon.baseDamage.burning.damageValue = 1;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
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
			baseHPResistances.electric.damageValue = -100.0;
			baseHPResistances.freezing.damageValue = 50.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
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
			
			isUniqueInFight = true;
			btnTargetText = "MG Turret";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "TURRET_MG";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(shields() == 0 && rand(2) == 0 && !hasStatusEffect("Shields Refilled")) shieldsUp();
			else shootEmToys(target);
		}
		
		private function shootEmToys(target:Creature):void
		{
			//Count as one HEAVY physical attack, but has a low to-hit chance.
			output("The machinegun-toting turret opens fire!");
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}		
		private function shieldsUp():void
		{
			//1 time per encounter, re-charges 50% of shields once they drop.
			output("The machinegun turret beeps noisily at you, stopping its barrage for a few moments. As it does, you see the tell-tale flicker of a shield barrier going up. Shit!");
			shields(Math.round(shieldsMax()/2));
			createStatusEffect("Shields Refilled",0,0,0,0);
		}
	}
}