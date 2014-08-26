package classes
{
	public class RoomClass
	{
		var titsClassPtr:*;

		//constructor
		public function RoomClass(titsClassPtrArg:*)
		{
			
			this.titsClassPtr = titsClassPtrArg;
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
		public var roomFlags:Array = new Array();
		
		public var choices:Array = new Array();
		
		//Exits - these point to the room key in rooms
		public var northExit:String = "";
		public var eastExit:String = "";
		public var southExit:String = "";
		public var westExit:String = "";
		public var inExit:String = "";
		public var inText:String = "In";
		public var outExit:String = "";
		public var outText:String = "Out";

		public var canSaveInRoom:Boolean = true;
		

		//Functions
		public function hasFlag(arg):Boolean {
			for(var x:int = 0; x <= roomFlags.length; x++) {
				if(roomFlags[x] == arg) return true;
			}
			return false;
		}
		public function addFlag(arg):void {
			roomFlags[roomFlags.length] = arg;
		}
		public function removeFlag(arg):void {
			for(var x:int = 0; x <= roomFlags.length; x++) {
				if(arg == roomFlags[x]) roomFlags.splice(x,1);
			}
		}
	}
}