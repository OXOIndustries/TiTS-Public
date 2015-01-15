package classes.GameData.Pregnancy 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class PregnancyStageProgression 
	{
		public function PregnancyStageProgression() { }
		
		private var _triggersAtDuration:int;
		public function get triggersAtDuration():int { return _triggersAtDuration; }
		public function set triggersAtDuration(v:int):void { _triggersAtDuration = v; }
		
		private var _triggerFunc:Function = null;
		public function set triggerFunc(v:Function):void { _triggerFunc = v; }
		
		private var _useSlotArgument:Boolean = false;
		public function get useSlotArgument():Boolean { return _useSlotArgument; }
		public function set useSlotArgument(v:Boolean):void { _useSlotArgument = v; }
		
		public function execute(pregSlot:int = -1):void
		{
			if (_useSlotArgument)
			{
				if (_triggerFunc != null) _triggerFunc(pregSlot);
			}
			else
			{
				if (_triggerFunc != null) _triggerFunc();
			}
		}
	}

}