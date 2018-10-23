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
		public static const ENERGY_WEAPON:uint	= 13;
		public static const GROUNDED:uint		= 14;
		public static const BYPASS_SHIELD:uint	= 15;	// An attack with this flag will only influence HP and/or lust
		public static const ONLY_SHIELD:uint	= 16;	// An attack with this flag will only influence shields and/or lust
		public static const EASY:uint 			= 17;	// Basically adds an extra 50% resistance up to a maximum of 100% resistance to any given type.
		public static const CHANCE_APPLY_BURN:uint = 18;
		public static const DRAINING:uint 		= 19; //Steals half of shield damage dealt
		public static const GREATER_DRAINING:uint = 20; //Steals 90% of shield damage dealt
		public static const VAMPIRIC:uint 		= 21; //Steals 50% of HP damage dealt.
		public static const GREATER_VAMPIRIC:uint = 22; //Steals 90% of HP damage dealt
		public static const CRYSTALGOOARMOR:uint = 23;
		public static const SYDIANARMOR:uint = 24;
		public static const CHANCE_APPLY_STUN:uint = 25;
		public static const NO_CRIT:uint		= 26;
		public static const BOTHRIOCARMOR:uint = 27;
		
		public static const FlagNames:Array = [];
		
		// Static init -- I think this might be the 'safest' way to map keys -> values statically
		// Trying to use the variables as object keys will use the key /text/ rather than the variable value (ie PENETRATING -> 'PENETRATING' rather than 1)
		{
			FlagNames[PENETRATING] 			= "Penetrating";
			FlagNames[ABLATIVE] 			= "Ablative";
			FlagNames[PLATED] 				= "Plated";
			FlagNames[CRUSHING] 			= "Crushing";
			FlagNames[BULLET] 				= "Bullet";
			FlagNames[LASER] 				= "Laser";
			FlagNames[MIRRORED] 			= "Mirrored";
			FlagNames[CRYSTAL] 				= "Crystal";
			FlagNames[PSIONIC] 				= "Psionic";
			FlagNames[NULLIFYING] 			= "Nullifying";
			FlagNames[AMPLIFYING] 			= "Amplifying";
			FlagNames[EXPLOSIVE] 			= "Explosive";
			FlagNames[ENERGY_WEAPON] 		= "Energy Weaponry";
			FlagNames[GROUNDED]				= "Grounded";
			FlagNames[BYPASS_SHIELD] 		= "Shield Bypass";
			FlagNames[ONLY_SHIELD] 			= "Targets Shield";
			FlagNames[EASY] 				= "Easy";
			FlagNames[CHANCE_APPLY_BURN]	= "Burn DoT Chance";
			FlagNames[DRAINING] 			= "Draining";
			FlagNames[GREATER_DRAINING] 	= "Greater Draining";
			FlagNames[VAMPIRIC] 			= "Vampiric";
			FlagNames[GREATER_VAMPIRIC] 	= "Greater Vampiric";
			FlagNames[CRYSTALGOOARMOR]		= "Crystal Goo Armor";
			FlagNames[SYDIANARMOR]			= "Sydian Armor";
			FlagNames[CHANCE_APPLY_STUN]	= "Stun Chance";
			FlagNames[NO_CRIT]				= "Cannot Crit";
		}
		
		private var _thisFlag:uint;
		private var _triggers:Array;
		
		public function get flag():uint { return _thisFlag; }
		public function get short():String { return FlagNames[_thisFlag]; }
		
		/**
		 * new DamageFlag(ABLATIVE, [PENETRATING, 0.75], [CRUSHING, 1.25], [BULLET, 0.8]);
		 * @param	dFlag
		 * @param	... dTriggers
		 */
		public function DamageFlag(dFlag:uint = UNSET, ... dTriggers) 
		{
			_triggers = [];
			
			// Allow creation for later overwrite by serialised data
			if (dFlag == UNSET)
			{
				_thisFlag = UNSET;
			}
			// Build defaults based on supplied flag.
			else if (dFlag != UNSET && (dTriggers == null || dTriggers.length == 0))
			{
				// Try and create the default values if none were specified
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
						createTrigger(BULLET, 1.3);
						break;
					
					case CRYSTAL:
						createTrigger(LASER, 0.6);
						createTrigger(EXPLOSIVE, 1.25);
						break;
						
					case NULLIFYING:
						createTrigger(PSIONIC, 0.75);
						break;
						
					case AMPLIFYING:
						createTrigger(PSIONIC, 1.25);
						break;
				}
				
				// Fallback
				if (_thisFlag == UNSET) _thisFlag = dFlag;
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
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				if (_triggers[i].triggerOn == trigger) return true;
			}
			
			return false;
		}
		
		private function triggerIndexFor(trigger:uint):uint
		{
			for (var i:uint = 0; i < _triggers.length; i++)
			{
				if (_triggers[i].triggerOn == trigger) return i;
			}
			throw new Error("Couldn't find index for " + trigger + ". Check it's present first!");
			return uint.MAX_VALUE;
		}
		
		public function getTriggerOp(trigger:uint):uint
		{
			return _triggers[triggerIndexFor(trigger)].triggerOp;
		}
		
		public function getTriggerValue(trigger:uint):Number
		{
			return _triggers[triggerIndexFor(trigger)].triggerValue;
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
