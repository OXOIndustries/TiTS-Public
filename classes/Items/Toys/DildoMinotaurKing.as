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
	
	public class DildoMinotaurKing extends Dildo
	{
		//constructor
		public function DildoMinotaurKing()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "KingMino";
			
			//Regular name
			this.longName = "Minotaur King";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Minotaur King dildo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "<i>“Po’s Own”</i> isn’t any manufacturer you’ve heard before, and it’s certainly no subdivision of the ever-popular TamaniCorp.\n\nYou doubt this fly-by-night company was able to obtain the rights of a quadruple-X title like <i>“Champions of Corruption”</i> by legitimate means, but that doesn’t stop this onyx-black pillar of cunt-wrecking minotaur-meat from wobbling around at a full three feet of length.\n\nA stamp on one of the melon-sized balls warns of <i>“Gut Flooding Fun for the Whole of Tel’Adre!”</i> while a much smaller notice reads, ‘May contain minor traces of chemical, genetic, and reality taint from manufacture.’\n\nWhatever that means.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 69000;//heh heh.
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.material = "digimeat";
			this.cumQ = 50000;
			
			this.version = _latestVersion;
		}
		override public function cock():CockClass
		{
			var dildCock:CockClass = new CockClass();
			dildCock.cLengthRaw = 36;
			dildCock.cockColor = "sable";
			dildCock.cType = GLOBAL.TYPE_EQUINE
			dildCock.addFlag(GLOBAL.FLAG_BLUNT);
			dildCock.addFlag(GLOBAL.FLAG_SHEATHED);
			dildCock.addFlag(GLOBAL.FLAG_FLARED);
			return dildCock;
		}
	}
}
