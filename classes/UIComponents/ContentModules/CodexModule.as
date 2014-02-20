package classes.UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import fl.controls.ScrollBar;
	import fl.controls.UIScrollBar;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.ContentModuleComponents.CodexTree;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexModule extends ContentModule
	{
		private var _codexText:TextField;
		private var _scrollBar:UIScrollBar;
		
		private var _codexTree:CodexTree;
		
		public function CodexModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = false;
			fullButtonTrayEnabled = false;
			_moduleName = "CodexDisplay";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
			this.BuildTree();
		}
		
		private function Build():void
		{
			_codexText = new TextField();
			_codexText.border = false;
			_codexText.background = false;
			_codexText.multiline = true;
			_codexText.wordWrap = true;
			_codexText.embedFonts = true;
			_codexText.antiAliasType = AntiAliasType.ADVANCED;
			_codexText.x = 5;
			_codexText.y = 5;
			_codexText.height = 735;
			_codexText.width = 626;
			_codexText.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			_codexText.name = this._moduleName + "text";
			this.addChild(_codexText);
			
			_codexText.addEventListener(Event.SCROLL, updateScrollBar);
			
			_scrollBar = new UIScrollBar();
			_scrollBar.direction = "vertical";
			_scrollBar.setSize(_codexText.width, _codexText.height);
			_scrollBar.move(_codexText.x + _codexText.width, _codexText.y);
			this.addChild(_scrollBar);
			_scrollBar.scrollTarget = _codexText;
		}
		
		private function updateScrollBar(e:Event):void
		{
			_scrollBar.update();
		}
		
		private function BuildTree():void
		{
			_codexTree = new CodexTree();
			_codexTree.x = _codexText.x + _codexText.width + 20;
			this.addChild(_codexTree);			
		}
	}

}