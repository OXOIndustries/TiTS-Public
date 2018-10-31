package classes.Items.Miscellaneous 
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
	public class EMPGrenade extends ItemSlotClass
	{
		
		public function EMPGrenade() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.EXPLOSIVECONSUMABLE;
			
			this.shortName = "EMP Gren.";
			
			this.longName = "EMP grenade";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "an EMP grenade";
			
			this.tooltip = "Used by soldiers and police officers to quickly neutralize shielded or robotic opponents, modern EMP grenades temporarily fry electronics. Though individually expensive, these little babies pretty much pay for themselves when you’re up against a heavily shielded enemy or an assassin droid!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 100;
			baseDamage = new TypeCollection();
			baseDamage.electric.damageValue = 15;
			baseDamage.addFlag(DamageFlag.EXPLOSIVE);
			
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = false;
			this.requiresTarget = false;
			
			this.version = this._latestVersion;
		}
		
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if (!inCombat())
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				if (targetCreature is PlayerCharacter)
				{
					clearOutput();
					output("Pulling the pin on a grenade without a target to throw it at would be pretty dumb now, wouldn’t it?\n");
				}
				else
				{
					output(usingCreature.capitalA + usingCreature.short + " considers it unwise to use a grenade outside of combat.\n");
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
				if (attacker is PlayerCharacter) output("It seems you have no target to use your EMP grenade on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an EMP grenade--but with no target to use it on, " + attacker.mfn("he", "she", "it") + " puts it away.");
				
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return;
			}
			
			if (attacker is PlayerCharacter) output("You pull out an EMP grenade and huck it in the direction of " + aTarget.getCombatName() + ".");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an EMP grenade and hucks it in your direction!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces an EMP grenade and hucks it in the direction of " + aTarget.getCombatName() + "!");
			
			for (var i:int = 0; i < hGroup.length; i++)
			{	
				if (hGroup[i].isDefeated()) continue;
				var cTarget:Creature = hGroup[i];
				
				var d:DamageResult = applyDamage(damageRand(baseDamage, 15), attacker, cTarget, "suppress");
				
				output("\n\n" + cTarget.capitalA + cTarget.uniqueName + " " + (cTarget.isPlural ? "are" : "is") + " caught in the explosion!");
				outputDamage(d);
				
				if (!cTarget.hasStatusEffect("Stunned") && cTarget.isRobot() && cTarget.hasShields() && !cTarget.getHPResistances().hasFlag(DamageFlag.GROUNDED))
				{
					if(cTarget is PlayerCharacter)
					{
						CombatAttacks.applyStun(cTarget, 2, false,"An electrical burst has temporarily stunned your equipment!");
						output("\n\nThe electronic burst from the grenade has temporarily disrupted your systems!");
					}
					else
					{
						CombatAttacks.applyStun(cTarget, 2, false,"An electrical burst has temporarily stunned the target!");
						output("\n\nThe electronic burst from the grenade has temporarily disrupted " + cTarget.a + cTarget.short + "’s systems!");
					}
				}
			}
		}
	}

}
