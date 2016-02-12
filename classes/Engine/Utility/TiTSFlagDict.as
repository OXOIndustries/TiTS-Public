package classes.Engine.Utility
{
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	import classes.DataManager.Serialization.ISaveable;
	
	// TODO: Create an ISavable version
	
	public class TiTSFlagDict extends FlagDict implements ISaveable
	{
		public function getSaveObject():Object
		{
			var newO:Object = {};
			
			for (var key:String in o)
			{
				newO[key] = o[key];
			}
			
			return newO;
		}
		
		public function loadSaveObject(oldO:Object):void
		{
			o = {};
			k = [];
			s = 0;
			
			for (var key:String in oldO)
			{
				o[key] = oldO[key];
				s++;
			}
		}
		
		public function makeCopy():*
		{
			var c:TiTSFlagDict = new TiTSFlagDict();
			c.loadSaveObject(this.getSaveObject());
		}
	}	
	
	/**
	 * Proxied version of an object-based dictionary.
	 * 
	 * A raw dictionary for flag storage has a few issues- namely, that unset flag values are undefined.
	 * Undefined will not coerce to false when used in boolean logic, they must be tested for (in)equality directly.
	 * 
	 * This proxy defaults unknown keys to 0, which will coerce to false as expected.
	 * eg
	 * Old: if (flag["MyFlag"] == undefined)
	 * New: if (!flag["MyFlag"])
	 * 
	 * As an effective upgrade over the CoC version, this should also be iterable like a regular object using
	 * for (var key:String in flags)
	 * 
	 * It's also possible to use a key directly for value increment purposes
	 * eg
	 * Old: if (flag["MyFlag"] == undefined) { flag["MyFlag"] = 1; } else { flag["MyFlag"]++; }
	 * New: flag["MyFlag"]++;
	 * 
	 * @author Gedan
	 */
	private class FlagDict extends Proxy
	{
		protected var o:Object;
		protected var s:uint;
		protected var k:Array;
		
		public function FlagDict() 
		{
			o = { };
			s = 0;
		}

		public function get length():uint { return s; }
		
		flash_proxy override function hasProperty(name:*):Boolean
		{
			return true;
		}
		
		flash_proxy override function getProperty(name:*):*
		{
			if (name == "length") return s;
			if (name in o) return o[name];
			
			return 0;
		}
		
		flash_proxy override function setProperty(name:*, value:*):void
		{
			if (name == "length") return;
			
			if (value != 0 && value != null && value != undefined)
			{
				if (!(name in o)) s++;
				o[name] = value;
			}
			else
			{
				if (name in o)
				{
					delete o[name];
					s--;
				}
			}
		}
		
		flash_proxy override function callProperty(methodName:*, ... args):*
		{
			if (methodName as String == "push") return;
			else
			{
				return o[methodName].apply(o, args);
			}
		}
		
		flash_proxy override function deleteProperty(name:*):Boolean
		{
			if (name in o)
			{
				delete o[name];
				s--;
				return true;
			}
			else
			{
				return false;
			}
		}
		
		flash_proxy override function nextNameIndex(index:int):int
		{
			if (index == 0 || k == null)
			{
				k = [];
				for (var key:String in o)
				{
					k.push(key);
				}
			}
			
			if (s != k.length) trace("FlagDict Warning: Key order may be compromised! Did you add or remove an element from the dict whilst iterating?");
			
			if (index < k.length)
			{
				return index + 1;
			}
			else
			{
				return 0;
			}
		}
		
		flash_proxy override function nextName(index:int):String
		{
			if (k == null)
			{
				k = [];
				for (var key:String in o)
				{
					k.push(key);
				}
			}
			
			if (s != k.length) trace("FlagDict Warning: Key order may be compromised! Did you add or remove an element from the dict whilst iterating?");
			
			return k[index - 1];
		}
		
		flash_proxy override function nextValue(index:int):*
		{
			if (k == null)
			{
				k = [];
				for (var key:String in o)
				{
					k.push(key);
				}
			}
			
			if (s != k.length) trace("FlagDict Warning: Key order may be compromised! Did you add or remove an element from the dict whilst iterating?");
			
			return o[k[index - 1]];
		}
	
	}

}