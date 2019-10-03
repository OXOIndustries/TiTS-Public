package classes.GameData.Pregnancy 
{
	import classes.Creature;
	import classes.Engine.Utility.rand;
	import classes.GLOBAL;
	import classes.PregnancyData;
	import classes.kGAMECLASS;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Containers.Genders;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class BasePregnancyHandler 
	{
		protected var _debugTrace:Boolean;
		public function get debugTrace():Boolean { return _debugTrace; }
		
		protected var _handlesType:String;
		public function get handlesType():String { return _handlesType; }
		
		protected var _basePregnancyIncubationTime:int;
		public function get basePregnancyIncubationTime():int { return _basePregnancyIncubationTime; }
		
		protected var _basePregnancyChance:Number;
		public function get basePregnancyChance():Number { return _basePregnancyChance; }
		
		protected var _definedAverageLoadSize:Number;
		public function get definedAverageLoadSize():Number { return _definedAverageLoadSize; }
		
		protected var _alwaysImpregnate:Boolean;
		public function get alwaysImpregnate():Boolean { return _alwaysImpregnate; }
		
		protected var _ignoreInfertility:Boolean;
		public function get ignoreInfertility():Boolean { return _ignoreInfertility; }
		
		protected var _ignoreFatherInfertility:Boolean;
		public function get ignoreFatherInfertility():Boolean { return _ignoreFatherInfertility; }
		
		protected var _ignoreMotherInfertility:Boolean;
		public function get ignoreMotherInfertility():Boolean { return _ignoreMotherInfertility; }
		
		protected var _allowMultiplePregnancies:Boolean;
		public function get allowMultiplePregnancies():Boolean { return _allowMultiplePregnancies; }
		
		protected var _canImpregnateButt:Boolean;
		public function get canImpregnateButt():Boolean { return _canImpregnateButt; }
		
		protected var _canImpregnateVagina:Boolean;
		public function get canImpregnateVagina():Boolean { return _canImpregnateVagina; }
		
		protected var _canFertilizeEggs:Boolean;
		public function get canFertilizeEggs():Boolean { return _canFertilizeEggs; }
		
		protected var _pregnancyQuantityMinimum:int;
		public function get pregnancyQuantityMinimum():int { return _pregnancyQuantityMinimum; }
		
		protected var _pregnancyQuantityMaximum:int;
		public function get pregnancyQuantityMaximum():int { return _pregnancyQuantityMaximum; }
		
		protected var _pregnancyChildType:uint;
		public function get pregnancyChildType():uint { return _pregnancyChildType; }
		
		protected var _pregnancyChildRace:uint;
		public function get pregnancyChildRace():uint { return _pregnancyChildRace; }
		
		protected var _childMaturationMultiplier:Number;
		public function get childMaturationMultiplier():Number { return _childMaturationMultiplier; }
		
		protected var _childGenderWeights:Genders;
		public function get childGenderWeights():Genders { return new Genders(_childGenderWeights); }
		
		public function BasePregnancyHandler() 
		{
			_debugTrace = false;
			
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
			_definedAverageLoadSize = 250;
			_pregnancyChildType = GLOBAL.CHILD_TYPE_LIVE;
			_pregnancyChildRace = GLOBAL.TYPE_HUMAN;
			_childMaturationMultiplier = 1.0;
			_childGenderWeights = new Genders();
			_childGenderWeights.Male = 50;
			_childGenderWeights.Female = 50;
			
			_stageProgressions = new Array();
			
			// Default event handlers
			_onTryImpregnate = BasePregnancyHandler.defaultOnTryImpregnate;
			_onSuccessfulImpregnation = BasePregnancyHandler.defaultOnSuccessfulImpregnation;
			_onSuccessfulImpregnationOutput = BasePregnancyHandler.defaultOnSuccessfulImpregnationOutput;
			_onFailedImpregnation = BasePregnancyHandler.defaultOnFailedImpregnation;
			_onDurationEnd = BasePregnancyHandler.defaultOnDurationEnd;
		}
		
		public function tryKnockUp(father:Creature, mother:Creature, pregSlot:int):Boolean
		{
			// Abort if there's an existing pregnancy of this type and multipreg of this type is disabled
			if (_allowMultiplePregnancies == false && mother.isPregnant())
			{
				return false;
			}
			
			if (pregSlot <= 2 && !this.canImpregnateVagina) return false;
			if (pregSlot == 3 && !this.canImpregnateButt) return false;
			
			// This may need to be reworked depending on a discussion about the actual handling of cunttail preggers
			if (pregSlot == 4)
			{
				if(this.canFertilizeEggs)
				{
					// Egg fertilization
					if (mother.hasTailOvipositor())
					{
						if (this.alwaysImpregnate || mother.fertility() > Math.floor(Math.random() * this.basePregnancyChance))
						{
							mother.fertilizeEggs("tail");
							return true;
						}
					}
				}
				return false;
			}
			
			var wasSuccessful:Boolean = false;
			if (_onTryImpregnate != null)
			{
				if (debugTrace) trace("Calling onTryImpregnate handler");
				wasSuccessful = _onTryImpregnate(father, mother, pregSlot, (this as BasePregnancyHandler));
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
					_onSuccessfulImpregnation(father, mother, pregSlot, (this as BasePregnancyHandler));
					
					if (_onSuccessfulImpregnationOutput != null) 
					{
						if (debugTrace) trace("Calling onSuccessfulImpregnationOutput handler");
						_onSuccessfulImpregnationOutput(father, mother, (this as BasePregnancyHandler));
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
					_onFailedImpregnation(father, mother, pregSlot, (this as BasePregnancyHandler));
					
					if (_onFailedImpregnationOutput != null)
					{
						if (debugTrace) trace("Calling onFailedImpregnationOutput handler");
						_onFailedImpregnationOutput(father, mother, (this as BasePregnancyHandler));
					}
					
					return wasSuccessful;
				}
			}
			else
			{
				throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onFailedImpregnation event handler.");
			}
			
			return false;
		}
		
		public function updatePregnancyStage(tarCreature:Creature, tMinutes:int, pregSlot:int):void
		{
			var pData:PregnancyData = tarCreature.pregnancyData[pregSlot];
			
			var modTDelta:int = Math.round(tMinutes * pData.pregnancyIncubationMulti);
			
			if (_debugTrace) trace("Incubation change of " + tMinutes + " * " + pData.pregnancyIncubationMulti + " = " + modTDelta);
			
			var oldInc:int = pData.pregnancyIncubation;
			var newInc:int = pData.pregnancyIncubation - modTDelta;
		
			// Catch potential repeated calls to updatePregnancyStage that could trip another onDurationEnd without having a chance to cleanup post-pregnancy data
			if (oldInc < 0) return;
			
			if (_debugTrace) trace("New incubation value = " + newInc + "(" + kGAMECLASS.prettifyMinutes(newInc) + ")");
			
			var triggeredPSPs:Array = new Array();
			
			for (var i:int = 0; i < _stageProgressions.length; i++)
			{
				var pPSP:PregnancyStageProgression = _stageProgressions[i];
				if (pPSP.triggersAtDuration < oldInc && pPSP.triggersAtDuration >= newInc) triggeredPSPs.push(pPSP);
			}
			
			for (i = 0; i < triggeredPSPs.length; i++)
			{
				if (_debugTrace) trace("Triggered StageProgression for duration index " + triggeredPSPs[i].triggersAtDuration);
				triggeredPSPs[i].execute(pregSlot);
			}
			
			pData.pregnancyIncubation = newInc;
			
			if (newInc < 0 && oldInc >= 0)
			{
				if (_debugTrace) trace("Incubation expired");
				
				pData.pregnancyIncubation = -1;
				
				if (_onDurationEnd != null)
				{
					if (debugTrace) trace("Calling onDurationEnd handler");
					_onDurationEnd(tarCreature, pregSlot, (this as BasePregnancyHandler));
				}
				else
				{
					throw new Error("BasePregnancyHandler for type " + _handlesType + " doesn't have a defined onDurationEnd event handler.");
				}
				return;
			}
			
			// Failsafe
			if(pData.pregnancyIncubation < 0) pData.pregnancyIncubation = -1;
		}
		
		// Baseline data/interaction
		protected var _onTryImpregnate:Function = BasePregnancyHandler.defaultOnTryImpregnate;
		
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
				var slotType:uint = Creature.PREGSLOT_NONE;
				
				if (thisPtr.canImpregnateButt && thisPtr.canImpregnateVagina) slotType = Creature.PREGSLOT_ANY;
				else if (thisPtr.canImpregnateVagina) slotType = Creature.PREGSLOT_VAG;
				else if (thisPtr.canImpregnateButt) slotType = Creature.PREGSLOT_ASS;
				
				pregSlot = mother.findEmptyPregnancySlot(slotType);
				
				if (pregSlot == -1)
				{
					if (thisPtr.debugTrace) trace("No valid pregnancy slots available, aborting.");
					return false;
				}
				
				if (thisPtr.debugTrace) trace("Autosetting pregnancy to slot " + pregSlot);
			}
			
			// Fail if the targetted hole is already pregnant
			if ((mother.pregnancyData[pregSlot] as PregnancyData).pregnancyType != "")
			{
				return false;
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
				// Sterility Ommissions
				if (virility <= 0 || fertility <= 0) return false;
				
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
				
				if (roll < iTotalChance)
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
		
		protected var _onSuccessfulImpregnation:Function;
		/**
		 * onSuccessfulImpregnation should be where all of the side-effects from an initial impregnation attempt should happen.
		 * This seperates the code handling the chance calculations from the changes that need to be made to the Creature objects.
		 * 
		 * Replacement onSuccessfulImpregnation handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		 */
		public function set onSuccessfulImpregnation(v:Function):void { _onSuccessfulImpregnation = v; }
		public function get onSuccessfulImpregnation():Function { return _onSuccessfulImpregnation; }
		public static function defaultOnSuccessfulImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler, qtyEdit:Array = null):void
		{
			if (thisPtr.debugTrace) trace("defaultOnSuccessfulImpregnation handler called");
			
			// Setup the pregnancy data for the Mother
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			pData.pregnancyType = thisPtr.handlesType;
			if (thisPtr.debugTrace) trace("Knocking up " + mother.short + " with pregnancy type " + pData.pregnancyType);
			
			pData.pregnancyIncubationMulti = (mother.pregnancyIncubationBonusMother() + father.pregnancyIncubationBonusFather()) / 2.0;
			if (thisPtr.debugTrace) trace("Calculated incubation acceleration multi as " + pData.pregnancyIncubationMulti);
			
			pData.pregnancyIncubation = thisPtr.basePregnancyIncubationTime;
			if (thisPtr.debugTrace) trace("Total incubation time as " + pData.pregnancyIncubation);
			
			// Define limits
			var quantityMin:int = thisPtr.pregnancyQuantityMinimum;
			var quantityMax:int = thisPtr.pregnancyQuantityMaximum;
			
			// Limit bonuses
			var qtyMultOverride:Number = 1;
			if (mother.perkv2("Broodmother") > 1) qtyMultOverride *= mother.perkv2("Broodmother");
			if (qtyMultOverride > 1) quantityMax = Math.max(quantityMax, Math.round(quantityMax * qtyMultOverride));
			
			// Calculate the *number* of "children", if applicable
			var quantity:int = rand(quantityMax + 1);
			if (quantity < quantityMin) quantity = quantityMin;
			
			// qtyEdit is Array used to override the children calculations
			// 0: Applies extra multiplier to quantityMax (after fertility calculation).
			// 1: Minimum fertility threshold before adding extra children.
			// 2: Increment to count through fertility loop.
			if (qtyEdit != null && qtyEdit.length > 2)
			{
				var limit:Number = Math.min(qtyEdit[1], 100);
				var inc:Number = Math.max(qtyEdit[2], 0.1);
				var cnt:Number = 0;
				
				// Always start with the minimum amount of children.
				quantity = quantityMin;
				
				// Unnaturally fertile mothers may get multiple children.
				for(var i:Number = mother.fertility(); i >= limit; i -= inc)
				{
					quantity += rand((quantityMax - quantityMin) + 1);
					// To prevent overloop crashes.
					cnt++;
					if (cnt >= 100) break;
				}
			}
			if (qtyEdit != null && qtyEdit.length > 0 && qtyEdit[0] > 1) quantityMax = Math.round(quantityMax * qtyEdit[0]);
			
			// Quantity bonuses
			var fatherBonus:int = Math.round((father.cumQ() * 2) / thisPtr.definedAverageLoadSize);
			var motherBonus:int = Math.round((quantity * mother.pregnancyMultiplier()) - quantity);
			
			quantity += fatherBonus + motherBonus;
			
			if (quantity < quantityMin) quantity = quantityMin;
			if (quantity > quantityMax) quantity = quantityMax;
			
			pData.pregnancyQuantity = quantity;
		}
		
		protected var _onSuccessfulImpregnationOutput:Function;
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
		public static function defaultOnSuccessfulImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("defaultOnSuccessfulImpregnationOutput handler called");
		}
		
		protected var _onFailedImpregnation:Function;
		/**
		 * onFailedImpregnantion should be where all of the side-effects from a failed initial impregnation attempt should happen.
		 * This seperates the code handling the chance calculations from the changes that need to be made to the Creature objects.
		 * 
		 * Replacement onFailedImpregnation handlers should use the following function signature:
		 * method(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		 */
		public function set onFailedImpregnation(v:Function):void { _onFailedImpregnation = v; }
		public function get onFailedImpregnation():Function { return _onFailedImpregnation; }
		public static function defaultOnFailedImpregnation(father:Creature, mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("defaultOnFailedImpregnation handler called");
			
			father.orgasm();
			mother.orgasm();
		}
		
		protected var _onFailedImpregnationOutput:Function;
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
		public function get onFailedImpregnationOutput():Function { return _onFailedImpregnationOutput; }
		public static function defaultOnFailedImpregnationOutput(father:Creature, mother:Creature, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("defaultOnFailedImpregnationOutput handler called");
		}
		
		protected var _onDurationEnd:Function;
		/**
		 * Replacement onDurationEnd handlers should use the following function signature:
		 * method(mother:Creature, thisPtr:BasePregnancyHandler):void
		 */
		public function set onDurationEnd(v:Function):void { _onDurationEnd = v; }
		public function get onDurationEnd():Function { return _onDurationEnd; }
		public static function defaultOnDurationEnd(mother:Creature, pregSlot:int, thisPtr:BasePregnancyHandler):void
		{
			if (thisPtr.debugTrace) trace("defaultOnDurationEnd handler called");
			
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			ChildManager.addChild(
				Child.NewChildWeights(
					thisPtr.pregnancyChildRace, 
					thisPtr.childMaturationMultiplier, 
					pData.pregnancyQuantity, 
					thisPtr.childGenderWeights
				)
			);
			
			pData.reset();
		}
		
		protected var _stageProgressions:Array;
		
		public function addStageProgression(... args):void
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
						
						if (args.length > 2 && args[cIndex + 2] is Boolean) psp.useSlotArgument = args[cIndex + 2];
						
						_stageProgressions.push(psp);
						cIndex += 3;
					}
					else
					{
						throw new Error("Incorrect initilization of a PregnancyStageProgression.");
					}
				}
			}
			
			_stageProgressions.sortOn("triggersAtDuration", Array.NUMERIC | Array.DESCENDING);
		}
		
		/**
		 * This is just the basic fragment used when a specialised handler doesn't have its own override for the fragment return.
		 * We'll just look at the overall bellyRating() and return something generic.
		 * We need to figure out some kind of scale for the rating value, so that there can be some sense
		 * of relative scale for different pregnancies.
		 * 
		 * We're passing the target and slot in so that specialised handlers know what to look for to
		 * grab more relevant data with which they can generate their return values.
		 * @param	target
		 * @param	slot
		 * @return
		 */
		public function pregBellyFragment(target:Creature, slot:int):String
		{
			if (target.bellyRating() <= 20)
			{
				return "Your belly is larger than it used to be.";
			}
			else if (target.bellyRating() <= 40)
			{
				return "Your belly is more noticably distended. You are probably pregnant.";
			}
			else if (target.bellyRating() <= 60)
			{
				return "The unmistakable bulge of pregnancy is visible in your tummy.";
			}
			else if (target.bellyRating() <= 80)
			{
				return "Your belly is obviously pregnant to anyone who looks at you.";
			}
			else if (target.bellyRating() <= 100)
			{
				return "It would be impossible to conceal your growing pregnancy from anyone who glanced your way.";
			}
			else if (target.bellyRating() <= 120)
			{
				return "Your stomach is painfully distended by your pregnancy, making it difficult to walk normally.";
			}
			else
			{
				return "Your belly protrudes unnaturally far forward, the sheer size of it making movement difficult.";
			}
		}
		
		/**
		 * Return the remaining duration for a given pregnancy slot. This is exposed as a method on each pregnancy handler to
		 * ensure we can handle "odd" pregnancies such as the venus pitcher seeds effectively resetting the duration multiple times.
		 * @param	target
		 * @param	pregSlot
		 * @return
		 */
		public function getRemainingDuration(target:Creature, pregSlot:int):int
		{
			var pData:PregnancyData = target.pregnancyData[pregSlot];
			
			return Math.round(pData.pregnancyIncubation / pData.pregnancyIncubationMulti) + 1; // Ensure we never end up in a fractional-less-than-one state to 0
		}
		
		public function nurseryEndPregnancy(mother:Creature, pregSlot:int, useBirthTimestamp:uint):Child
		{
			var pData:PregnancyData = mother.pregnancyData[pregSlot];
			
			var c:Child = Child.NewChildWeights(pregnancyChildRace, childMaturationMultiplier, pData.pregnancyQuantity, childGenderWeights);
			c.BornTimestamp = useBirthTimestamp;
			ChildManager.addChild(c);
			
			mother.bellyRatingMod -= pData.pregnancyBellyRatingContribution;
			
			pData.reset();
			
			return c;
		}
	}
}