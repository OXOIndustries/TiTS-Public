package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.ProtectiveJacket;
	import classes.Items.Melee.Fists;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.DecentShield;
	import classes.kGAMECLASS;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Utility.weightedRand;
	import classes.Util.InCollection;
	
	public class Zaalt extends Creature
	{	
		//constructor
		public function Zaalt()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Zaalt";
			this.originalRace = "milodan";
			this.a = "";
			this.capitalA = "";
			
			this.customDodge = "Zaalt casually sidesteps out of the way.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon = new ShockBlade();
			this.meleeWeapon.hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			this.armor = new ProtectiveJacket();
			
			this.shield = new DecentShield();
			
			this.level = 7;
			this.physiqueRaw = 30;
			this.reflexesRaw = 30;
			this.aimRaw = 11;
			this.intelligenceRaw = 11;
			this.willpowerRaw = 23;
			this.libidoRaw = 40;
			this.HPMod = 0;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.XPRaw = normalXP();
			
			this.credits = 1200;
			
			this.femininity = 10;
			this.eyeType = 0;
			this.eyeColor = "crimson";
			this.tallness = 95;
			this.thickness = 75;
			this.tone = 85;
			this.hairColor = "white";
			this.scaleColor = "white";
			this.furColor = "white";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
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
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 10;
			this.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
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
			this.timesCum = 1549;
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
			
			impregnationType = "ZaaltPregnancy";
			
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Sneak Attack", 0, 0, 0, 0, "");
			
			isUniqueInFight = true;
			btnTargetText = "Zaalt";
			setDefaultSexualPreferences();
			_isLoading = false;
		}
		
		override public function get long():String
		{
			var msg:String = "Zaalt is a towering milodan male, a heavily furred feline with a coat of orange and black stripes. His hair falls loosely around his shoulders, half black and half dyed blue. He’s a big man in more ways than just height: barrel chested and broad-shouldered, built more like a boxer than a spacer to your eye. He’s dressed in a dark jacket and weather-worn clothes beneath, now straining against his hammering chest and rippling muscle... and an uncontrollable fire in his loins that demands attention, bulging against his breeches. Claws adorn his fingers, though they seem a small threat compared to his saber-like fangs";
			if (meleeWeapon is ShockBlade) msg += " and deadly blade.";
			else msg += ".";
			return msg;
		}
		
		override public function get bustDisplay():String
		{
			return "ZAALT";
			//return "MILODANMALE";
		}
		
		override public function setDefaultSexualPreferences():void
		{
			// 9999 Set these or some shit
			
			//Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE,	GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,					GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_MULTIPLES,				GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_GAPE,					GLOBAL.KINDA_LIKES_SEXPREF);

			//Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,				GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS,				GLOBAL.KINDA_DISLIKES_SEXPREF);
		}
		
		public function SetDisarmed():void
		{
			createStatusEffect("No Weaponry", 1000, 0, 0, 0, false, "Blocked", "Zaalt doesn’t have his usual complement of weapons to hand!", true, 0, 0xFF0000);
			meleeWeapon = new Fists();
		}
		
		private var _leechUses:int = 0;
		private var _roundCount:int = 0;
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			_roundCount++;
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];
			
			if (energy() >= 15) attacks.push( { v: doLowBlow, w: 10 } );
			attacks.push( { v: doUnarmedFlurry, w: 20 } );
			if (target is PlayerCharacter && !target.hasStatusEffect("Staggered") && !target.isPlanted() && energy() >= 15) attacks.push( { v: doPsiShockwave, w: 10 } );
			if (_leechUses < 2 && target is PlayerCharacter && HPQ() < 50) attacks.push( { v: doMindLeech, w: 40 } );
			
			if (!hasStatusEffect("No Weaponry"))
			{
				if (!hasStatusEffect("Nade Cooldown")) attacks.push( { v: doFlashGrenade, w: 10 } );
				if (!hasStatusEffect("Nade Cooldown")) attacks.push( { v: doGasGrenade, w: 10 } );
				attacks.push( { v: doPsiBlade, w: 10 } );
			}
			
			var selAttack:Function = weightedRand(attacks);
			if (InCollection(selAttack, doGasGrenade, doFlashGrenade)) selAttack(hostileCreatures);
			else if (InCollection(selAttack, doLowBlow)) selAttack(alliedCreatures, hostileCreatures, target);
			else selAttack(target);
			
			if (kGAMECLASS.annoIsCrew() && rand(3) == 0 && _roundCount > 2 && hostileCreatures.length < 2)
			{
				annoJoinsFight();
			}
		}
		
		private function doLowBlow(f:Array, h:Array, t:Creature):void
		{
			CombatAttacks.LowBlow.execute(f, h, this, t);
		}
			
		private function doUnarmedFlurry(target:Creature):void
		{
			//Several light attacks: two slashing claw-strikes, one piercing bite.

			output("Zaalt roars with unfettered fury, lunging at");
			if (target is PlayerCharacter) output(" you");
			else output(" Anno");
			output(" with claw and fang!");
			
			output("\nHis first claw-swipe");
			if (combatMiss(this, target, -1, 1.5)) output(" misses!");
			else
			{ 
				output(" hits!");
				applyDamage(new TypeCollection( { kinetic: 5 } ), this, target, "minimal");
			}
			output("\nHis second claw-swipe");
			if (combatMiss(this, target, -1, 1.5)) output(" misses!");
			else
			{
				output(" hits!");
				applyDamage(new TypeCollection( { kinetic: 5 } ), this, target, "minimal");
			}
			output("\nHis savage bite");
			if (combatMiss(this, target, -1, 0.75)) output(" is easily avoided!");
			else
			{
				output(" sinks into");
				if (target is PlayerCharacter) output(" your");
				else output(" Anno’s");
				output(" flesh!");
				applyDamage(new TypeCollection( { kinetic: 7 }, DamageFlag.PENETRATING), this, target, "minimal");
			}
		}
		
		private function doPsiShockwave(target:Creature):void
		{
			//Psionic attack. Deals Lust damage and staggers (Will save resists).
			energy( -15);
			
			output("Screaming with rage, Zaalt grabs his head and almost doubles over backwards. A second later and the bridge erupts with power, slamming you back against a bulkhead. The real pain comes after, though: your mind sears with a burning, uncontrollable need: for sex, for comfort, for anything that isn’t battle.");
			
			applyDamage(new TypeCollection( { psionic: 8, kinetic: 3 } ), this, target, "minimal");
			
			if (10 + (rand(target.willpower()) / 2) < (willpower() / 2))
			{
				output(" <b>The mental blast has left your momentarily staggered!</b>");
				CombatAttacks.applyStagger(target, 4);
			}
			
		}
		
		private function doMindLeech(target:Creature):void
		{
			_leechUses++;
			energy( -20);
			
			//Psionic attack. Drains some of Zaalt's lust onto the PC, and restores a moderate amount of Health. 2/encounter; only targets PC. 

			output("Zaalt thrusts a hand out at you, as if to grab your head. You manage to duck back, but even as you dodge the swipe, you realize that it wasn’t his intention to <i>physically</i> attack you! Leeches of mental force gnaw at your mind, making you stagger back and grab your head, trying desperately to force out the invading force.");
			
			if (10 + (rand(target.willpower()) / 2) > willpower())
			{
				output("\n\nYou only barely manage to shrug off Zaalt’s mental attack, resisting the subtle claws of psionic energy.");
			}
			else
			{
				output("\n\nA rush of heat floods your mind, searing at your thoughts and boiling them away, leaving only carnal desire: it takes everything you have not to just jump on Zaalt now, to surrender and let the berzerking kitty do whatever he wants with you! The bulge in his pants strains against the seams, trying to free itself to tempt you further -- yet now Zaalt himself seems even more focused than before, more cogent of his surroundings... and more intent than ever of throwing you on the deck and fucking you. Of that, you have no doubt!");
				
				var dr:DamageResult = applyDamage(new TypeCollection( { psionic: 15, kinetic: 5 }, DamageFlag.GREATER_VAMPIRIC), this, target, "minimal");
				
				HP(HPMax() * 0.25);
			}
		}
		
		private var _flashesUsed:int = 0;
		private function doFlashGrenade(targets:Array):void
		{
			output("Zaalt pulls");
			if (_flashesUsed > 0) output(" another");
			output(" disk-like grenade from his belt and slides it across the deck, placing it " + (targets.length > 1 ? "between you and Anno!" : "right at your feet!") +" The flashbang detonates with deafening force, ");

			var pc:Creature;
			var anno:Creature;
			
			for (var i:int = 0; i < targets.length; i++)
			{
				if (targets[i] is PlayerCharacter) pc = targets[i] as Creature;
				if (targets[i] is Anno) anno = targets[i] as Creature;
			}
			
			var blindedPC:Boolean = rand(10) != 0 && !pc.hasBlindImmunity();
			
			if (targets.length > 1 && anno != null)
			{
				var blindedAnno:Boolean = rand(10) != 0 && !anno.hasBlindImmunity();
				if (blindedPC && blindedAnno)
				{
					output(" blinding you and Anno.");
					CombatAttacks.applyBlind(pc, 3);
					CombatAttacks.applyBlind(anno, 3);
				}
				else if (!blindedPC && blindedAnno)
				{
					output(" blinding Anno, though you manage to avoid any serious effect.");
					CombatAttacks.applyBlind(anno, 3);
				}
				if (blindedPC)
				{
					output(" blinding you.");
					CombatAttacks.applyBlind(pc, 3);
				}
				else
				{
					output(" though both you and Anno manage to avoid any serious effect.");
				}
			}
			// Can only be the PC then
			else
			{
				if (blindedPC)
				{
					output(" blinding you.");
					CombatAttacks.applyBlind(pc, 3);
				}
				else
				{
					output(" though you manage to avoid any serious effect.");
				}
			}

			createStatusEffect("Nade Cooldown", 3);
			_flashesUsed++;
		}
		
		private function doGasGrenade(targets:Array):void
		{
			energy(-20);
			output("Zaalt hurls a grenade from his belt " + (targets.length == 1 ? "in your direction" : "between you and Anno") + ". The grenade explodes in a flash of blinding light that renders you " + (targets.length == 1 ? "" : " and Anno") + " blind. A moment later, the expended grenade begins to hiss out a stream of green gas that floats out towards you.");
			
			var pc:Creature;
			var anno:Creature;
			var i:int = 0;
			
			for (i = 0; i < targets.length; i++)
			{
				if (targets[i] is PlayerCharacter) pc = targets[i] as Creature;
				if (targets[i] is Anno) anno = targets[i] as Creature;
			}
			
			var gassedPC:Boolean = rand(10) != 0 && !pc.hasAirtightSuit();
			
			if (targets.length > 1 && anno != null)
			{
				var gassedAnno:Boolean = rand(10) != 0 && !anno.hasAirtightSuit();
				if (gassedPC && gassedAnno)
				{
					output(" You and Anno cough violently from the thick gas drifting out and around the two of you.");
				}
				else if (!gassedPC && gassedAnno)
				{
					output(" The thick gas drifts around you to minor effect thanks to your airtight suit, but that doesn’t help in the way of visibility.");
				}
				else if (gassedPC)
				{
					output(" You clutch your throat as the gas drifts out, coughing violently.");
				}
				else
				{
					output(" The gas drifts around you two to minor effect thanks to your airtight suits, but that doesn’t help in the way of visibility.");
				}
			}
			// Can only be the PC then
			else
			{
				if (gassedPC)
				{
					output(" You clutch your throat as the gas drifts out, coughing violently.");
				}
				else
				{
					output(" The gas drifts around you to minor effect thanks to your airtight suit, but that doesn’t help in the way of visibility.");
				}
			}
			
			output(" Aim and Reflex decreased!");
			for (i = 0; i < targets.length; i++)
			{
				var t:Creature = targets[i];
				CombatAttacks.applyGassed(t);
			}
			
			createStatusEffect("Nade Cooldown", 3);
		}
		
		private function doPsiBlade(target:Creature):void
		{
			//Single heavy attack. Deals bonus damage based on Willpower. Can't be Disarmed to use this.
			energy( -15);
			
			output("Zaalt lunges at");
			if (target is PlayerCharacter) output(" you");
			else output(" Anno");
			output(", swinging his glowing purple blade in both hands. The force sword cries with power as it cuts the air,");
			if (!combatMiss(this, target))
			{
				output(" and slams into");
				if (target is PlayerCharacter) output(" you");
				else output(" Anno");
				output(" with bone-ratting force... and more, a psychic scream that burrows into the mind and makes");
				if (target is PlayerCharacter) output(" you");
				else output(" Anno");
				output(" stumble back with mental agony as well as physical.");
				
				var damMulti:Number = willpower() / target.willpower();
				if (damMulti > 2) damMulti = 2;
				if (damMulti < 1) damMulti = 1;
				
				applyDamage(new TypeCollection( { psionic: 7 * damMulti, kinetic: 10 * damMulti } ), this, target, "minimal");
			}
			else
			{
				output(" but thankfully it finds only that --");
				if (target is PlayerCharacter) output(" you evade");
				else output(" Anno evades");
				output(" the strike.");
			}
		}
		
		private function annoJoinsFight():void
		{
			//Play if the PC has Anno follower. Chance for any time after Turn 2.

			output("\n\n<i>“[pc.name]!?”</i> You hear Anno shouting from back in the crew quarters. She comes running towards the sound of your scuffle, and thankfully she arrives with her gun in hand. <i>“What’s going... what’s wrong with him?”</i>");

			output("\n\n<i>“No idea!”</i> you answer back, pushing back the feral cat-man as best you can. Anno just shrugs and takes her place at your side to defend you -- and her home!");
			
			kGAMECLASS.anno.HP(kGAMECLASS.anno.HPMax());
			kGAMECLASS.anno.shields(kGAMECLASS.anno.shieldsMax());
			kGAMECLASS.anno.lustRaw = 10;
			kGAMECLASS.anno.long = "Anno is next to you, her compact holdout held out in front of her as she waits for an opportunity to fire. Her bushy tail is tucked in tight, ears lowered against her head, and body poised and ready to avoid incoming attacks.";
			kGAMECLASS.anno.customDodge = "Anno quickly jumps to the side and evades the attack.";
			CombatManager.addFriendlyActor(kGAMECLASS.anno);
		}
	}
}