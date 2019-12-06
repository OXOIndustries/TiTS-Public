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
	
	public class DildoSavicite extends Dildo
	{
		//constructor
		public function DildoSavicite()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "SavDildo";
			
			//Regular name
			this.longName = "savicite dildo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a savicite dildo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A vivid green, brightly glowing savicite dildo! Carved and smoothed straight from the rock, this average-sized sex toy is guaranteed to provide you, or a partner, the most intense stimulation, thanks to its naturally strong lust-making qualities! It is shaped in canine fashion, just like a korgonne's, knot and all! A delicately inscribed signature etched into the silver base reads: KK.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 20000;//heh heh.
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.material = "savicite";
			this.cumQ = 0;
			
			this.version = _latestVersion;
		}
		override public function cock():CockClass
		{
			var dildCock:CockClass = new CockClass();
			dildCock.cLengthRaw = 9;
			dildCock.knotMultiplier = 1.6;
			dildCock.cockColor = "glowing green";
			dildCock.cType = GLOBAL.TYPE_CANINE;
			dildCock.addFlag(GLOBAL.FLAG_TAPERED);
			dildCock.addFlag(GLOBAL.FLAG_KNOTTED);
			return dildCock;
		}
	}
}
