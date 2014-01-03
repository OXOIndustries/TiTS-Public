package classes
{
	public class ShipClass
	{
		//constructor
		public function ShipClass()
		{
			choices = new Array();
		}
		// include "consts.as";
		//data
		public var planet:String = "";
		//Used on inventory buttons
		public var system:String = "";
		//Room Name
		public var roomName:String = "";
		//Longass shit, not sure what used for yet.
		public var description:String = "";
		//runOnEnter holds functions that overlay the normal functioning
		public var runOnEnter = undefined;
				
		//Information
		public var moveMinutes:Number = 5;
		public var shipFlags:Array = new Array();
		
		public var choices:Array = new Array();
		
		//Exits - these point to the room#
		public var northExit:int = -1;
		public var eastExit:int = -1;
		public var southExit:int = -1;
		public var westExit:int = -1;
		public var inExit:int = -1;
		public var inText:String = "In";
		public var outExit:int = -1;
		public var outText:String = "Out";
		
		//Functions
		public function hasFlag(arg):Boolean {
			for(var x:int = 0; x <= shipFlags.length; x++) {
				if(shipFlags[x] == arg) return true;
			}
			return false;
		}
		public function addFlag(arg):void {
			shipFlags[shipFlags.length] = arg;
		}
		public function removeFlag(arg):void {
			for(var x:int = 0; x <= shipFlags.length; x++) {
				shipFlags.splice(x,1);
			}
		}
		public function addChoice(text:String, func, arg = undefined):void {
			choices[choices.length] = new blueButton();
			choices[choices.length].func = func;
			choices[choices.length].arg = arg;
			choices[choices.length].tooltip = text
		}
	}
}