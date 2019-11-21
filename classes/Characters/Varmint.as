
package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	//**************************************************
	//Listed as chars["AUTOTURRETS"] in code elsewhere!
	//**************************************************
	public class Varmint extends Creature
	{
		//constructor
		public function Varmint()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			short = "varmint";
			originalRace = "varmint";
			a = "the ";
			capitalA = "The ";
			long = "This New Texan varmint is a big, blue creature near to the size of a burly Terran doberman, though its posture is more squat, and its frame is rippling with muscle. Its jaw is filled with razor-sharp teeth, slavering as it draws near to you, a hungry glint in its big green eyes. Several spikes coat the creature’s flat head, including a pair that curl into horn-like protrusions around its head, almost ram-like.\n\nThe creature stalks towards you, clearly angered by your disturbing it. Those horns and teeth look like they could do some serious harm if you don’t take it down quickly!";
			customDodge = "Claws scrabbling, " + getCombatName() + " slips away from your attack.";
			customBlock = "The armor plates soak up your attack.";
			isPlural = false;
			isLustImmune = true;
			
			meleeWeapon = new Fists();
			meleeWeapon.attack = 2;
			meleeWeapon.baseDamage.kinetic.damageValue = 1;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.longName = "claw";
			meleeWeapon.attackVerb = "claw";
			meleeWeapon.attackNoun = "claw";
			meleeWeapon.hasRandomProperties = true;
			
			armor.longName = "tough hide";
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			physiqueRaw = 27;
			reflexesRaw = 29;
			aimRaw = 2;
			intelligenceRaw = 5;
			willpowerRaw = 10;
			libidoRaw = 1;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 0;
			level = 6;
			XPRaw = normalXP();
			credits = 0;
			HPMod = 25;
			HPRaw = HPMax();
			
			femininity = 0;
			eyeType = GLOBAL.TYPE_CANINE;
			eyeColor = "green";
			tallness = 40;
			thickness = 70;
			tone = 95;
			hairColor = "blue";
			scaleColor = "none";
			furColor = "blue";
			hairLength = 1;
			hairType = GLOBAL.TYPE_HUMAN;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_FUR;
			skinTone = "gray";
			skinFlags = new Array();
			faceType = GLOBAL.TYPE_CANINE;
			faceFlags = new Array();
			tongueType = GLOBAL.TYPE_CANINE;
			lipMod = 0;
			earType = 0;
			antennae = 1;
			antennaeType = GLOBAL.TYPE_CANINE;
			horns = 2;
			hornType = GLOBAL.TYPE_GOAT;
			armType = GLOBAL.TYPE_CANINE;
			gills = false;
			wingType = 0;
			legType = GLOBAL.TYPE_CANINE;
			legCount = 4;
			legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			
			genitalSpot = 2;
			tailType = GLOBAL.TYPE_CANINE;
			tailCount = 1;
			tailFlags = new Array();
			tailGenitalArg = 0;
			tailGenital = 0;
			tailVenom = 0;
			tailRecharge = 5;
			
			hipRatingRaw = 2;
			buttRatingRaw = 2;
			
			cocks = new Array();
			
			createStatusEffect("Disarm Immune");
			createStatusEffect("Force It Gender");
			//createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "Varmint";
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "VARMINT";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (target.hasStatusEffect("Tripped")) maul(target);
			else if (rand(4) == 0) ramAttack(target);
			else if (rand(2) == 0) leap(target);
			else CombatAttacks.MeleeAttack(this, target);
		}
		
		private function ramAttack(target:Creature):void
		{
			output(StringUtil.capitalize(getCombatName(), false) + " lunges at you with its horns, slamming them");
			if(combatMiss(this, target) && !combatMiss(this, target)) output(" just past you, digging them into the ground.");
			else
			{
				output(" into your [pc.leg], giving you a pointy, painful head-butt!");
				var damage:TypeCollection = new TypeCollection( { kinetic: 12 + rand(6) }, DamageFlag.PENETRATING);
				damageRand(damage, 15);
				
				if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < 18)
				{
					output(" <b>The hit was hard enough to stun you!</b>");
					CombatAttacks.applyStun(target, 1);
				}
				
				applyDamage(damage, this, target);
			}
		}
		
		private function maul(target:Creature):void 
		{
			output("While you’re on the ground, the oversized varmint leaps onto you, savaging you with its huge teeth! You’re able to get an arm up in time to save your throat, but it still grabs you and shakes its head, tearing into you.");
			var damage:TypeCollection = new TypeCollection( { kinetic: 40 + rand(6) }, DamageFlag.PENETRATING);
			damageRand(damage, 15);
			applyDamage(damage, this, target);
		}
		
		private function leap(target:Creature):void
		{
			output(StringUtil.capitalize(getCombatName(), false) + " leaps at you with its slavering jaws agape, teeth bared!");
			if(!combatMiss(this, target))
			{
				output(" Its teeth sink into you, and the sheer weight of its impact against you");
				if((target.hasStatusEffect("Tripped") || target.physique()/2 + rand(20) > 19 || target.isPlanted()) && !target.hasStatusEffect("Stunned")) output(" staggers you momentarily!");
				else
				{
					output(" throws you right to the ground!");
					CombatAttacks.applyTrip(target);
				}
				
				var damage:TypeCollection = new TypeCollection( { kinetic: 12 }, DamageFlag.PENETRATING);
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
			else output(" You slip out of the way.");
		}
	}
}
