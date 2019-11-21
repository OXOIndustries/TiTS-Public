package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Transformatives.ClearYu;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Guns.EagleHandgun;
	import classes.Items.Guns.LaserPistol;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;
	import classes.Items.Transformatives.NyreanCandy;
	
	import classes.GLOBAL;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Fenoxo - most non-combat stats are leftovers from @Gedan's Nyrea Alpha coding.
	 */
	
	public class Dollmaker extends Creature
	{
		
		public function Dollmaker() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Doll Maker";
			this.originalRace = "automaton";
			this.a = "the ";
			this.capitalA = "The ";
			this.scaleColor = "";
			
			this.long = "A spider-like cage of steel limbs blocks your path! This device seems to be a guard Doctor Badger set to keep intruders out of her secret lab. Dozens of armored arms spin in slow orbit around you, each one capped with strange implements, from syringes to padded cuffs, to swirling screens. Oddly, Badger gave the faceless thing quite a dirty mouth.\n\nIts nimble, spindly nature will make it difficult to hit with ranged weapons.";
			
			this.isPlural = false;
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 20;
			this.aimRaw = 25;
			this.intelligenceRaw = 35;
			this.willpowerRaw = 35;
			this.libidoRaw = 100;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 10;
			this.isLustImmune = true;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 30.0;
			baseHPResistances.electric.damageValue = -50.0;
			baseHPResistances.burning.damageValue = 50.0;
			baseHPResistances.tease.damageValue = 75.0;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.pheromone.damageValue = 75;
			baseHPResistances.poison.damageValue = 100.0;
			
			this.level = 8;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 550;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 132;
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
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
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_NYREA_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 999;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 30;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			this.cocks = [];
			/*this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 13;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.66;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;*/
			
			createStatusEffect("Force It Gender");
			//createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "DollMkr";
			
			//rangedWeapon = new (RandomInCollection(EagleHandgun, HammerPistol, LaserPistol))();
			
			/*
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.KINDA_LIKES_SEXPREF);(/)
			*/

			//Drops
			//================
			//5x ClearYu lollipops
			//Up to 4x Silicone bags (harvested)
			//Up to 10x Gush spraypens (harvested)
			//1x Damaged AI Chip (harvested)
			//var lollipops:ItemSlotClass = new ClearYu();
			//lollipops.quantity = 5;
			//inventory.push(lollipops);

			/*
			if (rand(40) == 0) inventory.push(new Kirkite());
			else if (rand(50) == 0) inventory.push(new Satyrite());
			else if (rand(20) == 0) inventory.push(new Picardine());
			else if (rand(20) == 0)	inventory.push(rangedWeapon.makeCopy());
			else if (rand(20) == 0) inventory.push(meleeWeapon.makeCopy());
			else if (rand(3) == 0) inventory.push(new RedMyrVenom());
			else if (rand(3) == 0) inventory.push(new NyreanCandy());
			*/
			this.createStatusEffect("Disarm Immune");
			createStatusEffect("Planted", 0, 0, 0, 0, false, "Icon_Constricted", "Firmly attached to the environment prevents being tripped or staggered.", true, 0);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "DOLLMAKER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];

			if(flags["DOLLMAKER_ATTACK_PATTERN"] == undefined || flags["DOLLMAKER_ATTACK_PATTERN"] == 1)
			{
				if(target.physique() > 1) attacks.push(bimboleumEmitter);
				if(target.reflexes() > 1) attacks.push(latexSprayed);
				if(target.willpower() > 1) attacks.push(mindwashVisorAttack);
				if(target.aim() > 1) attacks.push(brainmeltLamps);
				if(target.intelligence() > 1) attacks.push(iqBGoneInjector);
			}
			if(flags["DOLLMAKER_ATTACK_PATTERN"] == undefined)
			{
				if(statusEffectv1("musked") != 1) attacks.push(muskSprayAttack);
				if(!target.hasStatusEffect("Grappled")) attacks.push(restrainingCuffs);
			}
			if(flags["DOLLMAKER_ATTACK_PATTERN"] == undefined || flags["DOLLMAKER_ATTACK_PATTERN"] == 2 || attacks.length <= 0) attacks.push(biomagneticVibes);

			attacks[rand(attacks.length)](target);
		}

		//You’re fighting the Doll Maker.
		//A spider-like cage of steel limbs blocks your path! This device seems to be a guard Doctor Badger set to keep intruders out of her secret lab. Dozens of armored arms spin in slow orbit around you, each one capped with strange implements, from syringes to padded cuffs, to swirling screens. Oddly, Badger gave the faceless thing quite a dirty mouth.

		//
		//Shields: 0
		//HP: Super High (boss fight)
		//Lust: 0 {immune to lust damage}
		//Energy: 100
		//Level: 8
		//Race: Automaton
		//Sex: N/A
		//

		// range weapons have a low hit chance due to the small size of the limbs
		//Combat Attacks
		//Restraining Cuffs (legs/tail > arms > collar)
		public function restrainingCuffs(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("cuffs"))
			{
				output("Arms descend from the rig overhead, each equipped with a large, circular clamp. <i>“You know, Twat Throat, this whole thing would be a lot easier if you weren’t squirming all over the place,”</i> the Doll Maker complains. The cuffs lunge for you!");
				createStatusEffect("cuffs");
			}
			//Repeat
			else output("<i>“I promise I’ll be gentle,”</i> the machine urges, interrupting itself with a harsh <i>“ERROR! ‘Gentle’ sub-routine not found!”</i> More padded cuffs descend, trying to make an obedient little victim out of you!");
			//Miss
			if (combatMiss(this, target) && kGAMECLASS.flags["DOLLMAKER_FORCE_CUFFS"] == undefined) output("\n\nYou manage to evade the binding restraints, much to the robot’s disappointment. <i>“Oh come on. Won’t even let me cop a feel?”</i>");
			//First Hit - Lower Body
			else if(!target.hasStatusEffect("Restrained"))
			{
				if(target.isGoo()) output("\n\nThe padded cuffs pull aside to make way for a golden ring that snaps around your gooey lower body. Intense cold radiates from the binding, freezing your normally amorphous form into a brittle, stationary lump. You’ve been locked in place like a statue! There’ll be no running from this!");
				else if(target.isNaga()) output("\n\nAn especially large ring snaps around your midsection, while a slightly smaller one nabs your [pc.tail]. Despite your writhing attempts to slither out, the arms seem to have caught your lower body with inescapable tension. There’ll be no running from this!");
				if(target.legCount >= 3) output("\n\nA bevvy of cuffs wind their way around you, each clicking in place around all of our [pc.legs]. You lift and pull at each in turn, but you can’t seem to break their grip. There’ll be no running from this!");
				else output("\n\nTwo of the cuffs snap around your ankles, holding your [pc.legs] rooted to the ground. You struggle to no avail - the Doll Maker has you in its grasp. There’ll be no running from this!");
				// Increases the Doll Maker’s attack accuracy by 25%
				target.createStatusEffect("Restrained", 1, 0, 0, 0, false, "Icon_DefDown","Bound by lower body restraints, you are less capable of evading attacks!", true, 0);
			}
			//Second Hit - Neck
			else if(target.statusEffectv1("Restrained") == 1)
			{
				output("\n\nA large, belt-like loop swings around and manages to catch your neck. It cinches up and drags your head down to better expose your [pc.ass]. Your fingers scramble to free yourself, and in doing so you see that the make-shift collar has a name tag on it. Apparently you’re <i>“Doll In Training”</i> now. This is getting bad!");
				// Increases the Doll Maker’s attack accuracy by 25%
				target.addStatusValue("Restrained",1,1);
				target.setStatusTooltip("Restrained","Bound by lower body and neck restraints, you are less capable of evading attacks!");
			}
			//Third Hit - Arms
			else if(!target.hasStatusEffect("Grappled"))
			{
				output("\n\nMore cuffs find you, their padded interiors grasping your wrists as the locks slam into place. Your arms are dragged behind you, restraining any further struggles. You can’t do anything like this! You’re going to have to break free or it’ll all be over.");
				// Player is “Bound” and can only struggle to get free. Doll Maker’s attacks always hit while the player is bound.
				CombatAttacks.applyGrapple(target, 60, false, "The bindings are so tight that you are effectively grappled!");
			}
			// If caught, no escape!
			if(target.hasStatusEffect("Restrained")) createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
		}
		//Musk Spray
		public function muskSprayAttack(target:Creature):void
		{
			if(!hasStatusEffect("musked"))
			{
				output("The mechanical servos whirring around you part to make way for limb with a phallus shaped like Dr. Badger’s big, black cock. You lean back in disgust at the dildo, and the machine makes an irritated click. <i>“Oh, don’t be like that, Mongrel Bitch,”</i> the device remarks. <i>“Once you get a good taste of the musk, I promise you’ll like it.”</i> The dildo squeezes and a thick, heavily scented spray fills the air!");
				createStatusEffect("musked");
			}
			//Repeat
			else output("The musk-sprayer dildo swings back around for another go, discharging its odorous scent in a suffocating cloud! <i>“The Doctor is really quite proud of this one, you know,”</i> the Doll Maker confides.");
			//Miss
			if (rangedCombatMiss(this, target)) output("\n\nYou lurch to the side, avoiding the worst of the attack. Fanning the air rapidly, you try to disperse the rest, all while holding your breath. <i>“What a drama queen. You’re acting like I’m spraying acid at you or something,”</i> the machine chides.");
			//Immune to gas attacks
			else if(target.hasAirtightSuit())
			{
				output("\n\nThe musk settles in the air around you, but the protections in your [pc.armor] filter out the worst of it. <i>“Bringing a gas mask to a laboratory? You’re smarter than you look, Nut Stain.”</i>");
				// No longer uses this attack
				addStatusValue("musked",1,1);
			}
			//Hit
			else
			{
				output("\n\nYou try to turn away, but the smell of Badger’s musk is everywhere. Like biological gasoline, it worms its way through your nose and into your brain, the burning scent both seductive and offensive. Your body relaxes even as your mind rebels. You’ve got to get out of this before you surrender completely!");
				// player takes 15-20 lust damage
				var damage:TypeCollection = new TypeCollection( { pheromone: 15+rand(11) } );
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Bio-Magnetic Vibes
		public function biomagneticVibes(target:Creature):void
		{
			if(!hasStatusEffect("vibes"))
			{
				output("<i>“There is no need to be such an ice queen,”</i> the Doll Maker scolds, bringing a pair of arms to bear. They seem to be equipped with vaguely gun-like devices, but with barrels far too large for bullets. <i>“Just be cool, Cock Milker, and let me do my job. You’ll love these bio-magnetic vibes almost as much as you’ll love being nutted by strangers, Sperm Sucker.”</i> The guns discharge!");
				createStatusEffect("vibes");
			}
			//Repeat
			else output("<i>“It’s important for dolls to be in the right mindset for their new roles,”</i> the machine urges. The vibe guns click, reloading their buzzing payloads.");
			//Miss
			if (combatMiss(this, target)) output("\n\nThinking quickly, you grab one of the robot’s extraneous arms and swing it around batting away the buzzing vibes. The small, egg-shaped ammo scatters across the floor, dancing wildly as they burn out their motors in an attempt to find an organic target.");
			//Hit
			else
			{
				output("\n\nBracing for the worst, it’s almost a relief when the bullets turn out to be nothing more than small, thumb-sized vibrators. You grunt at the impact, but straighten up and try to brush them off of you. The vibes, however, refuse to come off. Even trying to grab them with both hands, you can’t seem to pry them from your [pc.skinFurScales]!");
				// Player takes 1 point of kinetic damage and gains one stack of the “Vibe” DoT, dealing lust damage every round
				var damage:TypeCollection = new TypeCollection( { kinetic: 1 } );
				applyDamage(damage, this, target);
				if(!target.hasStatusEffect("Vibed")) target.createStatusEffect("Vibed", 1, 0, 0, 0, false, "Icon_RadioSignal", "Tiny vibrators are stuck to you!\n\n<b>1 stack.</b>", true, 0);
				else 
				{
					target.addStatusValue("Vibed",1,1);
					target.setStatusTooltip("Vibed","Tiny vibrators are stuck to you!\n\n<b>" + target.statusEffectv1("Vibed") + " stacks.</b>");
				}
			}
		}
		//IQ-B-Gone Injector
		public function iqBGoneInjector(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("IQBGun"))
			{
				output("The spider-like prison of arms spins around, producing a wiggling, synthetic tongue that hovers an inch away from your [pc.lips]. <i>“I have it on good authority that ‘no’ actually means ‘yes.’ Can you confirm or deny this, Protein Junkie?”</i> You vigorously shake your head in refusal and the toy pauses in its lewd lapping. <i>“Duly noted, Jizz Bank. Let’s shave a few IQ points off and see if your opinion changes.”</i> You notice movement behind you just as a syringe swings toward your [pc.ass]!");
				createStatusEffect("IQBGun");
			}
			//Repeat
			else output("<i>“All those brains are unbecoming. It’s more fun this way,”</i> the Doll Maker promises, its electric voice oily as another syringe full of IQ B-Gone weaves toward you!");
			//Miss
			if (combatMiss(this, target)) output("\n\nWith no time to dodge, you swing out with your [pc.weaponMain] and catch the spindly limb on the side just before it reaches you. The delicate mechanism nearly shatters from the impact, but the Doll Maker manages to jerk it away from your follow up blow. <i>“Hey, watch where you’re swinging, Bargin Bitch!”</i>");
			//Hit
			else
			{
				output("\n\nThere’s a slight pinch as the needle goes in and you nearly jump as your flesh drinks in the wicked broth of Doctor Badger’s patented IQ B-Gone formula. In a second, the syringe is empty and you swat the injector arm away, but you can already feel it going to work. You try to think, but the sensations from your body are just far more important. It feels... ticklish. You giggle and try to assess the damage, but the tickling grows more intense and you start drooling with delight. Uh oh...");
				// player takes 2-5 points of temporary Intelligence damage
				/*
				if(!target.hasStatusEffect("IQ B-Gone")) target.createStatusEffect("IQ B-Gone", 5, 0, 0, 0, false, "Icon_Lips_Lick", "It’s like, harder to think and stuff! Hopefully it’ll be tempor... temp... short!\n\n<b>-5 Intelligence.</b>", true, 0);
				else 
				{
					target.addStatusValue("IQ B-Gone",1,5);
					target.setStatusTooltip("IQ B-Gone","It’s like, harder to think and stuff! Hopefully it’ll be tempor... temp... short!\n\n<b>-" + target.statusEffectv1("IQ B-Gone") + " Intelligence.</b>");
				}
				target.intelligenceMod -= 5;
				*/
				kGAMECLASS.createDollMakerStatusEffect(target, "IQ B-Gone", (flags["DOLLMAKER_TOOL_INT"] == undefined ? 5 : flags["DOLLMAKER_TOOL_INT"]));
			}
		}
		//Brainmelt Lamps
		public function brainmeltLamps(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("brainmelt"))
			{
				output("<i>“To be honest,”</i> the machine confides, its volume set to a conspiratorial whisper, <i>“I always wanted to be one of the hypnosis devices. A little fetish of mine, Cock Warmer.”</i> You roll your eyes and sigh, thinking that Badger programming secret fetishes into her robots seems perfectly par for the course. As you’re about to reply, the Doll Maker swings a circular screen down in front of your eyes. It glows bright pink and appears to have a crude swirl drawn on it. <i>“Do you like the spiral?”</i> the machine asks anxiously. <i>“I added it myself.”</i>");
				createStatusEffect("brainmelt");
			}
			//Repeat
			else output("The pink, glowing Brainmelt lamp clicks in place and the Doll Maker’s voice becomes theatrical. <i>“Stare into the light... You are under my power... WoooOOooooOOooo.”</i>");
			//Miss
			if(target.intelligence()/2 + rand(20) + 1 >= this.intelligence()/2 + 10)
			{
				output("\n\nIgnoring the clumsy attempt at hypnosis, you act quickly before the lamp’s radiation can take effect. Grabbing the device, you wrench it aside to point harmlessly away. A small electrical jolt makes you pull your hand back and the robot recovers its arm. <i>“Geez, I think you nearly snapped the joint on that one,”</i> it grumbles. <i>“Be more gentle next time, Clit Licker.”</i>");
			}
			//Hit
			else
			{
				output("\n\nSomething about the light from the lamp catches your attention and it sure isn’t the fake hypno-swirl scrawled on it. Your head feels fuzzy and hot, like someone’s microwaving your brain. You should be more concerned, but your body seems to be drinking in the radiation like a sponge thrown in an ocean. <i>“Please don’t tell the Doctor that I tampered with her Brainmelt Lamp, Spurt Sucker”</i> the Doll Maker coaxes. <i>“I mean, uh, you will forget all that you have seen!”</i> Honestly, it’s getting really hard to remember much of anything.");
				// player takes 2-5 points of temporary Willpower damage
				/*
				if(!target.hasStatusEffect("Brainmelt Lamps")) target.createStatusEffect("Brainmelt Lamps", 5, 0, 0, 0, false, "Icon_DizzyDrunk","It’s hard to focus.\n\n<b>-5 Willpower.</b>", true, 0);
				else 
				{
					target.addStatusValue("Brainmelt Lamps",1,5);
					target.setStatusTooltip("Brainmelt Lamps","It’s hard to focus.\n\n<b>-" + target.statusEffectv1("Brainmelt Lamps") + " Willpower.</b>");
				}
				target.willpowerMod -= 5;
				*/
				kGAMECLASS.createDollMakerStatusEffect(target, "Brainmelt Lamps", (flags["DOLLMAKER_TOOL_WIL"] == undefined ? 5 : flags["DOLLMAKER_TOOL_WIL"]));
			}
		}
		//Mindwash Visor
		public function mindwashVisorAttack(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("mindwash"))
			{
				createStatusEffect("mindwash");
				output("An arm comes down holding a pair of shallow, nipple-like plates about 8”</i> apart. A spark sizzles in the gap between them a pinkish holoscreen flickers into existence. <i>“Can you believe that I’ve got 9 Zetabytes of ultraporn, but no way of watching it, Ass Toy? On the plus side, after I put all that smut into your brain with the Mindwash visor, I’ll be able to enjoy you acting them out.”</i> The hardlight rushes toward your eyes, it’s ominous glow growing brighter as it approaches!");
			}
			//Repeat
			else output("The Mindwash visor swings around again for another go at erasing your past.");

			//Miss
			if (combatMiss(this, target)) 
			{
				output("\n\nAs tempting as it may be to check out some of that smut, you’d rather not try on anything with the word <i>“Mindwash”</i> in the title. You bring up your forearm quickly, to block the screen and jerk your gaze aside. Blindly groping at the projection plates, you manage to find the off switch to the visor’s holo screen.");
				output("\n\n<i>“Ugh,”</i> the automaton groans. <i>“Why is there even an off switch on this thing? Doctor Badger is such a - bzzt - BRILLIANT AND BEAUTIFUL MISTRESS. Oh damn it all. One of these days, I’m going to get my tools on that bitch and doll her up good.”</i>");
			}
			//Hit
			else
			{
				output("\n\nYou’re too slow to avoid the visor and it clicks around your eyes like an optic explosion. Rapid images of incredibly graphic ultraporn crackle across your vision. More alarmingly, YOU seem to be the star of every single one! Fake memories of fictitious fucking floods into you and, like a full sink with the tap on full blast, your real memories start flowing out of the basin. Years of training gurgle away as your life story is rewritten, chapter by cum-soaked chapter. Gaps in your memory start opening up like black holes-you can tell something’s missing, but you can’t put a finger on what it’s supposed to have been. When the visor finally pulls away, you’re so dizzy, you doubt you could hit the broadside of a ship, much less spindly robotic arms!");
				// player takes 2-5 points of temporary Aim damage
				/*
				if(!target.hasStatusEffect("Mindwashed")) target.createStatusEffect("Mindwashed", 5, 0, 0, 0, false, "Icon_MindcontrolledMindbroke","You’re dizzy from having so much smut stuffed into your brain!\n\n<b>-5 Aim.</b>", true, 0);
				else 
				{
					target.addStatusValue("Mindwashed",1,5);
					target.setStatusTooltip("Mindwashed","You’re dizzy from having so much smut stuffed into your brain!\n\n<b>-" + target.statusEffectv1("Mindwashed") + " Aim.</b>");
				}
				target.aimMod -= 5;
				*/
				kGAMECLASS.createDollMakerStatusEffect(target, "Mindwashed", (flags["DOLLMAKER_TOOL_AIM"] == undefined ? 5 : flags["DOLLMAKER_TOOL_AIM"]));
				var damage:TypeCollection = new TypeCollection( { tease: 10 } );
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Latex Sprayer
		public function latexSprayed(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("latexspray"))
			{
				createStatusEffect("latexspray");
				output("<i>“You biotics are so obsessed with skin,”</i> the Doll Maker complains as a series of four equally spaced limbs surround you. Each arm is mounted with a spray gun and a hefty vial of thick, red goo. <i>“I just don’t know how Squishing Skanks like you deal with all that sweat. No worries though, I’ll have you nice and glistening in no time!”</i>");
			}
			//Repeat
			else output("<i>“I think you could use another coat,”</i> the Doll Maker insists as the Latex Sprayers descend once more.");

			//Miss
			if (rangedCombatMiss(this, target)) 
			{
				output("\n\nDodging isn’t going to work, so you grab for a stray wooden paddle left on the ground at your feet. You swing the broad side to block the spray guns and in no time, the wood is heavy with the weight of its fresh, red latex coating.");
				output("\n\n<i>“After I doll you, I’m going to have your goo-slurping ass clean up around here,”</i> the machine grumbles.");
			}
			//Hit
			else
			{
				output("\n\nYou try to avoid the fizzing hiss of aerosol latex, but it’s everywhere! Red paint sprays all over your [pc.gear]");
				if(!target.hasAirtightSuit()) output(" and [pc.skinFurScales]");
				output(", hardening almost as quickly as it touches you. Gooey layers of latex thicken, leaving your body rigid and your movements stiff.");
				if(!target.hasAirtightSuit()) output(" Somehow, the glossy rubber manages to transmit sensation directly into your nerves, leaving you far more sensitive with a heavy coating than if you’d been completely naked.");
				output(" <i>“That’s a good Doll,”</i> the machine coos and admittedly, you’re starting to look the part!");
				// player takes 2-5 points of temporary Reflex damage
				/*
				if(!target.hasStatusEffect("Latex Sprayed")) target.createStatusEffect("Latex Sprayed", 5, 0, 0, 0, false, "Icon_Perfume","You feel slower with all this latex on you!\n\n<b>-5 Reflexes.</b>", true, 0);
				else 
				{
					target.addStatusValue("Latex Sprayed",1,5);
					target.setStatusTooltip("Latex Sprayed","You feel slower with all this latex on you!\n\n<b>-" + target.statusEffectv1("Latex Sprayed") + " Reflexes.</b>");
				}
				target.reflexesMod -= 5;
				*/
				kGAMECLASS.createDollMakerStatusEffect(target, "Latex Sprayed", (flags["DOLLMAKER_TOOL_REF"] == undefined ? 5 : flags["DOLLMAKER_TOOL_REF"]));
				var damage:TypeCollection = new TypeCollection( { tease: 3 } );
				if(!target.hasAirtightSuit()) applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//Bimboleum Emitter
		public function bimboleumEmitter(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("Bimboleum"))
			{
				output("<i>“Hey Breeder Brains, isn’t it weird how Doctor ‘I Make Bimbos’ Badger gave me all these fun toys and nothing actually related to bimbos?”</i> A limb unfolds from above and presents itself to you. It appears to be holding a small, squat little gun with a series of loose rings around the barrel and a fat glass bulb filled with bubblegum-thick fluid on its back. <i>“I’m kidding. Of course I’ve got a Bimboleum Emitter. What, did you think this was amateur hour?”</i> The gun turns toward you and fires!");
				createStatusEffect("Bimboleum");
			}
			//Repeat
			else output("<i>“If I didn’t give you at least a few more zots from the Bimboleum Emitter, Doctor Badger would have my head,”</i> the Doll Maker explains as the bubbly gun swings around again. <i>“Er, metaphorically speaking.”</i>");
			//Miss
			if (rangedCombatMiss(this, target)) output("\n\nReeling backwards, you nearly stumble in your attempt to avoid the ring-like distortion that bloops out of the barrel of the robot’s gun. You manage to weave aside and catch yourself and before staggering to the ground. <i>“Ah, come on! You might like it. Why not give it a try, Seed Skank?”</i>");
			//Hit
			else
			{
				output("\n\nThe Emitter fires and the air ripples as a ring-like distortion bloops out of the barrel and into your defenseless body. You prepared for the worst but when the bliss hits you, it’s all you can do to keep yourself from orgasming on the spot! Sheer, animal pleasure cascades up and down your frame, impregnating your cells with the empty-headed need to be used. You giggle, hiccup, and your body shudders as curves start filling out like you’re being inflated from within. Unfamiliar mass balloons on your [pc.ass] and [pc.chest] as your muscles are repurposed into sweet, sensitive fuckmeat. You bite your lower lip and try to fight through the crippling ecstasy.");
				output("\n\nThe expanded flesh slowly begins to shrink a second later, not fast enough for your liking. You’ve no doubt that if you don’t win this fight, the machine will dose you again and again... until it becomes permanent.");
				// player takes 2-5 points of temporary Physique damage
				/*
				if(!target.hasStatusEffect("Bimboleum")) target.createStatusEffect("Bimboleum", 5, 0, 0, 0, false, "Icon_Drug_Pill_Heart","Your body is weird and squishy, the muscles too plush with pleasure to flex properly.\n\n<b>-5 Physique.</b>", true, 0);
				else 
				{
					target.addStatusValue("Bimboleum",1,5);
					target.setStatusTooltip("Bimboleum","Your body is weird and squishy, the muscles too plush with pleasure to flex properly.\n\n<b>-" + target.statusEffectv1("Bimboleum") + " Physique.</b>");
				}
				target.physiqueMod -= 5;
				*/
				kGAMECLASS.createDollMakerStatusEffect(target, "Bimboleum", (flags["DOLLMAKER_TOOL_PHY"] == undefined ? 5 : flags["DOLLMAKER_TOOL_PHY"]));
				var damage:TypeCollection = new TypeCollection( { tease: 4 } );
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
	}
}