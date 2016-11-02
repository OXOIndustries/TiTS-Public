package classes.Items.Melee
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MonofilamentSaber extends ItemSlotClass
	{
		//constructor
		public function MonofilamentSaber()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.MELEE_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "M.Saber";
			
			//Regular name
			this.longName = "monofilament saber";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a monofilament saber";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This blade is similar in design to cavalry saber of ages old. Three feet long, made of densely compressed modern alloys and edged with a monofilament wire to give this sword the best possible edge in combat.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			attackVerb = "slash";
			attackNoun = "slash";
			
			//Information
			this.basePrice = 24000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.kinetic.damageValue = 20;
			baseDamage.addFlag(DamageFlag.PENETRATING);
			//baseDamage.addFlag(DamageFlag.CHANCE_APPLY_BURN);
			//addFlag(GLOBAL.ITEM_FLAG_ENERGY_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 3;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}
	}
}