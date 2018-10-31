package classes.Characters 
{
	import classes.BreastRowClass;
	import classes.Creature;
	import classes.GameData.Pregnancy.PregnancyStageProgression;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.VaginaClass;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Util.RandomInCollection;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class GrayPrime extends Creature
	{
		
		public function GrayPrime() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "gray prime";
			this.originalRace = "gray goo";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This glistening gray goo-girl isn’t like her sisters. Tall, well-built, and realistically proportioned, she’s almost human. The gray goo has modeled herself on a human woman, with a long ponytail and a hefty shirt-straining rack that bounces with every step she takes. She’s even made clothes out of her goo: a knee-skirt and blouse over tall boots and stockings. Her shirt has a Bell-Isle/Grunmann patch stitched onto the shoulders, the field of stars on the logo rippling and shining as she moves. A sword of glistening goo extends seamlessly from her hand, cutting through the air with an audible <i>zing</i> as she advances.";
			this.customDodge = "The goo’s liquid flexibility allows it to handily avoid your attack.";
			this.customBlock = "The goo’s liquidity absorbs a great deal of punishment - without taking damage.";
			this.isPlural = false;
			
			meleeWeapon = new GooeyPsuedopod();
			meleeWeapon.attack = 2;
			meleeWeapon.baseDamage.kinetic.damageValue = 11;
			meleeWeapon.hasRandomProperties = true;
			
			armor = new GooeyCoverings();
			armor.defense = 3;
			armor.hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			this.physiqueRaw = 16;
			this.reflexesRaw = 19;
			this.aimRaw = 12;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 14;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 5;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 20;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "silver";
			this.tallness = 73;
			this.thickness = 45;
			this.tone = 60;
			this.hairColor = "steel gray";
			this.scaleColor = "steel gray";
			this.furColor = "steel gray";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "steel gray";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_SQUISHY);
			addSkinFlag(GLOBAL.FLAG_LUBRICATED);
			addSkinFlag(GLOBAL.FLAG_AMORPHOUS);
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 1;
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
			this.hipRatingRaw = 10;
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
			
			var pCunt:VaginaClass = new VaginaClass(true);
			pCunt.hymen = false;
			pCunt.loosenessRaw = 3;
			pCunt.wetnessRaw = 3;
			this.vaginas = [pCunt];
			
			var pTits:BreastRowClass = new BreastRowClass();
			pTits.breastRatingRaw = 14;
			pTits.breasts = 2;
			this.breastRows = [pTits];
			this.nippleColor = "silver";
			
			//No dicks here!
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Gray Prime";
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GRAY_GOO_PRIME_2";
		}
				
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var pc:PlayerCharacter;
			var anno:Anno;
			var isGrappling:Boolean = false;
			// If anything is grappled, move along and let the container deal with it
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				if (hostileCreatures[i].hasStatusEffect("Grappled")) isGrappling = true;
				if (hostileCreatures[i] is PlayerCharacter) pc = hostileCreatures[i] as PlayerCharacter;
				if (hostileCreatures[i] is Anno) anno = hostileCreatures[i] as Anno;
			}
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (!isGrappling)
			{
				var attackChance:int = 33;
				attackChance += ((HP() / HPMax()) * 50);
				attackChance -= ((lust() / lustMax()) * 50);
				
				if (target is PlayerCharacter && target.hasStatusEffect("Tripped") && !hasStatusEffect("Grapple Cooldown"))
				{
					grapplePC(pc);
				}
				else if (rand(100) <= attackChance)
				{
					var attacks:Array = [forcePunch, gooSword];
					if (target is Anno) attacks.push(attackAnno);
					
					RandomInCollection(attacks)(target);
				}
				else
				{
					lustfulClones(alliedCreatures);
				}
			}
			
			// Tack lust clones onto the end of the primes logic- lets us compress 3-4 identical
			// attacks into one
			if (alliedCreatures.length > 1)
			{
				cloneLustAttacks(alliedCreatures, pc);
			}
		}
		
		private function attackAnno(target:Creature):void
		{
			//Chance to disable help from Anno for a turn
			output("The goo turns her attention from you to your companion. Anno takes an unsure step back, leveling her gun at the goo and firing as it advances. The goo-girl dodges with inhuman ability, crumbling to dust where Anno shoots, only to reform inches from the ausar!");

			if (combatMiss(this, target))
			{
				output(" Anno leaps out of the way as the goo-girl lunges for her! <i>“Bitch!”</i> the goo shouts. <i>“I’m not almost human! I’M MORE HUMAN THAN YOU ARE.”</i>");
				output("\n\n<i>“I’m an ausar, you stupid cunt!”</i>\n");
			}
			else
			{
				output(" The gray goo’s hand lashes out, grabbing Anno by the neck and slamming your companion up against the bulkhead, choking her. Anno thrashes out, punching the goo square in the face... only for its face to deform around her fist, letting it pass straight through and hardening around it, trapping Anno’s hand. <i>“Almost human, was it? I’LL SHOW YOU ALMOST HUMAN!”</i>\n");

				target.createStatusEffect("Grappled", 0, 0, 0, 0, true, "Constrict", "The Gray Prime has Anno in her clutches!", true, 0);
			}	
		}
		
		private function gooSword(target:Creature):void
		{
			//One heavy physical attack
			output("The gray goo adapts an almost-textbook duelist’s pose before she lunges at " + (target is PlayerCharacter ? "you" : "Anno") + ", her razor-sharp saber cutting through the air towards your " + (target is Anno ? "companions " : "") + "neck! Her first thrust drives you and Anno apart, cutting neatly between the two of you. Even as " + (target is PlayerCharacter ? "you riddle" : "Anno riddles") + " the goo’s back with bullets, the monstrous woman pirouettes and brings her blade back around " + (target is PlayerCharacter ? "at you." : "toward Anno."));

			if (combatMiss(this, target))
			{
				output(" " + (target is PlayerCharacter ? "You duck" : "Anno ducks") + " back, evading the goo’s sword strike. Before she can swing again, " + (target is PlayerCharacter ? "you get" : "Anno gets") + " a shot off, blasting the goo’s sword into pieces... only for it to reform a moment later, once " + (target is PlayerCharacter ? "you’re" : "shes") +" safely away.");
			}
			else
			{
				output(" " + (target is PlayerCharacter ? "You duck" : "Anno ducks") + " back just in time, turning what might have been a mortal blow into a stinging graze. She isn’t playing around!\n");

				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
		
		private function grapplePC(target:Creature):void
		{
			//Restrain attack. Inflicts Lust over time.
			output("Suddenly, the sea of gray erupts around you! A half dozen thick, squirming gray tentacles surge up from the deck, lashing out at your limbs!");

			if (combatMiss(this, target))
			{
				output(" Just as the tentacles are about to grab you, half of them explode in showers of goop as Anno levels her gun at them, firing dangerously close to your head. You duck as the others writhe and retreat under a hail of fire.");
			}
			else
			{
				output(" Two of the tentacles wrap tightly around your wrists");
				if (target.isBiped()) output(", while two more grab your [pc.legs], lifting you up from the ground!");
				else if (target.isTaur()) output(", while the rest grapple your inhuman lower half, raising you up from the deck until your [pc.legs] are dangling!");
				else output(", while the rest grab your [pc.legOrLegs], lifting you up from the ground!");
				output(" Another tentacle emerges, squirming toward your mouth; others crawl across your body, seeking out your other hole");
				if (target.hasVagina()) output("s");
				output(". Across the room, Anno is suffering the same fate, tendrils of gray wrapping around her limbs, tearing at her sheer catsuit to get at her pussy and tits.");

				target.createStatusEffect("Grappled", 0, 35, 0, 0, false, "Constrict", "The Gray Primes tentacles are wound around your limbs, keeping you restrained!", true, 0);
			}
		}
		
		private function forcePunch(target:Creature):void
		{
			//One moderate physical, chance of knockdown
			output("The goo-girl leaps forward, her off-hand visibly enlarging and hardening as she hurtles toward " + (target is PlayerCharacter ? "you" : "Anno") +" for what’s going to be a world-rocking punch!");

			if (combatMiss(this, target))
			{
				output(" " + (target is PlayerCharacter ? "You knock" : "Anno knocks") + " her fist aside at the last moment, letting her momentum carry her through to the deck. Just when she tries to rise up, Anno leaps in with a roundhouse kick that takes the bitch’s head clean off! Of course, she reforms a moment later across the room, looking no worse for wear.");
			}
			else
			{
				output(" Her fist slams into " + (target is PlayerCharacter ? "you" : "Anno") + " like a freighter, cracking into " + (target is PlayerCharacter ? "your" : "her") +" face and sending " + (target is PlayerCharacter ? "you" : "her") +" plummeting to the ground. Oh, fuck, that " + (target is Anno ? "looks like it " : "") + "hurt!");

				// 25% of knockdown
				if (rand(4) == 0 && !target.isPlanted())
				{
					if (target is PlayerCharacter) output(" The blow hits you so hard you’re seeing stars!");
					else output(" Anno doesn’t look all that steady on her feet!");
					CombatAttacks.applyTrip(target);
				}

				var damage:TypeCollection = meleeDamage();
				damage.add(20);
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
	
		private function lustfulClones(allied:Array):void
		{
			//The Gray Prime creates 1d4+1 stripper clones. Each makes a light lust attack each turn until destroyed. Basically Mirror Image but worse. 
			output("The goo-girl takes a step back from you and Anno, dropping her sword and instead moving her fingers up to the buttons on her blouse, pulling them apart with a flourish to let her ample rack bounce free: two perfectly formed, glistening wet orbs of nanomachine flesh that look too good to not squeeze and grope. <i>“Why don’t you just surrender? I could use a few tough new sources of lubricant...”</i> she teases, shifting to emphasize her cleavage and jiggling it at you.");
			
			// If they don't already exist/have been defeated, add them
			if (allied.length == 1)
			{
				for (var i:int = 0; i < 3; i++)
				{
					CombatManager.addHostileActor(new GooClone());
				}
				
				output("\n\nAs she does so, several mounds of gray goo arise from the deck, slowly forming into new goo-girls. Each is a near perfect clone of the first, though butt-naked and with greatly overstated busts, hips, and asses, all of which are almost cartoonishly big. The new girls smile and shake what their programmer gave them, wiggling their hips and cupping their tits at you.");
			}
			// Otherwise cheat, and resurrect them to save having to deal with removing/readding shit all the time
			else
			{
				var numResurrected:int = 0;
				
				for (i = 0; i < allied.length; i++)
				{
					var tarClone:Creature = allied[i];
					
					if (!(tarClone is GooClone)) continue;
					
					if (tarClone.isDefeated())
					{
						numResurrected++;
						tarClone.HPRaw = tarClone.HPMax();
						tarClone.lustRaw = tarClone.lustMin();
						tarClone.alreadyDefeated = false;
					}
				}
				
				output("\n\nAs she does so, " + (numResurrected == 1 ? "a mound of gray goo arises from the deck, slowly forming into a new goo-girl" : "several mounds of gray goo arise from the deck, slowly forming into new goo-girls") + " to replace those fallen before them. Each is a near perfect clone of the first, though butt-naked and with greatly overstated busts, hips, and asses, all of which are almost cartoonishly big. The new girl" + (numResurrected == 1 ? "" : "s") + " smile and shake what "+ (numResurrected == 1 ? "her" : "their") +" programmer gave "+ (numResurrected == 1 ? "her" : "them") +", wiggling "+ (numResurrected == 1 ? "her hips and cupping her tits at you." : "their hips and cupping their tits at you."));
			}
		}
		
		private function cloneLustAttacks(allies:Array, target:Creature):void
		{
			var numAlive:int = 0;
			var gooClone:GooClone = null;
			
			for (var i:int = 0; i < allies.length; i++)
			{
				if (allies[i] is GooClone && !allies[i].isDefeated())
				{
					numAlive++;
					if (gooClone == null) gooClone = allies[i];
				}
			}
			
			if (numAlive > 0)
			{
				if (numAlive == 1)
				{
					output("\n\nOne of the lust clones shakes her hips and titties at you, trying to entice you into sex!");
				}
				else
				{
					output("\n\nThe lust clones shake their hips and titties at you, trying to entice you into sex!");
				}
				
				applyDamage(new TypeCollection( { tease: numAlive } ), gooClone, target, "minimal");
			}
		}
	}

}
