package classes
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.ISaveable;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	
	public class ItemSlotClass implements ISaveable
	{
		private var _version:int = 0;
		public function get version():int { return _version; }
		public function set version(v:int):void { _version = v; }
		
		protected var _latestVersion:int = 0;
		
		private var _quantity:Number;
		
		public function get quantity():Number { return _quantity; }
		public function set quantity(v:Number):void { _quantity = v; }
		
		public var stackSize:int;
		//Used on inventory buttons
		public var shortName:String;
		//Regular name
		public var longName:String;
		//Longass shit, not sure what used for yet.
		public var description:String;
		//Displayed on tooltips during mouseovers
		public var tooltip:String;
		public var attackVerb:String;
		//Information
		public var type:int;
		public var basePrice:Number;
		
		//Flags
		public var itemFlags:Array;
		
		//Equipped properties
		//Bonus tohit
		public var attack:Number;
		//Bonus damage
		public var damage:Number;
		public var damageType:int;
		public var defense:Number;
		public var shieldDefense:Number;
		public var shields:Number;
		public var sexiness:Number;
		public var critBonus:Number;
		public var evasion:Number;
		public var fortification:Number;
		public var bonusResistances:Array;
		
		//constructor
		public function ItemSlotClass(dataObject:Object = null)
		{
			this._latestVersion = 1;
			// Two-stage constructors. Storage is pre-allocated, 
			// and the variables are merely set on instantiation.

			this.quantity = 0;
			this.stackSize = 5;
			//Used on inventory buttons
			this.shortName = "";
			//Regular name
			this.longName = "";
			//Longass shit, not sure what used for yet.
			this.description = "";
			//Displayed on tooltips during mouseovers
			this.tooltip = "";
			this.attackVerb = "";
			//Information
			this.type = 0;
			this.basePrice = 0;
		
			//itemFlags
			this.itemFlags = new Array();
		
			//Equipped properties
			this.attack = 0;
			this.damage = 0;
			this.damageType = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
		
			if (dataObject != null)
			{
				this.loadSaveObject(dataObject);
			}
			else
			{
				this.version = 1;
			}
		}
		
		public function addFlag(arg:int):void 
		{
			if(this.hasFlag(arg)) 
				return;
			this.itemFlags[this.itemFlags.length] = arg;
		}
		
		public function hasFlag(arg:int):Boolean 
		{
			for(var x:int = 0; x < itemFlags.length; x++) {
				if(arg == itemFlags[x]) 
					return true;
			}
			return false;
		}
		
		public function deleteFlag(arg:int):void 
		{
			if(!this.hasFlag(arg)) 
				return;
			for(var x:int = 0; x < this.itemFlags.length; x++) 
			{
				if(arg == this.itemFlags[x]) this.itemFlags.splice(x,1);
			}
		}
		
		public function useFunction(targetCreature:Creature):Boolean
		{
			throw new Error("useFunction must be overriden in a child class!");
		}
		
		// Serialization shit
		public function getSaveObject():Object
		{
			var dataObject:Object = new Object();
			
			var _d:XML = describeType(this);
			var _dl:XMLList = _d..variable;
			var _da:XMLList = _d..accessor;
			
			for each (var prop:XML in _dl)
			{
				if (this[prop.@name] != null && this[prop.@name] != undefined)
				{
					dataObject[prop.@name] = this[prop.@name];
				}
			}
			
			for each (var accs:XML in _da)
			{
				if (accs.@name != "prototype" && accs.@name != "neverSerialize")
				{
					dataObject[accs.@name] = this[accs.@name];
				}
			}
			
			dataObject.classInstance = getQualifiedClassName(this);
			
			return dataObject;
		}
		
		public function loadSaveObject(dataObject:Object):void
		{
			if (this._latestVersion == -1) return;
			
			// Same mechanic as for creatures. If the player has a save instance of an item, their values will clobber
			// those in the game data, so rebalancing will have to go via a version system.
			if (dataObject.version < this._latestVersion)
			{
				while (dataObject.version < this._latestVersion)
				{
					this["UpgradeVersion" + dataObject.version](dataObject);
				}
			}
			
			if (dataObject.version != this._latestVersion)
			{
				throw new VersionUpgraderError("Couldn't upgrade the save data for " + dataObject.classInstance);
			}
			
			var _d:XML = describeType(dataObject);
			if (_d.@isDynamic == "true")
			{
				for (var prop in dataObject)
				{
					if (prop != "prototype" && prop != "neverSerialize" && prop != "classInstance")
					{
						this[prop] = dataObject[prop];
					}
				}
			}
			else
			{
				var _dl:XMLList = _d..variable;
				var _da:XMLList = _d..accessor;
				
				for each (var prop in _dl)
				{
					if (this[prop.@name] != null && this[prop.@name] != undefined)
					{
						this[prop.@name] = dataObject[prop.@name];
					}
				}
				
				for each (var accs in _da)
				{
					if (accs.@name != "prototype" && accs.@name != "neverSerialize")
					{
						this[accs.@name] = dataObject[accs.@name];
					}
				}
			}
		}
	}
}