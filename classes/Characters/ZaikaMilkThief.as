package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	//import classes.Items.Miscellaneous.Throbb;
	//import classes.Items.Transformatives.Soak;
	//import classes.Items.Transformatives.LaquineEars;
	import classes.Items.Protection.DecentShield;
	//import classes.Items.Armor.JumperJumpsuit;
	//import classes.Items.Armor.JumperJumpsuitSlutty;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Util.RandomInCollection;
	
	public class ZaikaMilkThief extends Creature
	{
		//constructor
		public function ZaikaMilkThief()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "milk thief";
			this.originalRace = "zaika";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = ""; // Implementation in prepForCombat
			this.customBlock = "";
			this.customDodge = "She launches aside with a high-pitched whine of cybernetic effort.";
			this.isPlural = false;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 0;
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			rangedWeapon.baseDamage.kinetic.damageValue = 1;
			this.rangedWeapon.attack = 0;
			this.rangedWeapon.longName = "dart gun";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "dart";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "defensive augmentations";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;

			//After aug armor is cracked, slightly weak to elec and kinetic. Rez drugs.
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.kinetic.damageValue = -25.0;
			baseHPResistances.drug.damageValue = 50.0;
			
			//Shield is actually "Aug armor". Elec rez, fire weak.
			this.shield = new DecentShield();
			this.shield.shields = 150;
			this.shield.resistances = new TypeCollection();
			this.shield.resistances.burning.damageValue = -50.0;
			this.shield.resistances.electric.damageValue = 25.0;
			//this.shield.resistances.burning.damageValue = 20.0;
			//this.shield.resistances.corrosive.damageValue = 20.0;
			
			this.shield.hasRandomProperties = true;

			this.physiqueRaw = 52;
			this.reflexesRaw = 52;
			this.aimRaw = 30;
			this.intelligenceRaw = 40;
			this.willpowerRaw = 38;
			this.libidoRaw = 45;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			
			this.level = 11;
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.XPRaw = normalXP();
			this.credits = 100;
			this.HPMod = 40;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "luminous";
			this.tallness = 5*12+rand(12);
			this.thickness = 25;
			this.tone = 59;
			this.hairColor = "pink";//set in random
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "";
			this.furColor = "pink";//Not used.
			this.hairLength = 9; //Chosen before Adj drew a bust. Defer to that.
			this.lipColor = "black";
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.tongueFlags = [GLOBAL.FLAG_LONG];
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.armFlags = [];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_ZAIKA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_ZAIKA;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.tailFlags = [GLOBAL.FLAG_TAILCOCK,GLOBAL.FLAG_TAILCUNT];
			//this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 2;
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
			//No dicks here!
			this.cocks = new Array();
			this.cockVirgin = false;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].bonusCapacity = 50;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINE;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 18;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 345;
			this.timesCum = 1234;

			this.elasticity = 1.5;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			//this.impregnationType = "";

			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "lilac";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "MilkThief";
			//this.impregnationType = "LapinaraPregnancy";
			kGAMECLASS.dhaalSSTDChance(this);
			randomise();
			this.createStatusEffect("Counters Melee");
			//this.createPerk("Appearance Enabled");
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			//Force like milky & tailgenital. Dislike sweat?
			sexualPreferences.setRandomPrefs(2 + rand(3),2);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, sexualPreferences.getRandomDislikeFactor());
			
			//Set da tid.
			this.breastRows[0].breastRatingRaw = RandomInCollection([2,8,33]);
			//smoltid!
			if(breastRows[0].breastRatingRaw == 2)
			{
				this.hairColor = "glowing green";
				this.eyeColor = "blue";//tbd
				//Set cum amounts for different tid sizes!
				this.cumMultiplierRaw = 5;
				this.ballEfficiency = 18;
				this.long = "This native zaika peers thoughtfully at you from underneath her luminescent, neon green hair, fixing you firmly in the path of her luminous, augmented eyes. For all her fierceness, she didn’t seem to bother with armor. Her clothing amounts to little more than a clear plastic suit with densely-packed elastic netting hanging supportively around her petite bust. Clear seams on her skin indicate cybernetics or other augmentations; you’d better not let her seeming nudity distract you from the fact she’s after your body.";
				this.lustRaw = 5;
			}
			//medtid!
			else if(breastRows[0].breastRatingRaw == 8)
			{
				this.long = "The zaika keeps you fixed in her hungry stare as she battles you, unbothered by the few strands of glowing blue hair that drift past her view. She sports a clear plastic bodysuit for clothing, covering her from neck to feet except for a mesh-filled gap across her well-formed breasts. Like all zaika, she lacks nipples. Cybernetic seams in her vibrant purple skin hint at subdermal armor plating and the possibility of augmented musculature. The heels of her feet are especially thick with them, indicative of heavy modding to enable her rooftop leaps.";
				this.hairColor = "glowing blue";
				this.eyeColor = "blue";//tbd
				//Set cum amounts for different tid sizes!
				this.cumMultiplierRaw = 18;
				this.ballEfficiency = 70;
				this.lustRaw = 10+rand(5);;
			}
			//swollus growus
			else
			{
				this.long = "The chesty zaika licks her lips as she circles you, brushing back her glowing coral hair with the unconcerned air of a runway model. You might have been able to ignore her bounteous bosom if she wasn’t dressed quite so revealingly. Clear plastic makes up the bulk of her see-through bodysuit save for the web of straining elastic strands supporting her tits. She might as well be naked! When she moves, her breasts wobble enticingly, like the netting is more of a suggestion than true support. You’d think she was some kind of cosplaying trollop if it wasn’t for the high-grade cybernetics that enabled her to make such an impressive jump.";
				this.hairColor = "glowing pink";
				this.eyeColor = "blue";//tbd
				//Set cum amounts for different tid sizes!
				this.cumMultiplierRaw = 100;
				this.ballEfficiency = 1000;
				this.lustRaw = 33+rand(10);;
			}
			this.credits = 100+rand(2000);
			this.tallness = 5+rand(13); //5-6 variance for normal zaika due to pollution.
			//Randomize HP & Shields slightly!
			this.HPMod = 100+rand(200);

			this.shield.shields = 200+rand(100);
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			shieldDisplayName = "AUGS";

			this.long += "\n\nA multipurpose storage tank hangs lightly on the milk thief's back, sloshing heavily in spite of her sprightly movements. The interior is divided into multiple compartments, many of which are empty. Those that aren't seem as likely to house bizarre glowing chemicals as the milk of her previous victims. A clear tube connects the pump at the base of it to her weapon: a gun-shaped device as capable of suckling the milk out of a breast as hosing you down with pure acid.";
			
			/*
			if(rand(4) == 0) this.inventory.push(new LaquineEars());
			else if(rand(4) == 0) this.inventory.push(new Soak());
			else if(rand(4) == 0) this.inventory.push(new Throbb());
			else if(rand(13) == 0) this.inventory.push(new JumperJumpsuitSlutty());
			else if(rand(12) == 0) this.inventory.push(new JumperJumpsuit());
			*/
		}
		override public function get bustDisplay():String
		{
			if(this.breastRows[0].breastRating() == 2) return "MILK_THIEF_SMALL";
			else if(this.breastRows[0].breastRating() == 8) return "MILK_THIEF_MEDIUM";
			else return "MILK_THIEF_LARGE";
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			//Counting leaps and landing it takes priority over everything else~
			if(this.hasStatusEffect("LeapCD"))
			{
				//Abort if de-flied somehow.
				if(!this.hasFlightEffects()) this.removeStatusEffect("LeapCD");
				//Otherwise, track for landing~
				else
				{
					this.addStatusValue("LeapCD",1,-1);
					//Time to land~
					if(this.statusEffectv1("LeapCD") <= 0) 
					{
						leapAttkGo(target);
						return;
					}
				}
			}
			//Antistun (only on 2nd stun turn) (10 energy)
			if(this.isImmobilized()) 
			{
				secondTurnStunCancel(target);
				return;
			}
			//Not stunned? Get rid of secret tracker.
			else if(this.hasStatusEffect("StunClearBois")) removeStatusEffect("StunClearBois");

			//Normal AI, goooo!
			if(!this.hasFlightEffects() && this.energy() >= 10 && this.hasStatusEffect("MeleeHit")) leapAttkGo(target);
			else if(this.HP()/this.HPMax() < 0.4 && !this.hasStatusEffect("Stimmypooed")) combatStimsAttk(target);
			else if(target.hasAirtightSuit() && rand(2) == 0 && this.energy() >= 25) acidSprayAttk(target);
			else if(!target.isBlind() && this.energy() >= 33 && rand(7) == 0) flashyBoiToy(target);
			else if(!target.hasAirtightSuit() && this.statusEffectv1("EROGASCOUNT") < 6 && rand(3) <= 1 && !this.hasFlightEffects()) eroGasAttk(target);
			//Fallback, weaker attacks. Target HP instead of lust, etc.
			else if(rand(2) == 0 || this.hasFlightEffects()) hiddenShockGunAttk(target);
			else fingerKnifeAttk(target);
		}
		//Attacks go here

		//Acid Spray - temporarily suppresses airtight if defense value is less than X - uses up 25 energy. (Only used vs airtight. Maybe make it last after fight and require a repair? Might be a PITA to make all suitable vendors on planet able to do it)
		public function acidSprayAttk(target:Creature):void
		{
			output("The milk thief twists a dial on the back of her “gun” and smiles cruelly. <i>“Don’t think that suit’s going to protect you from me.”</i> She pulls the trigger, and a spray of sizzling, corrosive fluid hoses down half the roadway.");
			//{Damage Here}
			applyDamage(new TypeCollection( { corrosive: 55 } ), this, target, "minimal");
			this.energy(-25);
			if(target.hasAirtightSuit() && target.defense() < 10)
			{
				output(" <b>Your airtight equipment isn’t quite so airtight any longer!</b>");
				target.createStatusEffect("Corroded Seals",0, 0, 0, 0, false, "DefenseDown", "<b>The acid has degraded your airtight seals</b>. You can swap them out after the fight, but you don't have time for that right now...", true, 0, 0xFFFFFF);
			}
		}
		//Ero Gas - make sure it functions similarly to the Ero Gas grenade
		// Won't use if the PC hasn't lost their airtight defense
		//10 energy
		public function eroGasAttk(target:Creature):void
		{
			if(!this.hasStatusEffect("EROGASCOUNT")) this.createStatusEffect("EROGASCOUNT");
			this.addStatusValue("EROGASCOUNT",1,1);
			output("Your opponent shakes her gun in frustration. <i>“");
			if(breastRows[0].breastRatingRaw == 2) 
			{
				//1st:
				if(!this.hasStatusEffect("EroGassy")) output("Listen, I just want your milk. Maybe you’ll see things my way after this - don’t hold your breath, now.");
				else output("Still trying to fight me? Not for much longer.");
			}
			//titsMed:
			else if(breastRows[0].breastRatingRaw == 8)
			{
				//first:
				if(!this.hasStatusEffect("EroGassy")) output("Ooh, you’re a feisty alien! You’re not alone in that - and you won’t be alone submitting to me!");
				else output("C’moooonnnn, just let me milk you! Here, take a deep breath and let’s forget about this!");
			}
			//titsBig:
			else
			{
				//first: 
				if(!this.hasStatusEffect("EroGassy")) output("Fffuuck come ooonnn, Rushers like being milked! And we like milking you! Fine, fine, I guess you need some encouragement!");
				else output("Can you even see how horny I am already? This could be you, if you’d let me milk you! C’monc’mon let’s just skip to that part!");
			}
			if(!this.hasStatusEffect("EroGassy")) this.createStatusEffect("EroGassy");
			output("”</i> Agile fingers work the knob on the back while you consider the merits of responding to her call out. Before you can blink, the zaika hops forward and levies her chunky weapon at chest-height, tightening the trigger. A cloud of plum-pink mist channels down the barrel and hisses in your direction; the diffusive discharge swirls in your vicinity - there’s no dodging it!");

			// Resist
			if(rand(20) + target.willpower()/2 >= this.intelligence()/2 + 10)
			{
				//Fenoxo stuff.
				output("\n\nNo matter how the chemical’s tendrils may speed your heartbeat, at the end of the day your mind is in charge of your body - not the other way around");
				var damage:TypeCollection = new TypeCollection( { drug: 10 + rand(2) } );
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				//Still in it to win it.
				if (damageResult.lustDamage + target.lust() < target.lustMax())
				{
					
					output(", and it’ll take more than some cheap drug to change that. You grit your teeth, a bit more excited, yes, but nowhere near as much as your foe would expect. When the fog clears, she’s stamping her foot in frustration. <i>“");
					//Will speach:
					//titsSmall:
					if(breastRows[0].breastRatingRaw == 2) output("Jerk! That stuff's expensive! The least you could do is cum" + (!target.isCrotchExposed() ? " in your pants":" for me") + "!");
					//titsMed: 
					else if(breastRows[0].breastRatingRaw == 8) output("Playing hard to get? That's hot too! It'll feel even better when you're begging me for a milking soon!");
					//titsBig:
					else output("Oh-hohoho, you're just a bag of tricks aren't you? Don't worry, I've got plenty of that stuff in the tank! You won't hold out for long, and you'll be giving me all that delicious milk soon!");
					output("”</i>");
					outputDamage(damageResult);
				}
				//Lost even with taking 1/3 damage.
				else
				{
					output("... yet there’s something intriguing about the surging warmth, ebbing away at your self-control. Your iron will is of so little avail when you’re this turned on!");
					outputDamage(damageResult);
				}
			}
			else
			{
				//100% william
				output("\n\nBefore you can think to cover your mouth, the erotic concoction slithers into your nostrils and clings to the roof of your mouth. Radiant arousal blooms inside and your mind wanders. The miasma begins to disperse, but not before your drooly gasps have left you chemically impassioned.");
				if(target.hasGenitals())
				{
					output(" Fresh lubricants spill" + (!target.isCrotchExposedByLowerUndergarment() ? " into your undies, a sticky marinade that signals to her your softening attitude and increasing desire to comply":" onto the jagged pavement, earning a few words of mocking contempt from boisterous onlookers. Even they want to see you submit") + ". <i>“");
					//titsSmall:
					if(breastRows[0].breastRatingRaw == 2) output("Come on, know your place, off-worlder! I need that milk!");
					else if(breastRows[0].breastRatingRaw == 8) output("Ooooh, I like that look! C'mon cutie-pie, let's see you on " + (target.hasKnees() ? "your knees":"the ground") + " now! Or do you need more?");
					else output("Mmmfhmhm... looks like you wanna be milked now. Right? Right? C'mon, just sit down, let me have all your milk, and I'll give you something nice and sticky in return!");
					output("”</i>");
				}
				applyDamage(new TypeCollection( { drug: 30 } ), this, target, "minimal");
			}
		}

		//Disarmed: hidden shock gun - actually good since it swaps the target health pool she's hitting from lust -> HP.
		public function hiddenShockGunAttk(target:Creature):void
		{
			if(!hasStatusEffect("ShockyZappy"))
			{
				this.createStatusEffect("ShockyZappy");
				output((this.isDisarmed() ? "Her milker-gun may be on the ground behind her, but t":"T") + "he rogue grins as cockily as ever. Her right wrist suddenly breaks apart into pieces - fingers and fold away as the mass of her hand splits apart to reveal the gleaming metal coils of a lightning gun!");
				if(rangedCombatMiss(this, target)) output(" You dodge the crackling blast!");
				else 
				{
					if(this.hasFlightEffects()) applyDamage(new TypeCollection( { electric: 60 } ), this, target, "minimal");
					else applyDamage(new TypeCollection( { electric: 35 } ), this, target, "minimal");
				}
			}
			else
			{
				output("The milk thief’s hidden lightning gun emerges from her wrist once more, blasting another arc of searing electricity in your direction!");
				if(rangedCombatMiss(this, target)) output(" You dodge!");
				else 
				{
					if(this.hasFlightEffects()) applyDamage(new TypeCollection( { electric: 60 } ), this, target, "minimal");
					else applyDamage(new TypeCollection( { electric: 35 } ), this, target, "minimal");
				}
			}
		}
		//Disarmed: fingerknife - similar to shock gun. Doesn't need much writing. (Can't use if leaped)
		public function fingerKnifeAttk(target:Creature):void
		{
			if(!hasStatusEffect("KnifySpoony"))
			{
				this.createStatusEffect("KnifySpoony");
				output("<i>“I really didn’t want to hurt you,”</i> the zaika explains, advancing" + (this.isDisarmed() ? " without her weapon":"") + ". <i>“But if I have to, I’ll cut a bitch.”</i> A glimmering, 3-inch blade emerges from the tip of her finger, and she swipes it at you!");
				if(combatMiss(this, target)) output(" You sidestep the short-ranged attack.");
				else applyDamage(new TypeCollection( { kinetic: 35 } ), this, target, "minimal");
			}
			//Repeat
			else
			{
				output("The milk-thief swipes at you with her razor-sharp finger-knife!");
				if(combatMiss(this, target)) output(" You dodge!");
				else applyDamage(new TypeCollection( { kinetic: 35 } ), this, target, "minimal");
			}
		}
		//Leap - Gives her the "flying" effect for 3 turns, preventing melee abilities. (Used if she takes a melee hit)
		public function leapAttkGo(target:Creature):void
		{
			if(!this.hasFlightEffects())
			{
				this.energy(-10);
				//create status and timer status!
				this.createStatusEffect("LeapCD",3,0,0,0);
				output("<i>“Ugh. Bruisers are such a pain to fight.”</i> The milk thief stumbles back and crouches. A high-pitched, electro-static hum fills the air, and she launches into the sky with a pavement-shattering ‘whump’. <b>Landing melee strikes on such a target is virtually impossible!</b>");
				createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);
			}
			//Landing
			else
			{
				//Clear it out to reset the proc.
				this.removeStatusEffect("MeleeHit");
				this.removeStatusEffect("LeapCD");
				this.removeStatusEffect("Flying");
				//remove status.
				output("The zaika hits the ground almost exactly where she took off without any apparent ill effects, save for shattering a second set of spiderwebbed lines into the pavement. <i>“Still fighting? Fine. I can do this all day.”</i>");
				//She's got america's ass!
			}
		}
		//Flash (only if HP below 2/3s) - effectively a flash grenade, though it's her bodystrips doing the work. 33 energy.
		public function flashyBoiToy(target:Creature):void
		{
			output("<i>“Can’t hit what you can’t see!”</i> The glowing strips on the milk thief’s body flicker, flashing into a supernova of searing light!");
			if(target.reflexes()/2 + rand(20) + 1 >= this.intelligence()/2 + 10) output(" You barely shield your eyes in time!");
			else
			{
				output(" <b>You are blind!</b>");
				CombatAttacks.applyBlind(target, 3);
			}
			this.energy(-33);
		}
		//Combat Stims - Heals all HP, 1x/combat, +10 lust. (10 energy)
		public function combatStimsAttk(target:Creature):void
		{
			this.createStatusEffect("Stimmypooed");
			output("<i>“F-f-fucking... making me use my expensive stims,”</i> the milk thief grumbles as her eyes cycle through a half dozen colors. She blinks, and a second later her stance relaxes as her wounds knit closed like magic. Behind her, the rogue’s tail raises high, infused with energy and lust. It twitches hungrily, like a predator on the prowl. <i>“Goddamn waste,”</i> she mumbles, squirming slightly. <i>“I’ll just steal even more of your milk!”</i>");
			this.changeLust(10);
			this.changeHP(this.HPMax());
			//output("(<b>+" + healing + " HP</b>)");
			//applyDamage(new TypeCollection( { drug: 19 } ), this, target, "minimal");
		}
		//Antistun (only on 2nd stun turn) (10 energy)
		//if this.isStunned
		//Clear StunClearBois if not stunned in AI.
		public function secondTurnStunCancel(target:Creature):void
		{
			if(!this.hasStatusEffect("StunClearBois")) 
			{
				this.createStatusEffect("StunClearBois");
				output("<b>The milk thief cannot act!</b>");
			}
			else
			{
				output("The milk-thief’s eyes cycle through a few different colors, and she suddenly <b>recovers from being stunned!</b> <i>“Dirty xeno tricks don’t work on me!”</i>");
				this.removeStatusEffect("Stunned");
				this.removeStatusEffect("Paralyzed");
				this.removeStatusEffect("StunClearBois");
			}
		}
	}
}
