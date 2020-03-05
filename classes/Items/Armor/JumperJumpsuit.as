package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class JumperJumpsuit extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		//constructor
		public function JumperJumpsuit()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "JJ-Suit";
			
			//Regular name
			this.longName = "Jumper jumpsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Jumper jumpsuit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A favorite of the infamous “Jumper” gang, this form-fitting suit of latex-like material is perfect for those who want to win fights and look great doing it. Neon lettering on the thigh declares the wearer’s lawless allegiances with unsubtle glare. Unfortunately the tight clinginess of it does little to help with resisting the more libidinous temptations of the galaxy. Oh well!";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 42000;
			this.attack = 0;
			this.defense = 5;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 4;
			this.resolve = 1;
			this.critBonus = 0;
			this.evasion = 18;
			this.fortification = 0;
			
			resistances.tease.resistanceValue = -10.0;
			resistances.electric.resistanceValue = 35.0;
			resistances.burning.resistanceValue = 10.0;
			
			this.version = _latestVersion;
		}
	}
}