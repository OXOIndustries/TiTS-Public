package classes
{ 
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;

	public class DoTheThings extends MovieClip
	{ 

		private var loopX:int;
		private var loopY:int;
		private var processing:Boolean;

		private var mainTextField:TextField;

		private var loops:int;

		public function DoTheThings()
		{
			this.mainTextField = new TextField();
			trace("Width = ",  this.stage.stageWidth)
			trace("Height = ", this.stage.stageHeight)
			this.prepTextField(this.mainTextField);
			this.processing = false;
			this.addEventListener(Event.EXIT_FRAME, this.processData);

			this.loops = 0;
		}

		public function processData(event:*)
		{
			if (this.mainTextField.htmlText.length > 5000)
				this.mainTextField.htmlText = "";
			this.mainTextField.htmlText += "Processing....";
			if (this.processing == true)
				throw new Error("WAT");

			this.processing = true;
			doLongRunningTask();
			this.processing = false;
			this.mainTextField.htmlText += "done!" + String(this.loops) + "\n";
			this.loops += 1;
		}
		private function doLongRunningTask():void
		{
			for (loopX = 0; loopX < 500; loopX += 1)
			{
				this.doShorterTask()
			}
		}
		private function doShorterTask():void
		{
			
			for (loopY = 0; loopY < 500; loopY += 1)
			{

			}
		}
		private function prepTextField(arg:TextField):void 
		{
			var borderSpacing:int = 8;

			arg.border = false;
			arg.text = "Placeholder";
			arg.background = false;
			arg.multiline = true;
			arg.wordWrap = true;
			arg.border = false;
			arg.x = borderSpacing;
			arg.y = borderSpacing;
			arg.height = this.stage.stageHeight - (borderSpacing * 2);
			arg.width  = this.stage.stageWidth  - (borderSpacing * 2);
			//arg.setTextFormat(format1);
			//arg.defaultTextFormat = format1;
			this.addChild(arg);
			arg.visible = true;
		}
	} 
}