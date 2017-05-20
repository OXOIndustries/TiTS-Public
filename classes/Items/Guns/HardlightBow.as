package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class HardlightBow extends ItemSlotClass
	{
		// Hardlight Bow (Level 8)
		// by HugsAlright
		// Vendor: Nerrasa
		public function HardlightBow()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.RANGED_WEAPON;
			
			shortName = "HL Bow";
			longName = "hardlight bow";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a hardlight-stringed bow";
			
			tooltip = "A popular choice among wealthy sport-hunters across the galaxy, this bow, as the name would suggest, features a hardlight bowstring that is capable of changing tension and draw-strength based on its user’s wishes. Along with its sleek, high-durability design and weightless bow-string, this weapon uses SmartShoot™ arrow tips that project their own shaft and fletching, and can change shape based on the archer’s needs";
			//Fen: nope - ; the bow is even capable of firing  multiple of these “smart arrows” at once.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "shoot";
			attackNoun = "arrow";
			
			basePrice = 22500;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 22;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			
			attack = 2;
			critBonus = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			evasion = 0;
			fortification = 0;
			
			addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);
			//Fen: nope - addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			version = _latestVersion;
			
			/*
			Special: 
			// When this weapon is equipped, it gives the player the special skill “Multi-Arrow”
			// [MultiArrow] Fire a small volley of arrows from your hardlight bow against multiple enemies.
			// - Drains 30 energy, is affected by double shot and shoot first, hits all enemies, aim increases chance to hit.
			*/
		}
	}
}