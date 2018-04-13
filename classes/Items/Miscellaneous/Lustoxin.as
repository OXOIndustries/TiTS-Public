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
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.damageRand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Lustoxin extends ItemSlotClass
	{
		
		public function Lustoxin() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.DRUG;
			
			this.shortName = "Lustoxin";
			
			this.longName = "Lustoxin";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a vial of lustoxin";
			
			this.tooltip = "A gold myr chemical weapon that explodes into a cloud of lusty toxins when shattered.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			this.basePrice = 500;
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
					kGAMECLASS.output("Using a chemical weapon without a target to throw it at would be pretty dumb now, wouldn’t it? ");
				}
				else
				{
					kGAMECLASS.output(usingCreature.capitalA + usingCreature.short + " considers it unwise to use a chemical weapon outside of combat.");
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
				
				this.throwGrenade(null, usingCreature);
				
				return false;
			}
		}
		
		public function throwGrenade(targetCreature:Creature, attacker:Creature):void
		{
			var hGroup:Array = CombatManager.getHostileActors();
			var aTarget:Creature = CombatAttacks.GetBestPotentialTarget(hGroup);
			if(aTarget == null)
			{
				if (attacker is PlayerCharacter) output("It seems you have no target to use your lustoxin on.");
				else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces a vial of lustoxin--but with no target to use it on, " + attacker.mfn("he", "she", "it") + " puts it away.");
				
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return;
			}
			
			if (attacker is PlayerCharacter) output("You pull out the Lustoxin vial and hurl it on the ground between you and " + aTarget.getCombatName() + ". The vial shatters on the ground, erupting in a cloud of pink vapors that quickly surround everyone and everything -- including you!");
			else if (aTarget is PlayerCharacter) output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces a vial of lustoxin and hucks it in your direction!");
			else output(StringUtil.capitalize(attacker.getCombatName(), false) + " produces a vial of lustoxin and hucks it in the direction of " + aTarget.getCombatName() + "!");
			
			//hits EVERYONE
			hGroup = hGroup.concat(CombatManager.getFriendlyActors());
			for (var i:int = 0; i < hGroup.length; i++)
			{	
				if (hGroup[i].isDefeated()) continue;
				
				var cTarget:Creature = hGroup[i];
				
				if(cTarget.hasAirtightSuit())
				{
					if (cTarget is PlayerCharacter) output("\nYour airtight outfit protects you from the lust-inducing gas.");
					else output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + " manages to avoid the lust-inducing gas thanks to their airtight outfit.");
				}
				else
				{
					var d:int = 18 + attacker.level * 2;
					var damage:TypeCollection = damageRand(new TypeCollection( { drug: d } ), 15);
					
					if (cTarget is PlayerCharacter) output("\nYou’re stricken with chemical-induced lust.");
					else output("\n" + StringUtil.capitalize(cTarget.getCombatName(), false) + " is stricken with chemical-induced lust.");
					
					applyDamage(damage, attacker, cTarget, "minimal");
				}
			}
		}
	}

}
