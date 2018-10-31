package classes.Characters
{
	import classes.Creature;
	import classes.Characters.Azra;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Utility.*
	
	public class GrayGooDoubleR extends Creature
	{
		//constructor
		public function GrayGooDoubleR()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "double goo's right side";
			this.originalRace = "gray goo";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The right side is the more calm and collected of the two, though still a wanton slut. She has a dangerous, hungry look in her eyes that tells you you’re likely to wind up on the receiving end of an all-day goo-fuck if you don’t pull out a win.";
			this.customDodge = "Liquid silver parts and flows like water to avoid the ill-aimed attack!";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "fist";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 2;
			this.meleeWeapon.addFlag(DamageFlag.CRUSHING);
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon.attackVerb = "shot";
			this.rangedWeapon.attackNoun = "shot";
			this.rangedWeapon.longName = "improvised gatling gun";
			this.rangedWeapon.baseDamage.kinetic.damageValue = 5;
			//this.rangedWeapon.addFlag(DamageFlag.PENETRATING);
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "gooey surface";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.tease.damageValue = 20.0;
			baseHPResistances.kinetic.damageValue = 50;
			
			baseHPResistances.burning.damageValue = 35;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.poison.damageValue = 100.0;
			baseHPResistances.pheromone.damageValue = 100.0;
			baseHPResistances.psionic.damageValue = 80.0;

			baseHPResistances.freezing.damageValue = -100;
			baseHPResistances.electric.damageValue = -50;
			
			this.physiqueRaw = 23;
			this.reflexesRaw = 20;
			this.aimRaw = 10;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 10;
			this.libidoRaw = 100;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 35;
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();

			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "silver";
			this.tallness = 14*12;
			this.thickness = 80;
			this.tone = 50;
			this.hairColor = "chrome";
			this.scaleColor = "silver";
			this.furColor = "silver";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "silver";
			this.skinFlags = [];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS, GLOBAL.FLAG_SQUISHY, GLOBAL.FLAG_GOOEY];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 0;
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
			this.hipRatingRaw = 20;
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
			this.buttRatingRaw = 21;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 6;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 55198;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createVagina();
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 3;
			//Goo is hyper friendly!
			this.elasticity = 20;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = 1;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 45;
			this.nippleColor = "steel";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 1000;
			
			this.createStatusEffect("Disarm Immune");
			this.createPerk("Inhuman Desire",20,0,0,0);
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//No loot on this fuckboy.
			//this.inventory.push(new NaleenNip());
			
			isUniqueInFight = true;
			btnTargetText = "DblGoo R";
			setDefaultSexualPreferences();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "SLUTGOO_R";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_LIKES_SEXPREF);
			
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(CombatManager.getRoundCount() == 1) aphroSprayGoo(hostileCreatures);
			//Physical if airtight or low HP...
			else if((target.hasAirtightSuit() && rand(3) <= 1) || this.HP()/this.HPMax() < 0.4)
			{
				if(rand(3) == 0) gatlingGoo(target);
				else if(rand(2) == 0) gooSpear(target);
				else hammerBlowGoo(target);
			}
			else if(rand(2) == 0) tingleButtAttack(target);
			else cuntlappyAttacky(hostileCreatures);
		}
		private function notifyTargetSelection(attacker:Creature, target:Creature, enemy:Creature):void
		{
			kGAMECLASS.setAttacker(attacker);
			kGAMECLASS.setTarget(target);
			kGAMECLASS.setEnemy(enemy);
		}
		
		//Aphro spray - energy cost + aphro gas attack :3 Only used on first round of combat and lasts all combat.
		public function aphroSprayGoo(targets:Array):void
		{
			output("The double-goo’s right arm extends, palm bubbling. ");
			if(kGAMECLASS.pc.hasAirtightSuit()) output("Whatever gas she’s releasing, you’re safe from it in your sealed suit. ");
			output("Azra’s nose wrinkles a moment later, ");
			if(!kGAMECLASS.pc.hasAirtightSuit()) output("and you both flush hotly from the invisible aphrodisiac!");
			else output("her skin flushing hot from the airborne aphrodisiac.");
			if(!kGAMECLASS.pc.hasAirtightSuit()) output(" It fills the air, tainting every breath with its foul payload. You’ll have to be careful if you don’t want to succumb to the curvaceous creature’s seductive wiles. <b>The air is filled with aphrodisiacs!</b>");
			for(var i:int = 0; i < targets.length; i++)
			{
				if(!targets[i].hasAirtightSuit() && !targets[i].hasStatusEffect("Aphro Gas")) CombatAttacks.applyAphroGas(targets[i], 8, 50);
			}
		}
		//Tinglekiss - french-kiss based attack. NOT BLOCKED BY AIRTIGHT.
		public function tingleButtAttack(target:Creature):void
		{
			output("The double-goo’s right side steps forward, crossing a half-dozen feet in an instant. She leans down for a kiss");
			if(combatMiss(this, target))
			{
				if(!(target is Azra)) output(", but you roll aside at the last second.");
				else output(", but Azra flaps back at the last second.");
			}
			else
			{
				if(target.hasAirtightSuit() && !(target is Azra)) output(", but to your surprise, your airtight armor doesn’t protect you. Her fingers are undo the seals in an instant, exposing your [pc.lipsChaste] to hers.");
				else if(!(target is Azra)) output(", and you can’t get away. She sweeps you up in one gooey arm to press your [pc.lipsChaste] to hers.");
				if(!(target is Azra))
				{
					output(" Her tongue is all you can taste, vaguely metallic but with a hint of lemon zest that dazzles your tastebuds and stirs your groin. Her eyes are twinkling with mirth, and it takes you a moment to realize that you’re kissing her back, plunging your own");
					if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" enormous");
					output(" tongue deep into her ");
					if(target.hasTongueFlag(GLOBAL.FLAG_LONG)) output("gullet");
					else output("mouth");
					output(". By the time you wriggle free, the damage has been done.");
				}
				else
				{
					output(", and Azra can’t get out of the way. Her eyes widen in shock as the silver slut’s lips press to hers. There’s a moment where it seems like Azra is going to lose herself to it, her eyes drifting half-closed and her back arching, but she struggles free after a few moments");
					if(!target.hasStatusEffect("cock out")) output(", panting");
					else if(target.lust() < 80) output(", her dick freely dripping");
					else output(", all but begging for a fuck");
					output(".");
				}
				applyDamage(new TypeCollection( { drug: 17 + rand(4) } ), this, target, "minimal");
			}
		}
		//Cuntlapping - lick own cunt once. Slight self lust damage. Slight AOE damage.
		public function cuntlappyAttacky(targets:Array):void
		{
			output("The right head’s tongue slowly extends, sliding through an ocean of silvery cleavage, across her pudgy pussy and down to a drooling slit. It flicks back and forth across the liquid lips before plunging inside.");
			//selfdamage
			applyDamage(new TypeCollection( { tease: 10 + rand(3) } ), this, this, "minimal");
			output(" The left head moans in pleasure, but it’s you");
			if(targets.length > 1) output(" and Azra");
			output(" that she’s putting on the show for.");
			
			
			for(var i:int = 0; i < targets.length; i++)
			{
				output("\n");
				if(targets[i].willpower()/2 + rand(20) + 1 > this.intelligence()/2 + 10)
				{
					//PC resists
					if(targets[i] is PlayerCharacter) output("\nYou look on impassively.");
					//Azra resists
					else output("\nAzra sighs. <i>“You realize that you’re only defeating yourself, right?”</i>");
				}
				else
				{
					if(targets[i] is Azra) output("\nAzra can't seem to look away.")
					else output("\nIt's a mesmerizing sight.");
					//damage!
					applyDamage(new TypeCollection( { tease: 12 + rand(4) } ), this, targets[i], "minimal");
				}
			}
		}
		//right uses physical attacks if PC is airtight or HP drops below 40%
		//Gatling Goo - suck up debris and fire out of arm. Ten low-damage flurry shots.
		public function gatlingGoo(target:Creature):void
		{
			output("<i>“I’ll show you!”</i> the right head cries, lifting her right arm. The silver ripples and twists, humanity forgotten in exchange for the polished chrome of a dozen gun-barrels. <i>“Hyaaaa!”</i> Tiny projectiles issue forth as her improvised gatling gun spins up, peppering you and everything around you with fragments of repurposed trash. She must be sucking up her <i>“ammo”</i> from the ground!");
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		//Spear - perfect accuracy attack, moderate damage.
		public function gooSpear(target:Creature):void
		{
			this.meleeWeapon.attackVerb = "stab";
			this.meleeWeapon.attackNoun = "thrust";
			this.meleeWeapon.longName = "shining spear";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 0;
			this.meleeWeapon.attack = 40;
			this.meleeWeapon.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.hasRandomProperties = true;
			output("<i>“We could’ve fucked!”</i> the right head cries as silver mass flows down her arm and into her hand, creating a quicksilver spear in an instant. <i>“We could have fucked so hard!”</i> She stabs at ");
			if(!(target is Azra)) output("you");
			else output("Azra");
			output(" with perfect, unerring accuracy.");
			if(combatMiss(this,target)) output(" Somehow, it misses!");
			//Damage if damaged.
			else
			{
				applyDamage(meleeDamage(), this, target, "minimal");
			}
		}
		//Hammerblow - high damage low accuracy attack.
		public function hammerBlowGoo(target:Creature):void
		{
			this.meleeWeapon.attackVerb = "smack";
			this.meleeWeapon.attackNoun = "swing";
			this.meleeWeapon.longName = "glittering hammer";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 15;
			this.meleeWeapon.attack = -40;
			this.meleeWeapon.addFlag(DamageFlag.CRUSHING);
			this.meleeWeapon.hasRandomProperties = true;
			output("<i>“Fucking... fuck! You fucks!”</i> the right head howls as her hand bubbles and reforms into an enormous hammer. <i>“I can fuck after I crush!”</i> She lifts it high above, then brings it down at ");
			if(!(target is Azra)) output("you");
			else output("Azra");
			output("!");
			if(combatMiss(this,target))
			{
				if(!(target is Azra)) output(" You roll to the side. The hammer slams harmlessly into the red-tinted soil.");
				else output(" She dashes to the side. The hammer slams harmlessly into the red-tinted soil.");
			}
			else 
			{
				output(" It connects!");
				//Damage!
				applyDamage(meleeDamage(), this, target, "minimal");
			}
		}
	}
}
