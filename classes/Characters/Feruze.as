package classes.Characters 
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.StorageClass;
	import classes.Items.Melee.ShockBlade;
	import classes.Items.Guns.SalamanderPistol;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Accessories.ShieldAugBracers;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fenoxo, based on a modified Azra.as by Fen who modified it from Gedan's Kiro.
	 */
	public class Feruze extends Creature
	{
		public function Feruze() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "Feruze";
			this.originalRace = "suula";
			this.a = "";
			this.capitalA = "";
			this.long = "Females of the shark-like suula are known for being the most imposing of their species, but Feruze is a particularly imposing specimen, broad-feathered wings and all. She stands more than eight feet tall and swells with curves enough to tempt a priest into heresy with a single look. She knows it too. The shark-girl smiles when your eyes slide along the glossy surface of her clinging suit, so diaphanous that the puffy swells of her half-turgid nips may as well be bared and presented for inspection. Though her garments expose her total femininity, this suula wears it as proudly as a sharpened blade. The electrode-studded ball on her tail crackles dangerously, and a half-dozen pistols of varying designs cling to her thighs on invisible, magnetic harnesses.\n\nNot a woman to be trifled with.";
			this.customDodge = "Feruze ducks aside!";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new SalamanderPistol();
			
			this.armor.longName = "polychromatic skinsuit";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.shield = new ReaperArmamentsMarkIIShield();
			this.shield.shields = 300;
			this.shield.hasRandomProperties = true;

			this.accessory = new ShieldAugBracers();

			this.inventory = [new ShieldAugBracers()];
			
			this.level = 10;
			this.physiqueRaw = 40;
			this.reflexesRaw = 45;
			this.aimRaw = 38;
			this.intelligenceRaw = 42;
			this.willpowerRaw = 30;
			this.libidoRaw = 60;
			this.HPMod = 300;
			this.shieldsRaw = this.shieldsMax();
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			
			this.XPRaw = bossXP();
			
			this.credits = 1337;
			
			this.femininity = 95;
			this.eyeType = 0;
			this.eyeColor = "orange";
			this.tallness = 8*12+1;
			this.thickness = 65;
			this.tone = 40;
			this.hairColor = "purple";
			this.scaleColor = "yellow";
			this.furColor = "gold";
			this.hairLength = 17;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "yellow";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_SUULA;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = 0;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 1;
			this.lipColor = "black";
			this.earType = GLOBAL.TYPE_SUULA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SUULA;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_SUULA;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SUULA;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG];
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
			this.hipRatingRaw = 15;
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
						
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_SUULA;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vaginaColor = "gold";
			this.vaginas[0].bonusCapacity = 400;
			this.vaginas[0].vagooFlags = [GLOBAL.FLAG_STINGER_BASED];
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 15;
			
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 10;
			this.ballFullness = 100;
			
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 200;
			this.minutesSinceCum = 2000;
			this.timesCum = 5669;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0.5;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 23;
			this.nippleColor = "orange";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 250;
			//createPerk("Fixed CumQ",2500,0,0,0);
			createPerk("Appearance Enabled");
			createPerk("Flee Disabled");
			createPerk("Juggernaut");

			isUniqueInFight = true;
			btnTargetText = "Feruze";
			this._isLoading = false;
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			if(CombatManager.getRoundCount() == 1) deployDroner(target);
			else if(CombatManager.getRoundCount() == 2 || (!target.hasStatusEffect("Tranquilized") && rand(4) == 0)) feruzeTranqShot(target);
			else if(target.hasStatusEffect("Tripped")) feruzeFaceSitAttack(target);
			else if(rand(3) == 0) tailWhipPikachu(target);
			else if(!this.hasStatusEffect("Done Shooting") && !this.hasStatusEffect("Disarmed")) laserPewpew(target);
			else feruzeDisarmedAttack(target);
			//Drone stuff at the end!
			if(this.hasStatusEffect("Drone Active"))
			{
				if(this.shields() > 0) droneAttack(target);
				else noDroneNoMore(target);
			}
		}
		//Face sitting trippy boi.
		public function feruzeFaceSitAttack(target:Creature):void
		{
			if(!this.hasStatusEffect("Face Sat"))
			{
				output("Feruze all but dances over, hips sashaying with a mixture of raw enthusiasm and self-aware sensuality. <i>“Usually I prefer to have " + target.mf("boys","girls") + " on their backs in my bedroom, but this’ll do.”</i> She squats down before you can react, ");
				if(target.hasAirtightSuit()) output("fiddling with your [pc.armor] to bare your head and ");
				output("planting her shrink-wrapped pussy square onto your face. Thick, clenching asscheeks massage your forehead while her thighs slide lower, dragging the crease of her pussy up the slope of your nose to the tip... and then down onto your lips.");
				output("\n\nInstead of tasting latex, or rubber, or some kind of exotic nanomesh... you encounter the slightly tangy taste of pussy on your lips... along with a dose of tingling numbness that makes it impossible to be sure if you can trust what you’re feeling. Looking up, you can make out that Feruze’s suit has scissored open to expose her dripping cleft and a forest whirling tentacles, each drawing lines of prickly strangeness wherever it touches.");
				output("\n\nShe rises, leaving you marked with a smear of cunt-juice on your face. Every breath is thick with her scent, and the numbness is fading into something else... a strange sort of heat that wakes your nerves with sensuous stimulation. Unconsciously, you lick your lips and nearly whine in sudden pleasure. It’s almost as good as sex, and you struggle mightily not to start exploring your mouth with your fingers.");
				applyDamage(damageRand(new TypeCollection( { drug: 15 } ), 15), this, target, "minimal");
				//Max lust
				if(target.lust() >= target.lustMax()) output("\n\nOf course, you fail, and failing feels so good. You suck your fingers and lap at your lips, staring up at Feruze in a lusty haze.");
				this.createStatusEffect("Face Sat",0,0,0,0);
			}
			//Repeat
			else if(this.statusEffectv1("Face Sat") < 1)
			{
				this.addStatusValue("Face Sat",1,1);
				output("Feruze bounces over with near child-like glee, then plants her pussy, still wet from its last brush with your face, square on your mouth. She humps and grinds it against you, though mostly your [pc.lipsChaste]. This time, there’s no tingling or numbness - just more heat and sensitivity. The suula’s cuntlips may as well be the silkiest, softest cushions in the universe, her juices ambrosia. The erotic onslaught momentarily stuns you into inaction, but the chemicals she’s secreting are happy to spur your body into action.");
				output("\n\nYour tongue slips out and inside. It too is blessed by prickling, tickling heat, blessed with the feeling of being as engorged and sensitive as a fattest, horniest prick. You purr in delight as you thrust it deep, then whine in consternation that " + (!target.hasTongueFlag(GLOBAL.FLAG_LONG) ? "it can only reach so far":"you can’t feel like this <i>everywhere</i>") + ". This is as good as sex, maybe better. You pump and groan for long seconds of unthinking delight, completely absorbed in licking cunt until the unwelcome knowledge that this is your foe finally resurfaces.");
				output("\n\nThat conflict stills your cunnilingual efforts. Light returns a second later. Feruze stands up, stroking your cheek with one hand as she does. <i>“That was a lovely warmup. Tell you what. If you had fun, you can just keep lying there, and I’ll let you taste my pussy a little longer next time, mmm?”</i>");
				applyDamage(damageRand(new TypeCollection( { drug: 35 } ), 15), this, target, "minimal");
			}
			//Third face sits auto-loss
			else
			{
				output("Feruze giggles and strides closer. <i>“Couldn’t get enough, huh? Suula venom’ll have that effect.”</i> She squats down on your face with a knowing smile and a casual stroke of your " + (!target.hasHair() ? "head":"[pc.hair]") + ". <i>“Shoulda known you were a natural born pussy-licker. What’s say you just forget about your cousin back there and focus on me. You can just slide that tongue inside me, and we’ll have some fun for the next few hours.”</i>");
				output("\n\nWith the scent of horny suula filling your nostrils and your entire maw aching for contact like a laquine in heat, you do the only logical thing. You thrust your [pc.tongue] deep into Feruze and let your eyes roll back from the drug-enhanced bliss. Forget fighting. You want to <i>Fuck.</i> Your whole body lights up with the need for it. Your lips are big fat clits, rubbery and full of ecstasy from the slightest brush of contact. When you full-on smooch Feruze’s pussy, your head nearly goes white with raw, unfiltered delight.");
				applyDamage(damageRand(new TypeCollection( { drug: 9001 } ), 15), this, target, "minimal");
				this.setStatusValue("Face Sat",1,100);
			}
		}
		//Laser Pistol
		//Double shot. As per normal attacks. If damage is less than 3 on a hit, stop using.
		public function laserPewpew(target:Creature):void
		{
			var targetHP:Number = target.HP() + target.shields();
			CombatAttacks.SingleRangedAttackImpl(this, target, false);
			output("\n");
			CombatAttacks.SingleRangedAttackImpl(this, target, false);
			if(target.HP() > 1 && target.HP()+target.shields() > targetHP - 3)
			{
				if(!this.hasStatusEffect("Annoyed")) this.createStatusEffect("Annoyed");
				else
				{
					output("\n\n<i>“Bah. Guess I’ll need to use something else.”</i>");
					this.createStatusEffect("Done Shooting");
				}
			}
		}
		//Disarmed
		public function feruzeDisarmedAttack(target:Creature):void
		{
			output("Feruze balls her hands into fists and lashes out with a one-two combo!\n");
			CombatAttacks.SingleMeleeAttackImpl(this,target,false);
			output("\n");
			CombatAttacks.SingleMeleeAttackImpl(this,target,false);
		}
		//Tranq Gun
		public function feruzeTranqShot(target:Creature):void
		{
			output("Feruze draws a slim tranquilizer pistol and fires a pair of darts your way!");
			//dodge
			if(rangedCombatMiss(this,target)) output(" You dodge them!");
			else
			{
				output(" One of the darts slams home, ");
				if(target.armor.defense > 0) output("punching a needle-thin spear through your armor and ");
				output("disgorging something into your blood - something that makes you feel weak and a little dizzy.");

				target.createStatusEffect("Tranquilized", 0, 0, 0, 0, false, "Icon_DrugVial", "You’ve been tranquilized by whatever was in that dart, greatly weakening your muscles!\n\n(<b>-50% physique</b>)", true, 0);
			}
		}
		//Tail whip
		public function tailWhipPikachu(target:Creature):void
		{
			output("Feruze sweeps around, ");
			if(combatMiss(this,target)) output("but you dodge her tail, electrode-studded metal macehead and all.");
			else 
			{
				output("the sparking, electro-studded ball at its tip smashing square into you!");
				applyDamage(damageRand(new TypeCollection( { kinetic: 25, electric: 25 } ), 15), this, target, "minimal");
				//Trip chance
				if(target.shields() <= 0)
				{
					if(target.physique()/2 + rand(20) + 1 <= this.physique()/2 + 10 && !target.hasStatusEffect("Tripped") && !target.isPlanted()) 
					{
						output(" Between the impact and the shock, <b>you’re tripped!</b>");
						CombatAttacks.applyTrip(target);
					}
				}
			}
		}
		//Round one, assuming she still has shields:
		public function deployDroner(target:Creature):void
		{
			output("Feruze reaches behind her back. Something makes a quiet click, and a small drone whizzes up over her shoulder, trailing jets of pinkish exhaust. <i>“I’m honestly not sure what it is that this little guy shoots, but it’s been fun watching those laquine sluts turn their suits into cum-balloons while it zaps them.”</i>");
			this.createStatusEffect("Drone Active");
		}
		public function droneAttack(target:Creature):void
		{
			//Drone attack. Still fires on first use turn.
			output("\n\nThe mercenary’s drone zips upward for a better firing position and unleashes a burst of pink ");
			var missed:Boolean = rangedCombatMiss(this,target);
			if(missed) output("so bright that its path leaves a blackened afterimage in its wake. Good thing " + (missed ? "it missed" : "you came prepared with protective headgear") + "!");
			else 
			{
				output("that glows brighter and brighter until everything is glowing with white-hot <i>pinkness</i>. Your blood rushes in your ears as your skin flushes with the effort of shunting your circulatory system’s entire attention into your rapidly heating loins.");
				applyDamage(damageRand(new TypeCollection( { tease: 10 } ), 15), this, target, "minimal");
			}
		}
		//Drone shutdown
		public function noDroneNoMore(target:Creature):void
		{
			output("\n\nIn the aftermath of her shields collapsing, the mercenary suula’s drone clatters to the ground uselessly. " + (target.lust() < 50 ? "That’ll be one less distraction!":"If only its arousing weapon hadn’t left her breasts looking so tantalizing or her ass so hypnotic."));
			this.removeStatusEffect("Drone Active");
		}

		override public function get bustDisplay():String
		{
			var sBust:String = "FERUZE";
			return sBust;
		}
	}

}
