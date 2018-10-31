package classes.GameData 
{
	import classes.DataManager.Serialization.UnversionedSaveableV2;
	import classes.DataManager.Serialization.VersionedSaveableV2;
	import classes.Ships.Library.TestShip;
	import classes.Ships.Modules.CapacitorModule;
	import classes.Ships.Modules.ShipModule;
	import classes.Ships.SpaceShip;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipManager extends VersionedSaveableV2
	{
		public function ShipManager() 
		{
			NewGame();
		}
		
		public function NewGame():void
		{
			// TODO: Change this to the Casstech (when I actually code the Casstech (aka when things actually work))
			_persistentShips = { };
			var defPcShip:SpaceShip = new TestShip();
			_persistentShips["PCShip"] = defPcShip;
			_activePlayerShip = defPcShip;
			_activePlayerShip.Owner = kGAMECLASS.pc;
			
			_ownedShips = [];
			_availableShips = [];
			_lockedShips = [];
			
			_lockedModules = [];
			_licensedModules = [];
			_ownedModules = [];
		}
		
		public function SetActiveShipType(ownedShipClass:Class):void
		{
			var storedShipId:String = getQualifiedClassName(ownedShipClass);
			storedShipId = storedShipId.substr(storedShipId.indexOf("::"));
			
			var currentShipId:String = getQualifiedClassName(ActivePlayerShip);
			currentShipId = currentShipId.substr(currentShipId.indexOf("::"));
			
			_ownedShips.splice(_ownedShips.indexOf(storedShipId), 1);
			_ownedShips.push(currentShipId);

			var newShip:SpaceShip = new ownedShipClass();
			newShip.Owner = kGAMECLASS.pc;
			
			var oldShip:SpaceShip = ActivePlayerShip;
			
			// Move inventory over, we're intentionally ignoring space limits for now because we have to decide how to handle that shit.
			newShip.TransferInventory(oldShip.Inventory);
			
			// Move over all of the active assignments; we'll have whatever code calls this function do a test to check if the assigned/available
			// crew is more than the ship can handle (and give opportunity to rectify by fitting modules that increase crew cap or telling crew
			// to gtfo)
			
			if (oldShip.Lightdrive.HookedCrew != null) newShip.AssignCrewToModule(oldShip.Lightdrive.HookedCrew, newShip.Lightdrive);
			if (oldShip.Engine.HookedCrew != null) newShip.AssignCrewToModule(oldShip.Engine.HookedCrew, newShip.Engine);
			if (oldShip.ShieldGenerator.HookedCrew != null) newShip.AssignCrewToModule(oldShip.ShieldGenerator.HookedCrew, newShip.ShieldGenerator);
			if (oldShip.HullArmoring.HookedCrew != null) newShip.AssignCrewToModule(oldShip.HullArmoring.HookedCrew, newShip.HullArmoring);
			if (oldShip.Reactor.HookedCrew != null) newShip.AssignCrewToModule(oldShip.Reactor.HookedCrew, newShip.Reactor);
			if (oldShip.CapacitorBattery.HookedCrew != null) newShip.AssignCrewToModule(oldShip.CapacitorBattery.HookedCrew, newShip.CapacitorBattery);
			if (oldShip.Gunnery.HookedCrew != null) newShip.AssignCrewToModule(oldShip.Gunnery.HookedCrew, newShip.Gunnery);
			
			// We can't count on any of the other modules being active, so we're just going to unassign all of those crewmembers
			var oldModules:Array = oldShip.OnlyExtensionFittedModules;
			for (var i:int = 0; i < oldModules.length; i++)
			{
				var sm:ShipModule = oldModules[i] as ShipModule;
				if (sm.HookedCrew != null)
				{
					oldShip.UnassignCrewFromModule(sm.HookedCrew);
				}
				
				StoreModuleOfType(sm);
			}
			
			// TODO: If we support players swapping out the core modules on the ship, we'll also need to pull those off the old ship and store them!
			
			_persistentShips["PCShip"] = newShip;
			_activePlayerShip = newShip;
		}
		
		[Serialize]
		public var _persistentShips:Object;
		public function get PersistentShips():Object { return _persistentShips; }
		
		// The players currently active ship should always be stored in _persistentShips under the key "PCShip".
		// We're not saving it here, just not bothering to go through an object-key lookup to find it.
		private var _activePlayerShip:SpaceShip;
		public function get ActivePlayerShip():SpaceShip { return _activePlayerShip; }
		
		/* boardedShip is serialized in a special way:
		* If the ship exists as an entry in the list of _persistentShips, then we only save a key to reconnect the propertly
		* back to the true storage location of the target ship; that is, whatever is inside _persistentShips.
		* If the ship is NOT persistent, say, it is a generic ship used as part of an encounter, then we save the whole ship object
		* as we'll not actually have a copy of it inside _persistentShips; this also means we'll be saving various state such
		* as status effects et al that may change the environment automatically. */
		private var _boardedShip:SpaceShip;
		public function get BoardedShip():SpaceShip { return _boardedShip; }
		
		private var _ownedShips:Array;
		private var _availableShips:Array;
		private var _lockedShips:Array;
		
		private var _lockedModules:Array;
		private var _licensedModules:Array;
		private var _ownedModules:Array;
		
		public function StoreModuleOfType(module:*):void
		{
			if (!(module is Class) && !(module is ShipModule))
			{
				throw new Error("Unknown type reference passed to StoreModuleOfType.");
			}
			
			var ownedIdx:int = OwnsModuleOfType(module);
			if (ownedIdx >= 0)
			{
				(_ownedModules[ownedIdx] as OwnedModuleQuantity).Quantity++;
			}
			else
			{
				var owq:OwnedModuleQuantity = new OwnedModuleQuantity();
				
				if (module is ShipModule)
				{
					owq.Module = module;
				}
				else
				{
					owq.Module = new module();
				}
				
				owq.Quantity = 1;
				owq.ModuleQN = getQualifiedClassName(module);
				_ownedModules.push(owq);
			}
		}
		
		protected function OwnsModuleOfType(module:*):int
		{
			if (!(module is Class) && !(module is ShipModule))
			{
				throw new Error("Unknown type reference passed to OwnsModuleOfType.");
			}
			
			for (var i:int = 0; i < _ownedModules.length; i++)
			{
				var owq:OwnedModuleQuantity = _ownedModules[i] as OwnedModuleQuantity;
				if (owq.Module is module)
				{
					return i;
				}
			}
			return -1;
		}
			
		override public function getSaveObject():Object
		{
			var so:Object = super.getSaveObject();
			
			DehydrateBoardedShip(so);
			
			so.ownedShips = [];
			
			for (var i:int = 0; i < _ownedShips.length; i++)
			{
				so.ownedShips.push(getQualifiedClassName(_ownedShips[i]));
			}
			
			so.availableShips = [];
			
			for (i = 0; i < _availableShips.length; i++)
			{
				so.availableShips.push(getQualifiedClassName(_availableShips[i]));
			}
			
			so.lockedShips = [];
			
			for (i = 0; i < _lockedShips.length; i++)
			{
				so.lockedShips.push(getQualifiedClassName(_lockedShips[i]));
			}
			
			so.lockedModules = [];
			
			for (i = 0; i < _lockedModules.length; i++)
			{
				so.lockedModules.push(getQualifiedClassName(_lockedModules[i]));
			}
			
			so.licensedModules = [];
			
			for (i = 0; i < _licensedModules.length; i++)
			{
				so.licensedModules.push(getQualifiedClassName(_licensedModules[i]));
			}
			
			so.ownedModules = [];
			
			for (i = 0; i < _ownedModules.length; i++)
			{
				so.ownedModules.push( {
					module: getQualifiedClassName(_ownedModules[i].Module),
					quantity: _ownedModules[i].Quantity
				});
			}
			
			return so;
		}
		
		override public function loadSaveObject(o:Object):void
		{
			var dehydratedBoardedShip:* = o.boardedShip;
			delete o.boardedShip;
			
			NewGame();
			
			for (var i:int = 0; i < o.ownedShips.length; i++)
			{
				_ownedShips.push(new (getDefinitionByName(o.ownedShips[i]) as Class));
			}
			
			delete o.ownedShips;
			
			for (i = 0; i < o.availableShips.length; i++)
			{
				_availableShips.push(new (getDefinitionByName(o.availableShips[i]) as Class));
			}
			
			delete o.availableShips;
			
			for (i = 0; i < o.lockedShips.length; i++)
			{
				_lockedShips.push(new (getDefinitionByName(o.lockedShips[i]) as Class));
			}
			
			delete o.lockedShips;
			
			for (i = 0; i < o.lockedModules.length; i++)
			{
				_lockedModules.push(new (getDefinitionByName(o.lockedModules[i]) as Class));
			}
			
			delete o.lockedModules;
			
			for (i = 0; i < o.licensedModules.length; i++)
			{
				_licensedModules.push(new (getDefinitionByName(o.licensedModules[i]) as Class));
			}
			
			delete o.licensedModules;
			
			for (i = 0; i < o.ownedModules.length; i++)
			{
				var c:OwnedModuleQuantity = new OwnedModuleQuantity();
				c.Module = (new (getDefinitionByName(o.ownedModules[i].module) as Class));
				c.ModuleQN = o.ownedModules[i].module;
				c.Quantity = o.ownedModules[i].quantity;
				_ownedModules.push(c);
			}
			
			delete o.ownedModules;
			
			super.loadSaveObject(o);
			
			HydrateBoardedShip(dehydratedBoardedShip);
			_activePlayerShip = _persistentShips["PCShip"];
		}
		
		private function DehydrateBoardedShip(o:Object):void
		{
			if (_boardedShip == null)
			{
				o.boardedShip = "None";
			}
			else
			{
				var found:Boolean = false;
				for (var key:String in _persistentShips)
				{
					if (_persistentShips[key] == _boardedShip)
					{
						found = true;
						o.boardedShip = key;
						break;
					}
				}
				
				if (found == false)
				{
					o.boardedShip = _boardedShip.getSaveObject();
				}
			}
		}
		
		private function HydrateBoardedShip(o:Object):void
		{
			if (o === null)
			{
				_boardedShip = null;
			}
			else if (o is String)
			{
				if (o == "None")
				{
					_boardedShip = null;
				}
				else
				{
					_boardedShip = _persistentShips[o];
				}
			}
			else if (o is Object)
			{
				_boardedShip = (new getDefinitionByName(o.classInstance));
				_boardedShip.loadSaveObject(o);
			}
		}
		
		// This should probably require us to give a shit about any other ship first but HO HUM
	}
}

import classes.Ships.Modules.ShipModule;

class OwnedModuleQuantity
{
	public var Module:ShipModule;
	public var ModuleQN:String;
	public var Quantity:uint;
}