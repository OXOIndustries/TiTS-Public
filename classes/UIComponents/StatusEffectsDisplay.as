package classes.UIComponents 
{
	import classes.UIComponents.StatusEffectComponents.StatusEffectElement;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.utils.getDefinitionByName;
	/**
	 * ...
	 * @author Gedan
	 */
	public class StatusEffectsDisplay extends Sprite
	{
		private var _targetX:int = 0;
		private var _targetY:int = 0;
		private var _targetWidth:int = 0;
		private var _targetHeight:int = 0;
		
		private var _padding:int = 0;
		private var _paddingTop:int = 0;
		private var _paddingRight:int = 0;
		private var _paddingBottom:int = 0;
		private var _paddingLeft:int = 0;
		
		private var _margin:int = 0;
		
		private var _childSizeX:int = 20;
		private var _childSizeY:int = 20;
		private var _childSpacing:int = 2;
		
		public function get targetX():int { return _targetX; }
		public function get targetY():int { return _targetY; }
		public function get targetWidth():int { return _targetWidth; }
		public function get targetHeight():int { return _targetHeight; }
		public function get padding():int { return _padding; }
		public function get paddingTop():int { return _paddingTop; }
		public function get paddingRight():int { return _paddingRight; }
		public function get paddingBottom():int { return _paddingBottom; }
		public function get paddingLeft():int { return _paddingLeft; }
		public function get margin():int { return _margin; }
		
		
		public function get childSizeX():int { return _childSizeX; }
		public function get childSizeY():int { return _childSizeY; }
		public function get childSpacing():int { return _childSpacing; }
		
		public function set targetX(v:int):void { _targetX = v; }
		public function set targetY(v:int):void { _targetY = v; }
		public function set targetWidth(v:int):void { _targetWidth = v; }
		public function set targetHeight(v:int):void { _targetHeight = v; }
		public function set padding(v:int):void { _padding = v; _paddingRight = v; _paddingBottom = v; _paddingLeft = v; _paddingTop = v; }
		public function set paddingLeft(v:int):void { _paddingLeft = v; }
		public function set paddingBottom(v:int):void { _paddingBottom = v; }
		public function set paddingRight(v:int):void { _paddingRight = v; }
		public function set paddingTop(v:int):void { _paddingTop = v; }
		public function set margin(v:int):void { _margin = v; }
		
		public function set childSizeX(v:int):void { _childSizeX = v; }
		public function set childSizeY(v:int):void { _childSizeY = v; }
		public function set childSpacing(v:int):void { _childSpacing = v; }
		
		private var _childElements:Vector.<StatusEffectElement>;
		private var _workElems:Vector.<StatusEffectElement>
		
		private var _benefitTransform:ColorTransform;
		private var _penaltyTransform:ColorTransform;
		private var _debugTransform:ColorTransform;
		
		[Embed(source = "../../assets/icons/statuseffects/blocked.svg", mimeType = "image/svg")]
		private static var Icon_Missing:Class;
		
		public function StatusEffectsDisplay() 
		{
			_benefitTransform = new ColorTransform();
			_benefitTransform.color = UIStyleSettings.gStatusGoodColour;
			
			_penaltyTransform = new ColorTransform();
			_penaltyTransform.color = UIStyleSettings.gStatusBadColour;
			
			_debugTransform = new ColorTransform();
			_penaltyTransform.color = UIStyleSettings.gTheColourOfDebug;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			if (this.targetHeight == 0) this.targetHeight = this.parent.height - this.targetY;
			if (this.targetWidth == 0) this.targetWidth = this.parent.width - this.targetX;
			
			this.BuildContainer();
			
			trace("StatusEffect Display Constructed!");
		}
		
		private function BuildContainer()
		{
			// Position within the parent
			this.x = _targetX + this.paddingLeft;
			this.y = _targetY + this.paddingTop;
			
			_childElements = new Vector.<StatusEffectElement>();
			_workElems = new Vector.<StatusEffectElement>();
		}
		
		/**
		 * Create a new child and push it into the storage array
		 * @param	iconClass
		 */
		private function BuildNewChild(effectName:String, iconClass:String):StatusEffectElement
		{
			var iconT:Class;

			// Try to get the classdef for the given icon class string
			try
			{
				iconT = (getDefinitionByName(iconClass) as Class);
			}
			catch (e:ReferenceError) // If it doesn't exist, use the fallback/missing icon
			{
				iconT = Icon_Missing;
			}
			
			return new StatusEffectElement(35, 35, effectName, new iconT());
		}

		/**
		 * Apply the sort methods to the storage array; the statusEffects array in Creatures is... I think
		 * kept alphabetically, but given the splicing and expiring that is going to happen here, using that
		 * as reference here will be problematic. Plus, options to display the effects in a different order;
		 * we can simply swap out which underlying sort method is applied to achieve the effect.
		 */
		private function SortChildren():void
		{
			if (_childElements.length >= 15)
			{
				_workElems = _workElems.concat(_childElements.splice(15, (_childElements.length - 15)));
			}
			
			_childElements.sort(vectSortMethod);
		}
		
		/**
		 * Sort method applied by the vector<T>.sort() method
		 * @param	elemA
		 * @param	elemB
		 * @return
		 */
		private function vectSortMethod(elemA:StatusEffectElement, elemB:StatusEffectElement):int
		{
			if (elemA.name < elemB.name)
			{
				return -1;
			}
			
			if (elemA.name > elemB.name)
			{
				return 1;
			}
			
			return 0;
		}
		
		/**
		 * I'm going to be a shit and just not display > 15 elements right now (3 rows of 5). They'll be shifted to some large value of X
		 */
		private function RepositionChildren():void
		{
			if (_childElements.length > 0)
			{
				for (var elem:int = 0; elem < _childElements.length; elem++)			
				{
					_childElements[elem].x = Math.floor((elem % 5) * (35 + childSpacing));
					_childElements[elem].y = Math.floor((Math.floor(elem / 5)) * (35 + childSpacing));
					if (_childElements[elem].parent == null) this.addChild(_childElements[elem]);
					
					trace("Moving effect icon for '" + _childElements[elem].name + "' to (" + _childElements[elem].x + "," + _childElements[elem].y + ")");
				}
			}
			
			if (_workElems.length > 0)
			{
				for (var elem:int = 0; elem < _workElems.length; elem++)
				{
					if (_workElems[elem].parent != null) this.removeChild(_workElems[elem]);
				}
			}
		}
		
		private function RemoveExpiredChildren():void
		{
			while (_workElems.length > 0)
			{
				this.removeChild(_workElems.pop());
			}
		}
		
		public function updateDisplay(statusEffects:Array):void
		{
			_workElems = _workElems.concat(_childElements);
			_childElements.splice(0, _childElements.length);
			
			for (var seElem:int = 0; seElem < statusEffects.length; seElem++)
			{
				// If this ends up being slow, I'll fix it later. It shouldn't be TOO bad considering
				// the total number of effects we're liable to be displaying.
				if (statusEffects[seElem].hidden != true && statusEffects[seElem].iconName.length > 0)
				{
					var gotMatch:Boolean = false;
					
					if (_workElems.length > 0)
					{
						for (var vecElem:int = 0; vecElem < _workElems.length; vecElem++)
						{
							if (_workElems[vecElem].name == statusEffects[seElem].storageName.toLowerCase())
							{
								_childElements = _childElements.concat(_workElems.splice(vecElem, 1));
								gotMatch = true;
							}
						}
					}
				
					// No match? new effect
					if (!gotMatch)
					{
						_childElements.push(this.BuildNewChild(statusEffects[seElem].storageName.toLowerCase(), statusEffects[seElem].iconName));
					}
				}
			}
			
			// Remove expired -- All elements remaining in _workElems should be expired effects
			this.RemoveExpiredChildren();
			
			// Sort containers -- Now we can repurpose _workElems to hold any effect > 15
			this.SortChildren();
			
			// Reposition children
			this.RepositionChildren();
		}
		
		public function clearGlo():void
		{
			// Stub
		}
		
	}

}