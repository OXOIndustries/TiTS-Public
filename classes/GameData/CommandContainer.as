package classes.GameData 
{
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.addButton;
	import classes.Engine.Interfaces.addDisabledButton;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CommandContainer 
	{
		public var IsDisabled:Boolean;
		public var IsPurple:Boolean;
		public var text:String;
		public var ttHeader:String;
		public var ttBody:String;
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
			IsDisabled = false;
			IsPurple = false;
			text = "";
			func = null;
			arg = undefined;
			ttHeader = undefined;
			ttBody = undefined;
		}
		
		public function AddAsButton(idx:int)
		{
			if (IsDisabled)
			{
				addDisabledButton(idx, text, ttHeader, ttBody);
			}
			else
			{
				addButton(idx, text, func, arg, ttHeader, ttBody);
			}
		}
		
	}

}