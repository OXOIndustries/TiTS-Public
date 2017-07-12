package classes.Ships 
{
	import classes.DataManager.Serialization.UnversionedSaveableV2;
	import classes.Resources.StatusIcons;
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusEffectPayload extends UnversionedSaveableV2
	{
		public static const DURATION_TIME:String = "time";
		public static const DURATION_ROUNDS:String = "rounds";
		public static const DURATION_PERM:String = "perm";
		
		[Serialize]
		public var Name:String = "";
		
		[Serialize]
		protected var _tooltipHeader:String = "";
		public function get TooltipHeader():String { return _tooltipHeader; }
		public function set TooltipHeader(v:String):void { _tooltipHeader = v; }
		
		[Serialize]
		protected var _tooltipBody:String = "";
		public function get TooltipBody():String { return _tooltipBody; }
		public function set TooltipBody(v:String):void { _tooltipBody = v; }
		
		[Serialize]
		public var Payload:Object = { };
		
		[Serialize]
		public var OnRemoveFuncLookup:String;
		
		[Serialize]
		public var OnCreateFuncLookup:String;
		
		[Serialize]
		public var OnRoundStartFuncLookup:String;
		
		[Serialize]
		public var OnRoundEndFuncLookup:String;
		
		[Serialize]
		public var CombatOnly:Boolean = false;
		
		[Serialize]
		public var DurationMode:String = DURATION_PERM;
		
		[Serialize]
		public var Duration:int = -1;
		
		[Serialize]
		public var Hidden:Boolean = false;
		
		public var IconClass:Class = null;
		
		[Serialize]
		protected var _iconClassRef:String = null;
		public function get IconClassRef():String
		{
			return _iconClassRef;
		}
		public function set IconClassRef(v:String):void
		{
			_iconClassRef = v;
			
			if (v == null)
			{
				IconClass = null;
			}
			else
			{
				if (StatusIcons[v] != undefined)
				{
					IconClass = StatusIcons[v];
				}
				else
				{
					IconClass = null;
				}
			}
		}
		
		[Serialize]
		public var IconColor:uint = 0xFFFFFF;
		
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
			return FuncLookup(OnRemoveFuncLookup);
		}
		
		public function get OnCreate():Function
		{
			return FuncLookup(OnCreateFuncLookup);
		}
		
		public function get OnRoundStart():Function
		{
			return FuncLookup(OnRoundStartFuncLookup);
		}
		
		public function get OnRoundEnd():Function
		{
			return FuncLookup(OnRoundEndFuncLookup);
		}
		
		public function StatusEffectPayload(seName:String = null, sePayload:Object = null, seDuration:int = -1, seDurationType:String = DURATION_PERM, seIconClass:String = null, removeAfterCombat:Boolean = false, hideFromDisplay:Boolean = false, seOnRemove:String = null, seOnCreate:String = null, seOnRoundStart:String = null, seOnRoundEnd:String = null) 
		{
			Name = seName;
			Payload = sePayload;
			Duration = seDuration;
			DurationMode = seDurationType;
			_iconClassRef = seIconClass;
			CombatOnly = removeAfterCombat;
			Hidden = hideFromDisplay;
			OnRemoveFuncLookup = seOnRemove;
			OnCreateFuncLookup = seOnCreate;
			OnRoundStartFuncLookup = seOnRoundStart;
			OnRoundEndFuncLookup = seOnRoundEnd;
		}
		
	}

}