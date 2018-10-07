package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Melee.SurvivalAxe;
	import classes.Items.Guns.MyrRifle;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;
	
	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class MyrRedFemaleDeserter extends Creature
	{
		public function MyrRedFemaleDeserter() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "red deserter";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "red";
			
			this.long = "You’re facing off against an amber-haired ant-girl armed with a hatchet and a handgun. Given her desecrated Scarlet Federation uniform - her country, name, and rank patches are all torn off - she’s definitely a deserter.\n\nHer shirt is torn wide open in a very un-red like manner. Her pert, small breasts are on display, though there’s a bullet scar just to the side of her heart. There’s another scar over her right eye, which she seems unable to fully close.\n\nHanging from both her gently curving hips are hand grenades. They’re attached to her belt, ready to unclick and throw at a moment’s notice.";
			this.customDodge = "The seasoned soldier throws herself sideways. Your attack misses her by an inch and she deftly tumbles back to her feet.";
			this.customBlock = "The female soldier brings up her hatchet and deftly parries your attack. Throwing you off, she then twirls the hand-axe in her hand.";
			this.isPlural = false;
			
			this.shield = new EmptySlot();
			this.meleeWeapon = new SurvivalAxe();
			this.rangedWeapon = new MyrRifle();
			rangedWeapon.longName = "heavy handgun";
			rangedWeapon.description = "a heavy handgun";
			rangedWeapon.attackVerb = "shoot";
			rangedWeapon.attackNoun = "shot";
			rangedWeapon.hasRandomProperties = true;

			armor.longName = "thick chitin";
			armor.defense = 5;
			armor.hasRandomProperties = true;
			
			this.physiqueRaw = 22;
			this.reflexesRaw = 18;
			this.aimRaw = 10;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 20;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 10.0;
			
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 50;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "amber";
			this.furColor = "amber";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "dusky red";
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
			
			this.breastRows[0].breastRatingRaw = 3;
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
			this.vaginas[0].loosenessRaw = 3;
			this.createPerk("Can Crit", 0, 0, 0, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Red Myr";
			
			credits = rand(200);
			if (rand(20) == 0) inventory.push(new Kirkite());
			else if(rand(20) == 0) inventory.push(new Satyrite());
			else inventory.push(new RedMyrVenom());
					
			sexualPreferences.setRandomPrefs(2 + rand(3),1);
			
			if (flags["KNOW_RED_MYR_NAME"] != undefined)
			{
				short = "Briha";
				a = "";
				capitalA = "";
			}
			//kGAMECLASS.myrellionSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if(kGAMECLASS.flags["BRIHA_INCUBATION_TIMER"] != undefined) return "BRIHA_PREGNANT";
			else return "BRIHA";
		}
		
		override public function isPregnant(x:int = 0):Boolean
		{
			if(kGAMECLASS.flags["BRIHA_INCUBATION_TIMER"] != undefined) return true;
			return false;
		}
		
		override public function bellyRating():Number
		{
			if(!isPregnant() || kGAMECLASS.flags["BRIHA_INCUBATION_TIMER"] > 90) return 0;
			return (11 + Math.round(kGAMECLASS.flags["BRIHA_INCUBATION_TIMER"]/1.5));
		}
		
		override public function bellyDescript(bForceSize:Boolean = false):String
		{
			var sBuilder:String = "";

			var belly:Number = bellyRating();

			var sizeDescripts:Array = new Array();
			var pregDescripts:Array = new Array();

			//engorged, swollen, stuffed
			//cumflated only: cum-bloated (could even be wildcarded for honeycum or other things, depending on your tracking), cum-inflated, sloshing,
			if(isPregnant())
			{
				if(belly < 10) {
					pregDescripts[pregDescripts.length] = "squishy";
				}
				else if(belly < 20)
				{
					pregDescripts[pregDescripts.length] = "fruitful";
					pregDescripts[pregDescripts.length] = "fecund";
				}
				else
				{
					pregDescripts[pregDescripts.length] = "expectant";
					pregDescripts[pregDescripts.length] = "pregnant";
				}
				if(belly >= 50)
				{	
					pregDescripts[pregDescripts.length] = "gravid";
				}
			}
			else
			{
				// Only show these if she ISN'T pregnant (I have no idea if she ever is, but yeah)
				sizeDescripts[sizeDescripts.length] = "toned";
				sizeDescripts[sizeDescripts.length] = "sculpted";
				sizeDescripts[sizeDescripts.length] = "flat";
				sizeDescripts[sizeDescripts.length] = "slim";
			}
			
			//Bonus pregsizes
			if(isPregnant() && belly > 50)
			{
				sizeDescripts[sizeDescripts.length] = "stuffed";
				sizeDescripts[sizeDescripts.length] = "swollen";
			}
			//Size: 50%
			if(rand(2) == 0)
			{
				if(sizeDescripts.length > 0) sBuilder += sizeDescripts[rand(sizeDescripts.length)];
				//Pregnant stuff & Size: 50% or 25% overall odds.
				if(isPregnant() && pregDescripts.length > 0 && rand(2) == 0)
				{
					sBuilder += ", ";
					sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
				}
				else sBuilder += " ";
			}
			//Pregnant Stuff - 25% chance (note there's a 25% chance of occurring with belly size for 50% total)
			else if(isPregnant() && pregDescripts.length > 0 && rand(2) == 0)
			{
				sBuilder += pregDescripts[rand(pregDescripts.length)] + " ";
			}
			
			//Noun selection:
			if(belly < 10 && rand(4) == 0) sBuilder += "midriff";
			else if(belly < 20 && rand(3) == 0) sBuilder += "middle";
			else sBuilder += "belly";
			
			return sBuilder;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(lust()/lustMax()*100 >= rand(100+1)) antGrillLustAttacku(target);
			//’Melee Strike’, ‘Shoot’, ‘Barrage’, or ‘Grenade Throw’. The other third of the time, they do lust attacks.
			else if(energy() >= 33 && rand(4) == 0) grenadeThrow(target);
			else if(rand(3) == 0) myrDeserterStrike(target);
			else if(rand(2) == 0) myrDeserterBarrage(target);
			else myrDeserterShot(target);
		}
		
		private function myrDeserterStrike(target:Creature):void
		{
			output("The battle-scarred beauty shoots a handful of bullets at you. When you’re dodging those, she darts in and lashes out with her hand-axe.");

			if (combatMiss(this, target)) output("\nHer feint fails - you duck under her slicing blow and scamper out of the way. She reloads her gun with a loud click and a focused stare.");
			else
			{
				output("\nHer feint succeeds - she lands a blow with her blade!");
				// ShieldUp: and your shield crackles in protest!
				// else: and you swear loudly. There’s no shield to stop her strikes!
				applyDamage(meleeDamage(), this, target, "melee");
			}
		}

		//Shoot
		private function myrDeserterShot(target:Creature):void
		{
			//Red/Briha:
			output("The red deserter pulls back the jointed lock of her semi-auto handgun. After lining you up in her iron sights, she shoots.");

			if (rangedCombatMiss(this, target)) 
			{
				output("\nHer attack falls far short of hitting you. Instead, her bullet whizzes past harmlessly.");
			}
			else
			{
				output("\nThere’s a ringing shot and a dull ache of impact");
				if(target.shields() > 0) output(", even through your shields.");
				applyDamage(rangedDamage(), this, target, "ranged");

				//Physique check. DC 25 vs trip!
				if((target.physique + rand(20) + 1 < 25 && target.shields() <= 0) && !target.isPlanted())
				{
					output("\nA hot, burning sensation sprays out from your chest. Your [pc.legs] go weak and you fall to the ground.");
					//Effect: Decent physical damage with small crit chance. If the PC’s shields are down, there is a 25% knockback chance. 100% knockback chance on crit.
					CombatAttacks.applyTrip(target);
				}
			}
		}

		//Barrage
		private function myrDeserterBarrage(target:Creature):void
		{
			//Red/Briha:
			output("The grizzled soldier loads her semi-auto with a fresh magazine. After clicking back the arm-lock, she points it at you, and shoots repeatedly.\n");
			
			for (var i:int = 0; i < 3; i++)
			{
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
				output("\n");
			}
		}

		//Grenade Throw
		//Req 33+ energy!
		private function grenadeThrow(target:Creature):void
		{
			//Red/Briha:
			output("The scarlet-skinned soldier grabs one of the hand grenades from her lightly curved hip. With practiced precision, she lights the fuse, and tosses it at you.");

			if (rangedCombatMiss(this, target)) output("\nWith such shoddy vision, her grenade throw falls short of her mark. You dart back and easily dodge the resulting blast.");
			else
			{
				output("\nThere’s a loud ‘whump’ and a cloud of red mist swiftly engulfs you.");
				if (target.hasAirtightSuit())
				{
					output(" Fortunately for you, the smoke doesn’t leak through your airtight [pc.armor], but it obscures your vision just briefly.");
				}
				else
				{
					output("\nThere’s a loud ‘whump’ and a cloud of red mist swiftly engulfs you. Your skin prickles and your [pc.nipples] harden. Lower down, a glorious ache spreads through your [pc.groin]. All you want to do is touch yourself!");
					applyDamage(new TypeCollection( { drug: 19 + rand(5) } ), this, target, "minimal");
				}
			}
			energy(-33);
		}

		private function antGrillLustAttacku(target:Creature):void
		{
			//Lust Attack #1 (Both)
			if(rand(2) == 0)
			{
				output("With a sultry wink, the battle-scarred beauty runs her slender fingers down her torn top and tugs open her shirt. She flashes a scarlet-skinned breast and dark nipple at you. Even though it’s modestly sized, it’s perfectly round and cuppable!");
			}
			//Lust Attack #2 (Red Only)
			else
			{
				output("Spreading her legs, the battle-scarred beauty slides her hands between her thighs and tugs at the top of her pants. The upward pull forces the thin fabric to dig into her snatch. It forms the perfect camel toe, and a slight damp patch begins to form.");
			}
			
			//DC 25 willpower check!
			if(target.willpower()/2 + rand(20) + 1 >= 25)
			{
				output("\n\nYou resist her erotic enticements... for now.");
			}
			else
			{
				output("\n\nYou try to resist her erotic enticements to little avail!");
				applyDamage(new TypeCollection( { tease: 15 + rand(6) } ), this, target, "minimal");
			}
		}
	}

}
