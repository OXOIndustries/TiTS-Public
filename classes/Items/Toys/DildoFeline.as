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
	
	public class DildoFeline extends Dildo
	{
		//constructor
		public function DildoFeline()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "CatDildo";
			
			//Regular name
			this.longName = "cat dildo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a cat dildo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "TamaniCorp’s ‘<i>Basics for Bitches</i>’ line of dildos is proud to include the latest addition to their phallic stable: Bukkir the feline stud! Packing 10 inches of pink cat-cock (but really silicone!), this dildo was lovingly reproduced from the popular “Biocock Infinibang” game using the official 3D model!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 110;//heh heh.
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
			dildCock.cLengthRaw = 10;
			dildCock.cockColor = "pink";
			dildCock.cType = GLOBAL.TYPE_FELINE;
			dildCock.addFlag(GLOBAL.FLAG_NUBBY);
			return dildCock;
		}
	}
}
