package classes.Characters
{
	import classes.Creature;
	import classes.Characters.SlamwulfeDrone;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Armor.AugmentWeaveArmor;
	import classes.Items.Transformatives.Nepeta;
	import classes.Items.Transformatives.Catnip;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	
	public class CyberPunkSecOp extends Creature
	{
		//Fen did dis.
		//constructor
		public function CyberPunkSecOp()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "punk security operative";
			this.originalRace = "kaithrit";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The kaithrit nimbly hops aside.";
			this.customBlock = "Bluh.";
			this.isPlural = false;
			
			meleeWeapon.attackVerb = "punch";
			meleeWeapon.attackNoun = "fist";
			meleeWeapon.longName = "fist";
			meleeWeapon.description = "a fist";
			meleeWeapon.baseDamage.kinetic.damageValue = 1;
			//meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon.longName = "shield-linked plasma rifle";
			this.rangedWeapon.description = "a shield-linked plasma rifle";
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "burning plasma";
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.baseDamage.burning.damageValue = 4;
			this.rangedWeapon.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.rangedWeapon.baseDamage.addFlag(DamageFlag.DRAINING);
			this.rangedWeapon.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.armor = new AugmentWeaveArmor();
			//this.armor.defense = 5;
			//this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.electric.damageValue = 10.0;

			this.shield = new ReaperArmamentsMarkIIShield();
			this.shield.shields = 200;
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 40;
			this.aimRaw = 45;
			this.intelligenceRaw = 40;
			this.willpowerRaw = 25;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 50;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 75;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "blue";
			this.tallness = 5*12+2+rand(3);
			this.thickness = 75;
			this.tone = 20;
			this.hairColor = "pink";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 13;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "fair";
			this.skinAccent = "";
			this.skinFlags = [];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			this.tongueType = GLOBAL.TYPE_FELINE;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 2;
			this.lipColor = "black";
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_FELINE;
			this.armFlags = []
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_FELINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 2;
			this.tailFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
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
			this.buttRatingRaw = 13;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 30;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 5;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 90;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 196;
			this.timesCum = 2503+rand(1000);
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 15;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 100;

			this.createVagina();
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].bonusCapacity = 100;
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].vaginaColor = "pink";
			
			//this.createStatusEffect("Disarm Immune");
			//createStatusEffect("Force Fem Gender");
			createPerk("Appearance Enabled");


			inventory = [];

			var lossLoot:Array = [];
			
			isUniqueInFight = true;
			btnTargetText = "PunkSecOp";
			sexualPreferences.setRandomPrefs(5,3);
			//sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, sexualPreferences.getRandomLikesFactor());
			//sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS, sexualPreferences.getRandomLikesFactor());

			this._isLoading = false;
			kGAMECLASS.zhengShiSSTDChance(this);
			randomise();
		}

		public function randomise():void
		{
			//IT WAS A BOI THE WHOLE TIME~!
			if(rand(2) == 0)
			{
				createStatusEffect("Force Male Gender");
				thickness = 25;
				tallness += 5;
				tone = 70;
				femininity = 35;
				hairColor = "blue";
				hairLength = 8;
				lipMod = 0;
				hipRatingRaw = 4;
				buttRatingRaw = 2;
				this.breastRows[0].breastRatingRaw = 1;
				vaginas = [];
				createCock();
				this.cocks[0].cType = GLOBAL.TYPE_SYNTHETIC;
				this.cocks[0].cockColor = "silver";
				this.cocks[0].cLengthRaw = 13;
				this.balls = 2;
				this.cockVirgin = false;
				this.vaginalVirgin = true;
				this.long = "This stiff-necked kaithrit brandishes a slick-looking plasma rifle in one hand like it’s nothing thanks to his skin-tight layer of augment-weave armor. The flexible metallic suit flexes powerfully with his every movement, unintentionally highlighting his lissom form, bulging groin, and the pert swells of two decidedly feminine A-cups. If he wasn’t a kaithrit, you could easily confuse him a for a female. Of course, he compensates for this with a butch, luminescent mohawk. Large eyes flicker with alertness under a projected holovisor, beamed forth by implants in his temples, and when he shifts position, a short-range antenna wobbles along with his feline ears.\n\nIt’s a sure bet that this mechanized security cat has a grab-bag of other, less-visible cybernetics as well, waiting to spring on you at a moment’s notice.";
			}
			//Nothing needs changed :3
			else
			{
				this.long = "This prissy kaithrit brandishes a slick-looking plasma rifle in one hand like it’s nothing thanks to her skin-tight layer of augment-weave armor. The metallic suit flexes powerfully with her every movement to support her motions, unintentionally highlighting her lightly muscled thighs, wide hips, and exquisitely large chest. The suit supports the latter attributes quite marvellously, keeping the pendulous mounds from swaying too heavily while she circles you. Her hair flutters behind in a lengthy ponytail, the sides of her head shaved to reveal the cybernetic implants responsible for the antennae behind her ear and the projected targeting visor across her eyes.\n\nIt’s a sure bet that this mechanized security cat has plenty of other gadgets on or in her person, ready to spring on you should you dare to continue your resistance.";
			}
			if(rand(10) == 0) this.inventory.push(new AugmentWeaveArmor());
			if(rand(3) == 0) this.inventory.push(new Nepeta());
			else if(rand(3) == 0) this.inventory.push(new Catnip());
		}
		override public function get bustDisplay():String
		{
			if(this.hasCock()) return "PUNK_SECOP_MALE";
			else return "PUNK_SECOP_FEMALE";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			//Combat Abilities & AI:
			if(this.hasStatusEffect("Blinded")) blindClear(target);
			//Grins before attacking if the PC uses a stealth field. Sees right through it courtesy of the visor. (Effectively dispels the status)
			else if(target.hasStatusEffect("Stealth Field Generator")) stealthFieldImmune(target);

			//HoT shield restore (33 energy)
			if(this.shields() < this.shieldsMax()/2 && this.energy() >= 33 && !this.hasStatusEffect("Deflector Regeneration") && rand(3) <= 1)
			{
				CombatAttacks.DeflectorRegenerationImpl(alliedCreatures, hostileCreatures, this, target);
				this.energy(-33);
			}
			//Energy regen:
			else if(!hasStatusEffect("Used Smuggled Stimulant") && this.energy() < 33 && rand(3) <= 1) CombatAttacks.SmuggleStimulatImpl(alliedCreatures, hostileCreatures, this, target);
			//Chance of wulfesummon
			else if(!this.hasStatusEffect("Used Wulfe") && rand(6) == 0) summonASlamwulf(target);
			else if(target.hasPerk("Attack Drone") && target.shields() > 0 && !target.hasStatusEffect("Porno Hacked Drone") && !target.accessory.hasFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE) && rand(3) == 0 && this.energy() >= 20) pornoDroneHack(target);
			//High lust stuff:
			else if(this.lust() >= 50 && !this.hasStatusEffect("LustModeEngaged")) transitionToLustFight(target);
			else if(this.lust() >= 50)
			{
				//Weapon Hack - disable energy weapons
				if(target.hasEnergyWeapon() && !target.hasStatusEffect("Disarmed") && this.energy() >= 10 && rand(3) == 0) CombatAttacks.WeaponHackImpl(alliedCreatures, hostileCreatures, this, target);
				bouncingTease(target);
			}
			//Regular HP stuff
			else
			{
				//Disarmed boi!
				if(this.hasStatusEffect("Disarmed") || rand(4) == 0) punchingStuff(target);
				else if(rand(4) == 0) shoulderRockets(target);
				else if(rand(4) == 0) burnTheFools(target);
				//Weapon Hack - disable energy weapons
				else if(target.hasEnergyWeapon() && !target.hasStatusEffect("Disarmed") && this.energy() >= 10 && rand(3) == 0) 
				{
					CombatAttacks.WeaponHackImpl(alliedCreatures, hostileCreatures, this, target);
					this.energy(-10);
				}
				//Volley
				else if(this.energy() >= 25 && !target.isBlind() && rand(3.5) == 0) 
				{
					volleyAttack(alliedCreatures,hostileCreatures,target);
					this.energy(-25);
				}
				else
				{
					output("[enemy.Short] takes aim with [enemy.hisHer] rifle. ");
					CombatAttacks.SingleRangedAttackImpl(this, target);
				}

			}			
		}
		public function volleyAttack(alliedCreatures:Array, hostileCreatures:Array, target:Creature):void
		{
			output("<i>“Think you can stand up to a volley?”</i> ");
			CombatAttacks.VolleyImpl(alliedCreatures, hostileCreatures, this, target);
		}
		//Summons a Slamwulf drone (1x/fight). Basic kinetic attack drone.
		public function summonASlamwulf(target:Creature):void
		{
			this.createStatusEffect("Used Wulfe");
			var doge:SlamwulfeDrone = new SlamwulfeDrone();
			if(!this.hasStatusEffect("Disarmed")) output("The thunderous clattering of heavy metal paws pounding on the deck <b>announces the arrival of the cybernetic punk’s personal security drone</b> - a slamwulfe model by the look of it. It bares its razor sharp teeth at you, then buzzes as they begin rotating at high speed, fast enough to blur into a chainsaw of motion.");
			else output("The thunderous clattering of heavy metal paws pounding on the deck <b>announces the arrival of the cybernetic punk’s personal security drone</b> - a slamwulfe model by the look of it. Its teeth retract in favor of transparent injector needles, dripping with some mysterious pink aphrodisiac.");
			CombatManager.addHostileActor(doge);
		}
		//Once above 50 lust:
		//Puts on gasmask and tosses aphrogas grenade (Lust over time - think I can reuse the status from myrellion)
		public function transitionToLustFight(target:Creature):void
		{
			this.createStatusEffect("LustModeEngaged");
			output("The SecOp smiles warmly. <i>“If you’re going to fight like that, well...”</i> " + this.mf("He","She") + " produces a neon orange gas mask and slips it over " + this.mf("his","her") + " face. <i>“I have just the thing for a slut like you.”</i> Micro-grenades fly out of " + this.mf("his","her") + " belt, spewing pink, drug-laced vapor into the air!");
			if(target.hasAirtightSuit()) output("\n\n<b>Good thing your equipment is airtight!</b>");
			else 
			{
				output("\n\n<b>The longer you fight, the more you’ll breathe in!</b>");
				CombatAttacks.applyAphroGas(target, 7, 9000);
			}
		}
		//Bouncing Tease - Leap onto PC’s shoulders and open suit, rubbing junk in face. +Tease! Suit seals back up after.
		public function bouncingTease(target:Creature):void
		{
			if(this.hasCock()) 
			{
				if(this.statusEffectv1("Face Rided") <= 0) output("Leaping inhumanly high into the air, the security operative casually flings himself directly at you, legs and arms outstretched.");
				else output("The SecOp flings himself at you with a feral grin.");
			}
			else
			{
				if(this.statusEffectv1("Face Rided") <= 0) output("Coiling her body like a spring, the security operative bounces high into the air, legs and arms outstretched as she flies forward.");
				else output("The SecOp flings herself at you with a lusty grin.");
			}
			//Dodge
			if(combatMiss(this, target)) 
			{
				output("\n\nYou barely roll out of the way!");
				if(!this.hasCock()) output("\n\nShe pouts. <i>“Aww, I thought you wanted to get up close and personal!”</i>");
				else output("\n\nHe arches an eyebrow. <i>“I thought you wanted this.”</i> The hand on his groin makes it clear exactly what ‘this’ is.");
			}
			else
			{
				if(!target.hasAirtightSuit())
				{
					if(this.hasCock())
					{
						if(this.statusEffectv1("Face Rided") <= 0) output("\n\nHe lands on your shoulders, legs splayed wide to plant his crotch directly against your face. The gleaming coils of his armor wriggle and twist as a much thicker coil - no, that’s his cock! A gleaming chromed cock grinds against your cheek, unimaginably hard and pulsating with promise. You" + ((target.isCumSlut() || target.isBimbo() || target.lust() > 66) ? " half-heartedly" : "") + " struggle as it slides over your lips and nose, an up-close-and-personal preview of exactly what this turned-on cyborg looks like in the bedroom.");
						else if(this.statusEffectv1("Face Rided") <= 1) output("\n\nThis time his armor opens up even before he lands on your shoulders. The chrome-colored dong slaps your cheek on its way to your lips. Its owner bucks and thrusts, humping it against your face. For all its hardness, there’s a hint of organic sponginess as well, like his shaft-shaped simulacrum was designed to mimic a boner at the absolute peak of arousal. You’re starting to see the appeal.");
						else if(this.statusEffectv1("Face Rided") <= 2) output("\n\nYou’re ready the big silver dick to slap into your face this time. You expect it. You turn away just in time, taking it on your cheek before pride compels you to face your sexual aggressor, staring up at him from under his 13-inch chrome-bone. So what if it’s kind of hot - if just having here tempts you to take a lick...");
						else output("\n\nYou sigh as his big, fat cock slips into position against your nose, his gleaming, artificial balls rest on your lips. He smells kind of nice, with a sort of artificial orangish tang to his musk. Maybe you ought to struggle, but he’ll get down on his own eventually. You barely keep yourself from licking your lips.");
					}
					else
					{
						if(this.statusEffectv1("Face Rided") <= 0) output("\n\nShe lands on your shoulders, legs splayed wide to plant her crotch directly against your face. The gleaming coils of her armor wriggle and twist apart, revealing a pretty purple pussy. You don’t have long to admire the latex-like texture of her gleaming folds before they’re pressing against your [pc.lipsChaste], grinding in small circles.");
						else if(this.statusEffectv1("Face Rided") <= 1) output("\n\nThis time her armor splits open before she even lands. Her cunt crashes into your face in sloppy delight. Her juices cascade down your cheeks and chin while she humps and squeals, her tails curled possessively around your face as she baptizes you in her lusty pussy-juices.");
						else if(this.statusEffectv1("Face Rided") <= 2) output("\n\nYou’re ready for the kaithrit’s juicy, artificially-enhanced snatch to slap into your face, so when those puffy, soaked folds grind into you, you can take a moment to admire the silky texture and incredible slickness. A pussy like that would feel great, even if all you slipped inside was a single finger...");
						else output("\n\nYou grin as her pretty, cybernetic pussy crashes into your face once more. If only all your fights could be so pleasant. You’ll take a buxom cat-girl humping your face over trading blaster fire any day of the week. At the last second, you stop yourself from grabbing her big, squeezable ass and opening wide. If you started eating her out now... you’d never get away.");
					}
					applyDamage(damageRand(new TypeCollection( { tease: 16 } ), 15), target, this,"minimal");
				}
				//Airtight tease scenes
				else
				{
					if(this.hasCock())
					{
						if(this.statusEffectv1("Face Rided") <= 0) output("\n\nLanding on your shoulders, the SecOp scythes his legs around the back of your head. The coiled metal of his armor parts at the groin, revealing the equally metallic curve of a thirteen inch, top-of-the-line cybercock. It slaps hard into your visor, gleaming and proud, but merely humping on your helmet isn’t enough for the kaithrit - oh no. He activates his chromed dong’s vibration function, filling your ears a cacophonous thrum worthy of a thousand credit sex-toy.");
						else if(this.statusEffectv1("Face Rided") <= 1) output("\n\nHis suit opens up even before he lands, allowing his cybernetically-enhanced cock to slam into your helmet ahead of everything else. <i>“C’mon!”</i> he emphatically barks, <i>“Let’s have some fun.”</i> He drags his dick all over your view, smiling when your eyes follow after it. You can’t quite bring yourself to look away from his glossy member. Beads of pre appear at the tip, threatening to ooze down and smear into the visor.");
						else output("\n\nA big fat cock flops right in front of your face, oozing and leaking with decadent promise. If you weren’t wearing a helmet, it’d be on your face, smearing it’s leaky pre into your cheek. Instead, you get to watch it as it slides and grinds around, hard yet with a little bit of give, enough to remind whoever he’s fucking that his science-enhanced boner is part of a biological breeder.");
					}
					else
					{
						if(this.statusEffectv1("Face Rided") <= 0) output("\n\nLanding on your shoulders, the SecOp scythes her legs around the back of your head. The coiled metal of her armor parts to reveal an obviously-augmented pussy. Its lips are glossy like rubber, slick with a lubricant that’s not entirely natural, and as she humps and grinds against your faceplate, she smears a heady layer of feminine juices across it. You can’t look anywhere without getting an eyeful of the curvy kaithrit’s libidinous leakage.");
						else if(this.statusEffectv1("Face Rided") <= 1) output("\n\nHer suit opens up like the petals of a flower to reveal her own feminine folds, just in time for the curvy sex-kitten to plant them hard against your faceplate. <i>“This would be a lot more fun if you took off the helmet, you know.”</i> She gyrates and swivels, filling your vision with nothing but a sea of thickened thighs and wantonly sensual femininity. <i>“I’ve got just the thing for a slut like you...”</i>");
						else output("\n\nPussy fills your vision once more. You barely tried to dodge. It’s not like she can hurt you like this, with her gleaming, fuckable cunt drawing circles of dribbling fuck-juice on your visor. You lick your lips, just watching her, taking in every detail of that angelic cunt. <i>“Come on out and play...”</i>");
					}
					applyDamage(damageRand(new TypeCollection( { tease: 12 } ), 15), target, this,"minimal");
				}				
				output("\n\nWith a staggeringly powerful jump, your face is free of the SecOp’s genitals once more, though the lingering scent of horny kaithrit lingers, intermingled with the aphrodisiac gas in the air. <i>“Gotta move faster... unless you want me to ride your face into the ground...”</i>");
				if(!this.hasStatusEffect("Face Rided")) this.createStatusEffect("Face Rided");
				this.addStatusValue("Face Rided",1,1);
			}
		}
		//Other ideas: Porno drone hack - copy from sexbots
		public function pornoDroneHack(target:Creature):void
		{
			this.energy(-20);
			output("<i>“I wonder if you’ve patched the latest firmware vulnerabilities out of your drone...”</i> The cybernetic cat-[pc.boyGirl] taps at his temple, the antennae mounted above glowing.");
			//Fail: 
			if(rand(20) + 1 + target.intelligence()/2 < 12)
			{
				output("\n\nYou breathe a sigh of relief as your drone successfully fights off the outside interference and rights itself.");
			}
			//Success: 
			else
			{
				output("\n\nYour drone rights itself... and then turns itself to you, green light beaming out of its optical sensors. Images flicker all around it, endlessly changing images of soft flesh, breasts, ass, bulging phalli, pink on pink, pink on brown, blue on mauve.... It’s accompanied with the moans, grunts and slurps of the extranet porn it is now helplessly streaming and projecting in ways you never thought it had the capacity to do. You bat it away, irritated, and it immediately flies back. It hovers near your shoulder, forcing the sounds and images into your head.");
				target.createStatusEffect("Porno Hacked Drone", 2 + rand(3), 0, 0, 0, false, "Charmed", "Your drone has been hacked to broadcast porn at you! You’ll have to wait for your programming to overcome the rogue process. Hopefully it won’t take too long!", true, 0);
			}
		}
		//Immune to blind via visor.
		public function blindClear(target:Creature):void
		{
			output("<i>“Do I look like one of Rat’s Raiders? It’ll take more than that to blind me.”</i> [enemy.Short] pivots to face directly at you, the projected visor effortlessly tracking you. <b>[target.HeShe] isn’t blind!</b>");
			this.removeStatusEffect("Blinded");
		}
		//Palm-based flamethrower
		public function burnTheFools(target:Creature):void
		{
			output("The pirate scowls and lifts [enemy.hisHer] free hand. Rather than toting a weapon, [enemy.heShe] allows a his forarm to split apart, revealing the barrel of a hidden flame-thrower!");
			if(rangedCombatMiss(this, target))
			{
				output("\n\nYou roll under the curtain of flame!");
			}
			else 
			{
				applyDamage(damageRand(new TypeCollection( { burning: 25 } ), 15), target, this,"minimal");
				if(this.aim()/2 + rand(20) + 1 > target.reflexes()/2 + 10 && !target.hasStatusEffect("Burning")) 
				{
					output(" <b>You’re lit on fire!</b>");
					CombatAttacks.applyBurning(target, rand(3)+1, 5, true);
				}
			}
		}
		//Electropunch?
		//Shoulder-mounted micro-rocket volley. Undodgeable.
		public function shoulderRockets(target:Creature):void
		{
			output("The Cyber Punk closes [enemy.hisHer] eyes and exhales. Like wriggling snakes, the coiled steel over [enemy.hisHer] shoulders parts, and the flesh beneath springs open, revealing a dozens of hidden, miniaturized rockets. They spray out in a wave of fire-spewing streamers - too many to dodge. All you can do is brace for impact!");
			applyDamage(damageRand(new TypeCollection( { kinetic: 15, burning: 15 } ), 15), target, this,"minimal");
		}
		//Stealth field cancel
		public function stealthFieldImmune(target:Creature):void
		{
			output("The operative’s visor-shrouded eyes easily follow your movements. <b>Your stealth field is useless!</b>\n\n");
			target.removeStatusEffect("Stealth Field Generator");
		}//Disarmed punches
		public function punchingStuff(target:Creature):void
		{
			if(this.hasStatusEffect("Disarmed")) output("With a snarl of irritation, the disarmed feline puts up " + this.mf("his","her") + " dukes! [enemy.hisHer] fist flashes brightly, wreathed in a corona of electrical energy.");
			else output("The feline lashes out one-handed! [enemy.HisHer] fist flashes brightly, wreathed in a corona of electrical energy.");
			var weapStorage:ItemSlotClass = this.meleeWeapon;
			this.meleeWeapon = new ItemSlotClass();
			this.meleeWeapon.longName = "lightning fist";
			this.meleeWeapon.description = "a fist";
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "shock-punch";
			this.meleeWeapon.baseDamage.electric.damageValue = 15;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 0;
			CombatAttacks.SingleMeleeAttackImpl(this, target);
			this.meleeWeapon = weapStorage;
		}
	}
}
