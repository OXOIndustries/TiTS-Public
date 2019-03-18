package classes.Items.Guns
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MagnumPistol extends ItemSlotClass
	{
		//Level 2 (Common). Balance 2.0
		//constructor
		public function MagnumPistol()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Mag.Pistol";
			
			//Regular name
			this.longName = "magnum pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a magnum pistol";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This is a large-barreled weapon of ancient design. Don’t let it’s age fool you - projectile weapon design hasn’t changed that much with the passage of time. Big, heavy projectiles launched at insane speeds do just as much damage now as they did back then. The kick on this gun makes it a little more difficult to aim than its smaller caliber brothers.";
			this.attackVerb = "shoot";
			attackNoun = "shot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 200;
			this.attack = -5;
			
			baseDamage.kinetic.damageValue = 11;
			baseDamage.addFlag(DamageFlag.BULLET);
			this.addFlag(GLOBAL.ITEM_FLAG_PISTOL_WEAPON);
			
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 2;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}