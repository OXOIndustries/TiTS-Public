package classes.TITSSaveEdit.UI 
{
	import classes.TITSSaveEdit.UI.Controls.GeneralStats;
	import fl.containers.ScrollPane;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEMainDisplay extends Sprite
	{
		private var _scrollPane:ScrollPane;
		private var _content:MovieClip;
		
		private var _generalStats:GeneralStats;
		
		public function get generalStats():GeneralStats { return _generalStats; }
		
		public function SEMainDisplay() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
			BuildControls();
		}
		
		private function Build():void
		{
			_scrollPane = new ScrollPane();
			_scrollPane.setSize(800, 800);
			
			this.opaqueBackground = null;
			
			var nullSkin:MovieClip = new MovieClip();
			_scrollPane.setStyle("skin", nullSkin);
			_scrollPane.setStyle("upSkin", nullSkin);
			
			this.addChild(_scrollPane);
			
			_content = new MovieClip();
			_content.name = "controlContent";
			
			_scrollPane.source = _content;
		}
		
		private function AddControl(control:DisplayObject):void
		{
			var numChildren:int = _content.numChildren;
			
			if (numChildren > 0)
			{
				if (numChildren % 2 == 1) control.x = 400;
				
				// Find the lowest down control on the prev row
				if (numChildren > 1)
				{
					var prevL:int = _content.getChildAt(numChildren - 2).y + _content.getChildAt(numChildren - 2).height;
					var prevR:int = _content.getChildAt(numChildren - 1).y + _content.getChildAt(numChildren - 1).height;
					
					if (prevR > prevL) prevL = prevR;
					
					prevR += 5;
					
					control.y = prevR;
				}
			}
			_content.addChild(control);
			_scrollPane.update();
		}
		
		private function BuildControls():void
		{
			var newControl:GeneralStats = new GeneralStats();
			AddControl(newControl);
			newControl.name = "generalstats";
		}
	}

}