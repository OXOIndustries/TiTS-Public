package classes.GameData.Pregnancy 
{
	import classes.Creature;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class BasePregnancyHandler 
	{
		private var _handlesType:int;
		public function get handlesType():int { return _handlesType; }
		
		protected var _remainingDuration:int;
		public function get remainingDuration():int { return _remainingDuration; }
		
		private var _initialDuration:int;
		public function get initialDuration():int { return _initialDuration; }
		
		public function BasePregnancyHandler(pType:int) 
		{
			_handlesType = pType;
		}
		
		public function updatePregnancyStage(tarCreature:Creature, tMinutes:int):void
		{
			
		}
		
		// Baseline data/interaction
		private var _onTryImpregnate:Function = BasePregnancyHandler.defaultOnTryImpregnate;
		public function set onTryImpregnate(v:Function):void { _onTryImpregnate = v; }
		public static function defaultOnTryImpregnate():Boolean
		{
			
		}
		
		private var _onSuccessfulImpregnation:Function;
		public function set onSuccessfulImpregnation(v:Function):void { _onSuccessfulImpregnation = v; }
		protected static function defaultOnSuccessfulImpregnation():void
		{
			
		}
		
		private var _onFailedImpregnation:Function;
		public function set onFailedImpregnation(v:Function):void { _onFailedImpregnation = v; }
		protected static function defaultOnFailedImpregnation():void
		{
			
		}
		
		private var _stageProgressions:Array;
		public function addStageProgression(args ...):void
		{
			if (args.length > 0)
			{
				var cIndex:int = 0;
				var psp:PregnancyStageProgression;
				
				while (cIndex < args.length)
				{
					if (args[cIndex] is PregnancyStageProgression)
					{
						_stageProgressions.push(args[cIndex]);
						cIndex++;
					}
					else if (args[cIndex] is int && args[cIndex + 1] is Function)
					{
						psp = new PregnancyStageProgression();
						psp.triggersAtDuration = args[cIndex];
						psp.triggerFunc = args[cIndex + 1];
						_stageProgressions.push(psp);
						cIndex += 2;
					}
					else if (args[cIndex] is Function && args[cIndex + 1] is int)
					{
						psp = new PregnancyStageProgression();
						psp.triggersAtDuration = args[cIndex + 1];
						psp.triggerFunc = args[cIndex];
						_stageProgressions.push(psp);
						cIndex += 2;
					}
				}
			}
		}
		
		private var _onDurationEnd:Function;
	}
}