package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.ZilSpear;
	import classes.Items.Melee.Rock;
	import classes.Items.Guns.ZilBow;
	//import classes.Items.Protection.DecentShield;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class RKLah extends Creature
	{	
		//constructor
		public function RKLah()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "R.K. Lah";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "The ausar fugitive stands maybe 6 foot tall, a height accentuated by his hard, jungle-leaned body and his wide, pointy ears. His skin is a sun-bronzed teak and his fur an orangey-gray, a shoulder-length matt of the stuff between his ears and down his bushy tail. Around his neck he has tied a long fur of some kind, which combined with the hunch of his shoulders lends him a prowling profile. Aside from that all he’s dressed in are the tattered remains of his bright orange jumpsuit bottoms; his bare feet are floured pale yellow with use.\n\nHe has a long, studious face which would be reasonably fetching in some circumstance in which his lips weren’t curled up in a mask of rage and fear. Similarly, his pale gray eyes could be pools of moon-like calm, were they not nakedly shining the light of a mind that has spent weeks marching far into the jungle night. He is armed with black, thorn-like claws and a zil spear, which with his spidery arms give him considerable reach.";
			this.customDodge = "Lah casually sidesteps out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new ZilSpear();
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 5;
			
			this.rangedWeapon = new Rock();
			
			this.armor.longName = "tattered jumpsuit";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			//this.shield = new DecentShield();
			
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.pheromone.damageValue = 50.0;

			this.level = 5;
			this.physiqueRaw = 20;
			this.reflexesRaw = 25;
			this.aimRaw = 15;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 23;
			this.libidoRaw = 25;
			this.HPMod = 30;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 20;
			this.XPRaw = bossXP();
			
			this.credits = 15;
			
			this.femininity = 10;
			this.eyeType = 0;
			this.eyeColor = "gray";
			this.tallness = 72;
			this.thickness = 25;
			this.tone = 85;
			this.hairColor = "orange-gray";
			this.scaleColor = "orange";
			this.furColor = "orange-gray";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "bronzed";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.hipRatingRaw = 0;
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
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.shiftCock(0,GLOBAL.TYPE_CANINE);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 15;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 2000;
			this.timesCum = 762;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "pale pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			impregnationType = "LahPregnancy";
			
			//this.createPerk("Multiple Attacks",1,0,0,0,"");
			//this.createPerk("Multiple Shots",1,0,0,0,"");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "R.K. Lah";
			setDefaultSexualPreferences();
			//kGAMECLASS.mhengaSSTDChance(this);
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "LAH";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.REALLY_LIKES_SEXPREF);

			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS,	GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var choices:Array = [];
			if(!hasStatusEffect("Grappled")) choices.push(theWolfAmongUs);
			else
			{
				willItBleed(target);
				return;
			}
			choices.push(redFlowerAttackWhatIsThisFuckingJungleBook);
			choices.push(wolfsToothytooth);
			if(!this.hasStatusEffect("Evasion Boost")) choices.push(dancesWithWolves);
			choices.push(willItBleed);
			choices[rand(choices.length)](target);
		}
		//Attacks
		//If It Bleeds
		//Causes 5 points of bleed for 3 turns if unshielded
		public function willItBleed(target:Creature):void
		{
			output("Lah lunges forward suddenly, a bestial, wordless snarl on his lips as he swipes at you with his bared, thorn-like claws! ");
			var preShields:Number = target.shields();

			if(combatMiss(this, target)) output("You manage to sidestep the attack.");
			else
			{
				if(target.shields() <= 0) output("His claws rake viciously through your [pc.skin].");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(0.5);
				applyDamage(damageRand(damage, 15), this, target);
				//If bleed:
				if(!target.hasStatusEffect("Bleeding")) output("\n<b>Blood dribbles freely from the ragged wound.</b>");
				else output("\n<b>The deepened cuts bleed faster!</b>");
				CombatAttacks.applyBleed(target, 1, 3, 5);
			}
		}
		//Dances With Wolves
		//Raises evasion by 30% for 3 turns
		public function dancesWithWolves(target:Creature):void
		{
			output("<i>“Fancy yourself, don’t you? Pigs always do,”</i> Lah growls, ears flat, tail twitching. He starts, eyes flicking this way and that, as if his neck were crawling... and then he shoots forward, spear raised for an all-out attack!... and then suddenly he’s not, he’s hopping and creeping around the opposite side of the stone circle instead, spear twirling in one hand. <i>“But here you are, way way out from your pen, without any of your fancy native-killing gadgets - and how soft you look without them, how </i>vulnerable<i>. So c’mon, pig. Just, just try and lay your snout on me.”</i>");
			this.createStatusEffect("Evasion Boost",30,0,0,0,false,"Icon_DefUp","+30% Evasion!",true,3);
		}
		//Wolf’s Tooth
		//Standard kinetic penetrating attack. 20% chance to cause 5 bleed for 3 turns if unshielded
		public function wolfsToothytooth(target:Creature):void
		{
			output("Lah prowls around you, arm up and grey eyes flashing, thrusting his spear viciously at your side where he anticipates you won’t expect it.");
			if(combatMiss(this, target)) output("\nYou manage to sidestep the attack.");
			else
			{
				//His blow is blunted by your shield.
				//His blow breaks through your shield and thunks into you.
				//His blow thunks into your bare side.
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target);
				//Causes bleed:
				if(rand(5) == 0 && target.shields() <= 0)
				{
					if(!target.hasStatusEffect("Bleeding")) output("\nHorribly unprotected as you are, there’s nothing stopping the blade hitting a vein and the merlot to start flowing down your [pc.skinFurScales], dripping in the dirt below your [pc.feet]. <b>You are bleeding.</b>");
					else output("\n<b>The deepened cuts bleed faster!</b>");
					CombatAttacks.applyBleed(target, 1, 3, 5);
				}
			}
		}
		//Red Flower
		//Burning damage, 50% chance to cause burn
		public function redFlowerAttackWhatIsThisFuckingJungleBook(target:Creature):void
		{
			output("Lah staggers backwards, seemingly cringing away from you in fear - before snatching a torch out of the hand of a zil behind him and thrusting its lit end at your face.");
			output("\n\n<i>“Burn, pig!”</i> he snarls.");
			// {Thankfully your shield deflects it upwards.} {Your shield can’t stop it entirely and instinctively you throw your arms in the way. Ffffffuck that stings!}
			
			if(combatMiss(this, target)) output("\nYou manage to sidestep the attack.");
			else
			{
				output(" You instinctively throw your arms in the way, saving your face at the expense of searing pain against your palms. Fffffffuck that stings!");
				var damage:TypeCollection = new TypeCollection( { electric: 15 } );
				applyDamage(damageRand(damage, 15), this, target);
				if(rand(2) == 0 && !target.hasStatusEffect("Burning") && target.shields() <= 0)
  				{
  					output("\n<b>You are now on fire!</b>");
					CombatAttacks.applyBurning(target, 2 + rand(2));
  				}
			}
		}
		//The Wolf About Us
		//Constrict. Only uses if PC suffering from a DoT. 2 turn cooldown.
		public function theWolfAmongUs(target:Creature):void
		{
			output("Pale eyes flickering over your wounds, Lah bounds forward, hunching forward on all fours in order to launch himself bodily at you.");
			if(combatMiss(this, target)) output(" You shuttle forward yourself, letting him leap right over you.");
			else
			{
				output(" Wind escapes your lungs as he grabs you around the neck, forcing you downwards in an arm-lock.");
				output("\n\n<i>“Give in,”</i> he barks gruffly in your ear. <i>“Better now, before your wounds force you to.”</i>");
				CombatAttacks.applyGrapple(target, 35);
			}
		}
	}
}