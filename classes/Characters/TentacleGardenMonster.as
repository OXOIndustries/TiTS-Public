package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class TentacleGardenMonster extends Creature
	{
		//constructor
		public function TentacleGardenMonster()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "Tentacle Garden";
			this.originalRace = "foliage";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You're surrounded on all sides by wriggling green vines, mercilessly whipping and grabbing at you. A wall of pink pussy-flowers box you in, sucking at your [pc.legs] if you stray out of the center of the garden. The tentacles grab at your [pc.arms], trying to restrain you -- and the cockhead-shaped tips at their ends make it abundantly clear what will happen if they succeed!";
			this.customDodge = "Vines writhing and twisting, they manage to slip away from your attack.";
			this.customBlock = "The spongey vines just seem to absorb your attack.";
			this.isPlural = true;
			isLustImmune = true;
			
			this.meleeWeapon = new Fists();
			meleeWeapon.baseDamage.kinetic.damageValue = 8;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.attack = 8;
			this.meleeWeapon.longName = "vine";
			this.meleeWeapon.attackVerb = "slap";
			this.meleeWeapon.attackNoun = "slap";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.baseHPResistances.corrosive.resistanceValue = -25.0;
			this.baseHPResistances.burning.resistanceValue = -25.0;
			this.baseHPResistances.kinetic.resistanceValue = -25.0;
			
			// Hackjob an existing damage flag with new bonuses to provide a bonus for "slashing" damage.
			this.baseHPResistances.addDamageFlag(
				new DamageFlag(DamageFlag.PLATED, [[DamageFlag.PENETRATING, 1.33, DamageFlag.OP_MUL]])
			);
			
			this.armor.longName = "tough hide";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 15;
			this.reflexesRaw = 40;
			this.aimRaw = 2;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 10;
			this.libidoRaw = 1;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Force It Gender");
			this.createStatusEffect("Flee Disabled");
			
			isUniqueInFight = true;
			btnTargetText = "TentacleGrdn";
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "ADULTCOCKVINE";
		}
		
		private var hasTripped:Boolean = false;
		private var roundsSinceTrip:int = 3;
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];

			roundsSinceTrip++;
			
			// Always follow up a trip attack with grape-juice, success or fail
			if (hasTripped)
			{
				grapeJuice(target);
				hasTripped = false;
				return;
			}
			
			// If the target is *still* tripped and it's been a couple rounds since the last grape-juice, do it again
			if (target.hasStatusEffect("Tripped"))
			{
				roundsSinceTrip++; // Inc faster if the player is still tripped, so we re-juice sooner
				
				if (roundsSinceTrip >= 5)
				{
					grapeJuice(target);
					hasTripped = false;
					return;
				}
			}
			
			if (roundsSinceTrip >= 5 && !target.hasStatusEffect("Tripped"))
			{
				pussyFlowerSlick(target);
				return;
			}
			
			tentacleSlap(target);
		}
		
		private function tentacleSlap(target:Creature):void
		{
			//Basic attack. Deals some Kinetic damage *and* some Lust (Pheromone) damage on a hit.

			output("Several of the dildo-tentacles lunge out, swiping at you like hammers!");
			
			var missMod:Number = 5;
			if (!combatMiss(this, target, -1, missMod))
			{
				output(" Several of the thick green dick-vines slap you, knocking you around with sheer blunt impacts. Every time you're hit, the alien fuck - vines squirt out their musky - smelling spunk across your" + (target.isNude() ? " [pc.chest]" : " [pc.armor]") + ". You're left with purple smears all over");
				if (target.hasAirtightSuit()) output(", smearing your suit with slightly stringy, sticky splatters of goo.");
				else output(", flooding your senses with fuck-pheromones.");
				applyDamage(damageRand(new TypeCollection( { kinetic: 20, pheromone: (target.hasAirtightSuit() ? 0 : 5) } ), 10), this, target);
			}
			else
			{
				output(" You duck and weave, avoiding the vines' attacks!");
			}
		}
		
		private function pussyFlowerSlick(target:Creature):void
		{
			//Knocks the player prone unless they pass a moderate Reflexes save.
			
			hasTripped = true;

			output("You're having a good enough time dodging a hundred fuck-hungry tentacles that for a moment, the pussy-flowers underfoot slip your mind");
			
			var reflexFail:Boolean = (target.reflexes() / 2 + rand(20) + 1 < 24);
			
			output(" -- so they");
			if (!reflexFail || target.isPlanted()) output(" try to");
			output("slip you in return.");
			
			if (!reflexFail || target.isPlanted())
			{
				output(" Something wet smears underneath you, and you're forced to grab some of the squirming tentacles, pulling on them to keep yourself upright. Not today, fuck-plants!");
			}
			else
			{
				output(" You feel something wet under you, but by the time you realize you've just stepped into a puddle of fuck-juices, you're already slipping, thrown on your ass by an errant tentacle-slap. <b>You're prone!</b>");
				CombatAttacks.applyTrip(target);
			}
		}
		
		private function grapeJuice(target:Creature):void
		{
			//Only if player is prone. Deals massive Lust damage.

			output("You're too busy trying not to get beaten into the dirt by the hundreds of thrashing tentacles to notice a handful of them rising back into the air. Only when the rest of them pull apart, creating a perfect circle of open air over you, do you see all of the drooling purple cock-heads looming over you, throbbing with pent-up juices.");

			output("\n\nAnd then, all as one, they ejaculate. Purple plant-spunk pours down on you, squirting from the vines' cockheads. Thick gouts of musky goo splatter all over your [pc.face], coating your body in the pheromone-laden seed.");
			
			var res:TypeCollection = target.getLustResistances();
			if (res.pheromone.resistanceValue < 100 && target.hasAirtightSuit() == false)
			{
				output(" Your mind is reeling by the time they're done, filled with the irresistible scents of sex. Stars, it would be so easy to just spread your [pc.legs] and let these plants breed you senseless...");
				
				applyDamage(damageRand(new TypeCollection( { pheromone: 20 } ), 10), this, target);
			}
		}
	}
}