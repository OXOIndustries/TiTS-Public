package classes.Engine 
{
	import classes.DataManager.Serialization.VersionedSaveableV2;
	import flash.net.SharedObject;
	import flash.utils.ByteArray;
	
	/**
	 * ...
	 * @author ...
	 */
	public class SharedData extends VersionedSaveableV2
	{
		[Serialize]
		public var _saveSetID:uint = 0;
		public function get SaveSetID():uint { return _saveSetID; }
		public function set SaveSetID(v:uint):void
		{
			_saveSetID = v;
			SharedData.Save(this);
		}
		
		[Serialize]
		public var _lastUsedFolderPath:String = null;
		public function get LastUsedFolderPath():String { return _lastUsedFolderPath; }
		public function set LastUsedFolderPath(v:String):void
		{
			_lastUsedFolderPath = v;
			SharedData.Save(this);
		}
		
		public function SharedData() {}
		
		public static function Load():SharedData
		{
			var d:SharedObject = SharedObject.getLocal("GlobalData", "/");
			if (d.data.hasOwnProperty("classInstance") == false)
			{
				return new SharedData();
			}
			
			var sd:SharedData = new SharedData();
			sd.loadSaveObject(GetFileData(d).global);
			d.close();
			return sd;
		}
		
		public static function Save(sd:SharedData):void
		{
			var d:SharedObject = SharedObject.getLocal("GlobalData", "/");
			d.clear();
			d.data.global = sd.getSaveObject();
			d.flush();
		}
		
		public static function Clear():void
		{
			SharedObject.getLocal("GlobalData", "/").clear();
		}
		
		private static function GetFileData(so:SharedObject):Object
		{
			var ret:Object = {};
			var c:ByteArray = new ByteArray();
			c.writeObject(so.data);
			c.position = 0;
			ret = c.readObject();
			return ret;
		}
	}

}