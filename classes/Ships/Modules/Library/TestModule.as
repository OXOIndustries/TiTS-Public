package classes.Ships.Modules.Library 
{
	import classes.Ships.Map.ShipRoom;
	import classes.Ships.Modules.ShipModule;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TestModule extends ShipModule
	{
		
		public function TestModule() 
		{
			_room = new ShipRoom(null);
			_room.Name = "Testing Room";
			_room.ShortName = "TestRoom";
		}
		
	}

}