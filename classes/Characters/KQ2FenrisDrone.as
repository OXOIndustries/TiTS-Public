package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class KQ2FenrisDrone extends Creature
	{
		
		public function KQ2FenrisDrone() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "fenris drone";
			this.originalRace = "Automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A sleek, black canine robot, its chest emblazoned with various markings identifying it as a Fenris IV assault drone.";
			this.customDodge = "Somehow, the drones manage to skirt out of the way of your fire.";
			this.customBlock = "The hardened exterior of the drones absorbs your attack.";
			this.isPlural = false;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "laser emitter";
			this.rangedWeapon.attack = 0;
			rangedWeapon.baseDamage.electric.damageValue = 1;
			rangedWeapon.baseDamage.burning.damageValue = 1;
			rangedWeapon.addFlag(DamageFlag.LASER);
			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.attackNoun = "laser beam";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel plates";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;
			this.shield = new BasicShield();
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 4;
			this.aimRaw = 14;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 20;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = -40.0;
			
			this.XPRaw = 100;
			this.level = 4;
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
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "FenrisDrone";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "FENRISDRONEIV";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (!target.hasStatusEffect("Blinded") && rand(5) == 0) blindAttack(target);
			else biteAttack(target);
		}
	
		private function blindAttack(target:Creature):void
		{
			output(StringUtil.upperCase(uniqueName, false) + " spins around, positioning its backside toward you and hiking a leg. Oh for fuck's...");
			
			if (rangedCombatMiss(this, target, -1, 2))
			{
				output(" A spray of black oil arcs out from the drone, smearing across the wall and floor. Yuck!");
			}
			else
			{
				output(" A spray of black oil shoots out of " + uniqueName + " and splatters across " + (target is PlayerCharacter ? "you" : target.a + target.short) +", blinding " + (target is PlayerCharacter ? "you" : target.mfn("him", "her", "it")) + ".");
				
				target.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0);
			}
		}
		
		private function biteAttack(target:Creature):void
		{
			output(StringUtil.upperCase(uniqueName, false) + " has a clear shot at "+ (target is PlayerCharacter ? "you" : target.a + target.short) + " through the weapons fire. With a fearsome digital growl, the cyberhound launches itself at "+ (target is PlayerCharacter ? "you" : target.mfn("him", "her", "it")) +" for a savage mauling!");
			
			if (combatMiss(this, target))
			{
				output(" " + (target is PlayerCharacter ? "You" : "Kara") +" dodge" + (target is PlayerCharacter ? "" : "s") +" aside, letting the cyberhound's momentum carry him past. Still, the drone makes a solid landing, skidding to a halt with teeth bared.");
			}
			else
			{
				output(" " + (target is PlayerCharacter ? "You" : "Kara") +" get" + (target is PlayerCharacter ? " your" : "s her") +" arm up in time to block the bite, but wince" + (target is PlayerCharacter ? "" : "s") +" in pain as the cyberhound's fangs sink into");
				if (target is PlayerCharacter && target.isNude()) output(" you.");
				else if (target is PlayerCharacter) output(" your [pc.armor].");
				else output(" her arm.");
				
				applyDamage(damageRand(new TypeCollection( { kinetic: 15 }, DamageFlag.PENETRATING), 15), this, target, "minimal");
			}
		}
	}

}