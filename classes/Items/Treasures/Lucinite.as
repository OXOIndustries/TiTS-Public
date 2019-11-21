package classes.Items.Treasures
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Lucinite extends ItemSlotClass
	{
		//constructor
		public function Lucinite()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GEM;
			
			//Used on inventory buttons
			this.shortName = "Lucinite";
			
			//Regular name
			this.longName = "Lucinite Ore Chunk";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a hand-sized chunk of lucinite ore";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A rare metal ore, only found within the coldest underbellies of the outer fringe worlds. This teal blue material is icy cold to the touch, even when taken into warm environments, and acts as a natural heat absorber. For this reason, it is usually wise to pack the proper equipment specifically for the safe excavation and handling of lucinite. When melted down at extreme temperatures, it can also function as a natural coolant. Being a newly discovered metal, most of its other possible applications are currently unknown.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 8000;
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
