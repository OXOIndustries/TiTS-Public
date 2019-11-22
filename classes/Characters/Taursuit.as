
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
	// Borrowing Varmint code!
	//**************************************************
	public class Taursuit extends Creature
	{
		//constructor
		public function Taursuit()
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			short = "taursuit";
			originalRace = "robot";
			a = "the ";
			capitalA = "The ";
			long = "It twists and turns unnaturally, cavorting like some kind of beast. The liquid grace with which it moves is completely at odds with its unwieldy-looking form, threatening to lash out with its limbs at any moment.";
			customDodge = "Claws scrabbling, " + getCombatName() + " slips away from your attack.";
			customBlock = "The armor plates soak up your attack.";
			isPlural = false;
			isLustImmune = true;
			
			meleeWeapon = new Fists();
			meleeWeapon.attack = 2;
			meleeWeapon.baseDamage.kinetic.damageValue = 1;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.longName = "hoof";
			meleeWeapon.attackVerb = "kick";
			meleeWeapon.attackNoun = "crush";
			meleeWeapon.hasRandomProperties = true;
			
			armor.longName = "tough hide";
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			physiqueRaw = 60;
			reflexesRaw = 22;
			aimRaw = 22;
			intelligenceRaw = 5;
			willpowerRaw = 10;
			libidoRaw = 1;
			shieldsRaw = 0;
			energyRaw = 100;
			lustRaw = 0;
			level = 10;
			XPRaw = normalXP();
			credits = 0;
			HPMod = 650;
			HPRaw = HPMax();
			
			femininity = 0;
			eyeType = GLOBAL.TYPE_EQUINE;
			eyeColor = "green";
			tallness = 48;
			thickness = 70;
			tone = 95;
			hairColor = "brown";
			scaleColor = "none";
			furColor = "brown";
			hairLength = 1;
			hairType = GLOBAL.TYPE_HUMAN;
			beardLength = 0;
			beardStyle = 0;
			skinType = GLOBAL.SKIN_TYPE_FUR;
			skinTone = "brown";
			skinFlags = new Array();
			faceType = GLOBAL.TYPE_EQUINE;
			faceFlags = new Array();
			tongueType = GLOBAL.TYPE_EQUINE;
			lipMod = 0;
			earType = 0;
			antennae = 1;
			antennaeType = GLOBAL.TYPE_EQUINE;
			horns = 2;
			hornType = GLOBAL.TYPE_GOAT;
			armType = GLOBAL.TYPE_EQUINE;
			gills = false;
			wingType = 0;
			legType = GLOBAL.TYPE_EQUINE;
			legCount = 4;
			legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			
			genitalSpot = 2;
			tailType = GLOBAL.TYPE_EQUINE;
			tailCount = 1;
			tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLOPPY];
			tailGenitalArg = 0;
			tailGenital = 0;
			tailVenom = 0;
			tailRecharge = 5;
			
			hipRatingRaw = 12;
			buttRatingRaw = 12;
			
			cocks = new Array();
			
			createStatusEffect("Disarm Immune");
			createStatusEffect("Force It Gender");
			//createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "Taursuit";
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "TAURSUIT";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (target.hasStatusEffect("Tripped") && rand(5) == 0) tentaLashies(target);
			else if (rand(3) <= 1) kickyKickyBoiBoi(target);
			else jumpyBoiBoi(target);
		}
		
		//Kick
		public function kickyKickyBoiBoi(target:Creature):void
		{
			output("The taursuit ducks and waves, slithering along the ground in a wholly unnatural and disturbing manner and spinning backwards, kicking out with its rear legs!");
			if(combatMiss(this, target)) output(" You just narrowly avoid them, pulling back out of range for your counterattack!");
			else
			{
				output(" You take the two of them right in the chest, momentarily knocking the wind from your lungs!");
				applyDamage(new TypeCollection( { kinetic: 50 + rand(6) } ), this, target);
			}
		}
		//Jump
		public function jumpyBoiBoi(target:Creature):void
		{
			output("The half-centaur suit bends its legs in a fashion that doesn’t seem quite possible, leaping into the air with surprising speed and barreling into you!");
			//HIT
			if(!combatMiss(this, target)) 
			{
				output(" It hits you right in the ");
				if(target.isTaur()) output(" front, sending you skittering back a few paces with the force of it!");
				else if(target.isNaga()) output(" front, sending you almost toppling over as you try to regain your balance!");
				else output(" legs, almost toppling you over with the force of it!");
				applyDamage(new TypeCollection( { kinetic: 25 + rand(5) } ), this, target);
			}
			else output(" It goes flying right by you, narrowly missing you by inches! Pivoting once more, it turns to ready for another attack!");
		}
		//Tentacle lash
		public function tentaLashies(target:Creature):void
		{
			output("A long, grasping tentacle shoots up from the taursuit, seeking to grab at your [pc.legOrLegs]!");
			//HIT
			if(!combatMiss(this, target)) 
			{
				//crit:
				if(target.reflexes()/2 + rand(20) + 1 < this.aim()/2 + 10) 
				{
					output("You’re too slow to react and it wraps around your hips! With unbelievable brute strength it lifts you straight off the floor and violently slams you against the wall, dropping you into a heap on the floor!");
					if(target.physique()/2 + rand(20) + 1 < this.physique()/2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun"))
					{
						output(" <b>You’re stunned!</b>");
						CombatAttacks.applyStun(target, 1);
					}
					applyDamage(new TypeCollection( { kinetic: 50 + rand(6) } ), this, target);
				}
				else
				{
					output(" It finds its mark, wrapping around your lower half and sending you tumbling to the ground! A followup series of slaps follows you down!");
					applyDamage(new TypeCollection( { kinetic: 30 + rand(6) }, DamageFlag.PENETRATING), this, target);
					CombatAttacks.applyTrip(target);
				}
			}
			else output(" You jump out of the way, avoiding its outstretched, groping grasp!");
		}
	}
}
