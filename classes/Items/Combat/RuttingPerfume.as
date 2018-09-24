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
	public class RuttingPerfume extends ItemSlotClass
	{
		public function RuttingPerfume() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 5;
			this.type = GLOBAL.POTION;
			
			//Used on inventory buttons
			this.shortName = "\"Rutting\"";
			
			//Regular name
			this.longName = "spray bottle titled “Rutting”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a spray bottle of perfume or cologne labelled “Rutting”";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "According to Mitzi, this bottle of pleasant scents also packs a dense load of pheromones designed to appeal to nearly every race in the known (and unknown) galaxy. While wearing it, your tease attacks will be extra effective, though you yourself will be more receptive to the attentions of others...";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			/*baseDamage = new TypeCollection();
			baseDamage.drug.damageValue = 40;
			baseDamage.addFlag(DamageFlag.EXPLOSIVE);*/

			//Information
			this.basePrice = 500;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = true;
			this.targetsSelf = true;
			this.requiresTarget = false;

			itemFlags = [GLOBAL.NOT_CONSUMED_BY_DEFAULT];

			this.version = _latestVersion;
		}	
		override public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			if (!inCombat())
			{
				//if(!kGAMECLASS.infiniteItems()) quantity++;
				if (targetCreature is PlayerCharacter)
				{
					clearOutput();
					if(!targetCreature.hasStatusEffect("\"Rutting\"")) 
					{
						targetCreature.createStatusEffect("\"Rutting\"",0,5,0,0,false,"LustUp","You smell really... really sexy. And everyone else looks sexier too!",false,5*60);
						output("You spritz yourself with the perfume. From the first whiff of the potent fragrance, you find yourself more aware of your own sexuality and the sexuality of everyone and everything around you. Hot!");
					}
					else 
					{
						output("No time like the present to thicken the fuckable cloud you’re floating about in! A single squeeze, and you’re feeling absolutely irresistible.");
						targetCreature.setStatusMinutes("\"Rutting\"",5*60);
					}
					targetCreature.lust(4);
				}
				else
				{
					output(usingCreature.capitalA + usingCreature.short + " considers it unwise.\n");
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
					if(!targetCreature.hasStatusEffect("\"Rutting\"")) 
					{
						targetCreature.createStatusEffect("\"Rutting\"",0,5,0,0,false,"LustUp","You smell really... really sexy. And everyone else looks sexier too!",false,5*60);
						output("You spritz yourself with the perfume. From the first whiff of the potent fragrance, you find yourself more aware of your own sexuality and the sexuality of everyone and everything around you. Hot!");
					}
					else 
					{
						output("No time like the present to thicken the fuckable cloud you’re floating about in! A single squeeze, and you’re feeling absolutely irresistible.");
						targetCreature.setStatusMinutes("\"Rutting\"",5*60);
					}
					targetCreature.lust(4);
				}
				return false;
			}
		}
	}
}
