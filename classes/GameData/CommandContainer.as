package classes.GameData 
{
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CommandContainer 
	{
		public var text:String;
		public var func:Function;
		public var arg:*;
		
		public function execute():void
		{
			kGAMECLASS.flags["LAST_FAP"] = text;
			if (arg != undefined)
			{
				func(arg);
			}
			else
			{
				func();
			}
		}
		
		public function CommandContainer() 
		{
			text = "";
			func = null;
			arg = undefined;
		}
		
	}

}