package classes.Engine.Combat.DamageTypes 
{
	import classes.DataManager.Serialization.ISaveable;
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class DamageFlag implements ISaveable
	{
		public static const OP_MUL:uint = 0;
		public static const OP_ADD:uint = 1;
		
		private static const UNSET:uint			= 0;
		
		public static const PENETRATING:uint 	= 1;
		public static const ABLATIVE:uint 		= 2;
		public static const PLATED:uint 		= 3;
		public static const CRUSHING:uint 		= 4;
		public static const BULLET:uint			= 5;
		public static const LASER:uint			= 6;
		public static const MIRRORED:uint		= 7;
		public static const CRYSTAL:uint		= 8;
		public static const PSIONIC:uint		= 9;
		public static const NULLIFYING:uint		= 10;
		public static const AMPLIFYING:uint		= 11;
		public static const EXPLOSIVE:uint		= 12;
		
		private var _thisFlag:uint;
		private var _triggers:Array;
		
		public function get flag():uint { return _thisFlag; }
		
		/**
		 * new DamageFlag(ABLATIVE, [PENETRATING, 0.75], [CRUSHING, 1.25], [BULLET, 0.8]);
		 * @param	dFlag
		 * @param	... dTriggers
		 */
		public function DamageFlag(dFlag:uint = UNSET, ... dTriggers) 
		{
			// Allow creation for later overwrite by serialised data
			if (dFlag == UNSET)
			{
				_thisFlag = UNSET;
				_triggers = [];
			}
			
			// Build defaults based on supplied flag.
			else if (dFlag != UNSET)
			{
				switch (dFlag)
				{
					case ABLATIVE:
						createTrigger(PENETRATING, 0.75);
						createTrigger(CRUSHING, 1.25);
						createTrigger(BULLET, 0.85);
						break;
						
					case PLATED:
						createTrigger(PENETRATING, 1.25);
						createTrigger(CRUSHING, 0.75);
						createTrigger(BULLET, 0.85);
						break;
						
					case MIRRORED:
						createTrigger(LASER, 0.1);
						break;
					
					case CRYSTAL:
						createTrigger(LASER, 1.5);
						break;
						
					case NULLIFYING:
						createTrigger(PSIONIC, 0.75);
						break;
						
					case AMPLIFYING:
						createTrigger(PSIONIC, 1.25);
						break;
				}
			}
			
			// Override defaults if data was provided
			if (dTriggers.length > 0)
			{
				for (var i:uint = 0; i < dTriggers.length; i++)
				{
					var aTrigger:Array = dTriggers[i];
					
					if (aTrigger.length == 2) createTrigger(aTrigger[0], aTrigger[1]);
					else if (aTrigger.length == 3) createTrigger(aTrigger[0], aTrigger[1], aTrigger[2]);	
				}
			}
		}
		
		private function createTrigger(trigger:uint, value:Number, op:uint = OP_MUL):void
		{
			var o:Object = new Object();
			o.triggerOn = trigger;
			o.triggerValue = value;
			o.triggerOp = op;
			
			if (hasTriggerFor(trigger))
			{
				_triggers[triggerIndexFor(trigger)] = o;
			}
			else
			{
				_triggers.push(o);
			}
		}
		
		public function hasTriggerFor(trigger:uint):Boolean
		{
			if (triggerIndexFor(trigger) == -1) return false;
			return true;
		}
		
		private function triggerIndexFor(trigger:uint):uint
		{
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				if (_triggers[i].triggerOn == trigger) return i;
			}
			return -1;
		}
		
		public function getSaveObject():Object
		{
			var d:Object = { };
			
			d.classInstance = getQualifiedClassName(this);
			
			d.thisFlag = _thisFlag;
			d.triggers = [];
			
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				var dd:Object = { };
				dd.triggerOn = _triggers[i].triggerOn;
				dd.triggerValue = _triggers[i].triggerValue;
				dd.triggerOp = _triggers[i].triggerOp;
				d.triggers.push(dd);
			}
			
			return d;
		}
		
		public function loadSaveObject(d:Object):void
		{
			_thisFlag = d.thisFlag;
			_triggers = [];
			
			for (var i:uint = 0; i < d.triggers.length; i++)
			{
				var dd:Object = { };
				dd.triggerOn = d.triggers[i].triggerOn;
				dd.triggerValue = d.triggers[i].triggerValue;
				dd.triggerOp = d.triggers[i].triggerOp;
				_triggers.push(dd);
			}
		}
		
		public function makeCopy():*
		{
			var ndf:DamageFlag = new DamageFlag();
			ndf.loadSaveObject(this.getSaveObject());
			return ndf;
		}
		
	}

}