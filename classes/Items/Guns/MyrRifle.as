package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class MyrRifle extends ItemSlotClass
	{
		//constructor
		public function MyrRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "M.Rifle";
			
			//Regular name
			this.longName = "myr's leg rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a myr's leg rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This beat up old gun looks something like an old-earth lever action rifle, chambered in a magnum pistol cartridge meant for close range blasting through the armored chitin of the myr races. The stock and barrel have been cut down significantly compared to the similar rifles you've seen in the hands of myr soldiers, but it still packs a punch and is dead accurate in close quarters.";
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 1000;
			this.attack = 2;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 14;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}