package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Vanquisher extends ItemSlotClass
	{
		//Level 9 (Common). Balance 2.0
		//constructor
		public function Vanquisher()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Vanquish";
			
			//Regular name
			this.longName = "Vanquisher hand cannon";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Vanquisher hand cannon";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "The Vanquisher pistol is a powerful semi-automatic pistol designed by Reaper Armaments for saurmorian military use. Since hitting the markets, it has found favor with law enforcement officers and criminals alike.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 27000;
			this.attack = -3;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 28;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 10;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
