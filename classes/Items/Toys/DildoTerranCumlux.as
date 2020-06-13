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
	
	public class DildoTerranCumlux extends Dildo
	{
		//constructor
		public function DildoTerranCumlux()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "TD Dildo";
			
			//Regular name
			this.longName = "deluxe terran dildo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a deluxe terran dildo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "TamaniCorp’s ‘<i>Cumlux</i>’ line of dildos comes hot on the heels of recent BionaHole(tm) breakthroughs, allowing for warm dildos that not only feel alive - they cum real, honest-to-goodness cum. Enjoy the feeling of a warm load of sexual relief, perfectly timed to your own climax on demand.\n\nIn a surprise move for the breeding-obsessed corporation, they even made sure the cum was sterile, though it makes sense that they wouldn’t want to cut into the market for their own high-end, hospital-grade reproductive assistance devices.\n\nThis particular device was cloned from a nine-inch phallus with fairly juicy, 250 mL cumshots and grown from the purest digimeat(tm).";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 6500;//heh heh.
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.material = "digimeat";
			this.cumQ = 250;
			
			this.version = _latestVersion;
		}
		override public function cock():CockClass
		{
			var dildCock:CockClass = new CockClass();
			dildCock.cLengthRaw = 9;
			dildCock.cockColor = "pink";
			return dildCock;
		}
	}
}
