package classes.UIComponents.ContentModuleComponents 
{
	import fl.containers.ScrollPane;
	import fl.controls.UIScrollBar;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexTree extends Sprite
	{
		private var _background:Sprite;
		
		// Header Text
		private var _codexHeaderText:TextField;
		private var _codexHeaderUnderline:Sprite;
		private var _codexHeaderIcon:Sprite;
		
		// Tree Elements
		private var _treeContent:ScrollPane;
		
		public function CodexTree() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.BuildContainer();
			this.BuildElementContainer();
		}
		
		private function BuildContainer():void
		{
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_background.graphics.drawRect(0, 0, 360, 740);
			_background.graphics.endFill();
			this.addChild(_background);
			
			_codexHeaderUnderline = new Sprite();
			_codexHeaderUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_codexHeaderUnderline.graphics.drawRect(0, 0, _background.width - 10, 3);
			_codexHeaderUnderline.graphics.endFill();
			_codexHeaderUnderline.x = 10;
			_codexHeaderUnderline.y = 50;
			this.addChild(_codexHeaderUnderline);
			
			_codexHeaderText = new TextField();
			_codexHeaderText.x = 10;
			_codexHeaderText.y = 1;
			_codexHeaderText.width = 300;
			_codexHeaderText.height = 50;
			_codexHeaderText.defaultTextFormat = UIStyleSettings.gCodexTitleHeaderFormatter;
			_codexHeaderText.embedFonts = true;
			_codexHeaderText.antiAliasType = AntiAliasType.ADVANCED;
			_codexHeaderText.text = "CODEX DB";
			_codexHeaderText.mouseEnabled = false;
			_codexHeaderText.mouseWheelEnabled = false;
			this.addChild(_codexHeaderText);
		}
		
		private function BuildElementContainer():void
		{
			// This fucking STUPID SHIT again, fuck you adobe for reals
			var nullSkin:MovieClip = new MovieClip();
			
			_treeContent = new CodexTreeElementContainer();
			_treeContent.x = 5;
			_treeContent.y = _codexHeaderUnderline.y + _codexHeaderUnderline.height + 3;
			_treeContent.width = _background.width - _treeContent.x - 14;
			_treeContent.height = _background.height - _treeContent.y;
			_treeContent.setStyle("skin", nullSkin);
			_treeContent.setStyle("upSkin", nullSkin);
			this.addChild(_treeContent);
		}
		
	}

}