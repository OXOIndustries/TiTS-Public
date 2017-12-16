package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class GooArmor extends ItemSlotClass
	{
		//Level 5 (Rare). Balance 2.0
		//constructor
		public function GooArmor()
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ARMOR;
			
			shortName = "Goo Armor";
			
			longName = "suit of gray goo armor";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a suit of armor constructed from an active gray goo";
			
			tooltip = "Your busty, bouncing resident bodysuit of goo. [goo.name] is a silvery-gray bimbo programmed to seek pleasure and friendship, and who will valiantly defend you so long as you give her all the benefits that your special friendship brings.";
		
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 0;
			attack = 0;
			
			/**
			 * Things like this are the reason I default to using getters/setters rather than exposing raw properties.
			 * If 'defense' was a get/set function, it would be trivial to override it in this object instance and include checks to return different values on-demand rather than having
			 * to hook various parts of the engine to hard-code checks for certain items and replicating the method there.
			 * 
			 * Refactoring this shit right now, I cba, as it'll mean a lot of save fuckery. Either I'll do it in future, or we can just leave it as a static value forever.
			 */
			
			defense = 6; // 1 + PC Level
			
			shieldDefense = 0;
			shields = 0;
			sexiness = 5;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			resistances.kinetic.resistanceValue = 25.0;
			resistances.burning.resistanceValue = 25.0;
			resistances.electric.resistanceValue = -25.0;
			
			resistances.drug.resistanceValue = -10.0;
			resistances.tease.resistanceValue = -10.0;
			resistances.pheromone.resistanceValue = -10.0;
			resistances.psionic.resistanceValue = -10.0;
			
			itemFlags.push(GLOBAL.ITEM_FLAG_SKIN_TIGHT);
			
			version = _latestVersion;
		}
	}
}