package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class QueensBow extends ItemSlotClass
	{
		//constructor
		public function QueensBow()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Royal Bow";
			
			//Regular name
			this.longName = "royal shard bow";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a royal crystalline shard bow";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A bow made of a strange, semi-flexible crystal found in the deepest depths of Myrellion and used by the Queen of the Deep Lake. The bow comes with a quiver of arrows tipped with dark green shards that seem to contain traces of the queen’s lusty venom.";
			this.attackVerb = "shoot";
			attackNoun = "arrow";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 6500;
			
			baseDamage.kinetic.damageValue = 3;
			baseDamage.drug.damageValue = 12;
			
			this.attack = 2;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 4;
			this.evasion = 0;
			this.fortification = 0;
			
			this.addFlag(GLOBAL.ITEM_FLAG_BOW_WEAPON);

			this.version = _latestVersion;
		}
	}
}