package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Transformatives.LaquineEars;
	import classes.Items.Protection.JumperShield;
	import classes.Items.Armor.JumperJumpsuit;
	import classes.Items.Armor.JumperJumpsuitSlutty;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class ShockHopper extends Creature
	{
		//constructor
		public function ShockHopper()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Shock Hopper";
			this.originalRace = "laquine";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The Jumper’s second-in-command is a statuesque woman, blessed with a killer top-heavy hourglass figure that’s been seriously enhanced by a tight latex bodysuit. The suit’s a dark orange, polished to a shine and bears a tight corset around the midriff that only serves to further emphasize her bare cleavage. There’s very little of her baby-blue fur on display aside from her cheeks and chest, and much of her head is covered by a bright pink mohawk. She’s certainly got a colorful ensemble!";
			this.customBlock = "";
			this.customDodge = "She hops aside!";
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
			
			this.armor.longName = "orange bodysuit";
			this.armor.defense = 4;
			this.armor.hasRandomProperties = true;

			this.baseHPResistances.electric.damageValue = 100.0;
			this.baseHPResistances.burning.damageValue = 33.0;
			this.baseHPResistances.tease.damageValue = -33.0;

			this.shield = new JumperShield();
			this.shield.shields = 600;
			this.shield.defense = 5;
			this.shield.hasRandomProperties = true;
			this.shield.resistances = new TypeCollection();
			this.shield.resistances.kinetic.resistanceValue = 25.0;
			this.shield.resistances.electric.damageValue = 50.0;
			this.shield.resistances.burning.damageValue = 50.0;
			this.shield.resistances.corrosive.damageValue = 50.0;

			this.physiqueRaw = 47;
			this.reflexesRaw = 44;
			this.aimRaw = 27;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 25;
			this.libidoRaw = 75;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 50;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 12346;
			this.HPMod = 350;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "purple";
			this.tallness = 7*12+5;
			this.thickness = 33;
			this.tone = 75;
			this.hairColor = "pink";
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.scaleColor = "blue";
			this.furColor = "blue";
			this.hairLength = 13;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_LAPINE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_LAPINE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_LAPINE;
			this.armFlags = [GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_LAPINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE,GLOBAL.FLAG_PAWS,GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_LAPINE;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_FURRED);
			//this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			this.hipRatingRaw = 16;
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
			this.buttRatingRaw = 12;
			//No dicks here!
			this.cocks = new Array();
			this.cockVirgin = false;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 4;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 500;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 13;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 32;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 36;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 345;
			this.timesCum = 7771;

			this.elasticity = 1.25;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 19;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 600;
			this.ass.loosenessRaw = 3;
			
			isUniqueInFight = true;
			btnTargetText = "ShockHop";
			//this.impregnationType = "LapinaraPregnancy";
			kGAMECLASS.zhengShiSSTDChance(this);
			randomise();
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);

			this.createPerk("Shield Tweaks");
			this.createPerk("Enhanced Dampeners");
			this.createPerk("Shield Regen");
			this.createPerk("Rapid Recharge");
			
			this._isLoading = false;
		}
		//Not really that random given that she's a fixed boss but w/e

		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(3 + rand(3),0);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, GLOBAL.REALLY_LIKES_SEXPREF);

			this.createCock();
			//Hoss!
			this.cocks[0].cLengthRaw = 28;
			this.shiftCock(0,GLOBAL.TYPE_EQUINE);
			this.cocks[0].cockColor = "pink";
		}
		public function updateDesc():void
		{
			this.long = "The Jumper’s second-in-command is a statuesque woman, blessed with a killer top-heavy hourglass figure that’s been seriously enhanced by a tight latex bodysuit. The suit’s a dark orange, polished to a shine and bears a tight corset around the midriff that only serves to further emphasize her bare cleavage. There’s very little of her baby-blue fur on display aside from her cheeks and chest, and much of her head is covered by a bright pink mohawk. She’s certainly got a colorful ensemble!";
			//Post first use of lightning cannon:
			if(hasStatusEffect("GunOutBunsOut")) long += "\n\nThe buxom bunny has a massive arc gun slung under a shoulder, crackling with electric energy and discharging wildly as she holds down the trigger.";
			if(statusEffectv1("Busted") == 1) long += "\n\nThe Hopper’s got herself a pretty massive bulge in her loins, spent spunk sloshing freely around a throbbing boner. She’s almost ready to pop!";
			else if(statusEffectv1("Busted") == 2) long += "\n\nThe Hopper’s suit has been blown open by her own overmodded sperminess, rupturing the loins and leaving her balls and cock spraying all over. Guess she should have picked a more elastic material!";
		}
		
		override public function get bustDisplay():String
		{
			return "SHOCK_HOPPER";
		}
		override public function isDefeated():Boolean
		{
			//Once twice busted, as normal
			if (this.statusEffectv1("Busted") == 2) return super.isDefeated();
			//Only HP till then.
			if (HP() <= 0) return true;
			return false;
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			updateDesc();
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			//Every Turn I’m Shockeling
			//Play at the start of every PC turn while the Hopper’s on her first two Lust bars. Zip zap bitch.
			if(this.hasStatusEffect("GunOutBunsOut") && this.statusEffectv1("Busted") < 2)
			{
				output("Electricity crackles around the barrel of the Hopper’s cannon, zapping the floor");
				if(!target.canFly()) 
				{
					output(" in random bursts that carry straight to your [pc.feet]!");
					applyDamage(new TypeCollection( { electric: 10+rand(6) } ), this, target, "minimal");
				}
				else output(" in random bursts that your flight thankfully avoids!");
				output("\n\n");
			}

			//Actual s tuff
			if(this.lust() >= this.lustMax()) bustANutHoppy(target);
			else if(!this.hasStatusEffect("GunOutBunsOut")) hopperLightningGunno(target);
			else if(CombatManager.getRoundCount() % 5 == 0) roundhouseKickypoo(target);
			else if(CombatManager.getRoundCount() == 6) haremCheerleadersGo(target);
			else if(statusEffectv1("Busted") <= rand(6)) strokeItForDaddy(target);
			else if(!hasStatusEffect("Evasion Boosted") && rand(4) == 0) bounceBoi(target);
			else if(target.shields() <= 0 && rand(4) == 0) bootySlamminAttack(target);
			else if(rand(4) == 0 && this.energy() >= 10 && !target.isBlind()) discoGrenade(target);
			else hopperLightningGunno(target);
		}
		//Lightning Gun
		//Primary attack. Deals Electrical damage.
		public function hopperLightningGunno(target:Creature):void
		{
			//First time she uses it:
			if(!this.hasStatusEffect("GunOutBunsOut"))
			{
				output("<i>“Hit me, babe,”</i> the Hopper laughs, leaning into the bed and opening her mouth. The dark bunny boss-boy pulls a cigar from... somewhere... in the orgy pit on the bed and plants it between his latex-wrapped lieutenant’s lips. She whirls around to you and lets loose with a withering barrage of electrical energy, blasting away with the shock cannon.");
				if(!rangedCombatMiss(this, target))
				{
					output(" You scream as the lightning courses through you.");
					applyDamage(damageRand(new TypeCollection( { electric: 45 } ), 15), this, target, "minimal");
				}
				else output(" You leap back, dodging the worst of it.");
				
				output("\n\nWhen she’s finished the assault, the Hopper twirls her cannon’s barrel up to her lips and uses the super-heated forks on it to light the cigar. <i>“Alright, <b>now</b> it’s go-time, fucker. Let’s dance!”</i>");
				this.createStatusEffect("GunOutBunsOut");
			}
			else
			{
				output("The Hopper braces her rubber-sheathed feet on the deck and aims her heavy cannon at you. A squeeze of the trigger sends a shocking assault of electrical energy arcing through the air and right for you!");
				if(!rangedCombatMiss(this, target))
				{
					output(" You scream as the lightning blasts through your body!");
					applyDamage(damageRand(new TypeCollection( { electric: 45 } ), 15), this, target, "minimal");
				}
				else output(" You leap back, dodging the worst of it.");
			}
		}
		//Disco Grenade
		//Causes Blindness for a turn and deals some Laser damage.
		public function discoGrenade(target:Creature):void
		{
			this.energy(-10);
			output("<i>“Glasses, everyone!”</i> the Hopper barks, reaching into her utility belt and whipping out a grey sphere. Her boss and his harem girls all scramble to put on sunglasses before the dickbunny throws it at you. The second it leaves her hand, the ball erupts in a blinding display of pyrotechnics and lasers, scatter-shooting beams of light every which-way!");
			//PC has blind-proof headgear:
			if(target.hasBlindImmunity()) output(" Too bad you came well-equipped for this shit.");
			else if(target.reflexes()/2 + rand(20) + 1 >= this.aim()/2 + 10) output(" You shield your eyes just in time to avoid the worst of it.");
			else
			{
				output(" Literally blinding, in this case. You struggle to cover your eyes, but to no avail! <b>You’re blinded by the lights!</b>");
			}
			output("\n\nSeveral of the laser beams pelt you, sizzling away!");
			var damage:TypeCollection = new TypeCollection( { burning: 25 } );
			damage.addFlag(DamageFlag.LASER);
			applyDamage(damageRand(damage, 15), this, target, "minimal");
		}
		//Roundhouse Kick
		//Deals low Kinetic damage, but has a 1-round Stun chance. Usable once per 5 rounds.
		public function roundhouseKickypoo(target:Creature):void
		{
			output("<i>“Chew on this!”</i> the bunny bitch howls, rushing at you and bouncing off the deck. You watch as she spins mid-air, thrusting out with one of her powerful legs. ");
			if(combatMiss(this, target)) output("You side-step the kung-fu furry’s kick!");
			else 
			{
				output("Ooof! The kick catches you straight in the chest, sending you stumbling back!");
				applyDamage(damageRand(new TypeCollection( { electric: 15 } ), 15), this, target, "minimal");
				//Hit, PC fails a Physique check:
				if(target.physique()/2 + rand(20) + 1 < this.physique()/2 + 10 && !target.hasStatusEffect("Stunned"))
				{
					output("\n\nYou fly backwards with a second kick to the solar plexus, smacking your head on the bulkhead. Stars flash in front of your eyes, leaving you <b>momentarily stunned!</b>");
					CombatAttacks.applyStun(target,1);
				}
			}
		}
		//Bounce Bounce!
		//Increases her Evasion and status-resist for 3 turns. Usable 1/encounter.
		public function bounceBoi(target:Creature):void
		{
			output("The Shock Hopper takes a moment to psyche herself up, bouncing from one powerful leg to the other. She claps her hands when she’s finished, assuming a flowing martial artist’s stance as her lightning gun hangs on its sling, still zapping away. <i>“C’mon, show me what you’ve got!”</i>");
			if(kGAMECLASS.silly || target.short == "Ronan" || target.short == "ronan" || target.short == "ronin" || target.short == "Ronin")
			{
				output("\n\n<i>“W-what are you doing?”</i> you say, watching her bouncing around.");
				output("\n\n<i>“Dance off, bro. Me and you! C’mon, boss-man!”</i>");
				output("\n\nThe bunny-boy just snickers and shakes his head.");
			}
			createStatusEffect("Evasion Boost",30,0,0,0,false,"Icon_DefUp","+30% Evasion!",true,3);
			createStatusEffect("Evasion Boosted");
			this.energy(+30);
		}
		//Stroke It For Daddy!
		//Basic lust attack. Deals herself a small amount of Lust damage.
		//Req's one+ busted load
		public function strokeItForDaddy(target:Creature):void
		{
			output("The Hopper pistons her hips forward, ");
			if(statusEffectv1("Busted") == 1) output("twirling her dick around within the cum-stuffed confines of her bodysuit");
			else output("helicoptering her cum-sheened cock in front of you and sending wads of spunk flying everywhere");
			output(". The wet sound it makes echoes through the cabin, accompanied by a heady musk.");
			applyDamage(damageRand(new TypeCollection( { tease: 8 } ), 15), this, target, "minimal");
			this.lust(2);
		}
		//Harem Cheerleaders!
		//The LDC and his harem put on a lustful display that deals heavy Lust damage to both PC and Hopper.
		public function haremCheerleadersGo(target:Creature):void
		{
			this.createStatusEffect("Cheered");
			output("<i>“Woah, this is really heating up, huh?”</i> the bunny-boy laughs, patting the head-giving pup between the ears. <i>“Why don’t you show my favorite cocksleeve what’s waiting for her when she finishes?”</i>");
			output("\n\nThe slave girls lounging around him giggle, groping themselves, their master... any cock or tit they can get their hands around. Lips meet, kissing pussies and cumslits with equal aplomb. The Hopper cuts her glance over as the harem-slaves fawn all over each other, and you watch the ");
			if(this.statusEffectv1("Busted") < 2) output("bulge in her suit");
			else output("floppy equine cock hanging out of her ruptured bodysuit");
			output(" twitch with mounting desire.");
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\n<b>You resist the erotic display!</b>");
			applyDamage(damageRand(new TypeCollection( { tease: 10 } ), 15), this, target, "minimal");
			this.lust(25);
		}
		//Butt Slam
		//Deals a mix of Kinetic and Lust damage to the PC. Only usable once your Shields are down. Does WAY more Kinetic damage if she’s on her second lust bar (not third, either). If she’s in her third phase, instead deals more Lust damage to you.
		public function bootySlamminAttack(target:Creature):void
		{
			output("The Hopper crouches down and springs up in the air, spinning like she’s going to kick you... and instead ");

			if(!combatMiss(this, target))
			{
				var damage:TypeCollection = new TypeCollection( { kinetic: 20 } );
				var teaseDamage:TypeCollection = new TypeCollection( { tease: 8 } );
				output("slams her ass directly into your face! ");
				//First phase:
				if(statusEffectv1("Busted") == 0)
				{
					output("Her bodysuit rubs on your [pc.face], giving you a good whiff of her cock and balls before she falls off you!");
				}
				//Second phase:
				else if(statusEffectv1("Busted") == 1)
				{
					output("All the cum stuffed into the lower half of her suit makes a potent squelching sound, bathing your [pc.face] in ballstench.");
					damage.add({ kinetic: 15 });
				}
				//Third phase:
				else 
				{
					output("The moment her ass impacts you, cum goes spraying out of the rupture in her suit, cascading down your [pc.chest] and butting her free-swinging nuts against your chin.");
					teaseDamage.add({ tease: 8 });
				}
				applyDamage(damageRand(damage, 15), this, target, "minimal");
				if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\n<b>You manage to resist the erotic imposition!</b>");
				else applyDamage(damageRand(teaseDamage, 15), this, target, "minimal");
			}
			else output("launches her ass directly at your face! Fortunately, you see it coming just in time to sidestep.");
		}
		//Combat Event: Bust a Nut (The First Time)
		//Play when the SH gets to max Lust the first time. Doesn’t consume her turn.
		public function bustANutHoppy(target:Creature):void
		{
			if(!this.hasStatusEffect("Busted"))
			{
				this.createStatusEffect("Busted",1);
				output("<i>“Fuuuuck, babe, this " + target.mf("guy","gal") + "’s hot...”</i> the Hopper groans, biting her lip. Her legs twitch, propelling her a few inches off the deck like a manic... well, bunny.");
				output("\n\n<i>“Haha, yeah [pc.heShe] is!”</i> her leader shouts back. <i>“Should I be jealous?”</i>");
				output("\n\nThe Hopper whines, bouncing faster. <i>“I don’t... I don’t... can’t...”</i>");
				output("\n\nShe gasps, sucking in breath as the massive bulge in her suit throbs. A second later and a fat bulb starts growing inside her suit just over her dick, swelling with a sudden eruption of cum. The black bunny on the bed guffaws, watching his lieutenant cream herself with obvious glee. The front of her suit keeps bulging out as <b>her obviously-modded balls empty themselves</b> inside it, plumping out her belly and thighs until she looks positively fertile.");
				output("\n\n<i>“Woo, girl, work that dick!”</i> the boss bunny laughs. <i>“Don’t tear your suit now!”</i>");
			}
			else
			{
				this.addStatusValue("Busted",1,1);
				//Combat Event: Bust a Nut, Bust Your Suit
				output("<i>“A-ah God, not again,”</i> the Hopper whines, dropping a hand off her gun barrel to grab her throbbing dick. <b>The cum-swell around her crotch suddenly starts growing</b>, swelling bigger and bigger until the latex material of her bodysuit is discoloring with the stretch...");
				output("\n\n... and then <i>pop!</i> it goes, exploding in a shower of thick white that just keeps coming and coming. Her bodysuit looked swollen before, but now you’re shown just how much this modded-up bunny’s balls were capable of producing. The sheer, massive volume of her two orgasms sprays across the deck in a veritable flood, covering it in a sticky sheen of musky white.");
				output("\n\n<i>“Fuuuuuck,”</i> the Hopper groans, slumping back against the nearest bulkhead. <i>“Oh, my balls.”</i>");
				output("\n\nAs she’s recovering, <b>another arc of lightning shoots from her gun to the floor, only to sputter out as it’s absorbed by the spooge everywhere</b>. Looks like you won’t be dealing with that anymore!");
			}
			this.orgasm();
		}
	}
}
