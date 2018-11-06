package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.UGCUniform;
	import classes.Items.Melee.Tonfas;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.Items.Guns.TrenchShotgun;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Utility.possessive;
	
	public class Penny extends Creature
	{
		
		
		//constructor
		public function Penny()
		{
			this._latestVersion = 5;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Penny";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "Penny is not especially tall or especially strong, nor is she particularly well-armed. The big-eared fennec is simply tenacious and skilled. She holds her tonfos with firm grips, a variety of other peacekeeper gadgets strapped around her waist. Her stance is steady and indicative of a long history of martial arts training. A shoulder strap hefts an old-fashioned, powder-fired roomsweeper while tight wrappings struggle to contain the entirety of her heavy bosom, keeping it compressed and out of the way.";
			this.long = "uncreated";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.isPlural = false;
			
			this.meleeWeapon = new Tonfas();
			this.armor = new UGCUniform();
			this.rangedWeapon = new TrenchShotgun();
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 25;
			this.aimRaw = 15;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 11;
			this.libidoRaw = 55;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();

			this.baseHPResistances.pheromone.resistanceValue = -200;
			this.baseHPResistances.tease.resistanceValue = -33;
			this.baseHPResistances.drug.resistanceValue = -25;
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 60;
			this.thickness = 40;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "bronze";
			this.furColor = "tawny";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_VULPINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_VULPINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_VULPINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY,GLOBAL.FLAG_LONG,GLOBAL.FLAG_THICK,GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 7;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 785;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;

			this.createPerk("Multiple Attacks",1,0,0,0,"");
			
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return kGAMECLASS.pennyBustDisplay();
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_DIGITIGRADE);
			}
		}
		
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.physiqueRaw = 10;
			dataObject.reflexesRaw = 8;
			dataObject.aimRaw = 6;
			dataObject.intelligenceRaw = 4;
			dataObject.willpowerRaw = 3;
		}
		
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.vaginas[0].bonusCapacity = 20;
			dataObject.elasticity = 3;
		}
		
		public function UpgradeVersion4(dataObject:Object):void
		{
			// Clear out this shit and let the default constructor handle it.
			delete dataObject.meleeWeapon;
			delete dataObject.rangedWeapon;
			delete dataObject.lustVuln;
			delete dataObject.resistances;
			delete dataObject.bonusResistances;
			delete dataObject.bonusLustVuln;
		}
		public function pennyQuestSetup():void
		{
			this.level = 5;
			this.physiqueRaw = 20;
			this.reflexesRaw = 25;
			this.aimRaw = 15;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 11;
			this.libidoRaw = 55;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 25;
			this.shield = new ReaperArmamentsMarkIShield();
			this.rangedWeapon = new TrenchShotgun();
			this.characterClass = GLOBAL.CLASS_MERCENARY;
			
			this.HP(this.HPMax());
			this.shields(this.shieldsMax());
			this.baseHPResistances.pheromone.resistanceValue = -200;
			this.baseHPResistances.tease.resistanceValue = -33;
			this.baseHPResistances.drug.resistanceValue = -25;
			this.createPerk("Multiple Attacks",1,0,0,0,"");
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			if(this.hasStatusEffect("cock out")) this.long = "Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop. She’d be far more imposing if it wasn’t for the fact that her 20\" dick and soft-ball sized balls are swinging in the open, doing their best to dribble pre everywhere she goes.";
			else this.long = "Azra stands by your side, garbed in a suit of heavy armor that makes the otherwise unarmed siren seem even more imposing than her nine foot stature alone. Still, she moves with grace and purpose, and her armored fists could pack quite a wallop.";

			var target:Creature;
					
			// More complex target selection to leverage some of Penny's abilities
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				// skip deadies
				if ((hostileCreatures[i] as Creature).isDefeated()) continue;
				
				if (hostileCreatures[i].hasStatusEffect("Stunned") || hostileCreatures[i].hasStatusEffect("Blinded"))
				{
					target = hostileCreatures[i] as Creature;
				}
				break;
			}
			if (target == null) target = selectTarget(hostileCreatures);
			
			var meleePenny:Boolean = true;
			var rangedPenny:Boolean = true;
			if(target.hasStatusEffect("Flying")) meleePenny = false;
			if(target.hasPerk("Ranged Immune")) rangedPenny = false;
			if(this.hasStatusEffect("Disarmed"))
			{
				rangedPenny = false;
				meleePenny = false;
			}
			//Penny lust turn overrides everything else
			if(this.lust() >= 60 && rand(10) + (this.lust()-60)/4 >= 9) pennyLustTurnLost(hostileCreatures, target);
			//Second wind - use if wounded or energy is low
			else if(!this.hasStatusEffect("Used Second Wind") && (this.HP()/this.HPMax() <= 0.6 || this.energy() < 33)) CombatAttacks.SecondWind.execute(alliedCreatures, hostileCreatures, this, target);
			//Flashbang
			else if(!target.hasStatusEffect("Blind") && this.energy() >= 10 && rand(3) == 0) 
			{
				pennyFlashGrenade(alliedCreatures,hostileCreatures,target);
				this.energy(-10);
			}
			//Charge weapon - boost tonfa damage
			else if(!this.hasStatusEffect("Charged Weapon") && meleePenny && this.energy() >= 15 && rand(2) == 0) 
			{
				output("<i>“I’m gonna need a little bit more...”</i> ");
				this.energy(-15);
				CombatAttacks.ChargeWeapon.execute(alliedCreatures, hostileCreatures, this, target);
			}
			//Melee:
			else if(meleePenny)
			{
				output("Penny’s lip curls into a sneer. <i>“Try these on for size!”</i>\n");
				CombatAttacks.MeleeAttack(this, target);
			}
			else if(rangedPenny)
			{
				output("Penny readies her shotgun.\n");
				CombatAttacks.RangedAttack(this, target);
			}
			else
			{
				if(this.lust() >= 60) pennyLustTurnLost(hostileCreatures, target);
				else output("Penny snarls in impotent fury.");
			}
		}
		public function pennyLustTurnLost(hGroup:Array, target:Creature):void
		{
			var d:int = 5+this.level;
			if(!this.hasStatusEffect("Unzipped"))
			{
				this.createStatusEffect("Unzipped", 0, 0, 0, 0, false, "", "", true, 0);
				output("Biting her lip, Penny groans and slides a hand to the quick-release on her pants. They fall in a heap around her ankles, gracefully decoupled from her weapon belt. She sheepishly steps forward, panting slightly. ");
				if(!this.hasCock()) output("Her very puffy, wet-looking mound is revealed, glistening sinfully. The turned-on vixen licks her lips and attempts to adopt a fighting stance once more, letting her broiling cunt cool in the open air.");
				else if(this.cocks[0].cLength() <= 7) output("A very hard, eager-looking [penny.cockNounSimple] is revealed, throbbing sinfully. The turned-on vixen licks her lips and attempts to adopt a fighting stance once more, clearly more comfortable with her extra appendage unrestrained.");
				else if(this.cocks[0].cLength() <= 13) 
				{
					output("An absolutely turgid [penny.cockNounSimple] springs into view, flinging ropes of anticipatory pre-cum in " + possessive(target.getCombatName()) + " direction. The turned-on vixen licks her lips and shakes her hips, slapping her heavy prong playfully against her belly before daring to return to a traditional combat stance once more.");
					d+= 3;
				}
				else 
				{
					output("The unnaturally large [penny.cockNounSimple] juts forward accusingly at " + target.getCombatName() + ", rigid and unforgiving. Veins as fat as pipes pulse and throb with her heartbeat while pre-cum dribbles from the tip, promising an extremely messy cum-shot in the near future. Penny caresses it with a strained smile and a lick of her lips, moaning like a whore in heat. It is with an extreme sense of regret on her face that the lusty prick-vixen adopts a fighting stance once more, careful not to slip in her own leaky sex-juice.");
					d+= 5;
				}
				this.lust(4);
			}
			//Already unzipped
			else
			{
				if(!this.hasCock())
				{
					if(rand(2) == 0) output("<i>“Just a taste...”</i> Penny whimpers, dropping a tonfa in order to plunge her fingers into her needy twat for a few rapid thrusts. No amount of shameful blushing stops her from stuffing the sodden digits into her maw and sucking them clean. Hums of pleasure soon overpower her needy whimpers, and by the time she pops the last tongue-polished digit free, Penny is dazed and panting. She picks up her fallen weapon with a murmured apology, but the slit between her thighs appears even wetter.");
					else output("Penny toggles one tonfa’s electrical field off, reverses it, and plunges it into her cunt with a pleasure cry. She brazenly fucks herself with her weapon until beads of pussy-juice dribble from its other end and her knees audibly slap together. <i>“S-sorry!”</i> the lust-addled vixen gasps a moment later when she remembers where she is and what she’s doing, withdrawing the soiled tonfa with barely suppressed cries of pleasure.");
					this.lust(5);
					d+= 3;
				}
				else
				{
					//Jack off
					if(rand(3) == 0)
					{
						output("Tucking a weapon into her armpit, Penny grabs hold of her [penny.cock] one-handed" + (this.cocks[0].cLength() >= 13 ? ", the fingers failing to fully encompass the enormity of her artificial endowment":"") + ". She moans, <i>“Sooo horny,”</i> and sets to jacking herself off furiously, ");
						if(this.cocks[0].cLength() <= 7) output("leaking droplets of pre-cum to slick her padded palm’s journey.");
						else if(this.cocks[0].cLength() <= 13) output("drooling enough pre to soak her padded palm and grease her pole all the way down to her low-hanging balls.");
						else output("spilling gooey ropes of pre thick enough to run a one-woman bukkake studio. It smears everywhere, oiling the entirety of her shaft and her oh-so-weighty balls. Webs of it hang between her painted thighs.");
						output(" The lurid, sloppy sounds of the prick-vixen’s masturbation fill the air for long seconds. You worry that she’s giving up entirely when her own obscene moan startles her into attentiveness, and she pulls her hand away with a shameful lick.");
						d+= 3;
					}
					//Selfsuck (big only)
					else if(rand(2) == 0)
					{
						output("Penny wraps her arms under her [penny.cock] and hugs it up against herself, shuddering briefly from the contact before going full-on suck-slut and diving down to wrap her lips around the [penny.cockHead]. Her cheeks hollow as she rabidly slurps at her own prong, messily gulping down the torrid flows of animalistic pre-jism. Dribbles of excess spill down her chin, but she doesn’t seem to care. Only when she stumbles and nearly falls from pleasure does she regain the sense of mind to stop sucking herself off and stagger back into a ready stance.");
						d+= 6;
					}
					//Electrosquirt
					else
					{
						output("With a lusty grin, Penny twists her tonfa, aiming the electrified shaft at her fully engorged one. <i>“This is probably a bad idea, but maybe a little...”</i> She gingerly brings the weapon closer and closer to [penny.cock]. The thunderous crack announces the instant she gets too close. Back arching, the vixen’s body seizes. Her eyes roll back, and her dick visibly swells from the force of her electro-stimulated contractions. " + (this.cocks[0].cLength() < 13 ? "A spurt of pre launches at " + target.getCombatName() + " with bullet-like force, splattering into a glistening web on contact.":"A urethra-straining ball of pre launches at " + target.getCombatName() + " like a ball from a cannon, shattering on impact into a thousand webs of glossy, sex-scented lubricant.") + " She staggers in the aftermath, spasming drops of creamy white onto the ground, eyes halfway crossed. <i>“Uhh... take that... yeah!”</i>");
						d+= 8;
					}
					this.lust(7);
				}
			}
			var totalDamage:DamageResult = new DamageResult();
			for (var i:int = 0; i < hGroup.length; i++)
			{
				var cTarget:Creature = hGroup[i];
				if (cTarget.isDefeated()) continue;
				
				var damage:TypeCollection = damageRand(new TypeCollection( { tease: d } ), 15);
									
				totalDamage.addResult(applyDamage(damage, this, cTarget, "suppress"));
			}
			outputDamage(totalDamage);
		}

		public function pennyFlashGrenade(f:Array, h:Array, target:Creature):void
		{
			CombatAttacks.FlashGrenade.execute(f, h, this, target);
		}
	}
}