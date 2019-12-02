package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Protection.ProtoShield;
	import classes.Items.Transformatives.Illumorphene;
	import classes.Items.Guns.SlutRay;
	import classes.Items.Miscellaneous.MaikesKeycard;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.GLOBAL;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;

	/**
	 * ...
	 * @author Fenoxo, based on @Gedan's Taivra
	 */
	
	public class Maike extends Creature
	{
		
		public function Maike() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Overseer Maike";
			this.originalRace = "cylirian";
			this.a = "";
			this.capitalA = "";
			this.tallness = 12*6+7;
			this.scaleColor = "pale green";
			
			this.long = "";
			
			this.isPlural = false;
			
			this.shield = new ProtoShield();
			this.shield.shields = 300;
			this.shield.hasRandomProperties = true;

			this.meleeWeapon = new SlutRay();
			this.meleeWeapon.baseDamage.psionic.damageValue = -3;
			this.meleeWeapon.attackVerb = "whip";
			this.meleeWeapon.attackNoun = "psi-whip";
			this.meleeWeapon.longName = "psi-whip";
			this.meleeWeapon.description = "a psi-whip";
			this.meleeWeapon.type = GLOBAL.MELEE_WEAPON;
			this.meleeWeapon.hasRandomProperties = true;

			//Armored corset
			this.armor.longName = "armored corset";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;

			//Double barreled hand cannon
			//Whip?

			this.physiqueRaw = 40;
			this.reflexesRaw = 37;
			this.aimRaw = 34;
			this.intelligenceRaw = 35;
			this.willpowerRaw = 40;
			this.libidoRaw = 80;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.drug.damageValue = 75.0;
			baseHPResistances.corrosive.damageValue = 75.0;
			baseHPResistances.poison.damageValue = 75.0;
			baseHPResistances.electric.damageValue = 33.0;
			baseHPResistances.burning.damageValue = 33.0;
			baseHPResistances.tease.damageValue = -15.0;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 450;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			

			this.femininity = 100;
			// Fen: too lazy to do all this. She has no scenes that call parsers. Sue me!
			this.eyeType = 0;
			this.eyeColor = "orange";
			this.thickness = 25;
			this.tone = 70;
			this.hairColor = "silver";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_MOTHRINE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_SYLVAN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_DEMONIC;
			this.armType = GLOBAL.TYPE_MOTHRINE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_MOTHRINE;
			this.legType = GLOBAL.TYPE_MOTHRINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_COCKVINE;
			this.tailCount = 1;
			this.tailFlags = [];
			
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
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			/*
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 9000;
			*/
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 7;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			//This exists mostly so that I can just use enemy.cockVolume(0) and such with ease.
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_HUMAN;
			(this.cocks[0] as CockClass).cLengthRaw = 9;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			
			createStatusEffect("Force Fem Gender");
			
			createPerk("Fixed CumQ",20000,0,0,0);
			createPerk("Inhuman Desire",25,0,0,0);
			createPerk("Agility",0,0,0,0);
			createPerk("Improved Agility",0,0,0,0);
			createPerk("Juggernaut",0,0,0,0);
			
			createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Maike";
			
			//Tease Stats
			//Likes - Small Male Endowments, Feminine Faces, Big Hips, Big Butts, Small Balls, Flat Chests, Long Hair, Chitin
			//Really Likes - Tail vaginas
			//Really Dislikes - BIG_MALEBITS, BIG_BREASTS, small breasts, PUSSIES, NARROW_HIPS, BALDNESS, NEUTER, HYPER, exotic bodyshape
				
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS,			GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CHITIN,		GLOBAL.KINDA_LIKES_SEXPREF);

			sexualPreferences.setPref(GLOBAL.SEXPREF_TAILGENITALS,		GLOBAL.REALLY_LIKES_SEXPREF);

			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_PUSSIES,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALDNESS,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE,	GLOBAL.REALLY_DISLIKES_SEXPREF);
			
			inventory.push(new Illumorphene());
			//inventory.push(new MaikesKeycard());
			//Replaced it with a key item.
			
			updateMaikeLong();
			
			this._isLoading = false;
		}
		private function updateMaikeLong():void
		{
			var buffer:String = "";
			//ifInTheRaftersTriggered: 
			if(this.hasStatusEffect("Flying")) buffer += "Jumping and flying from every crevice and cranny";
			else buffer += "Hovering in the open space";
			buffer += " of the pit is the shadow-casting form of Overseer Maike, the head slaver of the mines and general queen bee. Or demon-moth-scorpion, whichever.";

			buffer += "\n\nWith her wings at a full, rapid pelt to keep her afloat, you’re forced to fight her from the ground. She wields a double-barrelled hand-cannon that fires grapples for rapid descent and in the other hand, a coiled up energy whip that glows with sickly purple energy. Her armor is more ornate than protective but you notice the thin wobble in the air around her body that denotes a pretty robust shield array. All around, flood lights follow your actions in the natural gloom of the pit, somehow turning this all into an improvised gladiatorial showdown.\n\nEven from this spot several feet below, you can still make out her blazing orange glare that focuses right on you.";

			var HQ:Number = this.HP()/this.HPMax() * 100;

			if(HQ >= 75) buffer += "\n\nFrom what you can see, she’s in full fighting form.";
			//Maike33-74%HP:
			else if(HQ >= 33) buffer += "\n\nHer flight patterns are less sure and more erratic as the fight takes its toll on her.";
			///Maike1-32%HP:
			else buffer += "\n\nThere’s a tremble and a wobble in every movement that the Overseer makes, and you’re sure that all the damage you’ve poured in is bringing down her resolve.";

			//MaikeLust0-25:
			if(lust() <= 35) buffer += " Despite her overtly playful and sexually charged countenance, she seems laser-focused on taking you down.";
			//MaikeLust26-74:
			else if(lust() < 60) buffer += " It’s clear that all this sexual warfare is having an affect on her concentration, especially where her writhing tail-cock is concerned as its petal-plates jitter open randomly.";
			//maikeLust75-99:
			else buffer += " You notice that the Overseers concentration is faltering: she can’t stop looking at your assets and can’t stop touching up hers!";
			this.long = buffer;
		}
		override public function get bustDisplay():String
		{
			return "MAIKE";
		}

		private var _roundCount:int = 0;

		//Combat Routine/Maike
		//AUTHORS NOTES:
		//Maike has a variety of skills that do several things, some designed to expose her weakness that players can exploit. Following the brief, her main focus is victory through lust damage and she exclusively deals lust damage, status effects and a variety of disabling effects. Gains new skills when her shields lower/lust raises. The player will need all forms of skills at their disposal: damage, skills and lust attacks. Lust attacks are most effective but can only be exploited when she uses certain skills on you. Damage only goes so far: high evasion, her shields can regenerate and she will always have a mean advantage vs melee PC’s. But damage comes into play when she prepares powerful attacks as it’s then that the PC can use her closeness for a turn and do... stuff to her I guess. Anyway, her lust damage is potent and will quickly overwhelm generic attack spammers or tech-power spammers.

		//FEN'S NOTES: There's wayyyyy too many things going on with this. Mostly gonna be reworked or ignored. It isn't a bug if it doesn't follow this plan.

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			_roundCount++;
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			//Maike grappling reactions!
			if(target.hasStatusEffect("Grappled"))
			{
				if(target.hasStatusEffect("MaikeStruggled")) 
				{
					maikeStruggleReaction(target);
					target.removeStatusEffect("MaikeStruggled")
				}
				else 
				{
					maikeDoNothingReaction(target);
					
				}
			}
			//Get grappled!
			else if(_roundCount % 5 == 0 && energy() >= 25) eroticCoilAttack(target);
			//Go for a fly once beat up.
			else if(this.HP() < 250 && !this.hasStatusEffect("Flying")) raftersBiiiiiiitches(target);
			//Toss gas nade when shields break!
			else if(this.shields() <= 0 && !this.hasStatusEffect("Used Gas Nade") && this.energy() >= 25) maikeHasSexyGas(target);
			//High lust variant attacks
			else if(this.lust() >= 60 && rand(2) == 0) juicySquirtAttacks(target);
			else if(rand(2) == 0) flybyWhipAttack(target);
			else longDrLash(target);
			
			updateMaikeLong();
		}
		/*)
		output("\n\nYou Call Those Nades?");
		output("\n\n//Passive. Maike is immune to grenade powers. Cuz she flies.");
		output("\n\n//ifPcUsesAGrenadePower: However, the grenade{s} merely plink around the ground before exploding... oh duh, she’s flying!");
		*/
		//Flyby Whip
		//Basic attack, 3 hits for 13 lust damage each, high accuracy. Ready from start of fight. Removes 50% melee evasion but adds 20% ranged evasion to/from Maike for the next turn.
		public function flybyWhipAttack(target:Creature):void
		{
			output("The Overseer dives right for you in a graceful corkscrew maneuver, whip trailing in a spiral of purple energy! It only takes seconds for her to reach!");
			var tempy:Number = this.meleeWeapon.baseDamage.psionic.damageValue;
			this.meleeWeapon.baseDamage.psionic.damageValue = -10;
			for(var x:int = 0; x < 3; x++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this,target,true,"melee")
			}
			this.meleeWeapon.baseDamage.psionic.damageValue = tempy;
		}
		//Long Lash
		public function longDrLash(target:Creature):void
		{
			//Secondary attack, 1 hit for 30 lust damage, mid-high accuracy. Ready from start of fight. No change to evasion.
			output("<i>“Taste this!”</i> cries the Overseer as she aims her next whip strike at you! It snaps in the air at sonic speeds!");
			//Miss: The attack comes short of hitting you and the slaver growls in anger!
			if(combatMiss(this, target)) output("\nThe attack comes short of hitting you, and the slaver growls in anger!")
			else
			{
				output("\nThe whip crackles against you with nerve-agitating energy, sending flushes and frissons all throughout your body!");
				applyDamage(meleeDamage(), this, target, "minimal");
			}
		}
		//Erotic-Coil
		//Special attack, used infrequently, always hits, inflicts RESTRAINED. Ready from start of fight. Deals 7 lust damage to PC and 5 lust damage to Maike every time player presses [Struggle]. Pressing [Do Nothing] instantly stops RESTRAINED and deals 10 lust damage to PC. Removes 15% melee evasion and 10% ranged evasion from Maike for the next turn.
		public function eroticCoilAttack(target:Creature):void
		{
			this.energy(-25);
			output("<i>“All fail a trial by whip!”</i>");
			output("\n\nOn those words, the hovering slaver darts to your side and swings her whip wildly at your middle! <b>You’re ensnared by the thick energy rope!</b>");
			if(kGAMECLASS.flags["TIVF_MAIKE_TALK"] == 1) output(" What did the bee boy say... she <i>likes</i> a struggle?!");
			target.createStatusEffect("Grappled", 0, 65, 0, 0, false, "Constrict", "The ganrael has wrapped itself tight around you!", true, 0);
		}
		//If has this status "MaikeStruggled"
		public function maikeStruggleReaction(target:Creature):void
		{
			output("<i>“Ahaha, yes, yes! Squirm away, my little fly!”</i> swoons the Overseer as she charges her whip with nervous energy! Your body can’t help but shiver in the whip’s coils!");
			applyDamage(meleeDamage(), this, target, "minimal");
		}
		public function maikeDoNothingReaction(target:Creature):void
		{
			output("<i>“What?? What is this?! You... you spineless wretch!!!”</i> screams the Overseer as she violently whips away the purple tendril, freeing you!");
			target.removeStatusEffect("Grappled");
		}
		//Sexy Gas ‘Nade
		//Special attack, used frequently, medium accuracy, inflicts BLINDED and deals 5 lust damage and 10 energy damage to the PC per turn. Lasts 4 turns or until blindness wears off/PC resists blind. No effect to Maike evasion. Ready to use after Maike loses 80 shields or reaches 35 lust.
		public function maikeHasSexyGas(target:Creature):void
		{
			this.energy(-25);
			output("<i>“Ordinance One, Single Dose!”</i> At those words, a small and unnervingly fast disc shoots out from a port in the Overseer’s shoulder armor and lands right at your feet! In a near instant, the ground fills up with cloying, thick pink gas!");
			//Damage.
			if(target.hasAirtightSuit())
			{
				output("\n<b>Good thing you’re safely inside an airtight suit.</b>");
			}
			else if(target.reflexes()/2 + rand(20)+1 >= this.aim()/2+10 && !target.isBlind())
			{
				output(" <b>You’re Blinded!</b>");
				applyDamage(new TypeCollection( { tease: 20 } ), this, target, "minimal");
				CombatAttacks.applyBlind(target, 2);
			}
			else
			{
				output(" Luckily, you’re able to jump away from the worst of it!");
				applyDamage(new TypeCollection( { tease: 13 } ), this, target, "minimal");
			}
			this.createStatusEffect("Used Gas Nade");
		}

		//Bolas Bolts
		//Special attack, used frequently, high accuracy, inflicts TRIPPED. Ready to use after Maike loses 80 shields or reaches 35 lust. No changes to evasion.
		/* Cut.
		output("\n\nThe fluttering moth-domme lines up her double-barrelled handcannon to your legs and fires a whistling, spinning pair of energy bolas!");
		output("\n\n//Hit: The projectile swiftly twists in the air and a rope of purple energy wraps around your [pc.legs], knocking you to the ground!");
		output("\n\n//Miss: The spinning pair of balls and energy swing past you and land with a jarring thud into the ground!");

		//Hologram Drone
		//Special attack, used rarely, always hits. Effectively creates a 150HP/0 shield/0 lust dummy of Maike that blocks the PC’s attacks until it’s destroyed. Just think of it as a summon that tanks attacks. Lasts until it’s destroyed. Destroying it restores 100 to Maike’s shields. Reduces Maike melee evasion by 40% and ranged evasion by 15% for the next turn. Ready to use after Maike loses 150 shields or reaches 50 lust.
		//<i>“Oh look who it is: me!”</i>

		With those words, two small drones pop out of the sides of her shoulder pads and follow her as she zooms in closer to you. The small drones shoot a bluish-white, hardlight projection that hovers in front of the Overseer: a perfect mirror of herself! Looks like you’ll have to take it down before reaching her!
		
		//projectionDestroyed: The bluish image of an aghast Overseer shatters into a thousand digital shards... but all that energy zips right back into her armor, fueling her shields! 

		Mind Fucker-upper
		//Special Attack, used rarely, always hits. Drains 40 energy from the PC and uses it to restore 100 shields to Maike. No change to Maike evasion. Ready to use after Maike loses all of her shields or reaches 60 lust.
		<i>“Slaves shall serve, remember?!”</i>

		The Overseer points her control rod right at you and twists it around in her palm! Your body slacks in balance and posture as your physical will falters, as if your vital energy was being stolen...! Through some perversion of psionic science, the Overseer’s shields shimmer with renewal! Damnit!

		output("\n\nRidiculous Divebomb");
		output("\n\n//Special Attack, used infrequently, always hits, inflicts RESTRAINED and TRIPPED once RESTRAINED has worn off/been interrupted. PC gains 10 lust and Maike gains 5 lust every time [Struggle] is pressed. Pressing [Do Nothing] ends RESTRAINED and the PC gains 15 lust. PC ends the fight with Pussy Juice Covered status effect. Ready to use after Maike loses 170 shields or reaches 60 lust. Reduces Maike melee evasion by 60% and ranged evasion by 25% for the next turn.");
		output("\n\n<i>“I’ll take everything from you soon but for now, that useless mouth!”</i>");

		output("\n\nWuh?!");

		output("\n\nThe Overseer aims her double-barrelled handcannon at your feet and fires! As before, two metal prongs whistle through the hot air with an unnerving shriek and hammer into the ground around your feet. In seconds, the connective ropes of energy rapidly pull the slaver right to you feet-first! The claws shoot past your ears but you’re completely blindsided by a faceful of her barely-covered muff! <b>You’re pinned underneath!</b> {/pcFoundMaikeWeaknessWithTivf: What did the bee boy say... <i>likes</i> a struggle?!}");
		
		output("\n\n//Pressing[Struggle]: Well, better make use of this! With your [pc.face] pinned under the lust-driven body of the slaver, you rub your face against the thin thong that covers the slavers muff and lick at the squeezed-out labia that hug the sides!");

		output("\n\n<i>“Mmmhmmmyeesss, taste your new queen!”</i> wails the slaver as she grinds her muff against your head without a care!");
		output("\n\n//Pressing[DoNothing]: You keep your head turned to the ground, unwilling to play her lewd game!");

		output("\n\nDespite her insistent grinding, the Overseer quickly gives up!");

		output("\n\n<i>“Pathetic!”</i> is her terse jab and she boosts herself away from your prone form while leaving a parting whipcrack against your [pc.chest]!");
		output("\n\n//BreakingRESTRAINED: A surge of will hits you and you force the Overseer off of your body with a brutal slam! The flustered moth-woman quickly pushes herself away and hovers close to your proximity!");
		*/
		//A Juicy Squirt
		//Basic Attack, used frequently, replaces other two, high accuracy. Deals 35 lust damage to the PC and reduces Maike lust by 5. Reduces Maike melee evasion by 50% for the next turn. Ready to use after Maike reaches 65 lust. PC ends fight with Cum Covered status effect if hit.
		public function juicySquirtAttacks(target:Creature):void
		{
			output("The Overseer buzzes right up to your with a quick boost from her repulsors and her tail-plates spring open, right in your face! White seed squirts right at you!");
			//Miss: 
			if(rangedCombatMiss(this, target)) output("\nYou’re just about able to swing your head out of the way before a syrup squirt of her alien jizz flies out of the orchid-like organ!");
			else 
			{
				output("\nOh jeez, you’re covered in a thick squirt of her syrupy, buttery-sweet moth-cum! It’s so <i>dirty</i>!");
				applyDamage(new TypeCollection( { tease: 18 } ), this, target, "minimal");
				target.applyCumSoaked();
			}
		}
		//In The Rafters
		//Special move, used once per fight. Permanently increases Maike’s ranged evasion by 25% and adds 30% melee evasion for the next turn, restores 150 of her shields and reduces her lust by 40. Triggers as soon as Maike reaches 80 lust once or at the first time she takes HP damage once her shield has been depleted.
		public function raftersBiiiiiiitches(target:Creature):void
		{
			output("The Overseer flies up to a jutting rock some distance away and uses the cover and the shadows to hunker down. You can spy her here and there but landing a shot might be hard...");
			output("\n\nWith a new shimmer to her shield, she starts using the shadowed ceiling as cover while jumping erratically from spot to spot! <b>Melee attacks are out of the question while she’s flying that high!</b>");
			this.shields(this.shieldsMax());
			this.lust(-30);
			this.energy(45);
			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Cannot be struck by normal melee attacks!", true, 0);
		}
	}
}