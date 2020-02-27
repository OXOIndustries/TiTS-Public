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
	import classes.Engine.Utility.rand;
	
	/**
	 * ...
	 * @author Fenoxo, based on Gedan's EM Grenades
	 */
	public class EroGasGrenade extends ItemSlotClass
	{
		public function EroGasGrenade() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.EXPLOSIVECONSUMABLE;
			
			//Used on inventory buttons
			this.shortName = "E.GasGren";
			
			//Regular name
			this.longName = "ero gas grenade";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an Ero gas grenade";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The pharmaceutical zaibatsu Brightwater (a Limited Liability Company) is better known for their medical services than their weapon production, but Ero Gas is one notable exception. Originally developed as an aerosol painkiller, the gas was found to produce an intense and pervasive sexual stimulation on the volunteered test subjects. Due to its (relatively) harmless collateral damage, peacekeepers are known to toss belts full of Ero Gas at mobs and let them fuck themselves into compliance.\n\n45 lust damage.\nPossible 6 damage/turn DoT.\n\tLasts 3 turns.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			baseDamage = new TypeCollection();
			baseDamage.pheromone.damageValue = 45;
			baseDamage.addFlag(DamageFlag.EXPLOSIVE);

			//Information
			this.basePrice = 20000;
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
					output(usingCreature.capitalA + usingCreature.short + " considers it unwise to waste the grenade outside of combat.\n");
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
				if (attacker is PlayerCharacter) output("It seems you have no target to use your Ero gas grenade on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an Ero gas grenade - but with no target to use it on, " + attacker.mfn("he", "she", "it") + " puts it away.");
				
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return;
			}
			
			if (attacker is PlayerCharacter) output("You pull out an Ero gas grenade and huck it in the direction of " + aTarget.getCombatName() + ".");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an Ero gas grenade and hucks it in your direction!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an Ero gas grenade and hucks it in the direction of " + aTarget.getCombatName() + "!");
			
			for (var i:int = 0; i < hGroup.length; i++)
			{	
				if (hGroup[i].isDefeated()) continue;
				var cTarget:Creature = hGroup[i];
				
				var d:DamageResult = applyDamage(damageRand(baseDamage, 15), attacker, cTarget, "suppress");
				
				output(" " + cTarget.capitalA + cTarget.uniqueName + " " + (cTarget.isPlural ? "are" : "is") + " caught in the explosion of pink mist!");
				outputDamage(d);
				//Possible DoT
				if(!cTarget.isDefeated())
				{
					if(attacker.intelligence()/2 + rand(20)+1 >= cTarget.physique()/2 + 10 && !cTarget.hasStatusEffect("AphroGas"))
					{
						CombatAttacks.applyAphroGas(cTarget, 6, 3);
						output(" <b>The gas clings to " + cTarget.capitalA + cTarget.uniqueName + "</b>.");
					}
				}
			}
		}
	}
}
