package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Protection.ArcticWarfareBelt;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Guns.HammerPistolScavenged;
	import classes.Items.Melee.YappiStrap;
	import classes.Items.Armor.InsulatedCoat;
	import classes.Items.Upgrades.HardLightUpgrade

	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	public class StormguardMale extends Creature
	{
		//constructor
		public function StormguardMale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "storm lancer";
			this.originalRace = "cundarian";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The storm lancer pulls aside!";
			this.isPlural = false;

			this.meleeWeapon.attackVerb = "strike";
			this.meleeWeapon.longName = "storm lance";
			this.meleeWeapon.attackNoun = "thrust";
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.baseDamage.electric.damageValue = 5;
			this.meleeWeapon.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);

			this.rangedWeapon = new HammerPistolScavenged();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.baseDamage.kinetic.damageValue = 5;
			
			this.shield = new ArcticWarfareBelt();
			this.shield.shields = 200;
			this.shield.hasRandomProperties = true;
				
			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 80.0;
			baseHPResistances.electric.damageValue = 20.0;
			baseHPResistances.corrosive.damageValue = -15.0;
			baseHPResistances.pheromone.damageValue = 50.0;
			baseHPResistances.burning.damageValue = 10.0;

			//armorbutt
			this.armor.longName = "stormguard mail";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;
			
			//wat shield - randomized below.
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 40;
			this.reflexesRaw = 35;
			this.aimRaw = 35;
			this.intelligenceRaw = 110;
			this.willpowerRaw = 35;
			this.libidoRaw = 15;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 8;
			this.XPRaw = normalXP();
			//Credits set below.
			this.credits = 200;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 0;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "yellow";
			this.tallness = 7*12+6; //between 4'6"-5'6" (mid-upper of range in codex)
			this.thickness = 62;
			this.tone = 80;
			this.hairColor = "dirty blonde";
			this.hairType = GLOBAL.HAIR_TYPE_TENTACLES;
			this.scaleColor = "blue";;
			this.furColor = "tan";
			this.hairLength = 8;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "slate-blue";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.armFlags = [];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_EQUINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_HOOVES, GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 4;
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
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cockColor = "gray";

			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			this.cocks[0].cLengthRaw = 14;
			this.vaginas = new Array();
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.cockVirgin = false;
			//balls
			this.balls = 4;
			this.cumMultiplierRaw = 20;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 2;
			this.cumType = GLOBAL.FLUID_TYPE_CUNDARIAN_SEED;
			this.ballSizeRaw = 12;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 80;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 420;
			this.timesCum = 3500;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 35;
			
			isUniqueInFight = true;
			btnTargetText = "S.Lancer";
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//this.createStatusEffect("Disarm Immune");
			
			randomise();
			//kGAMECLASS.uvetoSSTDChance(this);
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			//this.furColor = RandomInCollection(["white","tawny","gray-speckled"]);
			return "STORMGUARD_MALE";
		}
		private function randomise():void
		{
			//"Hard" level preferences.
			//sexualPreferences.setRandomPrefs(4 + rand(3),2);
			
			//Korg love 'dem hips
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS, GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS, GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE, GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_DISLIKES_SEXPREF);

			descUpdate();
			credits = 200+rand(100);
		}
		public function descUpdate():void
		{
			if(kGAMECLASS.flags["MET_GEL_ZON"] != undefined)
			{
				short = "Gel Zon";
				a = "";
				capitalA = "";
			}
			this.long = "You are battling ";
			if(kGAMECLASS.flags["MET_GEL_ZON"] != undefined) long += "Gel Zon ";
			long += "the storm lancer. He is a 6\' 3\" slate-blue cundarian armed with a heavy kinetic pistol and a storm lance, clad everywhere except his head, his blunt three-foot-long tail and the tips of his black hooves in sleek white armor, emblazoned with lightning bolts.";
			if(!this.hasStatusEffect("Flying")) long += " Right now those hooves are firmly planted into the snow, his jetpack deactivated.";
			else 
			{
				long += " Right now those hooves are dangling thirteen feet above the ground - his jetpack is blazing blue fire from its exhaust pipe, and he is bobbing skilfully in the air, snow whipping around him.";
				if(kGAMECLASS.pc.canFly()) long += " Possibly you could use your [pc.wings] to get at him up there - but the weather and the thought of one of his bullets hitting them keeps you from attempting it.";
			}
			long += "\n\nEven beneath that sleek, heavy carapace, there’s no disguising the bulky hills of muscle that roll down his arms and pad out his chest and backside, the physique of a male who evidently adores outdoor survival and heavyweight fighting. Small tentacles dangle from his strong chin and jaw - thicker ones flow back from his ridged brow and scalp. His flat-nosed profile speaks of a handsome dude who’s taken a fair few hefty blows to the face during the course of his life.";
			if(kGAMECLASS.flags["SEXED_SG_MALE"] != undefined) long += " In his armored skivvies you know that he has a thick, fourteen inch dick with blunt ridges along the bottom, as well as a quad of foam-bloated testicles.";
		}
		//combat A.I. and characteristics:
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			//Timers:
			if(hasStatusEffect("Stormguard Determination")) addStatusValue("Stormguard Determination",1,-1);
			if(hasStatusEffect("Flying")) addStatusValue("Flying",1,1);
			if(hasStatusEffect("Shield CD")) addStatusValue("Shield CD",1,-1);
			if(statusEffectv1("Shield CD") <= 0) removeStatusEffect("Shield CD");
			
			//Conan MAD - all he does once shot down
			if(hasStatusEffect("Shot Down")) 
			{
				kronanTheBarbarianMad(target);
				return;
			}
			else if(this.lust() >= 70 && statusEffectv1("Stormguard Determination") <= 0) 
			{
				iceMonkHarlot(target);
			}
			//Shield regen for honor2 folks.
			else if(kGAMECLASS.stormguardHonor() == 2 && this.shields() <= 0 && statusEffectv1("Shield CD") <= 0) lightningRodHonor2(target);
			//We have liftoff.
			else if(hasStatusEffect("Flyaway") && !hasStatusEffect("Flying")) jetpackHOOOOOOO(target);
			//Disarmed!
			else if(hasStatusEffect("Disarmed")) disarmedRecovery(target);
			//Zoomies!
			else if(hasStatusEffect("Flying")) 
			{
				if(statusEffectv1("Flying") >= 3)
				{
					stormLanceInAir(target);
				}
				else if(rand(2) == 0) pewpewSG(target);
				else stormyJav(target);
			}
			//Not zoomie!
			else
			{
				if(rand(2) == 0) 
				{
					if(kGAMECLASS.stormguardHonor() == 2) coveringChargeMk2(target);
					else coveringChargeFromStormoLancer(target);
				}
				else thunderboltAttack(target);
			}		
			descUpdate();	
		}
		//Jetpack status: If storm lancer has jetpack active, PC cannot use melee attacks against him. Jetpack has one turn cooldown after it is deactivated. PC can shoot at his jetpack at greatly decreased accuracy - makes him crash

		//Attacks Pt. 1
		//I’m an Ice Monk, Harlot
		//Activates if lust reaches 70. Lust reduced by 50, lust resistance increased by 50% for next 3 rounds. Returns to ground if in air. 3 round cooldown.
		public function iceMonkHarlot(target:Creature):void
		{
			if(!hasStatusEffect("IceMonkey")) 
			{
				output("<i>“Cheap, whorish tricks!”</i> " + (kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon cries" : "cries the storm lancer") + " in outrage, face noticeably reddened. <i>“But if you refuse to fight like a warrior should, I am prepared.”</i> He closes his yellow eyes");
				if(hasStatusEffect("Flying"))
				{
					this.removeStatusEffect("Flying");
					output(", slowly sinks back down to the ground");
				}
				output(" and inhales deeply. A calm, self-possessed expression appears on his face.");
				this.createStatusEffect("IceMonkey");
			}
			else
			{
				output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " grits his teeth, face red, but this time doesn’t verbally respond to your lusty offensive. Instead he closes his yellow eyes");
				if(hasStatusEffect("Flying"))
				{
					this.removeStatusEffect("Flying");
					output(", slowly sinks back down to the ground");
				}
				output(" and inhales deeply. A calm, self-possessed expression once again appears on his face.");
			}
			//Fen note: instead of doing 3 round resistance (which isnt very transparent and doesnt have much point considering he can do it again 3 rounds, just raise his lust resistance overall and put non-functional status effect to alert the player.
			this.lust(-50);
			if(baseHPResistances.tease.damageValue < 50) baseHPResistances.tease.damageValue = 50;
			if(!hasStatusEffect("Stormguard Determination")) createStatusEffect("Stormguard Determination",3,0,0,0, false, "Icon_LustDown", "Increased resistance to tease attacks (+50%)!", true, 0, 0xFFFFFF);
		}
		//It Begins
		//Activates if PC successfully hits him with a melee attack. Activates Jetpack status
		public function jetpackHOOOOOOO(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " takes a step back, staggered slightly by your attack");
			if(this.shields() > 0) output(", even if it did thwack off his shield");
			output(". He grins at you, chest heaving, almost seeming to delight in your successful strike - and then the next instant his jetpack roars into life, and he shoots upward upon a plume of blue flame.");
			output("\n\n<i>“Are hard blows all you have, challenger?”</i> he roars over the howling wind. <i>“I hope not, for your sake!”</i>");
			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);
			removeStatusEffect("Flyaway");
		}
		//Pew Pew
		//Activates only if jetpack active
		public function pewpewSG(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " steadies himself in the wind and and then fires his heavy pistol at you twice with two deafening CRACKs.");
			if(rangedCombatMiss(this, target)) output(" You dodge the shots!");
			//Else fuck this shiiiit
			else
			{
				var oldShields:Number = target.shields();
				var damage:TypeCollection = rangedDamage();
				damageRand(damage, 15);
				//applyDamage(damage, this, target, "minimal");
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				if(target.shields() > 0) output(" The shot blats off your shield!");
				else if(oldShields > 0 && target.shields() <= 0) output(" The shot shatters your shield and smashes into you!");
				else output(" The shot pelts into your frame with numbing, deadening force.");
				outputDamage(damageResult);
			}
		}
		//Storm Javelin
		//Activates only if jetpack active
		public function stormyJav(target:Creature):void
		{
			output("The air hums and static charge crawls up your [pc.skin] as " + (kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "the storm lancer") + " hefts his brass-clad spear and thrusts it at you. ");
			if(combatMiss(this, target)) output("You flatten yourself to the ground and the lightning flares overhead, vaporizing all the snow off a rock mound instead.");
			else
			{
				output("Fierce light burns onto your [pc.eyes] as lightning blasts out of it, connecting you to the lance’s tip for one horrible, jarring moment.");
				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
			}
		}
		//Storm Lance
		//Always does this after two or more turns in the air. High damage, induces knockdown. Deactivates jetpack
		public function stormLanceInAir(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " reels back on the sputtering flame of his jetpack, and for a moment you lose sight of him in the ceaseless blizzard. Suddenly he’s thundering down from an angle, roaring out some wild, wordless battle-cry, his crackling lance pointed directly at you! ");
			if(combatMiss(this, target)) 
			{
				output("You hold yourself steady until the very last moment before flinging yourself to one side, the huge weight and impetus of the cundarian flying just past your head, like narrowly avoiding being flattened by a heavy goods vehicle.");
				output("\n\n<i>“Brilliant dodge!”</i> roars your opponent, thumping down on the snow behind you, his <b>jetpack extinguished</b>. His face is tight with joy as he charges back towards you, weapons flashing.");
			}
			else
			{
				output("You try and dodge him but the cundarian has got you locked in, and he smashes into you with all the force of a small, hefty, electrically charged meteor. The only thing that stops you taking serious injury is being flung about ten feet backwards into a snow drift.");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(2);
				applyDamage(damage, this, target, "minimal");

				//if trip:
				if (!target.hasStatusEffect("Tripped") && !target.isPlanted() && this.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10)
				{
					CombatAttacks.applyTrip(target);
					output("\n\nYou’re <b>tripped!</b>");
				}
				output("\n\n<i>“An attack worthy of finishing any battle!”</i> crows your opponent triumphantly.");
			}
			this.removeStatusEffect("Flying");
		}
		//Covering charge
		//Jetpack deactivated only. Low acc kinetic shot, high acc electric melee
		public function coveringChargeFromStormoLancer(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " pushes forward, head down and pistol-holding hand up, taking instinctive shots at you as he closes the gap.");
			if(rangedCombatMiss(this, target) || rangedCombatMiss(this, target) || rangedCombatMiss(this, target)) output(" The shots go wide.");
			else
			{
				var oldShields:Number = target.shields();
				var damage:TypeCollection = rangedDamage();
				damageRand(damage, 15);
				//applyDamage(damage, this, target, "minimal");
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				if(target.shields() > 0) output(" A shot blats off your shield!");
				else if(oldShields > 0 && target.shields() <= 0) output(" A shot shatters your shield and smashes into you!");
				else output(" A shot pelts into your frame with numbing, deadening force.");
				outputDamage(damageResult);
			}
			output("\n\nOnce close enough, he throws his whole frame into stabbing at you with his spear, energy coruscating off of it. ");
			if(combatMiss(this, target)) output("You deftly twist your body to avoid its seeking point.");
			else
			{
				var oldShields2:Number = target.shields();
				var damage2:TypeCollection = meleeDamage();
				damageRand(damage2, 15);
				var damageResult2:DamageResult = calculateDamage(damage2, this, target);
				//applyDamage(damage2, this, target, "minimal");
				if(target.shields() > 0) output(" Your shield thankfully pushes it wide.");
				else if(oldShields2 > 0 && target.shields() <= 0) output(" The tip pierces your shield and thunks into you. Unnerving energy buzzes through your body.");
				else output(" The tip thunks painfully into you. Unnerving energy buzzes through your body.");
				outputDamage(damageResult2);
			}
		}
		//Thunderbolt
		//Jetpack deactivated only. Electric ranged, chance to induce stun
		public function thunderboltAttack(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " circles you, hooves crunching into the snow, before pointing his crackling, sparking brass spear directly at you.");
			if(combatMiss(this, target)) output(" You hurl yourself to one side to avoid the jagged arc of lightning aimed at you - it blasts apart a rock instead.");
			else
			{
				var oldShields:Number = target.shields();
				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 15);
				//applyDamage(damage, this, target, "minimal");
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				if(target.shields() > 0) output(" You try and dodge it, but the jagged arc of lightning naturally seeks you out - it discharges itself off your shield.");
				else 
				{
					output(" You try and dodge it, but the jagged arc of lightning naturally seeks you out - horrible, powerful pain buzzes right the way through you as it connects.");
					if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < 25)
					{
						CombatAttacks.applyStun(target, 1);
						output(" The blazing light and the unnerving power which just smacked into you is staggering, and for a few moments there’s nothing you can do but try and regain your shell-shocked wits.");
					}
				}
				outputDamage(damageResult);
			}
		}
		//Shoot Jetpack
		//Option displayed in combat options when Jetpack active. Take ranged shot at - 65% acc.
		//Tooltip: It’s possible you could shoot his jetpack from here. It’s a small target, he’s weaving around and the conditions are wretched, though...
		public function jetpackShot(pc:Creature):void
		{
			kGAMECLASS.clearOutput();
			output("You take a moment to carefully track your target, and then fire. ");
			if(rangedCombatMiss(pc, this) || rangedCombatMiss(pc, this) || rand(3) == 0)
			{
				output("The shot narrowly whiffs past his broad shoulder.");
			}
			else
			{
				output("The shot flashes as it hits him somewhere on the back of his armor. It’s impossible to tell if you got him through the driving snow... a wail of failing micro-engines reaches your ears as the blue flame guttering beneath " + (kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "the storm lancer") + " sputters and then winks out. He bellows in alarm, hands clawing the air as he falls a good twelve feet, landing with a heavy, wince-inducing thud into the snow.");
				var damage:TypeCollection = new TypeCollection( { kinetic: 55+rand(5) });
				applyDamage(damage, pc, this, "minimal");
				//Does him: 
				if(this.HP() <= 0) output("\n\n<b>If he’s getting back up from that, you’re a monkey’s uncle.</b>");
				//Go to ground defeat
				else
				{
					output("\n\n<i>“Aargh...”</i> he groans, slowly clambering back to his feet. He glowers at you, weapons still clutched in his fists. <i>“You’re a smart shot, [pc.race]. But I can defeat you on land just as surely as in the sky!”</i>");
				}
				this.removeStatusEffect("Flying");
				this.removeStatusEffect("Flyaway");
				this.createStatusEffect("Shot Down");
			}
			CombatManager.processCombat();
		}
		//Attacks Pt. 2
		//When Honor 2 only.
		//Lightning Rod
		//Activates if shields = 0 on last turn. Recharges shield to 75%. 4 turn cooldown.
		public function lightningRodHonor2(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " cranes his spear behind him, as if attempting to scratch his back. For one moment you think he’s going to holster his weapon - then he taps his armor carefully with the crackling tip, and there’s a static buzz as the barely-perceptible bubble of his energy shield reasserts itself around him.");
			output("\n\n<i>“So easy to fry yourself or your equipment doing that,”</i> he grunts, ");
			if(this.hasStatusEffect("Flying")) output("circling you in the air");
			else output("prowling around you in the snow");
			output(". <i>“But fearsome opponents call for all-or-nothing tactics!”</i>");
			this.createStatusEffect("Shield CD",4,0,0,0);
			this.changeShields(150);
		}
		//Covering Charge Mk2
		//Becomes medium acc kinetic shot, high acc energy melee, low chance to cause stun
		public function coveringChargeMk2(target:Creature):void
		{
			output((kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "The storm lancer") + " charges forward, head down and pistol-holding hand up, taking shots that seem to follow your every movement.")
			if(rangedCombatMiss(this, target) || rangedCombatMiss(this, target)) output(" The shots go wide.");
			else
			{
				var oldShields:Number = target.shields();
				var damage:TypeCollection = rangedDamage();
				damageRand(damage, 15);
				//applyDamage(damage, this, target, "minimal");
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				if(target.shields() > 0) output(" A shot blats off your shield!");
				else if(oldShields > 0 && target.shields() <= 0) output(" A shot shatters your shield and smashes into you!");
				else output(" A shot pelts into your frame with numbing, deadening force.");
				outputDamage(damageResult);
			}
			output("\n\nOnce close enough, he throws his momentum into stabbing at your solar plexus with his spear, energy coruscating off of it.");
			//High accuracy requires DOUBLEMISS gum
			if(combatMiss(this, target) && combatMiss(this, target)) output(" You deftly twist your body to avoid its seeking point.");
			else
			{
				var oldShields2:Number = target.shields();
				var damage2:TypeCollection = meleeDamage();
				damageRand(damage2, 15);
				//applyDamage(damage2, this, target, "minimal");
				var damageResult2:DamageResult = calculateDamage(damage2, this, target);
				if(target.shields() > 0) output(" Your shield thankfully pushes it wide.");
				else if(oldShields2 > 0 && target.shields() <= 0) output(" The tip pierces your shield and thunks into you. Unnerving energy buzzes through your body.");
				else output(" The tip thunks painfully into you. Unnerving energy buzzes through your body.");
				outputDamage(damageResult2);
				if(target.physique()/2 + rand(20) + 1 < 22) 
				{
					CombatAttacks.applyStun(target, 1);
					output("\n<b>You are stunned!</b>");
				}
			}
		}
		//Storm Javelin Mk2
		//Gains chance to reduce energy by 20
		//Studied Your Moves, Senpai
		//Activates if PC uses any form of special offensive ability twice in a row. Before PC uses it subsequently: +60 thermal resist, +60 energy resist, +60 kinetic resist, +60 stun resist, +60 corrosive resist, +60 freezing resist. Does not substitute SL’s own attack
		public function stormJavelinMk2(target:Creature):void
		{
			output("As you prep your attack for the second time, " + (kGAMECLASS.flags["MET_GEL_ZON"] != undefined ? "Gel Zon" : "the storm lancer") + " suddenly ducks his ridged head behind his arms");
			if(hasStatusEffect("Flying")) output(", falls to the ground");
			output(" and curls himself into a tight ball!");
			//<insert standard ability text here.> 
			output(" The heavy, lightning-embossed armor of the storm lancer absorbs most of the blow.");
			output("\n\n<i>“Your attacks may be fierce, but they’re also predictable, warrior!”</i> he booms triumphantly,");
			if(!hasStatusEffect("Flying")) output(" rising swiftly from the snow.");
			else output(" re-opening his limbs and weaving through the air.");
		}
		public function disarmedRecovery(target:Creature):void
		{
			if(!hasStatusEffect("Disarmed1"))
			{
				if(kGAMECLASS.flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
				else output("The storm lancer");
				if(hasStatusEffect("Flying"))
				{
					output(" zips down to recover his fallen weapons, rooting about in the snow.");
				}
				else output(" roots around in the snow, trying to find his weapons.");
				createStatusEffect("Disarmed1");
			}
			else
			{
				if(kGAMECLASS.flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
				else output("The storm lancer");
				output(" recovers his weapons!");
				this.removeStatusEffect("Disarmed1");
				this.removeStatusEffect("Disarmed");
			}
		}
		//Activates if PC shoots him down. All he will do for remainder of battle. Heavy damage kinetic melee, + 15 kinetic resistance
		public function kronanTheBarbarianMad(target:Creature):void
		{
			var damage:TypeCollection = meleeDamage();
			damage.multiply(2.5);
			//First time!
			if(!hasStatusEffect("Enraged"))
			{
				if(kGAMECLASS.flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
				else output("The storm lancer");
				output(" bellows like a startled buffalo as he falls out of the sky, landing with a wince-inducing crump in the snow. He lies there unmoving for several moments, long enough for you to start thinking he’s done for the day. Then he claws himself back to his hoofs, wild rage in his eyes. Tentacles and tail swinging, he lets out a terrible, primordial war-cry that reverberates off the frozen hills and charges at you, throwing aside his weapons to strike at you with fists like barbells. ");
				if(combatMiss(this, target)) output("You retreat, staying just out of range of his savage blows.");
				else
				{
					output("His blows thud into you.");
					applyDamage(damage, this, target, "minimal");
				}
				createStatusEffect("Enraged", 0, 0, 0, 0, false, "Icon_Bull", "Raging. Deals extra physical damage and 15% more resistant to kinetic attacks.", true, 0);
			}
			else
			{
				output("Armored chest heaving and face wild, ");
				if(kGAMECLASS.flags["MET_GEL_ZON"] != undefined) output("Gel Zon");
				else output("the storm lancer");
				output(" continues to throw himself at you, relying on nothing but his berserk rage to batter you senseless. ");
				if(combatMiss(this,target)) output("You duck and dive, letting him waste his energy on thin air.");
				else
				{
					output("A mace-like fist smashes into you with bone-jarring force.");
					applyDamage(damage, this, target, "minimal");
				}
			}
		}
	}
}