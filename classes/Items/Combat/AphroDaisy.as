package classes.Items.Combat 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.clearOutput;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Characters.PlayerCharacter;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class AphroDaisy extends ItemSlotClass
	{
		public function AphroDaisy() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.EXPLOSIVECONSUMABLE;
			
			//Used on inventory buttons
			this.shortName = "AphroD.";
			
			//Regular name
			this.longName = "Aphro Daisy";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an Aphro Daisy";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This gentle flower with wavy pink petals emits a scent that reminds you of the lust-inducing pheromones of the female korgonne. One whiff of this is guaranteed to force any opponent to think about something else.\n\n40 lust damage.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			baseDamage = new TypeCollection();
			baseDamage.drug.damageValue = 40;
			baseDamage.addFlag(DamageFlag.EXPLOSIVE);

			//Information
			this.basePrice = 40;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = false;
			this.requiresTarget = false;

			this.version = _latestVersion;
		}	
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if (!inCombat())
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				if (targetCreature is PlayerCharacter)
				{
					clearOutput();
					output("You don’t have anyone to use this on right now.\n");
				}
				else
				{
					output(usingCreature.capitalA + usingCreature.short + " considers it unwise to waste the flower outside of combat.\n");
					output("\n");
				}
				return false;
			}
			else
			{
				// Player used an item
				if (usingCreature is PlayerCharacter)
				{
					kGAMECLASS.clearOutput();
				}
				
				throwGrenade(null, usingCreature);
				
				return false;
			}
		}
		
		public function throwGrenade(targetCreature:Creature, attacker:Creature):void 
		{
			var hGroup:Array = CombatManager.getHostileActors();
			var aTarget:Creature = CombatAttacks.GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your Aphro Daisy on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an Aphro Daisy - but with no target to use it on, " + attacker.mfn("he", "she", "it") + " puts it away.");
				
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return;
			}
			
			if (attacker is PlayerCharacter) output("You pull out an Aphro Daisy and huck it in the direction of " + aTarget.getCombatName() + ".");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an Aphro Daisy and hucks it in your direction!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an Aphro Daisy and hucks it in the direction of " + aTarget.getCombatName() + "!");
			
			for (var i:int = 0; i < hGroup.length; i++)
			{	
				if (hGroup[i].isDefeated()) continue;
				var cTarget:Creature = hGroup[i];
				
				var d:DamageResult = applyDamage(damageRand(baseDamage, 15), attacker, cTarget, "suppress");
				
				output(" " + cTarget.capitalA + cTarget.uniqueName + " " + (cTarget.isPlural ? "are" : "is") + " caught in the explosion of pink mist!");
				outputDamage(d);
			}
		}
	}
}
