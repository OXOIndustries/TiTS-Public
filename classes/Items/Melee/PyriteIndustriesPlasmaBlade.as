package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class PyriteIndustriesPlasmaBlade extends ItemSlotClass
	{
		//Level 9 (Very Rare). Balance 2.0
		//constructor
		public function PyriteIndustriesPlasmaBlade()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "PIP Blade";
			
			//Regular name
			this.longName = "plasma blade";
			this.description = "a Pyrite Industries plasma blade";

			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));	
			//Displayed on tooltips during mouseovers
			this.tooltip = "Blades of pure plasma are nothing to mess with - even if they come with a half-empty power cell and a hilt scarred by the endless strikes of korgonne spears. This one still works, surprisingly, and the denizens of Korg'ii Hold saw fit to gift it to you for saving them.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "slash";
			attackNoun = "burning slash";
			
			//Information
			this.basePrice = 36666;

			baseDamage = new TypeCollection();
			baseDamage.burning.damageValue = 30;
			baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.attack = 4;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 3;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}
