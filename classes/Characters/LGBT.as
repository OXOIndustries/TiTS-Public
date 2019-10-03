package classes.Characters
{
	import classes.Characters.LGBTPilots
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.LaserCarbine;
	import classes.Items.Transformatives.Goblinola;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	
	public class LGBT extends Creature
	{
		public function LGBT()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "LG-BT";
			this.originalRace = "robot";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You are fighting the <b>Luxury Gabilani Bipedal Transport</b>. From the waist down, the eighteen foot tall walker is a fearsome, looming war machine, dusty and pitted by long exposure to the unforgiving Tarkus wastelands. Above its two padded feet and armored, stork-like digitigrade legs, its underside bristles with bulky, lethal-looking weaponry: a twinned laser cannon, a boxy missile pod and a pronged energy weapon are all pointed in your general direction. Crude perhaps to your 32nd Century eyes, but it’s easily the most advanced and dangerous looking thing you’ve seen any native pack on this planet, and you’ve seen lesser vehicles tear apart cities in old war vids.\n\nThe head of the LG-BT, though, belongs on an entirely different vehicle - on an entirely different planet, perhaps. It’s a pristine, heavily reinforced synth-glass bubble, arrayed with camera modules, within which you can catch glimpses of its two gabilani occupants.";
			this.customDodge = "The lumbering mech’s unpredictable movements carry it out of the way!";
			this.customBlock = "That armor’s too thicc for blasters!";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "drill";
			this.meleeWeapon.longName = "pincers";
			this.meleeWeapon.attackNoun = "drill";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new LaserCarbine();
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.longName = "laser cannon";
			this.rangedWeapon.description = "a laser cannon";
			this.rangedWeapon.attackNoun = "laser beam";
			this.rangedWeapon.baseDamage.burning.damageValue = 3;
			
			this.armor.longName = "metal plates";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			//50% kinetic res, 100% elec vuln!
			baseHPResistances.kinetic.damageValue = 0.0;
			baseHPResistances.burning.damageValue = 50.0;
			baseHPResistances.freezing.damageValue = 50.0;
			//baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.electric.damageValue = -50.0;
			
			this.shield = new JoyCoPremiumShield();
			this.shield.shields = 100;
			this.shield.hasRandomProperties = true;

			this.inventory.push(new Goblinola);
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 5;
			this.aimRaw = 13;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 5;
			this.libidoRaw = 0;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 5;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 18*12;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "metal";
			this.skinFlags = new Array();
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 0;
			this.legFlags = new Array();
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
			this.buttRatingRaw = 0;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = 0;
			this.pregnancyMultiplierRaw = 0;
			
			this.createStatusEffect("Infertile");
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 0;
			this.ass.bonusCapacity = 0;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Stun Immune");
			
			isUniqueInFight = true;
			btnTargetText = "LG-BT";
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "LGBT";
		}
			
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var goblin:Creature;
			var target:Creature = selectTarget(hostileCreatures);
			for(var i:int = 0; i < alliedCreatures.length; i++)
			{
				if(alliedCreatures[i] is LGBTPilots) goblin = alliedCreatures[i];
			}
			if (target == null) return;
			
			//First the LG-BT AI chooses an attack, then a random gabilani blurb plays, then they choose an attack. If lust maxed out only the AI chooses, the gabilani cause tease damage instead.

			//Normal attacks here
			if(rand(2) == 0 && this.energy() >= 20 && target.shields() >= 35) empGoooo(target);
			else if(rand(3) == 0 && this.energy() >= 25) kineticMissileStrike(target);
			else if(this.energy() >= 20) twinLaserStrike(target); 
			else rechargyBoi(target);

			//Gabi blurb
			if(!goblin.hasStatusEffect("Gabilani_Fucking") && goblin.lust() >= goblin.lustMax()) goblin100LustActions(target,goblin);
			else if(goblin.hasStatusEffect("Gabilani_Fucking")) goblin100LustActions(target,goblin);
			//Bonus attks!
			else 
			{
				randoGabiBlurb(target);
				if(this.energy() >= 50 && rand(4) == 0) missileFlurryAttack(target);
				else if(this.energy() >= 20 && rand(3) == 0) twinLaserStrikeRoundPew(target);
				else if(this.energy() >= 20 && rand(3) == 0 && target.shields() > 30) EMPRoundPew(target);
				else if(this.energy() >= 15 && !target.hasStatusEffect("Stunned")) stunnaBoltAttacku(target);
				else if(this.energy() >= 30 && target.shields() <= 0 && target.energy() < 20) tampleAttack(target);
				else rechargyBoi(target,true);
			}
			this.long = "You are fighting the <b>Luxury Gabilani Bipedal Transport</b>. From the waist down, the eighteen foot tall walker is a fearsome, looming war machine, dusty and pitted by long exposure to the unforgiving Tarkus wastelands. Above its two padded feet and armored, stork-like digitigrade legs, its underside bristles with bulky, lethal-looking weaponry: A twinned laser cannon, a boxy missile pod and a pronged energy weapon are all pointed in your general direction. Crude perhaps to your 32nd Century eyes, but it’s easily the most advanced and dangerous looking thing you’ve seen any native pack on this planet, and you’ve seen lesser vehicles tear apart cities in old war vids.";
			this.long += "The head of the LG-BT, though, belongs on an entirely different vehicle - on an entirely different planet, perhaps. It’s a pristine, heavily reinforced synth-glass bubble, arrayed with camera modules, within which you can catch glimpses of its two gabilani occupants.";
			if(!goblin.hasStatusEffect("Gabilani_Fucking")) goblin.long = "The vacationers are happily busy with the control panel, a small bank of monitors, and glasses of alcohol. They laugh and wave when they notice you staring at them, for all the world like they’re enjoying themselves on a cruise liner rather than working out which lethal weapon to use on you next.\n\nThe blue-skinned pair are ensconced in miniature luxury: plush pillows, a bar and what looks like a tiny sauna all seem to be in evidence up there. Some form of gyroscopic stabilizer is keeping their glass bubble still and level, even as the LG-BT shakes the ground with its every heavy, groaning step, stalking around you, forcing you to keep moving to avoid being crushed.";
			else this.long += "\n\nRight now the gabilani vacationers are just an occasional flailing arm or a pair of buttocks bapping against the rapidly-steaming-up glass, since they’re completely involved with one another.\n\nThe blue-skinned pair are ensconced in miniature luxury: plush pillows, a bar and what looks like a tiny sauna all seem to be in evidence up there. Some form of gyroscopic stabilizer is keeping their glass bubble still and level, even as the LG-BT shakes the ground with its every heavy, groaning step, stalking around you, forcing you to keep moving to avoid being crushed.";
		}

		//AI Attacks
		//Missile Strike
		//Kinetic explosive. Heavy damage. Uses 25 energy.
		public function kineticMissileStrike(target:Creature):void
		{
			output("The massive walker levels its missile box at you, there’s a click, and then in a great flume of dirty smoke a blunt projectile is sent hurtling from one of its bays straight at you!");
			if(rangedCombatMiss(this, target)) output(" You manage to fling yourself to one side! The missile hisses past your ear and flings bits of scrap everywhere in a terrifying explosion.");
			else 
			{
				output(" <b>Boooooom!</b>");
				applyDamage(damageRand(new TypeCollection( { burning: 7, kinetic: 14 } ),15), this, target, "minimal");
			}
			this.energy(-25);
		}
		//Twin Laser
		//Burning laser. Highly accurate, hits twice. Uses 20 energy.
		public function twinLaserStrike(target:Creature):void
		{
			output("As the LG-BT stalks ponderously around you, its bulky double laser cannon is brought swinging around. Hateful light glares at you from within its chambers, and two beams of focused heat are sent slicing through the air and dirt towards you.\n");
			CombatAttacks.SingleRangedAttackImpl(this, target);
			output("\n");
			CombatAttacks.SingleRangedAttackImpl(this, target);
			this.energy(-20);
		}
		//EMP
		//Only activates if PC energy > 40 and/or PC shield > 30. Electric energy. Minor HP damage, heavy Shield damage, moderate Energy damage. Uses 20 energy.
		public function empGoooo(target:Creature):void
		{
			output("The pronged energy weapon attached to the LG-BT’s underside shudders and sparks, convulsing - and then with a cringe-inducing snap, it projects an expanding bolt of energy directly at you.");
			if(rangedCombatMiss(this, target)) output("\nYou avoid the EMP!");
			else
			{
				applyDamage(damageRand(new TypeCollection( { electric: 40 } ),15), this, target, "minimal");
			}
			this.energy(-20);
		}
		//Recharge
		//Only activates if Energy < 20. Regains 100% of energy and 66% of shields.
		public function rechargyBoi(target:Creature,newL:Boolean = false):void
		{
			if(newL) output("\n\n");
			output("The LG-BT pauses, as if thinking about you carefully. You can hear its internals clicking, turning and whirring, energy redirected from some deep source towards recharging... and microfacturing. Its shield snaps back into place a moment later, its weapons throbbing with refreshed mercilessness. (+<b>" + Math.round(20) + "</b> Shields)");
			this.energy(100);
			this.shields(Math.round(20));
		}

		//Gabilani Blurbs
		//Play one of these at random before they attack.
		public function randoGabiBlurb(target:Creature):void
		{
			if(rand(11) == 0) output("\n\n<i>“Whoops!”</i> the female gabilani dabs at the control panel with a napkin. <i>“Sorry, I spilled. I’m not sure what that’s going to do.”</i>");
			else if(rand(10) == 0) output("\n\n<i>“Ooh, so many options, so little time!”</i> The male gabilani rubs his hands giddily. <i>“How about...THIS!”</i> He stabs an outsized button.");
			else if(rand(9) == 0) output("\n\n<i>“Use the missiles! I wanna see fireworks!”</i> <i>“No, use the zapper, don’t you want to see [pc.him] flail like a puppet?”</i> <i>“Missiles!”</i> <i>“Zapper!”</i> The pair slap-fight over the control panel, until an elbow inadvertently hits a lever.");
			else if(rand(8) == 0) output("\n\n<i>“Oh darling, you’re so <b>wicked</b>!”</i> croons the male gabilani, in response to the female whispering something in his ear. He hits a switch, eagerly looking down to see the result..");
			else if(rand(7) == 0) output("\n\n<i>“Eenie meenie miney...”</i> <i>“Mo!”</i> The female gabilani darts in and presses a button before the male has finished.");
			else if(rand(6) == 0)
			{
				output("\n\n<i>“Can we wrap this up now, darling?”</i> yawns the female gabilani, examining her nails. <i>“This is taking a frightfully long time.”</i>");
				output("\n\n<i>“Of course dear,”</i> soothes the male, throwing a lever. <i>“This ought to do it.”</i>");
			}
			else if(rand(5) == 0) output("\n\n<i>“Try not to get hit in the face or genitals, won’t you dear alien?”</i> coos the female gabilani, fondling a switch. <i>“That would make the fun we’re going to have with you later a bit ick.”</i> She throws it.");
			else if(rand(4) == 0) output("\n\n<i>“Hmm. Aheh. Aheheheheh. Aheheheheheheheh!”</i> Overcome with sheer delight at what he’s going to do next, the male gabilani doubles up and slaps at the control panel deliriously.");
			else if(rand(3) == 0) output("\n\n<i>“Do you think maybe we shouldn’t be using military grade weapons on another tourist?”</i> posits the female gabilani, swirling her drink. <i>“The travel agency did say to only use them in an emergency.”</i>");
			else if(rand(2) == 0) output("\n\n<i>“Oh darling, it’s an alien!”</i> soothes the male, busy with the control panel. <i>“They can regrow their limbs and get robot faces and all sorts. And it <i>was</i> an emergency: I was getting bored.”</i>");
			else output("\n\n<i>“Wait, wait!”</i> The female has a chunky handheld device out, is angling it towards you. <i>“I want to get a recording of this. The family will think it’s adorable, I’ll be in the words for weeks. Alright, now!”</i>\n\nThe male enthusiastically flips a switch.");
		}
		//Gabilani Attacks
		//Missile Flurry
		//Kinetic explosive. Same damage as Missile Strike, except it hits three times at -30% accuracy. 50 energy. Twice per combat limit.
		public function missileFlurryAttack(target:Creature):void
		{
			output("\n\nThe LG-BT throbs loudly, its missile pod swings in your direction, and then in a blooming mushroom patch of cloud it launches a swarm of projectiles at you, box rattling and flailing wildly. ");
			if(rangedCombatMiss(this, target,-1,1.30))
			{
				if(rangedCombatMiss(this, target,-1,1.30))
				{
					if(rangedCombatMiss(this, target,-1,1.30))
					{
						output("With a truly astounding series of dodges and rolls, you manage to avoid every single one! Over the catastrophic explosions going on behind you, the gabilani above break into spontaneous applause and cheers.");
					}
					else
					{
						output("<b>Boom!</b>");
						applyDamage(damageRand(new TypeCollection( { burning: 7, kinetic: 14 } ),15), this, target, "minimal");
					}
				}
				else
				{
					output("<b>Boom! Booooooom!</b>");
					applyDamage(damageRand(new TypeCollection( { burning: 10, kinetic: 20 } ),15), this, target, "minimal");
				}
			}
			else
			{
				output("<b>Boom! Booooooom! BOOOOOOOOOOM!</b>");
				applyDamage(damageRand(new TypeCollection( { burning: 15, kinetic: 25 } ),15), this, target, "minimal");
			}
			this.energy(-50);
		}
		//Twin Laser
		//Burning laser. Highly accurate, hits twice. Uses 20 energy.
		public function twinLaserStrikeRoundPew(target:Creature):void
		{
			output("\n\nAs the LG-BT stalks ponderously around you, its bulky double laser cannon is brought swinging around. Hateful light glares at you from within its chambers, and two beams of focused heat are directed viciously through the air and dirt towards you.\n");
			CombatAttacks.SingleRangedAttackImpl(this, target);
			output("\n");
			CombatAttacks.SingleRangedAttackImpl(this, target);
			this.energy(-20);
		}
		//EMP
		//Only activates if PC energy > 40 and/or PC shield > 30. Electric energy. Minor HP damage, heavy Shield damage, moderate Energy damage. Uses 20 energy.
		public function EMPRoundPew(target:Creature):void
		{
			output("\n\nThe pronged energy weapon attached to the LG-BT’s underside shudders and sparks, convulsing - and then with a cringe-inducing snap, it beams an expanding ball of energy directly at you.");
			if(rangedCombatMiss(this, target)) output("\nYou avoid the EMP!");
			else
			{
				applyDamage(damageRand(new TypeCollection( { electric: 40 } ),15), this, target, "minimal");
			}
			this.energy(-20);
		}
		//Stun Bolt
		//Only activates if PC shield = 0. Electric energy. +50% accuracy, minor HP damage, 70% chance to Stun. Uses 15 energy.
		public function stunnaBoltAttacku(target:Creature):void
		{
			output("\n\nThe pronged energy weapon attached to the LG-BT’s underside shudders and sparks, convulsing - and then it projects a single, white-blue bolt of electricity, attempting to connect it to you for one horrible, juddering moment.");
			if(rangedCombatMiss(this, target,-1,.50)) output(" But it misses!");
			else
			{
				if (!target.hasStatusEffect("Stunned") && target.physique()/2 + rand(20) + 1 < 20)
				{
					CombatAttacks.applyStun(target, 1);
					output("\nYour nerves seem to jangle right out of your [pc.skin] and your head fills with white light. <b>You’re stunned!</b>");
				}
				else
				{
					output("\nDespite receiving a nasty shock, you manage to hold onto your senses.");
				}
				applyDamage(damageRand(new TypeCollection( { electric: 15 } ),15), this, target, "minimal");
			}
			this.energy(-15);
		}
		//Trample
		//Only activates if PC shield > 0 AND Energy < 20. Kinetic crushing. -60% accuracy, but does terrible damage if it connects. Always uses Recharge on next AI turn.
		public function tampleAttack(target:Creature):void
		{
			output("\n\nThe LG-BT pauses. You can feel the heat radiating off its weapons from here. For one moment you allow yourself the relieved thought it must be stopping to cool down, recharge... and then the war machine starts forward, thudding towards you like a gigantic heron on the rampage! It raises one of its huge, flat feet above you...");
			if(combatMiss(this, target,-1,3)) output("\nYou manage to fling yourself to one side, the walker’s foot thudding down on thin air! Fucking Void, this is crazy!!");
			else 
			{
				output(" <b>SPLAT.</b>");
				applyDamage(damageRand(new TypeCollection( { kinetic: 70 } ),15), this, target, "minimal");
				output("\n\n<i>“Ooh my,”</i> says one of the gabilani, somewhere far away. <i>“Have you got a coin, dear? I think we just stepped in something.”</i>");
			}
			this.energy(-100);
		}
		//If Lust reaches 100
		//In the lust effect read-out, ‘LG-BT’ should be replaced by ‘the gabilani’, e.g. ‘The gabilani look interested’ rather than ‘The LG-BT looks interested’.
		public function goblin100LustActions(target:Creature,goblin:Creature):void
		{
			if(!goblin.hasStatusEffect("Gabilani_Fucking"))
			{
				output("\n\n<i>“These aliens...”</i> The male gabilani is gazing down at you in a dreamy stupor. Even from where you are, you can see he’s developed a hell of a tent in his lower jumpsuit. <i>“They’re, uh. Definitely entertaining, aren’t they?”</i>");
				output("\n\n<i>“Yeah...”</i> sighs the female, lips wet, face flushed. They turn to each other, a decision is reached, and then they’re mashing their faces into each other, snogging as they begin furiously ripping off each other’s clothes. They tumble out of view, limbs flailing, underwear flying.");
				output("\n\nThe LG-BT continues to pace around you, utterly indifferent to what the individuals in its cockpit are now doing. <b>Looks like you’re still going to have to defeat the auto-pilot.</b>");
				goblin.createStatusEffect("Gabilani_Fucking");
				this.createStatusEffect("Gabilani_Fucking");
			}
			//Continuing Effect
			//Pick at random. Causes tease damage
			else if(goblin.statusEffectv1("Gabilani_Fucking") < 3)
			{
				if(rand(4) == 0) output("\n\nThe female gabilani is bearing down on the male from above, her big-nippled boobies bouncing up and down as she slaps at and twists his face with her pudgy hands, a cruel, lusty sneer on her face as she fucks and hurts him at the same time. His ecstatic gasps and howls echo around the battlefield. It’s hard not to watch...");
				else if(rand(3) == 0) output("\n\nThe male gabilani has gotten the female bent against the synth glass, her face, tits and hands smushing against the crystal barrier as he batters his out-sized cock into her from behind, waves of motion travelling down her fat behind. Animalistic moans and grunts wind their way down to you. It’s hard not to watch...");
				else if(rand(2) == 0) output("\n\nThe female gabilani is leaning back and pouring some form of spirit down her naked front, grinning as the male clambers onto her and licks it off her pudgy belly and ample breasts, culminating in him mounting her urgently, pumping his healthy, athletic frame between her open legs. It’s hard not to watch...");
				else output("\n\nThe gabilani are half-fighting, half-fucking against the control panel up there, neither apparently willing to be on the bottom. One moment the male has the female planted against it, hands hooked beneath her meaty thighs and thrusting away, the next the female has slapped and wrested her way back on top, pushing his hard chest down and riding him with florid abandon. The slaps of flesh, snarls and groans are transmitted readily through their impassive sound system. It’s hard not to watch...");
				if(target.willpower()/2 + rand(20) + 1 >= 20) output(" but you manage to keep your eyes mostly to yourself.");
				else applyDamage(damageRand(new TypeCollection( { tease: 5 } ),15), this, target, "minimal");
				goblin.addStatusValue("Gabilani_Fucking",1,1);
			}
			//Finish
			//Lust drained to 0 at the end of third round PC raised it to max.
			else
			{
				output("\n\nThings seem to be culminating, up in the LG-BT’s cockpit. It’s hard to tell visually now, since the synth glass has steamed up, but the moans and grunts being produced out of it are definitely getting more and more orgasmic.");
				output("\n\n<i>“Ugh! Ungh! Ugh. Ooh darling, that was wonderful,”</i> coos the female. There’s a wiping sound, and her serene green face appears beyond a clear smear in the glass. <i>“Oh golly. That " + target.mf("frisky little boy","wanton little slut") + " that started us off is still down there!”</i>");
				output("\n\n<i>“Oh excellent!”</i> The male appears, a pair of panties on his head, excitedly using a screen-wiper in front of the control panel. <i>“Let’s see if we can make [pc.himHer] do that lovely mating dance of [pc.hisHer] again!”</i>");
				goblin.orgasm();
				goblin.lust(35);
				goblin.removeStatusEffect("Gabilani_Fucking");
				this.removeStatusEffect("Gabilani_Fucking");
			}
		}
	}
}
