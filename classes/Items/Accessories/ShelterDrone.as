package classes.Items.Accessories
{
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.ItemSlotClass;
	import classes.StringUtil;
	
	public class ShelterDrone extends ItemSlotClass
	{
		public function ShelterDrone()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.ACCESSORY;
			
			shortName = "S.Drone";
			longName = "shelter drone";
			
			TooltipManager.addFullName(shortName,StringUtil.toTitleCase(longName));
			
			description = "a weather protection drone";
			tooltip = "[altTooltip ShelterDrone]";
			
			TooltipManager.addTooltip(shortName,tooltip);
			
			basePrice = 12000;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = -50;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			// Shelter would be a tag that provides an invisible +60% all resists for purposes of environmental damage. Hopefully this would reappear on power armor created for extreme environmental conditions, or a upgraded shelter drone for higher level planets. I made this an accessory rather than a drone type accessory because it is not intended to have combat applications, even for drone techs.
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_SHELTER);
			
			version = _latestVersion;
		}
	}
}
