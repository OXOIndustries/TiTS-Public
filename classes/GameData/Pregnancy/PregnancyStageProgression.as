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
		
		public function execute():void
		{
			if (_triggerFunc != null) _triggerFunc();
		}
	}

}