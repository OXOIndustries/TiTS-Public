package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class Goocubator extends Creature
	{
		//constructor
		public function Goocubator()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			this.short = "crystal goo incubator";
			this.originalRace = "ganrael";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.isPlural = false;
			this.meleeWeapon = new GooeyPsuedopod();
			this.meleeWeapon.baseDamage.kinetic.damageValue = 20;
			this.meleeWeapon.hasRandomProperties = true;
			this.armor = new GooeyCoverings();
			this.armor.defense = 10;
			this.armor.resistances.addFlag(DamageFlag.MIRRORED);
			this.armor.hasRandomProperties = true;
			this.physiqueRaw = 20;
			this.reflexesRaw = 10;
			this.aimRaw = 15;
			this.intelligenceRaw = 9;
			this.willpowerRaw = 30;
			this.libidoRaw = 60;
			this.HPMod = 200;
			this.shieldsRaw = 0;
			
			this.energyRaw = 100;
			this.lustRaw = 40;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 100.0;
			baseHPResistances.freezing.damageValue = 100.0;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.HPRaw = this.HPMax();
			this.credits = 0;
			
			this.femininity = 90;
			this.eyeType = 0;
			this.eyeColor = "green";
			this.tallness = 49;
			this.thickness = 60;
			this.tone = 50;
			this.hairColor = "green";
			this.scaleColor = "green";
			this.furColor = "green";
			this.hairLength = 12;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "green";
			this.skinFlags = [GLOBAL.FLAG_SQUISHY, GLOBAL.FLAG_LUBRICATED, GLOBAL.FLAG_AMORPHOUS];
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
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
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 50;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 24;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 400;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 5674;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 5;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "green";
			//Goo is hyper friendly!
			this.elasticity = 100;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 14;
			this.nippleColor = "deep emerald";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 5;
			
			impregnationType = "RoyalEggPregnancy";
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Goocubator";
			sexualPreferences.setRandomPrefs(7, 0);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikesFactor());
			long = "The crystal-armored goo-girl in front of you is a mass of green slime in the vague form of a nyrean woman, with oversized hips and a huge pair of glistening breasts that bounce around with every movement. Her body is covered with small flecks and plates of natural emerald crystal, but unlike most of her race, the vast majority of her crystal is concentrated around her hugely swollen belly, forming a perfect, smooth dome. Underneath the protective shell of crystal are what must be hundreds of white, fist-sized eggs, floating listlessly in their gooey womb.";
			if (flags["CRYSTAL_GOO_GLORYHOLED"] == 1) 
			{
				long += " A misty cloud of [pc.cumColor] billows around the eggs, clinging to several of the outliers. If they weren’t fertilized already, then you’ve certainly got a few new kids on the way. The gooey incubator looks at you with wild eyes, her arms clutching her eggy belly protectively. Looks like this artificial momma will do anything to protect her clutch!";
				lustRaw = 0;
			}
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GOOCUBATOR";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(!target.hasStatusEffect("Grappled"))
			{
				if(HP() < 150 && !hasStatusEffect("Goo Shield")) crystalShieldGoo(target);
				else if(!target.hasStatusEffect("Blinded") && rand(6) == 0) gooSpitShit(target);
				else if(rand(7) == 0) gooeyGrappleStuff(target);
				else if(rand(4) == 0) bellyTeaseGOOO(target);
				else if(rand(3) == 0) gooeyTentagrope(target);
				else gooTendrilSlap(target);
			}
			else keepOnGropinOn(target);
		}
		
		private function crystalShieldGoo(target:Creature):void
		{
			output("<i>“Oooww, you’re hurting me!?”</i> the goo whines, more in surprise than pain, it seems. <i>“Don’t you dare hurt my eggs!”</i>");
			output("\n\nThe look of bubbly determination that she’s been sporting twists into a grimace of concentration. A few moments later, the various small flecks of crystal floating around her body start to move through her, coalescing around one of her arms. They become a crystalline buckler, held together by a viscous layer of goo. <i>“Never gonna get through this!”</i> she declares with a shake of her hips.");
			createStatusEffect("Goo Shield",0,0,0,0,false,"Icon_DefUp","With her crystal shield, the goo will be much tougher to drop through violent means!",true,0);
			armor.defense += 20;
		}

		private function keepOnGropinOn(target:Creature):void
		{
			if(target.statusEffectv4("Grappled") >= 3)
			{
				didntEscapeFromGooInThreeTurns(target);
				return;
			}
			output("The goo girl is firmly affixed to you, rubbing her crystal belly against you like some sort of alien dry hump while the rest of her gooey body gropes at you, ");
			if(target.biggestTitSize() >= 1) output("squeezing your [pc.chest] and ");
			output("slipping tendrils of goo around your crotch.");

			output("\n\n<i>“This is soooo much better!”</i> she giggles, her voice fading into an unintelligible moan. She’s getting off on this - and she’s doing everything she can to make sure you do, too.");

			if(target.willpower()/2 + rand(20) + 1 >= 21) output("\nYou struggle as hard as you can, refusing to give in to your carnal desires!");
			else
			{
				applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
				output("\nAnd it’s working! Pleasure rushes through you, making you pant and gasp as the gooey vixen massages your entire body.");
			}lust(3);
			//Stick rounds in #4
			target.addStatusValue("Grappled",4,1);
		}
		
		private function didntEscapeFromGooInThreeTurns(target:Creature):void
		{
			output("Your attempts at escape seem completely useless, and your struggles only prove to excite the amorous goo-girl further. The more your limbs squirm in her sticky embrace, the louder her lusty moans become, and the more you see her bloated belly sway ponderously against your gut, rolling her huge clutch of eggs around. The feeling of all those eggs moving inside her must be maddeningly pleasurable, as her slimy exterior spurts moisture all over you [pc.chest].");
			output("\n\n<i>“Gonna... gonna...”</i> she mewls, rubbing faster against you. <i>“Gonna...!”</i>");
			output("\n\nShe can’t quite find the words to give voice to her ecstasy, and ends up settling on a high-pitched scream that reverberates off the stone walls. Her goo releases you, letting you tumble to the ground as she climaxes herself into a gooey, incoherent mess. Your eyes are drawn to the crystal dome around her belly, shielding her hundreds of pearly eggs from the rest of her body’s near-collapse into a formless pile of slime. The gemstone orb rolls around like a punted beachball on a bed of lube.");
			output("\n\nShe only stays that way for a moment, though, before she reforms herself into a familiar form, hefting up her crystal belly and protectively shielding it back in her gut. <i>“Aww, you didn’t cum?”</i> she whines, looking horribly disappointed. <i>“Guess I’ll have to, like, try harder!”</i>");
			orgasm();
			applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
			target.removeStatusEffect("Grappled");
		}
		
		private function gooeyGrappleStuff(target:Creature):void
		{
			output("<i>“Don’t fight me!”</i> the goo purrs, sliding towards you on her thick, legless lower body. Her belly bounces as she moves, hundreds of eggs gently rattling against the perfect crystal dome her arms are shielding. <i>“The queen will be SO MAD if you hurt her eggs... so why not, like, just stop already? I’ll let you play with me if you do...”</i> she offers, a seductive smile spreading on her emerald lips.");
			output("\n\nBefore you can answer, the goo lunges forward, sliding past your defenses and splattering her lower body around your [pc.legs], molding her goop around you! Her arms slip around you, trying to completely pull you into her! ");
			if(target.reflexes()/2 + rand(20) + 1 >= physique()/2 + 13)
			{
				output("\n\nYou push her back, forcing the goo-girl to give you some much-needed distance. She pouts, crossing her arms. <i>“You’re gonna regret this!”</i>");
			}
			else
			{
				output("\n\nYou try to push her back, but can’t find proper purchase! Before long, almost your entire body has been smothered in emerald slime - all that’s left is the crystal ball of the girl’s distended gut pressing against your [pc.belly], and her face just inches from yours. Her slime squirms and presses all around you, rubbing at your groin and ass and chest in all the right ways, with no sign of letting up! <b>You’re grappled!</b>");
				applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
				lust(3);
				CombatAttacks.applyGrapple(target, 35);
			}
		}
		
		private function gooeyTentagrope(target:Creature):void
		{
			output("The goo-girl reaches out with one of her arms, which breaks apart as it moves, becoming a dozen small, slender tendrils of viridian slime. You stumble back, but the goo’s reach seems unlimited, and she’s quickly rubbing her tentacles all over you, groping at your [pc.crotch], and smearing your [pc.chest] with slimy caresses.");
			for(var x:int = 0; x < 4; x++)
			{
				if(target.willpower()/2 + rand(20) + 1 >= 21) output("\nSomehow, you manage to grit your teeth and ignore her inhuman advances!");
				else 
				{
					output("\nThe alien attention leaves your cheeks burning, and your whole body flushing with arousal. The things you could do to a gooey beauty like this...");
					applyDamage(new TypeCollection( { tease: 4 } ), this, target, "minimal");
				}
			}
		}
		
		private function bellyTeaseGOOO(target:Creature):void
		{
			output("Your opponent bounces around you, moving with inhuman twists and turns that would break a creature with bones. But for her, it seems like she’s flowing around her crystal-clad belly, deforming and reforming every few moments in a myriad of ways that emphasize her hugely pregnant stomach. A pair of gooey arms wrap around it, fingers tracing over the perfectly smooth gemstone as her pseudo-hips thrust out beneath it.");
			//If PC saves...
			if(target.willpower()/2 + rand(20) + 1 >= 18)
			{
				output("\nIs that supposed to turn you on?");
			}
			else if(!target.hasCock())
			{
				output("\nYou find the alien display disquietingly erotic, an invitation to join with the gooey incubator and share in the joys of egg-swelling motherhood...");
				applyDamage(new TypeCollection( { tease: 13 } ), this, target, "minimal");
			}
			//if cock + success:
			else 
			{
				output("\nThe alien dance is alluring in the best of ways, inviting you to cover over and slide your cock ");
				if(flags["CRYSTAL_GOO_GLORYHOLED"] == 1) output("back ");
				output("into her gooey nethers and fertilize her massive store of nyrean eggs. Hundreds of them are floating inside her, begging for a cock to seed them. It’s hard to resist the urge to give her what she wants....");
				applyDamage(new TypeCollection( { tease: 16 } ), this, target, "minimal");
			}
		}
		
		private function gooSpitShit(target:Creature):void
		{
			output("The gooey incubator swings one of her arms at you, as fast as her heavily laden body will let her. Rather than strike at you directly, though, a clump of goop flings off of her body and hurtles towards you!");
			if(target.shields() > 0) output("\nThe goo splatters on your shields, drooling down to the ground like a bug caught on a windshield.");
			else if(rangedCombatMiss(this, target) || target.hasBlindImmunity()) output("\nThe goo splatters harmlessly on your chest. What was the point of that!?");
			else
			{
				output("\nThe gooey blob beans you right in the face! You yelp in surprise as the warm slime splatters across your face, bathing everything in a weird green light - <b>you’re blinded by the goo</b>!");
				CombatAttacks.applyBlind(target, rand(3) + 1);
			}
		}
		
		private function gooTendrilSlap(target:Creature):void
		{
			output("The goo-girl gives a shrill warcry and lunges at you, a thick tendril of goo forming from her shoulder and lashing at you.");
			if(combatMiss(this, target)) output("\nYou manage to block the attack, deflecting the swing away.");
			else
			{
				output("\nThe egg-laden woman catches you off-guard and smashes her gooey tentacle into your chest! The force of the blow leaves you reeling, and covered in wet slime.");
				applyDamage(meleeDamage(), this, target, "melee");
			}
		}
	}
}