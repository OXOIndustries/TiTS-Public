package classes.TITSSaveEdit.UI 
{
	import classes.TITSSaveEdit.UI.Controls.GeneralStats;
	import classes.TITSSaveEdit.UI.Controls.CoreStats;
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
		private var _left:Array;
		private var _right:Array;
		
		private var _generalStats:GeneralStats;
		private var _coreStats:CoreStats;	
		
		public function get generalStats():GeneralStats { return _generalStats; }
		
		public function SEMainDisplay() 
		{
			_left = new Array();
			_right = new Array();
			
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
		
		private static const LEFT_COL:Boolean = true;
		private static const RIGHT_COL:Boolean = false;
		
		private function AddControl(control:DisplayObject, left:Boolean = true):void
		{
			var numChildren:int = _content.numChildren;
			var yOffset:int = 0;
			var colArray:Array;
			
			if (left)
			{
				colArray = _left;
				control.x = 0;
			}
			else
			{
				colArray = _right;
				control.x = 400;
			}
			
			if (colArray.length > 0)
			{
				yOffset = (colArray[colArray.length - 1] as DisplayObject).y + (colArray[colArray.length - 1] as DisplayObject).height + 10;
			}
			
			colArray.push(control);
			control.y = yOffset;
			
			_content.addChild(control);
			_scrollPane.update();
		}
		
		private function BuildControls():void
		{
			_generalStats = new GeneralStats();
			AddControl(_generalStats, LEFT_COL);
			_generalStats.name = "generalstats";
			
			_coreStats = new CoreStats();
			AddControl(_coreStats, LEFT_COL);
			_coreStats.name = "corestats";
		}
	}

}