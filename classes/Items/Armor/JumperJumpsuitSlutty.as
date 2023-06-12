package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class JumperJumpsuitSlutty extends ItemSlotClass
	{
		//Level 9 (Rare). Balance 2.0
		//constructor
		public function JumperJumpsuitSlutty()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ARMOR;
			
			//Used on inventory buttons
			this.shortName = "SJJ-Suit";
			
			//Regular name
			this.longName = "slutty Jumper jumpsuit";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a slutty Jumper jumpsuit";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A favorite of the infamous “Jumper” gang, this form-fitting suit of latex-like material is perfect for anyone who wants to win fights <b>and look like an absolute slut while doing it</b>. A huge, thick-seamed opening stretches from the crotch to the small of the back, gleefully exposing the wearer’s nethers to any curious eyes. Neon lettering on the thigh declares the wearer’s lawless allegiances with unsubtle glare. Unfortunately, it’s raw sluttiness does little to help with resisting the more libidinous temptations of the galaxy. Oh well!";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 41000;
			this.attack = 0;
			this.defense = 3;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 5;
			this.critBonus = 4;
			this.evasion = 18;
			this.fortification = 0;
			
			resistances.tease.resistanceValue = -10.0;
			resistances.electric.resistanceValue = 35.0;
			resistances.burning.resistanceValue = 15.0;

			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_GROIN);
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_ASS);
			
			this.version = _latestVersion;
		}
	}
}