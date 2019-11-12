//Dildos by Fenoxo!
package classes.Items.Toys
{
	import classes.Dildo;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.CockClass;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class DildoKnottyTerran extends Dildo
	{
		//constructor
		public function DildoKnottyTerran()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "K.TerranD.";
			
			//Regular name
			this.longName = "knotted terran dildo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a knotted terran dildo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "This no-name terran dildo bears no marks of manufacturer nor identification of any kind. The wobbly 7-inch toy’s only distinguishing feature is the presence of a nearly double-wide knot at the base, an obvious concession to appeal to ausars and terrans alike.\n\nAnd it’s neon green.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 35;//heh heh.
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.material = "silicone";
			this.cumQ = 0;
			
			this.version = _latestVersion;
		}
		override public function cock():CockClass
		{
			var dildCock:CockClass = new CockClass();
			dildCock.cLengthRaw = 7;
			dildCock.cockColor = "neon green";
			dildCock.addFlag(GLOBAL.FLAG_KNOTTED)
			return dildCock;
		}
	}
}
