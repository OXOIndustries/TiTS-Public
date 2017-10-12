package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class Hirudo extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		//constructor
		public function Hirudo()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Hirudo";
			
			//Regular name
			this.longName = "Hirudo devourer"
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Hirudo devourer";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A living weapon, genetically modified and grown in a lab. The Hirudo series of living weapons is an improved strain derived from the Lampetra series; it offers a noticeable increase in range and firepower, and like many of its sisters, it's capable of healing its host when properly fed.";
			this.attackVerb = "shoot";
			attackNoun = "tendrils";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 40000;
			this.attack = 0;
			
			baseDamage = new TypeCollection();
			baseDamage.corrosive.damageValue = 16;
			baseDamage.kinetic.damageValue = 16;
			//baseDamage.addFlag(DamageFlag.NO_CRIT);
			//addFlag(GLOBAL.ITEM_FLAG_BLIND_IGNORE);
			baseDamage.addFlag(DamageFlag.VAMPIRIC);
			baseDamage.addFlag(DamageFlag.PENETRATING);

			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 5;
			this.evasion = 0;
			this.fortification = -15;

			this.version = _latestVersion;
		}
	}
}
