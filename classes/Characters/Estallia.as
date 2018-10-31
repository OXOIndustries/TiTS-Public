package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GLOBAL;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Guns.Vanquisher;
	import classes.Items.Melee.Shortsword;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Accessories.FlashGoggles;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Estallia extends Creature
	{
		//constructor
		public function Estallia()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "The War Queen";
			this.originalRace = "myrmedion";
			this.a = "";
			this.capitalA = "";
			this.long = "";
			this.customBlock = "Her defenses easily absorbs the attack.";
			this.isPlural = false;
			
			isLustImmune = false;
			
			rangedWeapon = new Vanquisher();
			meleeWeapon = new Shortsword();
			meleeWeapon.baseDamage.kinetic.damageValue = 40;
			
			this.armor.longName = "thick chitin";
			this.armor.defense = 25;
			this.armor.hasRandomProperties = true;
			
			this.shield = new BasicShield();
			this.shield.shields = 250;
			this.shield.resistances.kinetic.resistanceValue = 50.0;
			this.shield.resistances.electric.resistanceValue = 0.0;

			this.physiqueRaw = 50;
			this.reflexesRaw = 40;
			this.aimRaw = 30;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 40;
			this.libidoRaw = 50;
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 50.0;
			baseHPResistances.electric.damageValue = 0.0;
			baseHPResistances.tease.damageValue = 90.0;
			baseHPResistances.pheromone.damageValue = 90.0;
			baseHPResistances.drug.damageValue = 90.0;
			
			this.level = 9;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 100;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
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
			this.hipRatingRaw = 6;
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
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 10;
			
			isUniqueInFight = true;
			btnTargetText = "War Queen";
			
			this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			sexualPreferences.setRandomPrefs(5, 0);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS, GLOBAL.REALLY_LIKES_SEXPREF);
			
			var foo:int = rand(3);
			switch(foo){
				case 0:	inventory.push(new Picardine()); break;
				case 1:	inventory.push(new Kirkite()); break;
				case 2:	inventory.push(new Satyrite()); break;
			}
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ESTALLIA";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{	
			if(hasStatusEffect("Enraged") && statusEffectv1("Enraged") <= 0)
			{
				removeStatusEffect("Enraged");
				physiqueMod -= 15;
			}
			else if (hasStatusEffect("Enraged")) addStatusValue("Enraged", 1, -1);
			
			var target:Creature = hostileCreatures[0];
			var attacks:Array = new Array();
			
			//If ally died last turn 50% chance to trigger a retaliation attack
			if(rand(2) == 0 && (flags["FEDERATION_QUEST_HOT"] == 1 || flags["FEDERATION_QUEST_REVENGE"] == 1))
			{
				if(flags["FEDERATION_QUEST_HOT"] == 1) attacks.push(hot);
				if(flags["FEDERATION_QUEST_REVENGE"] == 1) attacks.push(revenge);
				flags["FEDERATION_QUEST_HOT"] = 0;
				flags["FEDERATION_QUEST_REVENGE"] = 0;
				if(attacks.length > 0)
				{
					var attack:* = attacks[rand(attacks.length)];
			
					if(attack == revenge) attack(hostileCreatures);
					else attack(target);
					
					return;
				}
			}
			
			flags["FEDERATION_QUEST_HOT"] = 0;
			flags["FEDERATION_QUEST_REVENGE"] = 0;
					
			if(!(target.hasStatusEffect("Staggered") && target.hasStatusEffect("Sundered"))) attacks.push(reavingBlow);
			if(!target.hasStatusEffect("Blinded")) attacks.push(debrisRain);
			attacks.push(doubleWhammy);
			
			attacks[rand(attacks.length)](target);
		}
		
		public function doubleWhammy(target:Creature):void
		{
			output("Estallia comes at you, swinging her massive swords. They’re like steel beams, coming with such force that even her misses and feints cause havoc on the battlefield around her!");
			var hits:int = 0;
			aimMod -= 15;
			for(var i:int = 0; i < 2; i++)
			{
				if(combatMiss(this, target))
				{
					output("\nEstallia misses with a powerful swing! ");
				}
				else
				{
					hits++;
					output("\nShe lands a hit on you with one of her massive blades! ");
					applyDamage(damageRand(meleeDamage(), 10), this, target, "minimal");
					if((hits == 2 && target.physique()/2 + rand(20) + 1 <= this.physique()/2 + 3) && !target.isPlanted())
					{
						output("\nThe force of getting slammed twice leaves you reeling! ");
						CombatAttacks.applyStagger(target, 1);
					}
				}
			}
			aimMod += 15;
		}
		
		public function reavingBlow(target:Creature):void
		{
			output("The queen throws herself at you with a bellowing warcry, swinging both swords overhead and bringing them down on you with all her might. ");
			if(combatMiss(this, target))
			{
				output("Luckily, you manage to duck out of the way before they hit! ");
			}
			else
			{
				output("The crushing blow leaves you reeling! ");
				applyDamage(damageRand(meleeDamage(), 10), this, target, "minimal");
				if(!target.isPlanted()) CombatAttacks.applyStagger(target, 1, true);
				CombatAttacks.applySunder(target, 1, true);
			}
		}
		
		public function debrisRain(target:Creature):void
		{
			output("Estallia swings herself around, using the momentum of her towering body and the blade of one of her oversized swords to sweep the floor, sending a hail of debris and shrapnel smashing into you! ");
			if(target.accessory is FlashGoggles) output(" Your goggles shield your eyes from the attack and you avoid being blinded from the blast.");
			else if(target.hasBlindImmunity()) output(" Your eyes are unaffected by the attack and you avoid being blinded from the blast.");
			else if(target.reflexes()/2 + rand(20) + 1 <= this.reflexes()/2 + 3)
			{
				output("You manage to duck behind cover and shield your eyes, avoiding the worst of the blast.");
			}
			else
			{
				output("You get hit full on the face with a blinding cacophony of metal detritus.");
				CombatAttacks.applyBlind(target, 1, true);
			}
			applyDamage(damageRand(rangedDamage().multiply(.85), 10), this, target, "minimal");
		}
		
		private function revenge(hostileCreatures:Array):void
		{
			output("<i>“No!”</i> the War Queen bellows, snarling at you and your comrades. <i>“I will not allow my daughters to perish here! Not to the likes of you!”</i>");
			output("\n\nShe follows up with a mighty swipe of her swords, slicing them in wide arcs across the battle lines!");
			for (var x:int = 0; x < hostileCreatures.length; x++) if(hostileCreatures[x].HP() > 0)
			{
				if(rand(100) > 40 && !combatMiss(this, hostileCreatures[x]))
				{
					output("\n");
					applyDamage(damageRand(meleeDamage(), 10), this, hostileCreatures[x]);
				}
				else
				{
					var eName:String = hostileCreatures[x].getCombatName() + (hostileCreatures[x].getCombatName() == "red commando" ? " "+String.fromCharCode((flags["FEDERATION_QUEST_AMBUSH"] == 1? 64 : 65)+x) : "");
					output("\n"+eName.substring(0, 1).toUpperCase()+eName.substring(1, eName.length)+" dodge" + (eName == "you" ? "" : "s") + " behind cover.");
				}
			}
		}
		
		private function hot(target:Creature):void
		{
			output("Seeing one of her shield-wielding daughters go down, Estallia pushes the unconscious body back behind the lines and takes up her fallen daughter’s shield in one of her four arms. <i>“Damn you all! Damn you all to hell!”</i>");
			if(!hasStatusEffect("Enraged")) physiqueMod += 15;
			createStatusEffect("Enraged",1, 0, 0, 0, false, "OffenseUp", "The Queen’s anger is making her stronger!\nPhysique increased.", true, 0, 0xFFFFFF);
			if(!hasStatusEffect("Shielded"))
			{
				createStatusEffect("Shielded",1, 0, 0, 0, false, "DefenseUp", "The Queen’s salvaged shield is providing additional protection!\nArmor increased.", true, 0, 0xFFFFFF);
				armor.defense += 3;
			} 
			else if(statusEffectv1("Shielded") < 2)
			{
				addStatusValue("Shielded", 1, 1);
				armor.defense += 3;
			}
		}
		
		public function attemptTranq():void
		{
			var pc:PlayerCharacter = kGAMECLASS.pc;
			var hit:Boolean = false;
			
			if(pc.physique() > pc.reflexes()) hit = (pc.physique()/2 + rand(20) + 1 < this.physique()/2 + 8);
			else hit = (pc.reflexes()/2 + rand(20) + 1 < this.reflexes()/2 + 13);
			
			kGAMECLASS.clearOutput();
			output("You take the tranquilizer syringe from your pack, gripping it tightly and stalking forwards towards the War Queen. She braces her blades, ready to meet your assault as you lunge forward, going for the big swathe of bare, bronze flesh of her toned belly. Estallia’s blades come swinging, making a barrier of scything iron between you and her.");
			
			if(hit)
			{
				output("\n\nYou dodge and weave between the whirling blades, managing to slide around behind the queen for a brief moment -- just long enough to jump onto her thick abdomen and reach around, jabbing the long needle into the chitin-free skin beneath one of her mammoth breasts. She gasps from shock, if not from actual pain, and shakes her flush backside to throw you free. You go flying, slamming into one of the stacks of crates across the factory.");
				output("\n\nBy the time you’ve got your footing back, Estallia is already feeling the effects of the drugs: you can see her gold-hued skin flushing darkly, and her chest is rising and falling with quick, erratic breaths. She staggers forward, forced to use one of her swords to keep her balance.");
				output("\n\n<i>“Dishonorable wretch!”</i> the War Queen growls, fighting back the liquid fatigue searing through her veins. <i>“I’ll not... go down... so easily! I will not yield!”</i>");
				output("\n\nShe roars and surges up to her feet, brandishing her blades with feral determination.");
				pc.removeKeyItem("Myr Heavy Tranquilizer Dart");
				createStatusEffect("Tranq'd",0, 0, 0, 0, false, "DefenseDown", "The Queen is under the influence of the Myr Heavy Traquilizer Dart!\nPhysique and reflexes significantly decreased.\nLust vulnerability massively increased.", true, 0, 0xFFFFFF);
				physiqueMod -= physiqueRaw/2;
				reflexesMod -= reflexesRaw/2;
				armor.defense /= 2;
				libidoMod += 25;
				baseHPResistances.tease.damageValue = -50.0;
				baseHPResistances.pheromone.damageValue = -50.0;
				baseHPResistances.drug.damageValue = -50.0;
			}
			else
			{
				output("You duck and weave, trying to evade the barrage of sweeping blades between you and the queen -- and you almost do, until a backswing with the flat of one of her blades comes crashing into you, almost accidentally, throwing you back and down against the ground.");
				applyDamage(meleeDamage(), this, pc, "minimal");
				output("\n\nThe queen sneers as you slide back across the ground, hefting her blade onto her shoulder. While she’s distracted by her gloating, you check the syringe and make sure it’s still alright. At least you’ve still got a chance!");				
			}
			
			CombatManager.processCombat();
		}
	}
}