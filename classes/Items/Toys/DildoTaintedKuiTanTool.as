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
	
	public class DildoTaintedKuiTanTool extends Dildo
	{
		//constructor
		public function DildoTaintedKuiTanTool()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "KT Dildo";
			
			//Regular name
			this.longName = "tainted kui-tan toy";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a tainted kui-tan toy";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "<i>“Po’s Own”</i> isn’t any manufacturer you’ve heard before, and it’s certainly no subdivision of the ever-popular TamaniCorp. This exotic toy looks and feels exactly like a real kui-tan penis... if said penis could stay perpetually hard, warm, and ready to go for years on end.\n\nThe rust-red, 14-inch phallus contains a series of increasingly wide knots, just like the real thing. A stamp on the base indicates it to be rated for ‘4 liters of fun!’ while a smaller notice claims 'May contain minor traces of chemical, genetic, and reality taint from manufacture.'\n\nWhatever that means.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 14000;//heh heh.
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.material = "digimeat";
			this.cumQ = 4000;
			
			this.version = _latestVersion;
		}
		override public function cock():CockClass
		{
			var dildCock:CockClass = new CockClass();
			dildCock.cLengthRaw = 14;
			dildCock.cockColor = "rust red";
			dildCock.cType = GLOBAL.TYPE_KUITAN
			dildCock.addFlag(GLOBAL.FLAG_KNOTTED)
			return dildCock;
		}
	}
}
