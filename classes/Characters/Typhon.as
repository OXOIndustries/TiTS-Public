package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.num2Text;
	
	//**************************************************
	public class Typhon extends Creature
	{
		//constructor
		public function Typhon()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Typhon";
			this.originalRace = "ai";
			this.a = " ";
			this.capitalA = " ";
			this.long = "The AI in charge of the Deepsea Research Facility mainframe has been corrupted beyond recognition. The warped and twisted holoavatar is disturbing to behold, but fortunately he’s given you a whole bunch of security turrets to focus on instead. You’d better take them out before the gunfire makes this place spring a leak!";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = true;
			isLustImmune = true;
			this.meleeWeapon = new Fists();
			this.rangedWeapon.longName = "laser gun";
			this.rangedWeapon.attack = 2;
			rangedWeapon.baseDamage.burning.damageValue = 50;
			rangedWeapon.baseDamage.addFlag(DamageFlag.LASER);
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "burning blast";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "steel plates";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 30;
			this.reflexesRaw = 25;
			this.aimRaw = 35;
			this.intelligenceRaw = 40;
			this.willpowerRaw = 40;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.resistanceValue = 40.0;
			
			this.level = 8;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 280;
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
			btnTargetText = "Turrets";
			
			this._isLoading = false;

		}
		
		override public function get bustDisplay():String
		{
			return "TYPHON";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var turretsLeft:int = 4;

			if (HP() / HPMax() <= 0.25) turretsLeft = 1;
			else if (HP() / HPMax() <= 0.5) turretsLeft = 2;
			else if (HP() / HPMax() <= 0.75) turretsLeft = 3;
			
			if (turretsLeft > 1) output("There are " + num2Text(turretsLeft) + " laser turrets remaining.\n\n");
			else output("There is one laser turret remaining.\n\n");
			
			if (target.hasStatusEffect("Coolant Soaked"))
			{
				target.addStatusValue("Coolant Soaked",1,-1);
				if (target.statusEffectv1("Coolant Soaked") <= 0)
				{
					target.removeStatusEffect("Coolant Soaked");
					target.reflexesMod += 10;
				}
			}
			
			//40/30/20/10% coolant breach based on turrets left, 40% fire turrets, 20% to 50% screech based on turrets left (unless already stunned, then just fire turrets)
			var rn:int = rand(10);
			if (rn < turretsLeft) typhonCoolantBreach(target);
			else if (rn >= 4 && rn <= 7) typhonTurretFire(target);
			else if (!target.hasStatusEffect("Stunned")) typhonScreech(target);
			else typhonTurretFire(target);
		}
		
		private function typhonTurretFire(target:Creature):void
		{
			var turretsLeft:int = 4;

			if (HP() / HPMax() <= 0.25) turretsLeft = 1;
			else if (HP() / HPMax() <= 0.5) turretsLeft = 2;
			else if (HP() / HPMax() <= 0.75) turretsLeft = 3;
			
			output("The sound of lasers warming up alerts you to the incoming fire, moments before crimson beams sweep wildly across the room.");
			for (var i:int = 0; i < turretsLeft; i++)
			{
				//Miss
				if(rangedCombatMiss(this, target)) output("\nYou narrowly manage to escape one of the sweeping lasers, hearing it carve a fresh groove into the wall behind you.");
				//Hit
				else
				{
					output("\nOne of the turrets catches you with a bolt of searing heat!");
					var damage:TypeCollection = new TypeCollection( { burning: this.rangedWeapon.baseDamage.burning.damageValue },DamageFlag.LASER);
					damageRand(damage, 15);
					applyDamage(damage, this, target, "minimal");
				}
			}
		}
		//sonic screech.  no sonic damage in game so went with having it bypass shields
		private function typhonScreech(target:Creature):void
		{
			var bon:int = 0;
			if (target.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)) bon += 20;
			if (target.armor.hasFlag(GLOBAL.ITEM_FLAG_PRESSURIZED)) bon += 20;
			
			output("Typhon’s insane rambling suddenly turns into a deafening, static-laden screech delivered at full volume across every speaker in the room.");
			//willpower save
			var damage:TypeCollection = null;
			
			var rn:int = rand(100);
			//always a chance for failure
			if (rn >= 95)
			{
				//crit failure!
				output(" The agony of the sonic blast drops you to your knees, clutching at your head even after the sound mercifully stops. <b>You’re stunned!</b>");
				if (!target.hasStatusEffect("Stun Immune")) CombatAttacks.applyStun(target);
				damage = new TypeCollection( { kinetic: 60 }, DamageFlag.BYPASS_SHIELD);
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");			
			}
			else if ((target.willpower() * 2) + bon - this.willpowerRaw > rn || rn < 5)
			{
				if (target.armor.hasFlag(GLOBAL.ITEM_FLAG_PRESSURIZED)) output(" Your pressurized armor protects you from ")
				else if (target.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)) output(" Your airtight armor protects you from ")
				else output(" You cover your ears just in time to avoid ");
				output("the worst of it, but the noise is still an agonizing experience that leaves you feeling drained. Thankfully it soon dies off into the more normal volume of ranting.");
			}
			else
			{
				output(" The agony of the sonic blast drops you to your knees, clutching at your head even after the sound mercifully stops. <b>You’re stunned!</b>");
				if (!target.hasStatusEffect("Stun Immune")) CombatAttacks.applyStun(target);
				damage = new TypeCollection( { kinetic: 30 }, DamageFlag.BYPASS_SHIELD);
				damageRand(damage, 15);		
				applyDamage(damage, this, target, "minimal");		
			}
		}		

		private function typhonCoolantBreach(target:Creature):void
		{
			output("One of the turrets goes completely off-kilter with its shot, the beam slicing open a coolant pipe overhead and sending a jet of icy gas downward.");
			
			//Miss
			if(rangedCombatMiss(this, target)) output("You get out of the way just in time to avoid the stream. You can feel the gas pooling around your [pc.feet], but it's nothing unmanageable.");
			//Hit
			else
			{
				output(" You don't manage to get out of the way in time to avoid getting doused in the freezing coolant, leaving you shivering.");
				if (!target.armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT))
				{
					output(" <b>Your reflexes are slowed.</b>");
					if (target.hasStatusEffect("Coolant Soaked")) target.addStatusValue("Coolant Soaked",1,3);
					else
					{
						target.createStatusEffect("Coolant Soaked", 3, 0, 0, 0, false, "Icon_Snowflake", "The coolant has you shivering. Reflexes decreased!", true, 0);
						target.reflexesMod -= 10;
					}
				}
				var damage:TypeCollection = new TypeCollection( { freezing: 40 });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
			
		}
		
	}
}