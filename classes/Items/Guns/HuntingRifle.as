package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class HuntingRifle extends ItemSlotClass
	{
		//constructor
		public function HuntingRifle()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "H.Rifle";
			
			//Regular name
			this.longName = "hunting rifle";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hunting rifle";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A high-quality bolt action hunting rifle made on Myrellion, completely unlike the mass-produced firearms you usually find in the Core. This gun's a work of art: silver and gold engraving line the action, with the head of some horned beast forming the head of the bolt. Packs a lot of punch, and it's surprisingly quick to fire.";
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 4500;
			this.attack = 5;
			
			baseDamage.kinetic.damageValue = 14;
			baseDamage.addFlag(DamageFlag.BULLET);
			
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