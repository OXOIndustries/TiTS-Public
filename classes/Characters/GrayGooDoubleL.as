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
	
	public class GrayGooDoubleL extends Creature
	{
		//constructor
		public function GrayGooDoubleL()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "double goo's left side";
			this.originalRace = "gray goo";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Bearing two heads and twice the mass of a typical gray goo, this imposing creature stands tall enough to tower over Azra and pack on twice the curves besides. From her titanic, silver breasts to shimmering hips, she radiates perverse sexuality and power in equal measure. Her lips are thick and puffy, her eyes (all four) framed by lashes so long that they occasionally lose cohesion at the tips and drip away. The only blessing in this whole mess is the dim look in her eyes. Subsisting on slutshrooms for so long as obviously addled her wits.\n\nThe left side seems the ditsier of the two. It frequently wastes time staring at Azra’s crotch or using its arm to caress its own breast.";
			this.customDodge = "Liquid silver parts and flows like water to avoid the ill-aimed attack!";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "fist";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 2;
			this.meleeWeapon.addFlag(DamageFlag.CRUSHING);
			this.meleeWeapon.hasRandomProperties = true;
			
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
			this.lipMod = 3;
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
			this.createPerk("Inhuman Desire",33,0,0,0);
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//No loot on this fuckboy.
			//this.inventory.push(new NaleenNip());
			
			isUniqueInFight = true;
			btnTargetText = "DblGoo L";
			setDefaultSexualPreferences();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "SLUTGOO_L";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,		GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.KINDA_LIKES_SEXPREF);
					
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTripperTarget(hostileCreatures);
			if (target == null) return;
			
			if(target.hasStatusEffect("Tripped")) crushGooAttack(target);
			//left uses physical attacks if dropped below 70% HP and hits HARD.
			if(this.HP()/this.HPMax() < 0.7)
			{
				if(rand(2) == 0) slapGooAttack(target);
				else punchGooAttack(target);
			}
			else
			{
				if(rand(3) == 0) titSuckleAttack(target);
				else if(rand(2) == 0) tentacaressAttack(target);
				else gooSprayAttack(target);
			}
		}
		private function notifyTargetSelection(attacker:Creature, target:Creature, enemy:Creature):void
		{
			kGAMECLASS.setAttacker(attacker);
			kGAMECLASS.setTarget(target);
			kGAMECLASS.setEnemy(enemy);
		}
		private function selectTripperTarget(otherTeam:Array):Creature
		{
			var selTarget:Creature = null;
			var posTargets:Array = [];
			for (var i:int = 0; i < otherTeam.length; i++)
			{
				// If it hasn't been defeated already this turn
				if (otherTeam[i].HP() > 0 && otherTeam[i].lust() < otherTeam[i].lustMax())
				{
					if(otherTeam[i].hasStatusEffect("Tripped"))
					{
						var posTarget:Object = { v: otherTeam[i], w: 10 };
						posTargets.push(posTarget);
					}
				}
			}
			//No tripped characters
			if (posTargets.length == 0) return selectTarget(otherTeam);
			//1 tripped? Pick em
			else if (posTargets.length == 1) selTarget = posTargets[0].v;
			//2 tripped somehow? Pick of the litter
			else selTarget = weightedRand(posTargets);
			
			notifyTargetSelection(this, selTarget, this);
			
			return selTarget;
		}

		//Titsuckle
		public function titSuckleAttack(target:Creature):void
		{
			output("The left head hefts an enormous breast in hand and slowly lifts the silvery nipple to her pursed lips, slowly swirling her glittering tongue in circles over the delectable nub. She watches ");
			if(!(target is Azra)) output("you");
			else output("Azra");
			output(" the entire time. Her eyes are wide and desperate, imploring ");
			if(!(target is Azra)) output("you");
			else output("her");
			output(" to come help her service the plush tit.");

			//moderate Will saves possible but made worse by libido!
			if(target.willpower()/2+rand(20) + 1 - target.libido()/5 >= 15)
			{
				if(!(target is Azra)) output("\n\nYou may as well be looking at a chromed fender for how you react to her display. It’ll take more than that to distract you!");
				//Azra saves
				else output("\n\nAzra may as well be admiring the silver side of a ship for how she reacts. Good on her!");
			}
			//Azra fails
			else 
			{
				if(target is Azra)
				{
					output("\n\nAzra flushes hotly and shifts uncomfortably in her armor.");
					if(target.hasStatusEffect("cock out")) output(" She reaches for her <i>very</i> tumescent shaft before jerking her hand away at the last second.");
					else output(" From the way she’s behaving, something must be bunched up behind her armor’s crotchguard.");
				}
				//tease damzors
				applyDamage(new TypeCollection( { tease: 6 + rand(4) } ), this, target, "minimal");
			}
		}

		//Tentacaress
		public function tentacaressAttack(target:Creature):void
		{
			output("The double-goo’s left arm stretches out and narrows into a tapered tentacle.");
			//No new PG. PC Target: 
			if(!(target is Azra)) 
			{
				if (combatMiss(this, target)) output(" You twist aside at the last second, leaving the left head to wordlessly pout as she reels it back in.");
				else
				{
					if(rand(2) == 0)
					{
						output(" It’s too fast to avoid");
						if(!target.isCrotchExposed()) output(", slipping into your [pc.crotchCover]");
						else output(", slapping into your loins");
						output(" and aggressively caressing your ");
						if(target.hasCock()) output("[pc.cockBiggest]");
						else if(target.hasVagina()) output("[pc.vagina]");
						else output("[pc.asshole], sawing back and forth across your taint");
						output(".");
					}
					else output(" It slams into your [pc.chest] and roughly squeezes, the tip flicking your [pc.nipple] teasingly.");
					applyDamage(new TypeCollection( { tease: 10 + rand(6) } ), this, target, "minimal");
				}
			}
			//No new PG. Azra Target: 
			else
			{
				if (combatMiss(this, target)) output(" Azra twists aside at the last second, leaving the left head to wordlessly pout as she reels it back in.");
				else
				{
					output(" Azra tries to dodge, but the tentacle is on her in seconds");
					if(target.hasStatusEffect("cock out")) output(", wrapping around her exposed cock and messily tugging on it. The shark-woman’s knees wobble before she pulls away, shuddering.");
					else output(", slithering through a gap in her armor to fondle a particularly sensitive part of the suula’s body. From the way she shudders and jerks back, it must feel quite good.");
					applyDamage(new TypeCollection( { tease: 10 + rand(6) } ), this, target, "minimal");
				}
			}
		}
		//Goo Spray
		public function gooSprayAttack(target:Creature):void
		{
			output("The double-goo’s left hand reaches up and squeezes her enormous tit. A moment later, a torrent of silver sprays out from her plate-sized nipples, aimed straight at your face!");
			//PC target:
			if(!(target is Azra))
			{
				if (rangedCombatMiss(this, target)) output(" You manage to keep it out of your eyes, but it still gets everywhere else!");
				else if(!target.isBlind())
				{
					output("It splatters over your face, <b>blinding you with sticky goo!</b>");
					CombatAttacks.applyBlind(target, 3);
				}
				output(" The warm, liquid metal flows over the rest of your body, clinging to your most sensitive areas.");
				if(target.hasCock())
				{
					output(" Your [pc.cocks] feel");
					if(target.cockTotal() == 1) output("s");
					output(" like ");
					if(target.cockTotal() == 1) output("it’s");
					else output("they’re");
					output(" wrapped in liquid condoms.");
				}
				if(target.hasVagina())
				{
					output(" If your [pc.vaginas] ");
					if(target.totalVaginas() == 1) output("wasn’t");
					else output("weren’t");
					output(" wet before, ");
					if(target.totalVaginas() == 1) output("it is");
					else output("they are");
					output(" now.");
				}
				applyDamage(new TypeCollection( { tease: 7 + rand(6) } ), this, target, "minimal");

				if(target.lust() < target.lustMax()) output(" With some effort, you dislodge it, but not before it’s had a chance to stir your passion.");
				else output(" You make a meager effort to displace it before giving up and touching yourself.");
			}
			//Azra target
			else
			{
				if (!rangedCombatMiss(this, target)) 
				{
					output(" It goes in Azra’s eyes, <b>blinding her!</b>");
					CombatAttacks.applyBlind(target, 3);
				}
				output(" The warm, liquid metal flows over her body, seeping into her armor to cling to her most sensitive areas.");
				//Damage# here.
				applyDamage(new TypeCollection( { tease: 7 + rand(6) } ), this, target, "minimal");
			}
		}

		//left uses physical attacks if dropped below 70% HP and hits HARD.
		//Slap - Stun chance
		public function slapGooAttack(target:Creature):void
		{
			output("The double-goo’s left arm whips around, palm extended ");
			if(!(target is Azra)) output("for a slap");
			else output("to slap Azra");
			output(".");
			if(combatMiss(this, target)) 
			{
				if(!(target is Azra)) output(" It misses.");
				else output(" Azra backpedals just in time to avoid it.");
			}
			else
			{
				if(!(target is Azra)) output(" Yeowch!");
				else output(" It connects full-on with the suula’s face!");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
			if(!target.isImmobilized() && this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
			{
				if(!(target is Azra)) output(" <b>You’re stunned </b>from the concussive impact!");
				else output(" <b>Azra is stunned by the concussive impact!</b>");
				CombatAttacks.applyStun(target,1);
			}
		}
		//Punch - Trip chance
		public function punchGooAttack(target:Creature):void
		{
			output("A viscous left hook swings ");
			if(!(target is Azra)) output("your way");
			else output("Azra’s way");
			output(".");
			if(combatMiss(this, target)) 
			{
				if(!(target is Azra)) output(" You barely sidestep it!");
				else output(" Azra barely sidesteps it!");
			}
			else
			{
				if(!(target is Azra)) output(" You try to avoid it, but the enormous fist is simply too large.");
				else output(" Azra tries to avoid it but the fist is simply too large.");
				//Damage
				applyDamage(meleeDamage(), this, target, "minimal");

				//if trip:
				if (!target.hasStatusEffect("Tripped") && this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
				{
					output(" The forceful impact hits hard enough to knock ");
					if(!(target is Azra)) output("you");
					else output("Azra");
					output(" flat on ");
					if(!(target is Azra)) output("your");
					else output("her");
					output(" ass. <b>");
					if(!(target is Azra)) output("You are");
					else output("She is");
					output(" tripped!</b>");
				}
			}
		}
		//Crush - step on tripped PCs for low damage 5x times.
		public function crushGooAttack(target:Creature):void
		{
			output("An enormous foot forms from the goo-woman’s blobby base. ");
			if(!(target is Azra)) 
			{
				output("You try to roll aside, but it’s too little, too late. She easily slams it down on you, pinning you to the ground. Then she does it again. And again, battering you mercilessly.");
				//Four is probably plenty...
				applyDamage(meleeDamage(), this, target, "minimal");
				applyDamage(meleeDamage(), this, target, "minimal");
				applyDamage(meleeDamage(), this, target, "minimal");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
			else 
			{
				output("Azra tries to roll aside, but it’s too little, too late. The double-goo easily slams her foot down onto Azra’s crotch, grinding the shark-girl’s ");
				if(!target.hasStatusEffect("cock out")) output("genitals");
				else output("boner");
				output(" beneath her weight. Azra whimpers and blushes. Is she... enjoying that?");
				applyDamage(meleeDamage(), this, target, "minimal");
				applyDamage(new TypeCollection( { tease: 25 + rand(6) } ), this, target, "minimal");
			}
		}
	}
}
