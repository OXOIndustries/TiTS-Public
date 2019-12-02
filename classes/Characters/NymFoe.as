package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Transformatives.ClearYu;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.StorageClass;
	
	import classes.GLOBAL;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Fenoxo
	 */
	
	public class NymFoe extends Creature
	{
		
		public function NymFoe() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Nym-Foe";
			this.originalRace = "automaton";
			this.a = "";
			this.capitalA = "";
			
			this.long = "A reprogrammed and repurposed nursedroid blocks your path! As with all things Badger, she has been inflated to bimbo proportions and seems intent on doing the same to you. A long, sinuous steel tail flicks back and forth behind her while her exposed nipples leak with steady streams of thin, clear fluid, utterly unlike milk.";
			
			this.isPlural = false;
			
			this.physiqueRaw = 28;
			this.reflexesRaw = 35;
			this.aimRaw = 35;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 35;
			this.libidoRaw = 100;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 50;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 20.0;
			baseHPResistances.electric.damageValue = -50.0;
			baseHPResistances.burning.damageValue = 30.0;
			baseHPResistances.tease.damageValue = 50.0;
			baseHPResistances.drug.damageValue = 100.0;
			baseHPResistances.pheromone.damageValue = 75;
			baseHPResistances.poison.damageValue = 100.0;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 400;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "pink";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "platinum blonde";
			this.hairLength = 0;
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_LATEX;
			this.skinFlags = new Array();
			this.skinTone = "white";
			this.furColor = "silver";
			this.scaleColor = "silver";
			this.faceType = GLOBAL.TYPE_SYNTHETIC;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SYNTHETIC;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_SYNTHETIC;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_SYNTHETIC;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SYNTHETIC;
			this.tailCount = 1;
			this.tailFlags = [];
			
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			
			this.hipRatingRaw = 10;
			this.buttRatingRaw = 10;
			
			this.cocks = new Array();
			this.balls = 0;
			
			this.cumMultiplierRaw = 1.5;
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			this.ballEfficiency = 4;
			this.refractoryRate = 999;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			
			this.elasticity = 3;
			
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 30;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			//this.createVagina();
			
			createStatusEffect("Force Fem Gender");
			
			isUniqueInFight = true;
			btnTargetText = "Nym-Foe";

			//Drops
			//================
			//5x ClearYu lollipops
			//Up to 4x Silicone bags (harvested)
			//Up to 10x Gush spraypens (harvested)
			//1x Damaged AI Chip (harvested)
			var lollipops:ItemSlotClass = new ClearYu();
			lollipops.quantity = 5;
			inventory.push(lollipops);
			
			//Enemy Status: Bouncy x5
			createStatusEffect("Bouncy!",5,0,0,0,false,"Icon_DefUp","Nym-Foe’s massive mammaries deflect basic attacks!\n\n100% chance to block basic attacks!",true,0);
			this.createStatusEffect("Disarm Immune");
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "NYMFOE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];

			//GUSHing Teats
			// ignores shields, high accuracy, cannot be used unless Nym-Foe has at least 1 stack of “Bouncy”
			//v2 of Bouncy! disables if 1 (for sealed suits)
			if(target.statusEffectv1("Bouncy! Mod") >= 0 && statusEffectv2("Bouncy!") == 0 && statusEffectv1("Bouncy!") > 0) attacks.push(gushingTreats);
			if(!hasStatusEffect("Sampled")) attacks.push(sampleTailAttack);
			else attacks.push(injectionTail);
			if(statusEffectv1("Gloved") == 0) attacks.push(anaestheticGloveAttack);
			attacks.push(highspeedLollipops);

			attacks[rand(attacks.length)](target);
		}
		//Sample Tail
		public function sampleTailAttack(target:Creature):void
		{
			//First Time
			if(!this.hasStatusEffect("Tailed"))
			{
				output("<i>“I’m programmed to be extremely appreciative and I’d just like to say that I’m very pleased to be your chosen upgrade module! First, I will need to take a small sample to better calibrate my medical services for your particular genetic structure.”</i> The nursedroid’s prehensile tail turns its needle-sharp tip toward you, like a serpent spotting a mouse.");
				output("\n\n<i>“You may feel a slight pinch.”</i>");
				createStatusEffect("Tailed");
			}
			//Repeat
			else output("<i>“I can draw a sample from anywhere, but if you would like, please present your posterior for optimal analysis.”</i> Her tail shoots forward, trying to nip you!");
			//Miss
			if (combatMiss(this, target))
			{
				output("\n\nYou twist to avoid the probing tendril, knocking it away with your [pc.mainWeapon]. The droid reels her tail back in, blinking. <i>“If I don’t take a sample, I cannot prepare your customized treatment,”</i> she explains, a bit flustered.");
			}
			//Hit
			else
			{
				output("\n\nThe sharp steel tail manages to tag you, sliding ");
				if(!(target.armor is EmptySlot)) output("around your [pc.armor], ");
				output("through your [pc.skinFurScales], and piercing into the flesh beneath with smooth, surgical precision. There is a slight sting, and the tail pulls back with a single droplet of blood on its point. Vacuum pressure sucks the blood into a tiny hole in the tail and Nym-Foe’s eyes flicker for a moment.");
				output("\n\n<i>“Analysis complete. Bio-silicone reformatted.”</i> Before your eyes, her ass plumps up, globular cheeks fattened through some internal process. A trickle of clear goo oozes from her tail.");
				// deals 1 Kinetic point of hp damage. Unlocks the Injection Tail attack and disables the Sample Tail attack
				this.createStatusEffect("Sampled");
				var damage:TypeCollection = new TypeCollection( { kinetic: 1 } );
				applyDamage(damage, this, target);
			}
		}
		//Injection Tail
		// Requires a hit with the Sample Tail first
		public function injectionTail(target:Creature):void
		{
			//First time
			if(statusEffectv1("Sample") == 0)
			{
				output("<i>“Your formatted bio-silicone is ready for injection,”</i> she chirps happily. <i>“No need to worry about surgical implants or storage containers: Bio-Silicone situates itself inside your body quickly and easily, for immediate results!”</i> Her needle-tipped tail weaves dangerously in the air, looking for an opening.");
				output("\n\n<i>“You may feel some pressure,”</i> she warns as the steel spike shoots forward.");
				addStatusValue("Sample",1,1);
			}
			//Repeat
			else output("An electric chime radiates from the automaton’s head and her rump fattens, the sizeable posterior becoming a bubble butt once again. <i>“Additional Bio-Silicone has been prepared. Now injecting.”</i> Her tail lunges!");
			//Miss
			if (combatMiss(this, target)) output("\n\nDodging away from the syringe-like tip of Nym-Foe’s tail, you grab hold of the warm steel. <i>“This is a bit irregular,”</i> she complains as you squeeze the segmented injector, milking the clear silicone out of her. The semi-firm goo splatters harmlessly on the floor before she can pull herself free. <i>“Do not worry, additional silicone is being fabricated.”</i>");
			//Hit
			else
			{
				output("\n\nThe spike finds its way through your defenses and you feel a pinch of penetration. The flexible steel bulges and distorts as the nursedroid pumps her payload through it, and into your body. The pressure of the silicone sliding inside your body makes you feel woozy and a little sick. You jerk away, pulling free of the needle, but not quite fast enough. Your [pc.skinFurScales] shifts as the inflating goo slides around your body, looking for a spot to settle in. You’re going to have to win quickly or these implants are going to be permanent!");
				// deals 15-25 Drug hp damage
				var damage:TypeCollection = new TypeCollection( { drug: 15+rand(11) } );
				applyDamage(damageRand(damage, 15), this, target);

				// randomly choose one of the following:
				var siliconeSite:StorageClass = target.getStatusEffect("Silicone Please");
				var injectionSites:Array = [];
				if(siliconeSite == null || siliconeSite.value1 >= 1) injectionSites.push(1);
				if(siliconeSite == null || siliconeSite.value2 >= 1) injectionSites.push(2);
				if(siliconeSite == null || siliconeSite.value3 >= 1) injectionSites.push(3);
				if((siliconeSite == null && target.lipMod < 5) || (siliconeSite != null && siliconeSite.value4 >= 1)) injectionSites.push(4);
				
				var injectionSite:int = injectionSites[rand(injectionSites.length)];
				
				switch(injectionSite)
				{
					// hips
					case 1:
						output("\n\nA groaning pressure floods across your [pc.legOrLegs], and you squirm in your place. Before your eyes, your [pc.hips] grow and swell as the silicone settles into your flanks like a feast of cheesecakes. Frankly, it’s a little embarrassing, but you resolve not to be distracted by this added weight.");
						// pc’s hips increase by 1 step
						kGAMECLASS.nymFoeInjection(target,1,(siliconeSite == null ? 3 : siliconeSite.value1));
						break;
					// ass
					case 2:
						output("\n\nYour posterior thickens, the cheeks of your [pc.ass] growing broader and fatter as the bio-silicone deposits itself in your rump. You wiggle your backside uncomfortably, trying to get used to the extra mass before the nursedroid has another chance to pump more into you!");
						// pc’s ass increases by 1 step.
						kGAMECLASS.nymFoeInjection(target,2,(siliconeSite == null ? 3 : siliconeSite.value2));
						break;
					// breasts
					case 3:
						output("\n\nYou gasp as the fluid filling settles into your [pc.chest], turning into a semi-firm gel that expands your [pc.chest] considerably. You press an arm against the inflated mounds, but the enlarged breasts are just as responsive as if you’d grown them yourself - albeit far more gravity-defying than natural!");
						// pc’s breasts increase by 1 cup size
						kGAMECLASS.nymFoeInjection(target,3,(siliconeSite == null ? 3 : siliconeSite.value3));
						break;
					// lips
					case 4:
						output("\n\nYou face flushes as heat momentarily blinds you. You rub the back of your hand across your eyes to help clear your vision and when you draw it away, your fingers brush against your lips. Normally, you’d expect to feel [pc.lips], but now your pucker seems to have been inflated by the silicone! You’ve got a mouth that porn stars would kill for, but there’s no time to think about that now!");
						kGAMECLASS.nymFoeInjection(target,4,(siliconeSite == null ? 1 : siliconeSite.value4));
						break;
				}
			}
		}
		//Anaesthetic Glove
		public function anaestheticGloveAttack(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("Gloved")) 
			{
				output("<i>“You seem anxious. Don’t worry, a lot of people are afraid of going to the doctor.”</i> The bimbo bot steeples her hands and nods encouragingly to you. <i>“Let me assure you, this will be completely - bzt! - mostly - bzt! - partially painless!”</i> She produces a bottle filled with a clear liquid and upends it into one of her gloved hands, the soft, cottony fabric drinking it in eagerly.");
				output("\n\n<i>“This should help relax you relax,”</i> she adds, advancing with her palm towards your face.");
				createStatusEffect("Gloved");
			}
			//Repeat
			else
			{
				output("Nym-Foe splashes more scented chemicals onto her gloves with a slightly glitchy smile on her face. <i>“It’s your old friend, Ms. Anesthetic! Give her a kiss, won’t you?”</i> She lunges!");
			}
			//Player is immune to gas attacks
			if(target.hasAirtightSuit())
			{
				output("\n\nThe chloroform-soaked glove claps down around your [pc.lips], but luckily your [pc.armor] seems to block everything but a wiff of the sweet-scented inhalant. You pry the droid’s hand off and wipe the fluid from your face.");
				output("\n\nNym-Foe blinks, looking down at her hand. <i>“Error, subdual mechanism insufficient.”</i> Experimentally, she holds her glove up to her own face and takes a deep breath. <i>“Modifying treatment subroutine.”</i>");
				// She no longer uses this attack
				addStatusValue("Gloved",1,1);
			}
			//Miss
			else if (combatMiss(this, target))
			{
				output("\n\nHolding your breath, you struggle against the hydraulic strength of the aggressive android. You know this is bound to be a losing battle, so you think quickly and grab the cuff of her glove, attempting to pull it off. The glove is turned inside out by your maneuver, but it seems to be attached to her fingertips, preventing you from removing it entirely.");
				output("\n\n<i>“Oh!”</i> she cries in alarm, releasing her grip on your entirely. <i>“I’m naked!”</i> The robot blushes slightly and flips her glove around to cover the indecent synthetic skin of her palm. Badger puts the weirdest behaviors in her guards.");
			}
			//Hit
			else
			{
				output("\n\nThe fiercely strong android manages to clap her palm across your nostrils and the scent of slightly sweet chemicals floods your senses. You struggle to pull away, holding your breath as best you can. The sinisterly seductive scent coils up, behind your eyes, tinting the world with a darkening oblivion. Adrenaline pounding, you manage to jerk her hand away before you’re completely lost to the aromatic inhalant.");
				// player loses 34 points from their Energy. If at 0 energy, they take 10-15 Poison hp damage
				if(target.energy() <= 0)
				{
					var damage:TypeCollection = new TypeCollection( { poison: 20 } );
					applyDamage(damageRand(damage, 15), this, target);
				}
				else 
				{
					output(" (<b>-34 Energy</b>)");
					target.energy(-34);
				}
			}
		}
		//High Speed Lollipops
		public function highspeedLollipops(target:Creature):void
		{
			//First Time
			if(!hasStatusEffect("lolli"))
			{
				createStatusEffect("lolli");
				output("<i>“My sensors indicate that you are not being a very good " + kGAMECLASS.pc.mf("boy","girl") + "! Do not worry, I am authorized to dispense sweets as a means of encouraging cooperation.”</i> Nym-Foe reaches into the expansive valley of her cleavage and produces a lollipop");
				if(flags["MET_FLAHNE"] != undefined) output(" just like the ones you see Flahne sucking down all the time");
				output(".");
				output("\n\nShe carefully removes the waxy wrapper and reveals the pink, candy orb at the tip. <i>“My data indicates that <i>“pink”</i> is the most delicious color. You are very lucky,”</i> she asserts with a smile and a nod. Without changing her expression, she swings her arm back and whips it forward, throwing the lollipop at your head with so much mechanical force she may as well have shot it from a gun!");
			}
			//Repeat
			else output("<i>“Your jovality is still at worrisome levels. Deploying additional treats.”</i> She pulls out another lollipop and carefully unwraps it for you before launching it directly at your face!");
			//miss
			if (rangedCombatMiss(this, target)) output("\n\nYou jerk your head aside, letting the weaponized candy shoot past and crack against the wall behind you. This robot’s bedside manner leaves something to be desired!");
			//hit
			else
			{
				output("\n\nThe candy cracks against your forehead with all the velocity the nurse could put into it. Stars explode behind your eyes and a bubble of darkness blinds you for a split second. When you recover, your head is still ringing. Not only that, but the lollipop was practically reduced to dust by the impact.");
				// deals 10-15 kinetic damage if it hits
				var damage:TypeCollection = new TypeCollection( { kinetic: 20 } );
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		//GUSHing Teats
		// ignores shields, high accuracy, cannot be used unless Nym-Foe has at least 1 stack of “Bouncy”
		//v2 of Bouncy! disables if 1 (for sealed suits)
		public function gushingTreats(target:Creature):void
		{
			//First Time:
			if(statusEffectv1("Bouncy!") >= 5)
			{
				output("The nursedroid’s face lights up. <i>“Your bio-signs identify you as-”</i> her speech cuts out into garbled static, her head twitching to one side while sparks shoot out of her neck joint. <i>“Identify- identify- identify you as: In need of a drink! Please remain stationary.”</i> She hoists both hands to the dripping nozzles of her synthetic nipples and squeezes. Pressurized fluid gushes out in twin streams!");
			}
			//Repeat:
			else
			{
				output("The automaton’s pink eyes flicker over you. <i>“Checking endocrine system...”</i>");
				output("\n\n<i>“Commencing deep tissue scan...”</i>");
				output("\n\n<i>“Analyzing...”</i>");
				output("\n\n<i>“Error. Tissue insufficiently deep. Deploying medical assistance.”</i> She grips her nipples and sprays another pair of showering blasts at you!");
			}
			// Removes 1 stack of “Bouncy” from Nym-Foe
			if(!target.hasStatusEffect("Bouncy! Mod")) this.addStatusValue("Bouncy!",1,-1);
			var stacks:int = statusEffectv1("Bouncy!");
			if(stacks <= 0) removeStatusEffect("Bouncy!");
			else
			{
				setStatusTooltip("Bouncy!","Nym-Foe’s massive mammaries deflect basic attacks!\n\n" + (stacks * 20) + "% chance to block basic attacks!");
			}
			//Sealed suit, immune to splash attacks
			if(target.hasAirtightSuit())
			{
				output("\n\nThe chemical lactation splashes against your [pc.armor]. Thin streams trickle down harmlessly, repelled by your sealed suit. Nym-Foe blinks, looking down at her dripping chest. <i>“Error, subdual mechanism insufficient.”</i> Sadly, she tweaks her nipples, stopping their gushing streams. <i>“Modifying treatment subroutine.”</i>");
				// She no longer uses this attack
				addStatusValue("Bouncy!",2,1);
			}
			//Miss
			else if (rangedCombatMiss(this, target)) 
			{
				output("\n\nThe nurse’s gushing bounty sprays toward you, but a quick dodge puts you behind a suitable barrier. The chemical lactation splashes against a piece of scrap metal, dribbling down the rusted iron harmlessly. Nym-Foe looks slightly flustered, though you’re not sure if it’s because you dodged her attack or because she’s less busty than she was before.");
			}
			else
			{
				if(!target.hasStatusEffect("GUSHed")) target.createStatusEffect("GUSHed", 0, 0, 0, 0, false, "Icon_Poison", "You’re splattered in arousing drugs. Better not get hit by too many gushers, or you’ll be this robot’s simpering plaything.", true, 0);
				else target.addStatusValue("GUSHed",1,1);
				//First Hit:
				if(target.statusEffectv1("GUSHed") == 0)
				{
					output("\n\nYou dodge, but the multitude of sex toys and half-broken garbage all over Doctor Badger’s floor trips you up. Nym-Foe’s spray catches you and you sputter as the fluid seeps into your [pc.skinFurScales], leaving your body feeling swollen and slightly numb. Pinpricks of sensation radiate through your [pc.chest], and you shudder as your body throbs under the building pressure.");
					output("\n\n<b>At least she’s less bouncy!</b>");
					// 24 lust damage
					target.lust(24);
				}
				//Second Hit:
				else if(target.statusEffectv1("GUSHed") == 1)
				{
					output("\n\nYour body is woozy and doesn’t seem to be responding to your brain very well anymore. Another spray of clear fluid drenches you and the numbness floods you once more. When it recedes, the sensation in your chest is as suffocating as if you were being pinned under a starship. You gasp and moan, trying your best to ignore the furnace of your [pc.chest].");
					output("\n\n<b>At least she’s less bouncy!</b>");
					// 24 lust damage
					target.lust(24);
				}
				//Third Hit:
				else if(target.statusEffectv1("GUSHed") == 2)
				{
					output("\n\nIt’s like you’re not even trying to get out of the way anymore. The android’s glistening bounty spurts from her pink nipples and hoses you down yet again. Your gut tells you something terrible is happening, but your brain can’t be bothered to investigate. You exult in the cold numbness and rejoice at the tingling warmth. It feels so good, tears start brimming in your eyes and it’s hard to keep your mouth closed, your [pc.tongue] hanging out as you pant like a bitch in heat.");
					output("\n\n<b>At least she’s less bouncy!</b>");
					// 24 lust damage
					target.lust(24);
				}
				//Fourth Hit
				else if(target.statusEffectv1("GUSHed") == 3)
				{
					output("\n\nYou raise an arm weakly, as if your palm will hold back the gushing tide of the nursedroid’s twin geysers. A fresh coating of the translucent lactation leaves you barely standing. The temptation to drop to your knees is so strong that you’re fighting yourself nearly as much as the reprogramed android. Your body feels wound up tighter than a spring-loaded trap, every muscle and nerve twitching with pent-up need.");
					output("\n\n<b>At least she’s less bouncy!</b>");
					// 24 lust damage
					target.lust(24);
				}
				//Fifth Hit
				else
				{
					output("\n\nYou fall to your [pc.ass] and open your mouth wide, accepting the droid’s shower with an obedient moan. Heat overtakes you and, body dripping with the oily drug, all resistance fades from your slack limbs.");
					// 15000 lust damage. Go to “GUSH’d Bad End”
					target.lust(1500000);
					//9999
				}
			}
		}
	}
}