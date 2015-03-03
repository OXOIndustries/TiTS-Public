package classes.Characters 
{
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
	import classes.rand;
	import classes.GameData.CodexManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GigaGoo extends Creature
	{
		
		public function GigaGoo() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "giga goo";
			this.originalRace = "gray goo";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The gray goo gestalt calling itself Nova has taken on an entire vat of additional goo, expanding itself to monstrous proportions. She's having to lean over just to fit in the reactor compartment now, and each of her fists are easily bigger than you are. Her sword is the size of a truck, the blade resizing itself to slide through the open front of the elevator with ease. Her eyes burn with hate and anger as she swings and lunges at you, all too happy to take advantage of your confinement and trying to plunge you into the billowing cloud of poison gas below.";
			this.customDodge = "The goos liquid flexibility allows it to handily avoid your attack.";
			this.customBlock = "The goos liquidity absorbs a great deal of punishment - without taking damage.";
			this.plural = true;
			this.lustVuln = 0.8;
			this.meleeWeapon = new GooeyPsuedopod();
			(this.meleeWeapon as GooeyPsuedopod).attack = 3;
			(this.meleeWeapon as GooeyPsuedopod).damage = 12;
			(this.meleeWeapon as GooeyPsuedopod).hasRandomProperties = true;
			
			this.armor = new GooeyCoverings();
			(this.armor as GooeyCoverings).defense = 3;
			(this.armor as GooeyCoverings).hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			this.physiqueRaw = 16;
			this.reflexesRaw = 19;
			this.aimRaw = 12;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 14;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.resistances = [0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8, 0.8];
			this.XPRaw = 250;
			this.level = 5;
			this.credits = 0;
			this.HPMod = 60;
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
			this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			this._isLoading = false;
		}
		
		override public function prepForCombat():void
		{
			var gigaGoo:GigaGoo = this.makeCopy();
			
			kGAMECLASS.userInterface.showBust("GRAY_GOO_GIGA");
			kGAMECLASS.userInterface.showName("FIGHT:\nGIGA GOO");
			
			//combatGunTurrets.sexualPreferences.setRandomPrefs(2 + rand(3));
			
			kGAMECLASS.foes.push(gigaGoo);
		}
		
	}

}