package classes.UIComponents.StatusEffectComponents 
{
	import classes.UIComponents.StatusEffectComponents.StatusEffectElement;
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	import classes.UIComponents.UIStyleSettings;
	import classes.Resources.StatusIcons;
	
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
		
		private var _childSizeX:int = 35;
		private var _childSizeY:int = 35;
		private var _childSpacing:int = 2;
		
		private var _tooltipSizeX:int = 350;
		private var _tooltipSizeY:int = 250;
		
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
		
		public function set tooltipSizeX(v:int):void { _tooltipSizeX = v; }
		public function set tooltipSizeY(v:int):void { _tooltipSizeY = v; }
		
		private var _childElements:Vector.<StatusEffectElement>;
		private var _workElems:Vector.<StatusEffectElement>
		
		private var _lastActiveElement:StatusEffectElement;
		private var _tooltipElement:StatusTooltipElement;
		
		private var _benefitTransform:ColorTransform;
		private var _penaltyTransform:ColorTransform;
		private var _debugTransform:ColorTransform;
		
		private var _rightAlign:Boolean;
		
		/**
		 * Class Constructor just sets up some stuff we don't need a stage reference to do properly.
		 */
		public function StatusEffectsDisplay(rightAlign:Boolean = true) 
		{
			_benefitTransform = new ColorTransform();
			_benefitTransform.color = UIStyleSettings.gStatusGoodColour;
			
			_penaltyTransform = new ColorTransform();
			_penaltyTransform.color = UIStyleSettings.gStatusBadColour;
			
			_debugTransform = new ColorTransform();
			_penaltyTransform.color = UIStyleSettings.gTheColourOfDebug;
			
			_lastActiveElement = null;
			
			_rightAlign = rightAlign;
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Lazyinit engage.
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			if (this.targetHeight == 0) this.targetHeight = this.parent.height - this.targetY;
			if (this.targetWidth == 0) this.targetWidth = this.parent.width - this.targetX;
			
			this.BuildContainer();
			this.BuildTooltipElement();
		}
		
		/**
		 * Build the base container for childelements. Right now, we're using self as the container (although that will change when I blow back through to setup glows.
		 */
		private function BuildContainer()
		{
			// Position within the parent
			this.x = _targetX + this.paddingLeft;
			this.y = _targetY + this.paddingTop;
			
			_childElements = new Vector.<StatusEffectElement>();
			_workElems = new Vector.<StatusEffectElement>();
		}
		
		/**
		 * Construct a copy of the tooltip element, and prepare it for later display.
		 */
		private function BuildTooltipElement():void
		{
			_tooltipElement = new StatusTooltipElement(StatusIcons.Icon_Missing, _tooltipSizeX, _tooltipSizeY);
			_tooltipElement.x = 5000;
			this.stage.addChild(_tooltipElement);
			this.stage.removeChild(_tooltipElement);
		}
		
		/**
		 * Create a new child and push it into the storage array
		 * @param	iconClass
		 */
		private function BuildNewChild(effectName:String, iconClass:String, tooltipText:String, durationRemaining:int):StatusEffectElement
		{
			var iconT:Class;

			if (StatusIcons[iconClass] !== undefined)
			{
				iconT = StatusIcons[iconClass];
			}
			else
			{
				iconT = StatusIcons.Icon_Missing;
			}
			
			return new StatusEffectElement(_childSizeX, _childSizeY, effectName, iconT, tooltipText, durationRemaining, this.mouseHandlerFunc);
		}

		/**
		 * A function passed into each of the display elements to enable "easy" detection of which element is being interacted with.
		 * This could be all managed here, but the code is much neater if each child element is in charge of its own interaction code.
		 * I might go back through and refactor it here to cut down on the total number of eventListeners in play.
		 * @param	activeObj
		 */
		private function mouseHandlerFunc(activeObj:StatusEffectElement):void
		{
			// If a previous element has been selected, unselect it
			if (this._lastActiveElement != null && this._lastActiveElement !== activeObj)
			{
				this._lastActiveElement.toggleSelect();
			}
			
			// If the selected object is the same one that is currently active, unselect it
			if (this._lastActiveElement === activeObj)
			{
				this._lastActiveElement.toggleSelect();
				this.HideTooltip();
				this._lastActiveElement = null;
			}
			// Otherwise, set the new object as active and display the tooltip
			else
			{
				this._lastActiveElement = activeObj;
				activeObj.toggleSelect();
				this.DisplayTooltip(activeObj);
			}
		}
		
		/**
		 * Code to display and position the tooltip element correctly in relation to the location of the primary status display elements.
		 * Kind of a pain in the ass, but without this kinda positioning, the edges of the thing gets "lost" in other UI components.
		 * Also, a handy-dandy place to refactor data lookups for status effects.
		 * @param	activeObj
		 */
		private function DisplayTooltip(activeObj:StatusEffectElement):void
		{		
			_tooltipElement.SetData(activeObj.displayName, activeObj.tooltipText, activeObj.iconType, activeObj.durationRemaining);
			this.stage.addChild(_tooltipElement);
			
			var tPt:Point = this.localToGlobal(new Point(0, 0));
			
			// Horizontal position
			_tooltipElement.x = (_rightAlign) ? tPt.x - (_tooltipElement.width + 35) : 215;
			
			// Vertical position
			_tooltipElement.y = 635 - _tooltipElement.height;
		}
		
		/**
		 * Remove the tooltip from display
		 */
		public function HideTooltip():void
		{
			this.stage.removeChild(_tooltipElement);
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
			
			_childElements.sort(vectSortMethodName);
		}
		
		/**
		 * Sort method applied by the vector<T>.sort() method. Sorts elements based on name.
		 * @param	elemA
		 * @param	elemB
		 * @return
		 */
		private function vectSortMethodName(elemA:StatusEffectElement, elemB:StatusEffectElement):int
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
		 * Sort method applied by the vector<T>.sort() method. Sorts elements based on remaining duration
		 * @param	elemA
		 * @param	elemB
		 * @return
		 */
		private function vectSortMethodDuration(elemA:StatusEffectElement, elemB:StatusEffectElement):int
		{
			if (elemA.durationRemaining < elemB.durationRemaining)
			{
				return -1;
			}
			
			if (elemA.durationRemaining > elemB.durationRemaining)
			{
				return 1;
			}
			
			return 0;
		}
		
		private function vectFilterMethod(elem:StatusEffectElement, index:int, vector:Vector.<StatusEffectElement>):Boolean
		{
			if (_childElements.indexOf(elem) == -1)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		/**
		 * Reposition status effect element children within the display, based on their vector index position.
		 * Sorting the underlying vector determines where, in the container, elements should be positioned.
		 */
		private function RepositionChildren():void
		{
			var elem:int;
			if (_childElements.length > 0)
			{
				for (elem = 0; elem < _childElements.length; elem++)			
				{
					_childElements[elem].x = Math.floor((elem % 5) * (_childSizeX + childSpacing));
					_childElements[elem].y = Math.floor((Math.floor(elem / 5)) * (_childSizeY + childSpacing));
					if (_childElements[elem].parent == null) this.addChild(_childElements[elem]);
				}
			}
			
			if (_workElems.length > 0)
			{
				for (elem = 0; elem < _workElems.length; elem++)
				{
					if (_workElems[elem].parent != null) this.removeChild(_workElems[elem]);
				}
			}
		}
		
		/**
		 * Remove elements from the display list that are still present in the workElement vector and discard their references.
		 */
		private function RemoveExpiredChildren():void
		{
			while (_workElems.length > 0)
			{
				var childElem:StatusEffectElement = _workElems.pop();
				if (childElem.parent != null)
				{
					this.removeChild(childElem);
				}
			}
		}
		
		/**
		 * Update the displayed list of status effects.
		 * @param	statusEffects	Array of status effects to search through for displayable elements.
		 */
		public function updateDisplay(statusEffects:Array):void
		{
			// Shift current elements into a working vector and clear the primary vector
			_workElems = _workElems.concat(_childElements);
			_childElements.splice(0, _childElements.length);
			
			// Check through the incoming effects
			for (var seElem:int = 0; seElem < statusEffects.length; seElem++)
			{
				// If this ends up being slow, I'll fix it later. It shouldn't be TOO bad considering
				// the total number of effects we're liable to be displaying.
				
				// If an effect is a valid, displayable effect...
				if (statusEffects[seElem].hidden != true && statusEffects[seElem].iconName.length > 0)
				{
					var gotMatch:Boolean = false;
					
					// Check if we've already got an element for it.
					if (_workElems.length > 0)
					{
						for (var vecElem:int = 0; vecElem < _workElems.length; vecElem++)
						{
							// If we do, shift the element in question back to the primary vector, and update it's duration.
							if (_workElems[vecElem].name == statusEffects[seElem].storageName.toLowerCase())
							{
								_workElems[vecElem].durationRemaining = statusEffects[seElem].minutesLeft;
								_workElems[vecElem].tooltipText = statusEffects[seElem].tooltip;
								
								// Force through an update of the timer if we're looking at the active tooltip element!
								if (_workElems[vecElem] == _lastActiveElement)
								{
									_tooltipElement.UpdateDurationText(statusEffects[seElem].minutesLeft);
									_tooltipElement.UpdateTooltip(statusEffects[seElem].tooltip);
								}
								
								_childElements.push(_workElems[vecElem]);
								gotMatch = true;
							}
						}
					}
				
					// No match? It must be a new effect, so we need to create the displayable element
					if (!gotMatch)
					{
						_childElements.push(this.BuildNewChild(statusEffects[seElem].storageName, statusEffects[seElem].iconName, statusEffects[seElem].tooltip, statusEffects[seElem].minutesLeft));
					}
				}
			}
			
			// Remove instances of display elements from _workElems that are present in _childElements
			_workElems = _workElems.filter(this.vectFilterMethod, this);
			
			// Remove expired -- All elements remaining in _workElems should be expired effects, so we need to clear them up
			this.RemoveExpiredChildren();
			
			// Sort containers -- Now we can repurpose _workElems to hold any effect > 15, and they will automatically fall back into processsing
			// during the next update pass.
			this.SortChildren();
			
			// Reposition children in the display container, based on their now sorted vector index position.
			this.RepositionChildren();
		}
		
		// Some of the GUI code might (still) be blindly calling clearGlo() on any child elements. This is a stub to catch it so I can fix it.
		public function clearGlo():void
		{
			throw new Error("clearGlo called on StatusEffectDisplay. Bad GUI code, bad!");
		}
	}

}