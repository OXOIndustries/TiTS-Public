package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Guns.PrimitiveBow;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class Kane extends Creature
	{
		//constructor
		public function Kane()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "Kane";
			this.originalRace = "zil";
			this.a = "";
			this.capitalA = "";
			this.long = "Although not heavily built by any means, the 5\' 11\" zil is more muscular than most of his brethren, compact muscle rounding the shiny black carapace on his limbs and chest, his ass long and athletic. He carries it well, moving around you with an easy, assured athleticism married to sudden, insectile jerkiness, changing position with a flicker of his giant, opaque wings, latex-like boots clacking as they land. His shoulder length dark brown hair is shaggy, hanging over his long, brooding face, a long, thin scar across one eye. Floppy antennae and scowling, pupil-less black eyes never stop tracking your movements.\n\nHe is armed with a smooth, football-sized rock securely tied to a five foot long fibrous rope. He swings it around him with trained precision, an ominous, whirring blur near his fist. The cloying, sweet smell of him is heavy on the air, constantly distracting you, trailing your thoughts away to energetic, honey-soaked sex. You’d hate to think what a large, aggressive zil like this would be like in the smothering confines of the lower jungle.";
			this.customDodge = "Kane zips out of the way with a swift contortion of his agile frame.";
			this.customBlock = "The zil’s chitinous armor deflects your attack.";
			this.isPlural = false;
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "rock";
			this.meleeWeapon.attackVerb = "smash";
			this.meleeWeapon.attackNoun = "smash";
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon.attack = 2;
			this.rangedWeapon.longName = "rock";
			this.rangedWeapon.attackVerb = "smash";
			this.rangedWeapon.attackNoun = "smash";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 20;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 26;
			this.reflexesRaw = 30;
			this.aimRaw = 21;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 24;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 30;
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 71;
			this.thickness = 20;
			this.tone = 80;
			this.hairColor = "dark brown";
			this.scaleColor = "black";
			this.furColor = "yellow";
			this.hairLength = 11;
			this.hairType = GLOBAL.TYPE_BEE;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_BEE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_BEE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_BEE;
			wingCount = 2;
			this.legType = GLOBAL.TYPE_BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
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
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			this.cocks[0].cType = GLOBAL.TYPE_BEE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 1;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;

			//this.createStatusEffect("Disarm Immune");
			setDefaultSexualPreferences();
			isUniqueInFight = true;
			btnTargetText = "Kane";
			createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			this._isLoading = false;
			
			//inventory.push(new ZilRation());
		}

		override public function setDefaultSexualPreferences():void
		{
			//KANE Likes:
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,			GLOBAL.REALLY_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS,	GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION,		GLOBAL.KINDA_LIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_LIKES_SEXPREF);
			//KANE Dislikes
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,			GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_DISLIKES_SEXPREF);
			this.sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,			GLOBAL.REALLY_DISLIKES_SEXPREF);
		}
		
		override public function get bustDisplay():String
		{
			return "KANE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			if (hasStatusEffect("KANE_AI_SKIP")) 
			{
				removeStatusEffect("KANE_AI_SKIP");
				return;
			}
			//CD timer for Honey Shot:
			if(this.statusEffectv1("HS CD") > 0 && this.energy() >= 50) this.addStatusValue("HS CD",1,-1);
			if(this.statusEffectv1("Roofied") > 0) this.addStatusValue("Roofied",1,-1);


			//ABILITY SELECTION:
			//Uses if Lust over 80. One turn to prepare, next turn releases. Riposte inactive on both turns. Drains 50 lust and causes pheromone lust damage to PC. Three turn cooldown
			if(this.lust() >= 80 && this.statusEffectv1("HS CD") <= 0)
			{
				honeyShot(target);
			}
			//Bee Wit U
			//Only uses if PC is stunned. Heavy pheromone lust damage
			else if(target.hasStatusEffect("Stunned") && !target.hasAirtightSuit()) beeWitU(target);
			else if(this.hasStatusEffect("Disarmed")) punchyPunch(target);
			else
			{
				//Wind
				//Activates if PC energy < 40. Kinetic ranged, drains 40 energy.
				if(target.energy() >= 10 && target.energy() < 50) kaneWindFart(target);
				//Primitive Roofie
				//Kinetic, medium HP damage, causes stun
				//Not used if Stunned already.
				else if(!target.hasStatusEffect("Stunned") && this.statusEffectv1("Roofied") <= 0) primitiveRoofie(target);
				//Double Slap
				//Hit twice. Always use directly after PC has recovered from stun, so they have a chance to do something
				else kaneDoubleSlap(target);
			}
		}
		public function punchyPunch(target:Creature):void
		{
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			CombatAttacks.MeleeAttack(this, target);
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "rock";
			this.meleeWeapon.attackVerb = "smash";
			this.meleeWeapon.attackNoun = "smash";
			this.meleeWeapon.hasRandomProperties = true;
		}	
		//Primitive Roofie
		//Kinetic, medium HP damage, causes stun
		//Not used if Stunned already.
		public function primitiveRoofie(target:Creature):void
		{
			output("Half-running, half-gliding, Kane charges at you in a curve, holding back his viciously swinging rope until the last moment before belting it at your head. ");
			if(combatMiss(this, target)) output("You duck out of the way, allowing him to fly past you.");
			else
			{
				var bStun:Boolean = false;
				output("The heavy rock smacks you in the temple");
				if(target.physique()/2 + rand(20) + 1 >= this.physique()/2 + 10)
				{
					output(", but you manage to go with the direction of the blow, and as painful as it is, you avoid being knocked for six.");
				}
				else
				{
					output(". You taste iron, and the horrible sound of pain and shock rings in your [pc.ears]. <b>You are stunned.</b>");
					bStun = true;
					if(!this.hasStatusEffect("Roofied")) this.createStatusEffect("Roofied",4,0,0,0);
					else this.addStatusValue("Roofied",1,4);
				}
				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target);
				if(bStun) CombatAttacks.applyStun(target, 2 + rand(2));
			}
		}
		//Bee Wit U
		//Only uses if PC is stunned. Heavy pheromone lust damage
		public function beeWitU(target:Creature):void
		{
			//First
			if(!target.hasStatusEffect("Kane's Honey"))
			{
				output("In your private floaty world of stunned pain you can only watch as several copies of Kane stride towards you. He pulls you into his smooth, hard arms and roughly explores you with his strong hands; clutching your [pc.ass], breathing in your scent with sensuous, inquisitive intent, molding his fingers into your [pc.chest]... the deep, heavy smell of his honey is everywhere, inundating your senses and coursing steady heat down to your groin.");
				output("\n\n<i>“I can smell your desires, pawn,”</i> he murmurs. <i>“I shall see to them, once you have accepted the folly of coming here to take the word-wolf away. The message you will take back to the land-stealers shall be one of harshness and fairness.”</i>");
				target.createStatusEffect("Kane's Honey",0,0,0,0,false,"Icon_Charmed","Kane is bombarding you with delicious pheromones!",true,0,0xFF0000);
				applyDamage(new TypeCollection( { tease: 15+rand(4) } ), this, target, "minimal");
			}
			//Subsequent round if PC still stunned:
			else
			{
				output("You are still too dazed to do anything but writhe ineffectually in Kane’s strong grip. Your vague movements only seem to present more of your body for him to grind his smooth, warm plate onto and fondle with his confident hands. He rubs his fingertips against a [pc.nipple] and bends his other hand between your [pc.thighs]. The honeyed smell of him washes into your mouth and nose in waves, making heat rise to your [pc.skin]");
				if(target.hasGenitals())
				{
					output(" and ");
					if(target.hasCock()) output("[pc.eachCock] achingly erect");
					if(target.isHerm()) output(" and ");
					if(target.hasVagina()) output(" [pc.eachVagina] drip with anticipation");
				}
				output("...");
				output("\n\n<i>“Give in,”</i> the lusty zil growls in your ear. <i>“Accept it.”</i>");
				applyDamage(new TypeCollection( { tease: 20+rand(4) } ), this, target, "minimal");
			}
		}
		//Honey Shot
		//Uses if Lust over 80. One turn to prepare, next turn releases. Riposte inactive on both turns. Drains 50 lust and causes pheromone lust damage to PC. Three turn cooldown
		public function honeyShot(target:Creature):void
		{
			//First turn: 
			if(!this.hasStatusEffect("Honey Shot")) 
			{
				output("His scowling features riven with angry lust, the ropey zil warrior pauses, closing his black eyes. His face turns steadily darker and darker, his fists clenched - he seems to be concentrating something...");
				this.createStatusEffect("Honey Shot", 0, 0, 0, 0, false, "Icon_DizzyDrunk", "Kane is building up to something...", true);
			}
			else
			{
				output("Kane’s face has almost turned purple - then he opens his eyes and bellows out in relief, his groin plate slipping down, his six-inch cock thrusting out and jetting a huge");
				if(!target.hasAirtightSuit()) output(", fragrant");
				output(" geyser of golden jizz directly at you! ");
				if(rangedCombatMiss(this, target)) output("You manage to duck to one side.");
				else if(target.hasAirtightSuit())
				{
					output("It splatters right across your [pc.upperGarmentOuter] and over your helmet. You instinctively wipe the sticky gloop off you in disgust");
					if(target.hasBlindImmunity()) output(" - fortunately for you, it as little to no effect on your vision.");
					else
					{
						output(" - unfortunately, it leaves a smear that obscures your vision. <b>You are now blind!</b>");
						CombatAttacks.applyBlind(target, 2);
					}
				}
				else
				{
					output("It splatters right across your ");
					if(target.isChestExposed()) output("[pc.chest]");
					else output("[pc.upperGarmentOuter]");
					output(" and over your face. You instinctively wipe the sticky gloop off you in disgust - but you groan as the thick, heavy smell of it intensifies, your [pc.skinFurScales] marked with indomitable zil lust.");

					output("\n\n<i>“You are mine now, pawn,”</i> the zil gloats, looking refreshed, his fluid flitting drawing him closer and closer to you. <i>“You smell like my brother did, after servicing all the warriors in our clan.”</i>");
					var damage:TypeCollection = new TypeCollection( { pheromone: 15 } );
					applyDamage(damageRand(damage, 15), this, target);
					this.removeStatusEffect("Honey Shot");
				}
				if(!this.hasStatusEffect("HS CD")) this.createStatusEffect("HS CD",3,0,0,0);
				else this.addStatusValue("HS CD",1,3);
				this.lust(-50);
				this.energy(-50);
			}
		}
		//Double Slap
		//Hit twice. Always use directly after PC has recovered from stun, so they have a chance to do something
		public function kaneDoubleSlap(target:Creature):void
		{
			output("<i>“The word-wolf knew that the land-stealers would send pawns!”</i> Kane shouts, wild fury cracking his voice. <i>“Acquiescent plate-shiners like my brother, dependent upon their metal blowpipes to win. He has shown us how to defeat you!”</i>");
			output("\n\nAs he speaks he flies at you wings humming, swinging his stone first at your midriff from one side, then swiftly from the other.\n");
			for (var i:int = 0; i < 2; i++)
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
				if(i == 0) output("\n");
			}
		}
		//Wind
		//Activates if PC energy < 40. Kinetic ranged, drains 40 energy.
		public function kaneWindFart(target:Creature):void
		{
			output("Kane arcs through the air, rock trailing behind him. He zips ");
			if(target.shields() > 0) output("through your shield with a crackle and then ");
			output("past you with a whine... his rock follows a moment later.");
			if(combatMiss(this, target)) output("\nYou manage to dodge out of the way.");
			else output("\nThe crude mace thuds into your midriff, forcing air out of your lungs and tears to your eyes. Energy seems to sweat out of you with the pain.");
			var damage:TypeCollection = meleeDamage();
			damageRand(damage, 15);
			applyDamage(damage, this, target);
			target.changeEnergy(-50);
		}
	}
}
