package classes.Engine.ShipCombat.DamageTypes 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class ShipDamageFlag 
	{
		public static const OP_MUL:uint = 0;
		public static const OP_ADD:uint = 1;
		
		public static const UNSET:uint = 0;
		
		public static const SHIELDBREAKER:uint = 1;
		public static const ARMORPENETRATING:uint = 2;
		public static const CAPNEUT:uint = 3;
		public static const EASY:uint = 4;
		public static const TYPE_SHIELD:uint = 5;
		public static const TYPE_ARMOR:uint = 6;
		public static const TYPE_HULL:uint = 7;
		
		public static const FlagNames:Array = [];
		
		{
			FlagNames[SHIELDBREAKER] = "Shield Breaker";
			FlagNames[ARMORPENETRATING] = "Armor Penetrating";
			FlagNames[CAPNEUT] = "Capacitor Neutrailization";
		}
		
		private var _thisFlag:uint;
		private var _triggers:Vector.<DamageFlagTrigger>;
		
		public function get Flag():uint { return _thisFlag; }
		public function get ShortName():String { return FlagNames[_thisFlag]; }
		
		public function ShipDamageFlag(dFlag:uint = UNSET, ... dTriggers) 
		{
			_triggers = new Vector.<DamageFlagTrigger>();
			
			if (dFlag == UNSET)
			{
				_thisFlag = UNSET;
			}
			else
			{
				_thisFlag = dFlag;
				
				if (dTriggers.length > 0)
				{
					for (var i:uint = 0; i < dTriggers.length; i++)
					{
						var aTrigger:Array = dTriggers[i];
						
						if (aTrigger.length == 2 || aTrigger.length == 3) CreateTrigger.apply(null, aTrigger);
					}
				}
			}
		}
		
		private function CreateTrigger(trigger:uint, value:Number, op:uint = OP_MUL):void
		{			
			if (HasTriggerFor(trigger))
			{
				var o:DamageFlagTrigger = GetTriggerValues(trigger);
				o.Value = value;
				o.Operation = op;
			}
			else
			{
				_triggers.push(new DamageFlagTrigger(trigger, value, op));
			}
		}
		
		public function HasTriggerFor(trigger:uint):Boolean
		{
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				if (_triggers[i].triggerOn == trigger) return true;
			}
			return false;
		}
		
		private function TriggerIndexFor(trigger:uint):uint
		{
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				if (_triggers[i].triggerOn == trigger) return i;
			}
			return uint.MAX_VALUE;
		}
		
		public function GetTriggerValues(trigger:uint):DamageFlagTrigger
		{
			return _triggers[TriggerIndexFor(trigger)];
		}
		
		public function MakeCopy():ShipDamageFlag
		{
			var n:ShipDamageFlag = new ShipDamageFlag();
			n._thisFlag = _thisFlag;
			
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				n._triggers.push(_triggers[i].MakeCopy());
			}
			
			return n;
		}
	}

}