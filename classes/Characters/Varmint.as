
package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
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
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "varmint";
			this.originalRace = "varmint";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This New Texan varmint is a big, blue creature near to the size of a burly Terran doberman, though its posture is more squat, and its frame is rippling with muscle. Its jaw is filled with razor-sharp teeth, slavering as it draws near to you, a hungry glint in its big green eyes. Several spikes coat the creature’s flat head, including a pair that curl into horn-like protrusions around its head, almost ram-like.\n\nThe creature stalks towards you, clearly angered by your disturbing it. Those horns and teeth look like they could do some serious harm if you don’t take it down quickly!";
			this.customDodge = "Claws scrabbling, " + getCombatName() + " slips away from your attack.";
			this.customBlock = "The armor plates soak up your attack.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			this.meleeWeapon.attack = 2;
			meleeWeapon.baseDamage.kinetic.damageValue = 1;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.longName = "claw";
			this.meleeWeapon.attackVerb = "claw";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.rangedWeapon.longName = "guns";
			this.rangedWeapon.attack = -2;
			rangedWeapon.baseDamage.kinetic.damageValue = 1;
			rangedWeapon.baseDamage.addFlag(DamageFlag.BULLET);
			this.rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "tough hide";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 27;
			this.reflexesRaw = 29;
			this.aimRaw = 2;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 10;
			this.libidoRaw = 1;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_CANINE;
			this.eyeColor = "green";
			this.tallness = 40;
			this.thickness = 70;
			this.tone = 95;
			this.hairColor = "blue";
			this.scaleColor = "none";
			this.furColor = "blue";
			this.hairLength = 1;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_CANINE;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_GOAT;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 4;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
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
			//this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "Varmint";
			this._isLoading = false;
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
