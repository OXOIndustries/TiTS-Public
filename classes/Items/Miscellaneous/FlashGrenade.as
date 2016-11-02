package classes.Items.Miscellaneous 
{
	import classes.Creature;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Engine.Combat.applyDamage;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Interfaces.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.rand;
	import classes.Characters.PlayerCharacter;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class FlashGrenade extends ItemSlotClass
	{
		
		public function FlashGrenade() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.EXPLOSIVECONSUMABLE;
			
			this.shortName = "Flashbang";
			
			this.longName = "flashbang";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a flashbang";
			
			this.tooltip = "These single-use flash grenades are valuable self-defense and escape tools, allowing you to quickly evade an opponent or exploit his blindness and attack with near impunity. ";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 100;
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
					kGAMECLASS.clearOutput();
					kGAMECLASS.output("Pulling the pin on a grenade without a target to throw it at would be pretty dumb now, wouldn't it?");
				}
				else
				{
					kGAMECLASS.output(usingCreature.capitalA + usingCreature.short + " considers it unwise to use a grenade outside of combat.");
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
			var hGroup:Array = CombatManager.getHostileCharacters();
			var aTarget:Creature = CombatAttacks.GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your flash grenade on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces a flash grenade--but with no target to use it on, " + attacker.mfn("he", "she", "it") + " puts it away.");
				
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return;
			}
			
			if (attacker is PlayerCharacter) output("You pull out a flash grenade and huck it in the direction of " + aTarget.getCombatName() + ".");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces a flash grenade and hucks it in your direction!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces a flash grenade and hucks it in the direction of " + aTarget.getCombatName() + "!");
			
			for (var i:int = 0; i < hGroup.length; i++)
			{	
				if (hGroup[i].isDefeated()) continue;
				
				var cTarget:Creature = hGroup[i];
				
				if (attacker.aim() / 2 + rand(20) + 6 >= cTarget.reflexes() / 2 + 10 && !cTarget.hasStatusEffect("Blinded") && !cTarget.hasBlindImmunity())
				{
					cTarget.createStatusEffect("Blinded", 3, 0, 0, 0, false, "Blind", "Accuracy is reduced, and ranged attacks are far more likely to miss.", true, 0,0xFF0000);
					
					if (cTarget is PlayerCharacter) output("\n<b>You're blinded by the luminous flashes.</b>");
					else output("\n<b>" + StringUtil.capitalize(cTarget.getCombatName(), false) + " is blinded by the luminous flashes.</b>");
				}
				else
				{
					if (cTarget is PlayerCharacter) output("\nYou manage to avoid the blinding projectile.");
					else output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + " manages to avoid the blinding projectile.");
				}
			}
		}
	}

}
