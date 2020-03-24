package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Whip;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class KQDoctorIllustriaPo extends Creature
	{
		//constructor
		public function KQDoctorIllustriaPo()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Doctor Po";
			this.originalRace = "Cyborg";
			this.a = "";
			this.capitalA = "";
			this.long = "Illustria is more machine than woman. Despite her softened, artificial skin, her dermis sports clearly demarcated joints with reinforcement pins that look hard enough to use as military armor. Her breasts and sides house transparent windows. Mysterious fluids swirl behind them, ready to be dispensed into into her victim’s bodies. Rich blonde hair wreathes her flawless features and serves to conceal the antennae-like attachments she has instead of ears. Everything about this eight foot tall mad doctor seems designed to heighten her sex appeal, display her apparent knowledge, or intimidate those foolish enough to oppose her.";
			this.customBlock = "";
			this.customDodge = "She seems to start moving out of the way before you even launch the attack. Drat!";
			this.isPlural = false;
			
			this.armor.longName = "hyper-durable skin";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;

			//Built tough for rugged fukkin'
			baseHPResistances.electric.damageValue = 50.0;
			//Naked folks suck at handling cold...
			baseHPResistances.freezing.damageValue = -50.0;
			//Immune to drugs
			baseHPResistances.drug.damageValue = 100.0;
			//Lil bit tease/pheromone vuln
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			
			this.shield = new JoyCoPremiumShield();
			this.shield.shields = 300;
			this.shield.hasRandomProperties = true;

			this.meleeWeapon = new Whip();

			this.physiqueRaw = 50;
			this.reflexesRaw = 50;
			this.aimRaw = 35;
			this.intelligenceRaw = 60;
			this.willpowerRaw = 40;
			this.libidoRaw = 150;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 50;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 250;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.hairType = GLOBAL.TYPE_HUMAN;
			//this.scaleColor = "blue";
			//this.furColor = "PLACEHOLDER";
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.lipMod = 1;

			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			
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
			this.legCount = 2;
			this.cocks = new Array();

			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].bonusCapacity = 600;
			this.vaginas[0].vaginaColor = "chrome";
			this.vaginas[0].type = GLOBAL.TYPE_HUMAN;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 18;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 24;
			this.timesCum = 31113;

			this.elasticity = 2;
			this.fertilityRaw = 1.05;
			this.clitLength = .3;
			this.pregnancyMultiplierRaw = 1;
			
			//this.impregnationType = "BoredJumperPregnancy";

			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 115;
			
			isUniqueInFight = true;
			btnTargetText = "Dr.Po";
			//this.impregnationType = "LapinaraPregnancy";
			//kGAMECLASS.zhengShiSSTDChance(this);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, sexualPreferences.getRandomLikesFactor());
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS, sexualPreferences.getRandomDislikeFactor());
			//this.createPerk("Appearance Enabled");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Inhuman Desire",250);

			this.tallness = 8*12+1;
			this.thickness = 50;
			this.tone = 66;
			this.lipColor = "blue";
			this.eyeColor = "black";
			this.furColor = "blue";
			this.hairColor = "blonde";
			this.hairLength = 20;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "cyan";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			this.armType = GLOBAL.TYPE_HUMAN;
			this.armFlags = [];
			//"She’s wearing nothing but a confident smile on her pouty pink lips that doesn’t reach her shining blue eyes, her overfull breasts large and proudly exposed to you in her nakedness. Tiny trickles of white milk run down her light pink skin with every move she makes, a seriously oversized human cock swaying from side to side between her legs as she decides on her next course of action. Underneath it rests her balls, heavy and plump.\n\nDespite her soft, womanly features and skin her exterior looks hard enough to resist some damage - not to mention there are odd lines all over her, perhaps detailing hidden compartments. There’s almost no telling what she’ll do next but it’s a good bet she’s aiming to subdue you with sex!";	
			this.breastRows[0].breastRatingRaw = 11;
			
			this.balls = 0;
			this.earType = GLOBAL.TYPE_SYNTHETIC;
			this.earFlags = [];
			this.tailCount = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailFlags = [];
			this.antennae = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_HEELS];
			this.buttRatingRaw = 8;
			this.hipRatingRaw = 6;
			this.nippleColor = "transparent";
			credits = 16969;
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ILLUSTRIA_PO";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			var choices:Array = [];

			//Needlefingers
			choices.push(needlefingers);
			//Fingerfuck (exposed crotches only)
			/*
			if(target.isCrotchExposedByArmor())
			{
				if(target.hasVagina()) choices.push(fingerfuckAttack);
				if(target.hasCock()) choices.push(jerkyStrokeyBoiAttack);
			}
			//Ditzistrobe (very low lust damage and halves int. Willpower to resist)
			if(!target.hasStatusEffect("Ditzy Strobed")) choices.push(ditzystrobe);
			//Stumblestrobe (very low lust damage and halves reflexes. Will to resist)
			if(!target.hasStatusEffect("Stumble Strobed")) choices.push(stumblestrobe)
			//Stunstrobe (very low lust damage and low stun chance. every 5th round)
			if(!target.hasStatusEffect("Stun") && !target.hasStatusEffect("Stunned") && this.energy() < 100) choices.push(stunStrobe);
			//Aphrospray (Uses 33% energy. Unavoidable low lust damage)
			if(this.energy() >= 33) choices.push(aphrospray);
			//Recharge (Refills her inner goo. refills energy. Only happens if PC stunned and below 100%)
			if((target.hasStatusEffect("Stun") || target.hasStatusEffect("Stunned")) && this.energy() < 100) choices.push(rechargeDatBot);
			*/

			//Illustria acts
			choices[rand(choices.length)](target);
			//Sidekick abilities:
			if(!this.hasStatusEffect("no drone"))
			{
				if(this.shields() <= 0)
				{
					output("\n\n");
					botfall(target);
					return;
				}
				choices = [];
				output("\n\n");
				//Stripperbot (removes armor, then undies on next attack) (requires shields)
				if(!target.isCrotchExposed()) choices.push(stripperBotAttack);
				//Aphrobot (injects with druuuugs) (requires bossshields)
				//choices.push(aphroSting);
				//Idlebot (every third round attempts to tidy the lab)
				choices.push(idleBot);
				//Bot acts
				choices[rand(choices.length)](target);
			}
			
		}
		//Needlefingers
		public function needlefingers(target:Creature):void
		{
			output("Doctor Po reaches out to caress you with her fingertips");
			if(combatMiss(this,target)) output(", but you skillfully avoid them!");
			else
			{
				output(", but when they touch you, they fill you with prickling warmth. As she retreats, you see gleaming steal needles painlessly retracting into the tips of her digits. Whatever she drugged you with feels good...");
				//applyDamage(new TypeCollection( { drug: 12+rand(3) } ), this, target, "minimal");
			}
		}
		//Fingerfuck (exposed crotches only)
		public function fingerfuckAttack(target:Creature):void
		{
			output("Taking advantage of your exposed state, Illustria prances close, trying to pull you into a hug.");
			if(combatMiss(this,target)) output(" You barely dodge her!");
			else
			{
				output(" She’s too fast to avoid, and before you know it, you’re clutched in her grasp, feeling her fingers plumbing the depths of your [pc.vagina]. Everywhere they touch feels warm, and sensitive, and oh so very <b>right</b>.");
				applyDamage(new TypeCollection( { tease: 9+rand(2) } ), this, target, "minimal");
			}
		}
		//Stroke (exposed cocks only)
		public function jerkyStrokeyBoiAttack(target:Creature):void
		{
			output("Illustria Po prowls forward like a cat on the hunt");
			if(combatMiss(this,target)) output(", but you manage to keep her at bay by circling a bank of heavy lab equipment.");
			else
			{
				output(", and in the tight confines of her lab, you can’t avoid her! She grabs you by the [pc.cock] firmly, her palm instantly slick and wet with lubricant. You can’t help but firm up for her, can’t resist the way her milks like a New Texan bull.");
				applyDamage(new TypeCollection( { tease: 9+rand(2) } ), this, target, "minimal");
				if(target.lust()/target.lustMax() >= 0.8) output(" Much more of this and you’ll be putty in her hands!");
			}
		}
		//Ditzistrobe (very low lust damage and halves int. Willpower to resist)
		public function ditzystrobe(target:Creature):void
		{
			output("<i>“It’s perfectly alright to feel a bit ditzy, 66,”</i> Doctor Po coos as her eyes strobe wildly, blasting out every color of the rainbow in randomized sequence, interspersed with hues that defy explanation.");
			if(target.willpower()/2 + rand(20) + 1 >= 30) output("\n\nYou shake off whatever she just tried to do with a grunt.");
			else
			{
				output(" The longer you stare, <b>the harder it is to think</b>. Your brain feels scrambled and raw, but a little horny too...");
				target.createStatusEffect("Ditzy Strobed", 0, 0, 0, 0, false, "Icon_Confused", "Your intelligence is halved until the end of combat!", true, 0);
			}
			applyDamage(new TypeCollection( { psionic: 4+rand(2) } ), this, target, "minimal");
		}
		//Stumblestrobe (very low lust damage and halves reflexes. Will to resist)
		public function stumblestrobe(target:Creature):void
		{
			output("<i>“Do be careful not to trip over my equipment, 66,”</i> Doctor Po advises as a searingly bright light blasts out of her eyes!");
			if(target.willpower()/2 + rand(20) + 1 >= 30) output("\n\nYou manage to force your eyes closed before it can do much more than warm your loins.");
			else
			{
				output(" Strangely, the flash of light feels like it goes on for a solid ten or fifteen seconds. By the time you’re able to see again, you’re kind of woozy. <b>It’s hard to move around as quickly as before</b> - like your limbs are dragging through a vat of pussy-scented molasses.");
				target.createStatusEffect("Stumble Strobed", 0, 0, 0, 0, false, "Icon_Constricted", "Your reflexes are halved until the end of combat!", true, 0);
			}
			applyDamage(new TypeCollection( { psionic: 4+rand(2) } ), this, target, "minimal");
		}
		//Stunstrobe (very low lust damage and low stun chance. every 5th round)
		public function stunStrobe(target:Creature):void
		{
			output("Illustria says, <i>“Hey... [pc.name]?”</i>");
			//Int to resist :3
			if(target.intelligence()/2 + rand(20) + 1 >= 32)
			{
				output("\n\nSomething about the way she’s standing gives away what’s coming, and you raise a hand to shield your eyes as her face lights up like a dick-sucking flashbang.");
			}
			else
			{
				output("\n\nYou momentarily drop your guard to answer, <i>“Yeah?”</i>");
				output("\n\n<i>“Surprise!”</i> she screams as her eyes light up like camera flashbulbs. <b>You’re stunned</b>, both literally and figuratively, by the ocular radiation.");
				CombatAttacks.applyStun(target,1);
				applyDamage(new TypeCollection( { psionic: 1+rand(2) } ), this, target, "minimal");
			}
		}
		//Aphrospray (Uses 33% energy. Unavoidable low lust damage)
		public function aphrospray(target:Creature):void
		{
			output("Illustria reaches behind herself and plugs a wall-mounted tube into something at the base of her spine.");
			if(this.energy() >= 100) output("\n\nOne third of her internal fluids drain away.");
			else if(this.energy() >= 67) output("\n\nThe second third of her internal fluids drains into the wall.");
			else output("\n\nThe final dregs of her internal fluids drain away.");
			if(this.energy() >= 100) 
			{
				output("\n\n<i>“I hope you’re thirsty.”</i> Fire extinguishing devices emerge from the ceiling and spray the room down with her pink, drugged fluids. There’s no hiding from it");
				if(target.hasAirtightSuit()) output(", but at least you have an airtight suit to protect you from it.");
				else output(". It drenches you, soaking into your skin. It’s not just muggy in here, but warm too. Humid. You wonder how your own sweaty form would feel against Illustria’s sculpted perfection...");
			}
			else 
			{
				output("\n\n<i>“Bathe in perfection.”</i> ");
				if(!target.hasAirtightSuit()) output("Like you have any other choice but to let it splatter across your skin and make you feel horny, and silly, and sooo fuckable.");
				else output("Like it even matters. Safe in your airtight armor, you don’t have to worry about her exotic contact poisons.");
			}
			this.energy(-33);
			if(!target.hasAirtightSuit()) applyDamage(new TypeCollection( { drug: 15+rand(3) } ), this, target, "minimal");
		}
		//Recharge (Refills her inner goo. refills energy. Only happens if PC stunned and below 100%)
		public function rechargeDatBot(target:Creature):void
		{
			output("Illustria coos and plugs another hose into herself, refilling her reserves from a hidden reservoir.");
			this.energy(110);
		}
		//Sidekick abilities:
		//Stripperbot (removes armor, then undies on next attack) (requires shields)
		public function stripperBotAttack(target:Creature):void
		{
			if(!target.isCrotchExposedByArmor())
			{
				output("While you’re focused on Illustria, her floating assistant strikes, its dangling tentacle splitting into fifty different manipulators, peeling you out of your [pc.armor] in a flash!");
				if(!target.isCrotchExposedByLowerUndergarment()) output(" At least your [pc.lowerUndergarment] keeps you decent.");
				else output(" <b>You’re exposed!</b>");
				//this.inventory.push(target.armor);
				//target.armor = new EmptySlot();
				if(target is PlayerCharacter) (target as PlayerCharacter).takeArmor();
			}
			else if(!target.isCrotchExposedByLowerUndergarment())
			{
				output("The floating drone scoops in and drags down your [pc.lowerUndergarment] a flash. Hey! <b>You’re exposed!</b>");
				//this.inventory.push(target.lowerUndergarment);
				//target.lowerUndergarment = new EmptySlot();
				if(target is PlayerCharacter) (target as PlayerCharacter).takeLowerUndergarment();
			}
		}
		//Aphrobot (injects with druuuugs) (requires bossshields)
		public function aphroSting(target:Creature):void
		{
			if(rand(3) == 0) output("A pinch at the back of your neck is all the warning you get before Illustria’s tits start to look really good.");
			else if(rand(2) == 0) output("Illustria’s drone stings its tendril into your [pc.butt], leaving you flushed with warmth and increasingly perverse thoughts.");
			else output("Pain in your thigh earns your attention in time to see Illustria’s drone pulling out its needle-like appendage and fleeing to the safe recesses of Illustria’s shields, but looking at her is a mistake. She’s so hot, just like the flesh around the injection site. Maybe after you win she’ll want to fuck.");
			applyDamage(new TypeCollection( { drug: 1+rand(3) } ), this, target, "minimal");
		}
		//Idlebot (every third round attempts to tidy the lab)
		public function idleBot(target:Creature):void
		{
			output("Illustria’s drone perches cutely on her shoulder, watching you.");
		}
		//Botfall (0 shields - bot is defeat)
		//"no drone" status gib.
		public function botfall(target:Creature):void
		{
			output("With her shields cracked, Illustria’s drone wobbles. It falls to the ground as its capacitors empty, powerless.");
			this.createStatusEffect("no drone");
		}
	}
}
