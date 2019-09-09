package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ZhouLingRifle extends ItemSlotClass
	{
		//Level 5 (Rare). Balance 2.0
		//constructor
		public function ZhouLingRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Z.L.Rifle";
			
			//Regular name
			this.longName = "Zhou-Ling Rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Zhou-Ling Rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Developed by the long-gone Zhu-Rong Incorporated, the Zhou-Ling rifle is a weapon that condenses water vapor in the air and uses a series of freezing-coils to turn it into icicles that are launched at high-velocities. Originally rejected from military contracts due to its limited range, later versions such as this one feature a reservoir that continuously collects water and a high-pressure gas tank that is able to shoot projectiles farther distances.\n\nSteele Tech purchased a large reserve of these weapons in the bankruptcy auctions and recently began liquidating them after your father’s passing.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "icicle";
			
			//Information
			this.basePrice = 2500;
			this.attack = 4;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 10;
			baseDamage.freezing.damageValue = 10;
			//baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			//this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_RIFLE_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
