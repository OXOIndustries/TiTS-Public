package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class TentacleGardener extends Creature
	{
		//constructor
		public function TentacleGardener()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "Tentacle Gardener";
			this.originalRace = "human";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "She's a tall, statuesque woman... if the statuary you're looking at has grossly exaggerated sexual attributes: an impossibly thin waistline but mareish hips, huge breasts decorated with golden chains, and demonic claws and horns. Black-and-green hair swirls around her as she moves, dancing around the garden with a feline grace that seems outright impossible considering the sheer weight of ass, hips, and titties she's carrying -- yet she makes her assets look feather-light. And predatory smile is drawn across her jade lips, and coal-black eyes betray a deep, fathomless hunger as she circles you.";
			this.customDodge = "The gardener deftly slides past your attack with graceful agility.";
			this.customBlock = "The gardener meets your attack with one of her own, glancing it away.";
			this.isPlural = false;
			isLustImmune = false;
			
			this.meleeWeapon = new Fists();
			meleeWeapon.baseDamage.kinetic.damageValue = 8;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.attack = 8;
			this.meleeWeapon.longName = "vine";
			this.meleeWeapon.attackVerb = "slap";
			this.meleeWeapon.attackNoun = "slap";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.baseHPResistances.tease.resistanceValue = -25.0;
			this.baseHPResistances.burning.resistanceValue = 33.3;
			this.baseHPResistances.freezing.resistanceValue = 33.3;
			this.baseHPResistances.electric.resistanceValue = 33.3;
			this.baseHPResistances.kinetic.resistanceValue = 10.0;
			
			// Hackjob an existing damage flag with new bonuses to provide a bonus for "slashing" damage.
			this.baseHPResistances.addDamageFlag(
				new DamageFlag(DamageFlag.PLATED, [[DamageFlag.PENETRATING, 1.5, DamageFlag.OP_MUL]])
			);
			
			this.armor.longName = "tough hide";
			this.armor.defense = 5;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 20;
			this.aimRaw = 15;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 35;
			this.libidoRaw = 1;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 140;
			this.HPRaw = this.HPMax();
			
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled");
			
			isUniqueInFight = true;
			btnTargetText = "TentGardener";
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "TENTACLEGARDENER";
		}
		
		private var HasTakenPhysicalDamage:Boolean = false;
		private var HasTentacleQueued:Boolean = false;
		private var VineWhipCooldown:int = 0;
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (HasTakenPhysicalDamage)
			{
				HasTakenPhysicalDamage = false;
				pollenCloud(target);
			}
			
			if (HasTentacleQueued)
			{
				naughtyTentacle(target);
				return;
			}
			
			if (target.isGrappled())
			{
				if (!target.hasAirtightSuit())
				{
					snowball(target);
				}
				else
				{
					vineSqueeze(target);
				}
				return;
			}
			
			VineWhipCooldown--;
			
			var attacks:Array = [];
			
			if (rand(4) == 0)
			{
				if (VineWhipCooldown <= 0)
				{
					vineWhip(target);
				}
				else
				{
					tentacleSlap(target);
				}
			}
			else
			{
				stripTease(target);
			}
		}
		
		private function pollenCloud(target:Creature):void
		{
			//Creates a low-impact Lust Over Time on the PC. She uses this automatically at the start of any turn she took physical damage on, before taking her normal actions. These stack, so the more damage she takes, the worse the lust effect gets.
			
			output("<i>“Oh, that hurts!”</i> the demonic woman mocks, crossing her hands over her heart. Pressing her shoulders together just makes her massive udders look that much larger, more enticing... and the subtle pressure on them triggers something inside her! Her pierced nipples stiffen, and you see a golden liquid start beading on the obsidian peaks. At first it looks like honey, but as soon as it's out of her breasts, the stuff crystallizes and bursts into a million tiny particles!");

			output("\n\nThe air is suddenly thick with miniscule golden seeds -- pollen! Her pain is filling the arena with some kind of fuck-scent cloud");
			
			if (!target.hasAirtightSuit())
			{
				output(", clawing at your will to fight!");
				
				// Repurposing an existing status effect that handles everything we already want
				if (target.hasStatusEffect("Pollen Lust"))
				{
					var se:StorageClass = target.getStatusEffect("Pollen Lust");
					se.value1 = 3; // Reset the remaining round duration
					se.value3 += 0.2; // Add some extra to the multiplier
				}
				else
				{
					// v1 = rounds remaining
					// v2 = type of handling for this effect (seeing as we're repurposing an existing effect)
					// v3 = stacks
					target.createStatusEffect("Pollen Lust", 3, 1, 1, 0, false, "Icon_LustUp", "The miasma of fuck-pollen produced by the tentacle gardener hangs heavy in the air...", true, 0, 0xFF0000);
				}
			}
			else
			{
				output(". Good thing your suit is air-tight!");
			}

			output("\n\n");
		}
		
		private function stripTease(target:Creature):void
		{
			output("The obsidian temptress twirls around you, making fuck-hungry noises and shaking her hips and tits with every motion. Her hands grasp at the dildo-vines hanging from the walls, pulling them taut and swinging herself around them. At first, you think she's using them to leap around the clearing just that much faster, but as you watch her movements, it becomes obvious it's all a show, a dance to make her huge breasts jiggle and let her thrust her fuckable ass out towards you in a brazen display of sexuality.");
			
			applyDamage(damageRand(new TypeCollection({ tease: 5 }), 15), this, target);
		}
		
		private function vineWhip(target:Creature):void
		{
			//Deals like Kinetic damage and grapples the PC! Will only do this once she's below full Health.
			output("With a snarl, the alien woman grabs one of her precious vines by the step and swings the meaty, living trunk of it right at your [pc.feet].");
			
			var missMod:Number = 3;
			if (combatMiss(this, target, -1, missMod))
			{
				output(" You dodge backwards, evading the vine!");
			}
			else
			{
				output(" The tentacle slaps against your [pc.foot], winding around your body before you can react! In the blink of an eye, you're wrapped up in tentacles that squeeze and squirm all around you, making movement all but impossible!");
				target.createStatusEffect("Grappled", 0, 20, 0, 0, false, "Constrict", "You’re wrapped up in the gardeners tentacles!", true, 0, 0xFF0000);
				VineWhipCooldown = 4;
			}
		}
		
		private function vineSqueeze(target:Creature):void
		{
			output("The sinuous tentacles squeeze down around your limbs tightly, a cooing groan from their gardener mistress as she revels in the sweet sight of your tender flesh bulging slightly around the vice-tight embrace of her writhing pets. She squishes herself against your back, her face perched over your shoulder, cheek-to-helmet with your airtight suit, a lazy, tantilizing fingertip trailing down the other side of the face mask protecting you from the rich oozings delivered by the tentacles squirming around you."); 
			
			applyDamage(damageRand(new TypeCollection({ kinetic: 7, tease: 3}, DamageFlag.BYPASS_SHIELD), 15), this, target);
		}
		
		private function snowball(target:Creature):void
		{
			//Deals more Lust damage than the basic Tease attack; only usable when the PC is grappled.

			output("<i>“All trussed up with nowhere to go,”</i> the demonic-looking gardener coos, approaching you with a swaggering gait. She cups some of the viney cock-heads surrounding you, pointedly ignoring your struggles while she takes one of the throbbing crowns into her mouth. Her jade lips close around it, and you can see her cheeks moving with an obvious sucking motion, drawing the shaft deeper in and letting it wiggle back out again.");

			output("\n\nThe vine shudders and grows thicker for a brief moment before squirming out of her mouth, squirting aftershots of purple cum onto its mother's tits and belly. She moans, eyes fluttering closed. Then her hands are one your cheeks, claws caressing your [pc.skinFurScales]. Her lips push against yours, tongue thrusting forward to push your [pc.lips] apart. And with it comes thick, fragrant seed!");

			output("\n\nWhen she breaks the forced kiss, you're coughing and sputtering, and purple plant-cum is leaking down your chin.");

			applyDamage(damageRand(new TypeCollection({ tease: 5, drug: 4}), 15), this, target);
		}
		
		private function naughtyTentacle(target:Creature):void
		{
			output("The woman's wave-like motions come to a momentary stop when she nears one of the tentacles that was bruised in your previous conflict. She gasps, picking up the swollen cockhead in both hands and cradling its throbbing, turgid body. <i>“Oh, you poor baby! Here, mama will make it all better...”</i>");

			output("\n\nWith the ease of an act practiced a thousand times, the gardener guides the vine's purple crown right into her pussy. She moans throatily, cupping a boob and rubbing her clit while the vine snuggles in and starts pumping away. The golden chains hugging her plush frame jingle from their piercing mounts, making the lurid display that much more enticing.");

			output("\n\nThe whole affair only lasts a handful of seconds before the vine wriggles free, followed quickly by a purple streak that leaks down the gardener's lush thighs.");
			
			applyDamage(damageRand(new TypeCollection({ tease: 7 }), 15), this, target);
			this.lust(-(this.lust() * 0.2)); // Reduce current lust by 20%
		}
		
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{
			var sHealthPc:Number = HPQ();
			var sLustPc:Number = lustQ();
			var gates:Array = [75, 50, 25];
			
			super.OnTakeDamage(incomingDamage);
			
			if (incomingDamage.kinetic.damageValue > 0)
			{
				HasTakenPhysicalDamage = true;
			}
			
			for (var i:int = 0; i < gates.length; i++)
			{
				if (sHealthPc >= gates[i] && HPQ() < gates[i])
				{
					HasTentacleQueued = true;
					return;
				}
				
				if (sLustPc <= gates[i] && lustQ() > gates[i])
				{
					HasTentacleQueued = true;
					return;
				}
			}
		}
		
		private function tentacleSlap(target:Creature):void
		{
			//Basic attack. Deals some Kinetic damage *and* some Lust (Pheromone) damage on a hit.

			output("Several of the dildo-tentacles lunge out, swiping at you like hammers!");
			
			var missMod:Number = 5;
			if (!combatMiss(target, target, -1, missMod))
			{
				output(" Several of the thick green dick-vines slap you, knocking you around with sheer blunt impacts. Every time you're hit, the alien fuck - vines squirt out their musky - smelling spunk across your" + (target.isNude() ? " [pc.chest]" : " [pc.armor]") + ". You're left with purple smears all over, flooding your senses with fuck-pheromones.");
				applyDamage(damageRand(new TypeCollection( { kinetic: 14, pheromone: 5 } ), 10), this, target);
			}
			else
			{
				output(" You duck and weave, avoiding the vines' attacks!");
			}
		}
	}
}