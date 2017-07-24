package classes.Characters 
{
	import classes.BreastRowClass;
	import classes.Creature;
	import classes.GameData.Pregnancy.PregnancyStageProgression;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.VaginaClass;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GooClone extends Creature
	{
		
		public function GooClone() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "prime clone";
			this.originalRace = "gray goo";
			this.a = "the ";
			this.capitalA = "The ";
			long = "A physically exaggerated clone of the prime gray goo; butt-naked and with greatly overstated busts, hips, and asses, all of which are almost cartoonishly big.";
			this.customDodge = "The goo's liquid flexibility allows it to handily avoid your attack.";
			this.customBlock = "The goo's liquidity absorbs a great deal of punishment - without taking damage.";
			this.isPlural = false;
			
			meleeWeapon = new GooeyPsuedopod();
			meleeWeapon.attack = 2;
			meleeWeapon.baseDamage.kinetic.damageValue = 11;
			meleeWeapon.hasRandomProperties = true;
			
			armor = new GooeyCoverings();
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			this.physiqueRaw = 1;
			this.reflexesRaw = 1;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 1;
			this.lustRaw = 1;
			this.XPRaw = 0;
			this.level = 1;
			this.credits = 0;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "black";
			this.tallness = 24;
			this.thickness = 70;
			this.tone = 60;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "steel gray";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_SQUISHY);
			addSkinFlag(GLOBAL.FLAG_LUBRICATED);
			addSkinFlag(GLOBAL.FLAG_AMORPHOUS);
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
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
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
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
			this.hipRatingRaw = 10;
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
			this.buttRatingRaw = 6;
			
			var pCunt:VaginaClass = new VaginaClass(true);
			pCunt.hymen = false;
			pCunt.loosenessRaw = 3;
			pCunt.wetnessRaw = 3;
			this.vaginas = [pCunt];
			
			var pTits:BreastRowClass = new BreastRowClass();
			pTits.breastRatingRaw = 14;
			pTits.breasts = 2;
			this.breastRows = [pTits];
			
			//No dicks here!
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			
			isUniqueInFight = false;
			btnTargetText = "GooClone";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GRAY_GOO";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			// Noop
			// GooClones attacks are handled by their *owner*
		}
	}
}