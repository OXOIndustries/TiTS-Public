package classes.Items.Guns 
{
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	/**
	 * ...
	 * @author lighterfluid
	 */
	public class LashCannon extends ItemSlotClass 
	{
		
		public function LashCannon() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			this.shortName = "L.Cann";
			this.longName = "lash cannon";
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a lash cannon";
			
			this.tooltip = "Marked as ‘CV-x1375: Lash Cannon’, this chunky pistol seems intimidating to handle. Covered in ultra-sleek white plating, the grip is enough for a human-sized hand yet the overall size is";
			this.tooltip += " almost twice that of a more typical pistol. The muzzle is split into three stubby barrel tips that appear to have direction-adjustable qualities.";
			this.tooltip += "\n\nWhen fired, 3 whip-like beams of arcing white energy ‘snap’ against the target location. It leaves distinctive star-point burns on impact. The weapon can also exchange shield power from target";
			this.tooltip += " to user, essentially turning it into a portable bulldozer for single targets by stripping defenses. Using it in one hand is cumbersome with its kickback but holding it in two allows you to perform";
			this.tooltip += " precise and devastating short-range shots.";

			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 154000;
			this.attack = 10;
			
			this.baseDamage = new TypeCollection();
			this.baseDamage.burning.damageValue = 18;
			this.baseDamage.electric.damageValue = 18;
			this.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.baseDamage.addFlag(DamageFlag.DRAINING);
			
			this.critBonus = 5;
			
			this.evasion = -10;
		}
		
	}

}