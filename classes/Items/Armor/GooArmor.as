package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class GooArmor extends ItemSlotClass
	{
		//constructor
		public function GooArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "Goo Armor";
			
			//Regular name
			this.longName = "suit of gray goo armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of armor constructed from an active gray goo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Your busty, bouncing resident bodysuit of goo. [goo.name] is a silvery-gray bimbo programmed to seek pleasure and friendship, and who will valiantly defend you so long as you give her all the benefits that your special friendship brings.";
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 0;
			this.attack = 0;
			
			/**
			 * Things like this are the reason I default to using getters/setters rather than exposing raw properties.
			 * If 'defense' was a get/set function, it would be trivial to override it in this object instance and include checks to return different values on-demand rather than having
			 * to hook various parts of the engine to hard-code checks for certain items and replicating the method there.
			 * 
			 * Refactoring this shit right now, I cba, as it'll mean a lot of save fuckery. Either I'll do it in future, or we can just leave it as a static value forever.
			 */
			
			this.defense = 6; // 1 + PC Level
			
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances.kinetic.resistanceValue = 25.0;
			resistances.burning.resistanceValue = 25.0;
			resistances.electric.resistanceValue = -25.0;
			
			resistances.drug.resistanceValue = -10.0;
			resistances.tease.resistanceValue = -10.0;
			resistances.pheromone.resistanceValue = -10.0;
			resistances.psionic.resistanceValue = -10.0;
			
			this.version = _latestVersion;
		}
	}
}