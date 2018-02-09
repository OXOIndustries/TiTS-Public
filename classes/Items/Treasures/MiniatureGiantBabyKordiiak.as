package classes.Items.Treasures
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class MiniatureGiantBabyKordiiak extends ItemSlotClass
	{
		//constructor
		public function MiniatureGiantBabyKordiiak()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "MGBK";
			
			//Regular name
			this.longName = "miniature giant baby kor'diiak";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a miniature giant baby kor'diiak";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "You're not rightly sure how this baby miniature giant kor'diiak found its way into your inventory, but it's there all the same. According to your Codex, it will take decades to mature, so for the time being, you have a cuddly pet.\n\n(This item is nothing but a cute souvenier.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 2000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.isUsable = false;
			
			this.version = _latestVersion;
		}
	}
}
