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
	
	public class DildoEquine extends Dildo
	{
		//constructor
		public function DildoEquine()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "HorseDil";
			
			//Regular name
			this.longName = "horse dildo";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a horse dildo";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "TamaniCorp’s ‘<i>Basics for Bitches</i>’ line of dildos is proud to include the latest addition to their phallic stable: Urta! Packing 20 inches of pure black horsemeat (but really silicone!), this dildo was lovingly reproduced from the popular “Champions of Corruption” game using the official 3D model!";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 100;//heh heh.
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
			dildCock.cLengthRaw = 20;
			dildCock.cockColor = "black";
			dildCock.cType = GLOBAL.TYPE_EQUINE;
			dildCock.addFlag(GLOBAL.FLAG_BLUNT);
			dildCock.addFlag(GLOBAL.FLAG_FLARED);
			return dildCock;
		}
	}
}
