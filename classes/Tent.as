package classes
{
	import classes.Characters.PlayerCharacter;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ItemSaveable;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.ParseText;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.Tent;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.kGAMECLASS;
	import classes.Engine.Map.InShipInterior;
	
	public class Tent extends ItemSlotClass
	{
		public var lastUseAt:Number;
		public var cooldown:Number;

		public function ready():Boolean
		{
			return (kGAMECLASS.GetGameTimestamp() - cooldown >= lastUseAt);
		}
		public function timeLeft():Number
		{
			return Math.ceil((lastUseAt+cooldown) - kGAMECLASS.GetGameTimestamp());
		}
		public function useTent():Boolean
		{
			clearOutput();
			//Only use in hazard areas.
			if(!kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.HAZARD))
			{
				output("Deploying " + this.description + " here would be a bad idea.");
				return false;
			}
			//No reason to deploy where a bed is.
			else if(InShipInterior(kGAMECLASS.pc) || kGAMECLASS.rooms[kGAMECLASS.currentLocation].hasFlag(GLOBAL.BED))
			{
				output("You don't need a tent here!");
				return false;
			}
			else
			{
				lastUseAt = kGAMECLASS.GetGameTimestamp();
				output("You find a relatively clear patch to deploy your " + this.longName + " and bunker down for a solid eight hours...");
				kGAMECLASS.eventBufferXP();
				kGAMECLASS.sleep(false);
				return true;
			}
			return false;
		}
		//constructor
		public function Tent(dataObject:Object = null)
		{
			this._latestVersion = 1;
			lastUseAt = -10000;
			cooldown = 3*24*60;
			hasRandomProperties = true;
			if (dataObject != null)
			{
				this.loadSaveObject(dataObject);
			}
			else
			{
				this.version = 1;
			}
		}
	}
}
