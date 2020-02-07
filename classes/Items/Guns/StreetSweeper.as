package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class StreetSweeper extends ItemSlotClass
	{
		//Level 11 (Rare). Balance 2.0
		//constructor
		public function StreetSweeper()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "St.Sweeper";
			
			//Regular name
			this.longName = "street sweeper"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a street sweeper";
			//Street Sweeper: Shotgun with explosive chlorine shells. Kinetic/Corrosive
			//Displayed on tooltips during mouseovers
			this.tooltip = "Your average weapon enthusiast will certainly be aware of the short-range stopping power of a sawed-off shotgun. Paragon Inc. asks the important question: how do you keep that stopping power but minimize property damage? Simple! With the Street Sweeper’s custom exploding shells technology, you can replace all the oxygen in your targets’ lungs with deadly chlorine gas. Nothing says clean streets like a good Cl2 scrub!";
			this.attackVerb = "shoot";
			attackNoun = "chlorine";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 155000;
			this.attack = 30;
			
			baseDamage = new TypeCollection();
			baseDamage.poison.damageValue = 30;
			baseDamage.kinetic.damageValue = 5;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			this.addFlag(GLOBAL.ITEM_FLAG_SHOTGUN_WEAPON);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = -4;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}
