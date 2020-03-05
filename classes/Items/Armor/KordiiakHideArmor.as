package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class KordiiakHideArmor extends ItemSlotClass
	{
		//Level 9 (Very Rare) Balance 2.0
		//constructor
		public function KordiiakHideArmor()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "KH.Armor";
			
			//Regular name
			this.longName = "kor’diiak hide armor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a suit of masterworked kor’diiak hide armor";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Kor’diiak hide is reknowned for its durability and resistance to cold. Unlike many other materials, it does not stiffen or become brittle in sub-freezing temperatures, nor does it require special treatment to prevent rot.\n\nThis particular suit is an absolute masterwork. The stitching is near-perfect. Individual frostworm scales decorate the chest and reinforce potential weakpoints. The lining is thick and soft, made from some Uvetan beast you're not quite familiar with. It's quite the gift.";

			//An alright upgrade. Stronk against kinetic, slashing and thermal, practically worthless against piercing.
		
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 50000;
			this.attack = 0;
			this.defense = 9;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.resolve = 5;
			this.critBonus = 0;
			this.evasion = 9;
			this.fortification = 40;
			
			resistances.freezing.resistanceValue = 40.0;
			resistances.burning.resistanceValue = -5.0;
			
			this.version = _latestVersion;
		}
	}
}