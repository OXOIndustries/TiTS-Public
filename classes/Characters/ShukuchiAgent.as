//Parent/Template for ShukuchiAusar and ShukuchiHuman

package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.Items.Melee.Fists;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.HardlightDagger;
	public class ShukuchiAgent extends Creature
	{
		//MUST FIX RESISTANCES
		public function ShukuchiAgent()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You were not supposed to see this :/";
			this.customDodge = " as you swiftly recompose yourself before he takes up another stance.";
			this.customBlock = " brushes your strike aside by parrying the pivot of your wrists, guaranteeing that it doesn’t make contact!";
			this.isPlural = false;
			this.meleeWeapon = new HardlightDagger();
			
			this.armor.longName = "ShukuSuit";
			this.armor.defense = 0;
			this.armor.resistances = new TypeCollection();
			
			this.physiqueRaw = 35;
			this.reflexesRaw = 40;
			this.aimRaw = 30;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 25;
			this.libidoRaw = 45;
			this.energyRaw = 100;
			this.level = 8;
			this.credits = 500;
			this.XPRaw = 5000;
			this.HPMod = 20;
			this.HPRaw = this.HPMax();
			
			var baseHPResistances:TypeCollection = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 50.0;
			baseHPResistances.burning.damageValue = -10.0;
			baseHPResistances.psionic.damageValue = 1.0;
			baseHPResistances.pheromone.damageValue = 1.0;
			baseHPResistances.tease.damageValue = 1.0;
			
			this.femininity = 15;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.hairColor = "black";
			this.tone = 65;
			this.thickness = 15;
			
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_SMOOTH];
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			
			this.lipMod = 0;
			this.lipColor = "peach";
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			
			this.breastRows[0].breastRatingRaw = 0;
			this.breastRows[0].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
			this.nipplesPerBreast = 1;
			this.nippleColor = "brown";
			this.timesCum = 0;
			this.minutesSinceCum = 9999;
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			
			isUniqueInFight = false;
			_isLoading = false;
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			
			var choice:int = rand(9);
			
			if (CombatManager.getRoundCount() == 1){
				punchySpecial(target);
				return;
			}
			else if (choice > 3) punchyCutty(target);
			else if (choice > 1) punchyFlurry(target);
			else if (choice > 0) punchyFlashy(target);
			else punchySpecial(target);
		}
		
		private function punchyCutty(target:Creature):void
		{
			output("An agent swings a blade towards your eyes! ");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output("You duck and twist, dodging the blade and the follow up punch to your ribs.");
			else
			{
				output("The blade swings past your face, dazzling your senses! In that moment, follow up rib punches rock your side, pushing you back!");
				for (var i:int = 0; i < 2; ++i) applyDamage(damageRand(meleeDamage(), 10), this, target, "minimal");
			}
		}		
		protected function punchyFlurry(target:Creature):void
		{
			output("The agent ducks low, throwing his fist towards your midsection!");
			if (combatMiss(this, target) || blindMiss(this, target, true)) output(" You’re able to avoid this odd maneuver, the agent’s follow-up punch failing to connect!");
			else
			{
				output(" His fist makes a hefty impact against your sternum, battering through any defense you have! A kick to the calves, a gut punch and a knife-hilt to the face follow!");
				for (var i:int = 0; i < 4; ++i) applyDamage(damageRand(meleeDamage(), 10), this, target, "minimal");
			}
		}
		private function punchyFlashy(target:Creature):void
		{
			output("With a quick dive of his hand to his belt, the masked madman throws a small blue object right at your feet: grenade! ");
			if (combatMiss(this, target) || target.hasBlindImmunity()) output("You manage to cover your eyes in time, the worst effect being the quickly passing piercing whine!");
			else
			{
				output("You can’t dodge or take cover in time, the extreme, cripplingly sharp flash doing enough to make you blinded!");
				CombatAttacks.applyBlind(target, 2);
			}
		}
		protected function punchySpecial(target:Creature):void
		{
			output("\n\n<b>This should <i>not</i> happen.</b> Was punchySpecial() overriden?");
		}
	}
}