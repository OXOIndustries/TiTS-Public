package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class PyriteIndustriesSuperchargedLaserPistol extends ItemSlotClass
	{
		//Level 9 (Very Rare). Balance 2.0
		//constructor
		public function PyriteIndustriesSuperchargedLaserPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "SCL Pistol";
			
			//Regular name
			this.longName = "supercharged laser pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Pyrite Industries SC115 Laser Pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Pyrite Heavy industries isn't typically in the weapons manufacturing business, but they're not above taking an existing firearm from another corporation, stamping their own logo over it, and stuffing it full of aftermarket mods to make it punch a little harder, durability be damned.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			attackNoun = "laser beam";
			
			//Information
			this.basePrice = 36666;
			this.attack = 5;
			
			baseDamage = new TypeCollection();
			//baseDamage.electric.damageValue = 1;
			baseDamage.burning.damageValue = 25;
			baseDamage.addFlag(DamageFlag.LASER);
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			this.addFlag(GLOBAL.ITEM_FLAG_PISTOL_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 15;
			this.evasion = 2;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
