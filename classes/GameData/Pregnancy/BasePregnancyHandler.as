package classes.GameData.Pregnancy 
{
	import classes.Creature;
	import classes.rand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class BasePregnancyHandler 
	{
		private var _debugTrace:Boolean;
		public function debugTrace():Boolean { return _debugTrace; }
		
		private var _handlesType:String;
		public function get handlesType():String { return _handlesType; }
		
		private var _basePregnancyIncubationTime:int;
		public function get basePregnancyIncubationTime():int { return _basePregnancyIncubationTime; }
		
		private var _basePregnancyChance:Number;
		public function get basePregnancyChance():Number { return _basePregnancyChance; }
		
		private var _definedAverageLoadSize:Number;
		public function get definedAverageLoadSize():Number { return _definedAverageLoadSize; }
		
		private var _alwaysImpregnate:Boolean;
		public function get alwaysImpregnate():Boolean { return _alwaysImpregnate; }
		
		private var _ignoreInfertility:Boolean;
		public function get ignoreInfertility():Boolean { return _ignoreInfertility; }
		
		private var _ignoreFatherInfertility:Boolean;
		public function get ignoreFatherInfertility():Boolean { return _ignoreFatherInfertility; }
		
		private var _ignoreMotherInfertility:Boolean;
		public function get ignoreMotherInfertility():Boolean { return _ignoreMotherInfertility; }
		
		private var _allowMultiplePregnancies:Boolean;
		public function get allowMultiplePregnancies():Boolean { return _allowMultiplePregnancies; }
		
		private var _canImpregnateButt:Boolean;
		public function get canImpregnateButt():Boolean { return _canImpregnateButt; }
		
		private var _canImpregnateVagina:Boolean;
		public function get canImpregnateVagina():Boolean { return _canImpregnateVagina; }
		
		private var _canFertilizeEggs:Boolean;
		public function get canFertilizeEggs():Boolean { return _canFertilizeEggs; }
		
		private var _pregnancyQuantityMinimum:int;
		public function get pregnancyQuantityMinimum():int { return _pregnancyQuantityMinimum; }
		
		private var _pregnancyQuantityMaximum:int;
		public function get pregnancyQuantityMaximum():int { return _pregnancyQuantityMaximum; }
		
		public function BasePregnancyHandler() 
		{
			_handlesType = "";
			_basePregnancyIncubationTime = -1;
			_basePregnancyChance = -1;
			_alwaysImpregnate = false;
			_ignoreInfertility = false;
			_ignoreFatherInfertility = false;
			_ignoreMotherInfertility = false;
			_allowMultiplePregnancies = true;
			_canImpregnateButt = false;
			_canImpregnateVagina = true;
			_canFertilizeEggs = true;
			_pregnancyQuantityMinimum = 1;
			_pregnancyQuantityMaximum = 1;
			
			// Default event handlers
			_onTryImpregnate = BasePregnancyHandler.defaultOnTryImpregnate;
			_onSuccessfulImpregnation = BasePregnancyHandler.defaultOnSuccessfulImpregnation;
			_onSuccessfulImpregnationOutput = BasePregnancyHandler.defaultOnSuccessfulImpregnationOutput;
			_onFailedImpregnation = BasePregnancyHandler.defaultOnFailedImpregnation;
			_onDurationEnd = BasePregnancyHandler.defaultOnDurationEnd;
		}
		
		public function tryKnockUp(father:Creature, mother:Creature, pregSlot:int):Boolean
		{
			var wasSuccessful:Boolean = false;
			if (_onTryImpregnate != null)
			{
				if (debugTrace) trace("Calling onTryImpregnate handler");
				wasSuccessful = _onTryImpregnate(father, mother, pregSlot, this);
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onTryImpregnate event handler.");
			}
			
			if (_onSuccessfulImpregnation != null)
			{
				if (wasSuccessful)
				{
					if (debugTrace) trace("Calling onSuccessfulImpregnation handler");
					_onSuccessfulImpregnation(father, mother, pregSlot, this);
					
					if (_onSuccessfulImpregnationOutput != null) 
					{
						if (debugTrace) trace("Calling onSuccessfulImpregnationOutput handler");
						_onSuccessfulImpregnationOutput(father, mother, this);
					}
					
					return wasSuccessful;
				}
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onSuccessfulImpregnation event handler.");
			}
			
			if (_onFailedImpregnation != null)
			{
				if (!wasSuccessful)
				{
					if (debugTrace) trace("Calling onFailedImpregnation handler");
					_onFailedImpregnation(father, mother, pregSlot, this);
					
					if (_onFailedImpregnationOutput != null)
					{
						if (debugTrace) trace("Calling onFailedImpregnationOutput handler");
						_onFailedImpregnationOutput(father, mother, this);
					}
					
					return wasSuccessful;
				}
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onFailedImpregnation event handler.");
			}
		}
		
		public function updatePregnancyStage(tarCreature:Creature, tMinutes:int):void
		{
			
		}
		
		// Baseline data/interaction
		private var _onTryImpregnate:Function = BasePregnancyHandler.defaultOnTryImpregnate;
		
		/**
		 * onTryImpregnate should be purely used to calculate the a pass/fail true/false success/fail impregnation chance. Any side-effects should
		 * be reserved for within the onSuccessfulImpregnation and onFailedImpregnation handlers.
		 * 
		 * Replacement onTryImpregnate handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):Boolean
		 * 
		 * thisPtr is present so that methods can be defined outside of the class structure, but rely on properties/utility methods therein.
		 */
		public function set onTryImpregnate(v:Function):void { _onTryImpregnate = v; }
		public static function defaultOnTryImpregnate(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):Boolean
		{
			if (thisPtr.debugTrace) trace("defaultOnTryImpregnate handler called");
			
			// Check if we have a valid pregnancy slot defined
			if (pregSlot == -1)
			{
				// Find the first available pregnancy slot on the mother, else return a failure
				pregSlot = mother.findEmptyPregnancySlot();
				
				if (pregSlot == -1) return false;
			}
			
			// Process various ignore values
			var virility:Number = father.virility();
			var fertility:Number = mother.fertility();
			
			if (thisPtr.ignoreInfertility)
			{
				if (thisPtr.debugTrace) trace("Ignoring infertility.");
				
				if (virility == 0) virility = 1;
				if (fertility == 0) fertility = 1;
			}
			
			if (thisPtr.ignoreMotherInfertility)
			{
				if (thisPtr.debugTrace) trace("Ignoring mother infertility.");
				
				if (fertility == 0) fertility = 1;
			}
			
			if (thisPtr.ignoreFatherInfertility)
			{
				if (thisPtr.debugTrace) trace("Ignoring father infertility.");
				
				if (virility == 0) virility = 1;
			}
			
			// Calculate chances
			var pregChanceSuccessful:Boolean = false;
			var totalChance:Number;
			
			if (thisPtr.alwaysImpregnate == true)
			{
				if (thisPtr.debugTrace) trace("Bypassing chance rolls");
				
				pregChanceSuccessful = true;
			}
			else
			{
				totalChance = (virility + fertility) / 2;
				if (thisPtr.debugTrace) trace("Mother + Father Fertility chance bonus multi = " + totalChance);
				
				// Pull out cumQ modifier so it can be limited
				var cumQContrubtion:Number = father.cumQ() / thisPtr.definedAverageLoadSize;
				
				if (cumQContrubtion < 0.5) cumQContrubtion = 0.5;
				if (cumQContrubtion > 2) cumQContrubtion = 2;
				if (thisPtr.debugTrace) trace("CumQ Chance Contribution to chance multi = " + cumQContrubtion);
				
				totalChance += cumQContrubtion;
				totalChance /= 2;
				
				totalChance *= thisPtr.basePregnancyChance;
				if (thisPtr.debugTrace) trace("Total Pregnancy Chance = " + totalChance );
				
				var iTotalChance:int = Math.round(100 * totalChance);
				var roll:int = rand(100);
				if (thisPtr.debugTrace) trace("Total Pregnancy Chance as Int = " + iTotalChance);
				if (thisPtr.debugTrace) trace("Rolled " + roll);
				
				if (roll > iTotalChance)
				{
					if (thisPtr.debugTrace) trace("Preggo Confirmed!");
					pregChanceSuccessful = true;
				}
				else
				{
					if (thisPtr.debugTrace) trace("Preggo Failed!");
					pregChanceSuccessful = false;
				}
			}
		
			return pregChanceSuccessful;
		}
		
		private var _onSuccessfulImpregnation:Function;
		/**
		 * onSuccessfulImpregnation should be where all of the side-effects from an initial impregnation attempt should happen.
		 * This seperates the code handling the chance calculations from the changes that need to be made to the Creature objects.
		 * 
		 * Replacement onSuccessfulImpregnation handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		 */
		public function set onSuccessfulImpregnation(v:Function):void { _onSuccessfulImpregnation = v; }
		public function get onSuccessfulImpregnation():Function { return _onSuccessfulImpregnation; }
		protected static function defaultOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("defaultOnSuccessfulImpregnation handler called");
			
			// Setup the pregnancy data for the Mother
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			pData.pregnancyType = thisPtr.handlesType;
			if (thisPtr.debugTrace) trace("Knocking up " + mother.short + " with pregnancy type " + pData.pregnancyType);
			
			pData.pregnancyIncubationMulti = mother.pregnancyIncubationBonusMother() + father.pregnancyIncubationBonusFather() / 2.0;
			if (thisPtr.debugTrace) trace("Calculated incubation acceleration multi as " + pData.pregnancyIncubationMulti);
			
			pData.pregnancyIncubation = thisPtr.basePregnancyIncubationTime * pData.pregnancyIncubationMulti;
			if (thisPtr.debugTrace) trace("Calculated total incubation time as " + pData.pregnancyIncubation);
			
			// Calculate the *number* of "children", if applicable
			var quantity:Number = rand(thisPtr.pregnancyQuantityMaximum + 1);
			if (quantity < thisPtr.pregnancyQuantityMinimum) quantity = thisPtr.pregnancyQuantityMinimum;
			
			var fatherBonus:int = Math.round((father.cumQ() * 2) / thisPtr.definedAverageLoadSize);
			var motherBonus:int = Math.round((quantity * mother.pregnancyMultiplier()) - quantity);
			
			quantity += fatherBonus + motherBonus;
			
			if (quantity > thisPtr.pregnancyQuantityMaximum) quantity = thisPtr.pregnancyQuantityMaximum;
			
			pData.pregnancyQuantity = quantity;
			
			// Orgasmo
			father.orgasm();
			mother.orgasm();
		}
		
		private var _onSuccessfulImpregnationOutput:Function;
		/**
		 * onSuccessfulImpregnationOutput should be where the output message(s) are defined from the impregnation attempt.
		 * Again, this is seperated so that the generic mechanics handling can be removed from the specific text required of the pregnancy.
		 * 
		 * Considering how the defaultOnSuccessfulImpregnationOutput handler is called, the output message could be a follow-on from other scene
		 * content. Success/Failure output message handlers are totally optional however.
		 * 
		 * Replacement onSuccessfulImpregnationOutput handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		 */
		public function set onSuccessfulImpregnationOutput(v:Function):void { _onSuccessfulImpregnationOutput = v; }
		public function get onSuccessfulImpregnationOutput():Function { return _onSuccessfulImpregnationOutput; }
		protected static function defaultOnSuccessfulImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("defaultOnSuccessfulImpregnationOutput handler called");
		}
		
		private var _onFailedImpregnation:Function;
		/**
		 * onFailedImpregnantion should be where all of the side-effects from a failed initial impregnation attempt should happen.
		 * This seperates the code handling the chance calculations from the changes that need to be made to the Creature objects.
		 * 
		 * Replacement onFailedImpregnation handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		 */
		public function set onFailedImpregnation(v:Function):void { _onFailedImpregnation = v; }
		public function get onFailedImpregnation():Function { return _onFailedImpregnation; }
		protected static function defaultOnFailedImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			
		}
		
		private var _onFailedImpregnationOutput:Function;
		/**
		 * onFailedImpregnationOutput should be where the output message(s) are defined from the impregnation attempt.
		 * Again, this is seperated so that the generic mechanics handling impregnation can be removed from the specific text required of the pregnancy.
		 * 
		 * Considering how the defaultOnFailedImpregnation handler is called, the output message could be a follow-on from other scene content, injected to the trailing end of the current "screen". Success/Failure output message handlers are totally optional however.
		 * 
		 * Replacement onFailedImpregnationOutput handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		 */
		public function set onFailedImpregnationOutput(v:Function):void { _onFailedImpregnationOutput = v; }
		public function set onFailedImpregnationOutput():Function { return _onFailedImpregnationOutput; }
		protected static function defaultOnFailedImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			
		}
		
		private var _onDurationEnd:Function;
		/**
		 * Replacement onDurationEnd handlers should use the following function signature:
		 * method(mother:Creature, thisPtr:BasePregnancyHandler):void
		 */
		public function set onDurationEnd(v:Function):void { _onDurationEnd = v; }
		protected static function defaultOnDurationEnd(mother:Creature, thisPtr:BasePregnancyHandler):void
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
		
		// Some methods stripped outta creature for reference.
		public function knockUp(hole: int, type: int = 0, incubation: int = 0, beat: int = 100, arg: int = 0): void {
			//Contraceptives cancel!
			if (hasStatusEffect("Contraceptives") >= 0) return;
			//Not having an appropriate cunt cancels.			
			if (hole < 3 && !hasVagina(hole)) return;

			//LETS MAKE SOME BABIES.
			var bonus: int = 0;
			//If arg = 1 (always pregnant), bonus = 9000
			if (arg >= 1) bonus = 9000;
			if (arg <= -1) bonus = -9000;
			//If unpregnant and fertility wins out:
			if ((arg == 2 || (pregnancyIncubations[hole] == 0)) && totalFertility() + bonus > Math.floor(Math.random() * beat)) {
				pregnancyTypes[hole] = type;
				pregnancyIncubations[hole] = incubation;
				trace("PC Knocked up with pregnancy type: " + type + " for " + incubation + " incubation in hole#: " + hole + ".");
			}
			//Chance for eggs fertilization - ovi elixir and imps excluded!
			if (type != 1 && type != 5 && type != 10) {
				if (hasTailFlag(GLOBAL.OVIPOSITOR) && (tailType == GLOBAL.ARACHNID || tailType == GLOBAL.DRIDER || tailType == GLOBAL.BEE)) {
					if (totalFertility() + bonus > Math.floor(Math.random() * beat)) {
						fertilizeEggs();
					}
				}
			}
		}
		
		public function tryKnockUp(cumFrom:Creature, pregSlot:int = 0):void
		{
			// Check the sperm provider can actually knock up this hole
			if (pregSlot <= 2 && cumFrom.canImpregnateVagina || pregSlot == 3 && cumFrom.canImpregnateButt)
			{
				// If the holes not already preggers
				if (this.pregnancyIncubations[pregSlot] == 0)
				{
					// Roll the dice
					// Creature.alwaysImpregnate is replacing the old arg fiddle. I don't *really* understand what was going 
					// on with the arg paramemter, but it seems like it was being used to basically fuck the math into MASSIVELY 
					// increasing the chance to be pregnant OR make it 100%.
					if (cumFrom.alwaysImpregnate || this.totalFertility() > Math.floor(Math.random() * cumFrom.basePregnancyChance))
					{
						// Knockup go!
						this.pregnancyTypes[pregSlot] = cumFrom.impregnateType;
						this.pregnancyIncubations[pregSlot] = cumFrom.basePregnancyIncubation;
						trace(this.short + " Knocked up with pregnancy type: " + cumFrom.impregnateType + " for " + cumFrom.basePregnancyIncubation + " in hole#: " + pregSlot);
					}
				}
			}
			
			// Egg fertilization
			if (cumFrom.canFertilizeEggs)
			{
				if (this.hasTailFlag(GLOBAL.OVIPOSITOR) && (this.tailType == GLOBAL.ARACHNID || this.tailType == GLOBAL.DRIDER || this.tailType == GLOBAL.BEE))
				{
					if (cumFrom.alwaysImpregnate || this.totalFertility() > Math.floor(Math.random() * cumFrom.basePregnancyChance)) this.fertilizeEggs();
				}
			}
		}
	}
}