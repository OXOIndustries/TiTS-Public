package classes.Ships 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusEffectPayload 
	{
		public static const DURATION_TIME:String = "time";
		public static const DURATION_ROUNDS:String = "rounds";
		public static const DURATION_PERM:String = "perm";
		
		public var Name:String = "";
		public var TooltipHeader:String = "";
		public var TooltipBody:String = "";
		
		public var Payload:Object = { };
		
		public var OnRemoveFuncLookup:String;
		public var OnCreateFuncLookup:String;
		public var OnNewRoundFuncLookup:String;
		
		public var CombatOnly:Boolean = false;
		public var DurationMode:String = DURATION_PERM;
		public var Duration:int = -1;
		public var Hidden:Boolean = false;
		public var IconClass:Class = null;
		
		private function FuncLookup(prop:String):Function
		{
			if (prop != null && prop.length > 0)
			{
				if (ShipEffectFunctionLibrary[prop] != undefined)
				{
					return ShipEffectFunctionLibrary[prop];
				}
				else
				{
					new Error("Couldn't find the associated function name for the declared effect '" + prop + "'");
				}
			}
			return null;
		}
		
		public function get OnRemove():Function
		{
			FuncLookup(OnRemoveFuncLookup);
		}
		
		public function get OnCreate():Function
		{
			FuncLookup(OnCreateFuncLookup);
		}
		
		public function get OnNewRound():Function
		{
			FuncLookup(OnNewRound);
		}
		
		public function StatusEffectPayload(seName:String, sePayload:Object, seDuration:int = -1, seDurationType:String = DURATION_PERM, seIconClass:Class = null, removeAfterCombat:Boolean = false, hideFromDisplay:Boolean = false, seOnRemove:String = "", seOnCreate:String = "", seOnNewRound:String = "") 
		{
			Name = seName;
			Payload = sePayload;
			Duration = seDuration;
			DurationMode = seDurationType;
			IconClass = seIconClass;
			CombatOnly = removeAfterCombat;
			Hidden = hideFromDisplay;
			OnRemoveFuncLookup = seOnRemove;
			OnCreateFuncLookup = seOnCreate;
		}
		
	}

}