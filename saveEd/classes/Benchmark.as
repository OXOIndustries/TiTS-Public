package classes
{ 
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.*;
	import flash.geom.*;

	import classes.MyPoint;
	import classes.MyDynamic;


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
			

			this.loops = 0;
			this.FieldAccessMethods()
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
		public static var VAL:Number=0;
 
		private function row(...vals): void
		{
			mainTextField.appendText(vals.join(",")+"\n");
		}
 
		public function FieldAccessMethods()
		{
 
			var i:int;
			const REPS:int = 1000000;
			var beforeTime:int;
			var afterTime:int;
			var readDotTime:int;
			var writeDotTime:int;
			var readIndexTime:int;
			var writeIndexTime:int;
			var p:Point = new Point(0,0);
			var mp:MyPoint = new MyPoint();
			var md:MyDynamic = new MyDynamic();
			var d:Dictionary = new Dictionary();
				d.x=0;
			var a:Array = [0];
				a.x=0;
			var c:Class = MyPoint;
			var dc:Class = MyDynamic;
			var o:Object = {x:0};
 
			row("Type", "Read (dot)", "Write (dot)", "Read (index)", "Write (index)");
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				p.x++;
				p.x++;
				p.x++;
				p.x++;
				p.x++;
				p.x++;
				p.x++;
				p.x++;
				p.x++;
				p.x++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				p.x=0;
				p.x=1;
				p.x=2;
				p.x=3;
				p.x=4;
				p.x=5;
				p.x=6;
				p.x=7;
				p.x=8;
				p.x=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;
				p["x"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				p["x"]=0;
				p["x"]=1;
				p["x"]=2;
				p["x"]=3;
				p["x"]=4;
				p["x"]=5;
				p["x"]=6;
				p["x"]=7;
				p["x"]=8;
				p["x"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("Point", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;
				mp.x++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				mp.x=0;
				mp.x=1;
				mp.x=2;
				mp.x=3;
				mp.x=4;
				mp.x=5;
				mp.x=6;
				mp.x=7;
				mp.x=8;
				mp.x=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;
				mp["x"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				mp["x"]=0;
				mp["x"]=1;
				mp["x"]=2;
				mp["x"]=3;
				mp["x"]=4;
				mp["x"]=5;
				mp["x"]=6;
				mp["x"]=7;
				mp["x"]=8;
				mp["x"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("MyPoint", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md.x++;
				md.x++;
				md.x++;
				md.x++;
				md.x++;
				md.x++;
				md.x++;
				md.x++;
				md.x++;
				md.x++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md.x=0;
				md.x=1;
				md.x=2;
				md.x=3;
				md.x=4;
				md.x=5;
				md.x=6;
				md.x=7;
				md.x=8;
				md.x=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md["x"]++;
				md["x"]++;
				md["x"]++;
				md["x"]++;
				md["x"]++;

				md["x"]++;
				md["x"]++;
				md["x"]++;
				md["x"]++;
				md["x"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md["x"]=0;
				md["x"]=1;
				md["x"]=2;
				md["x"]=3;
				md["x"]=4;
				md["x"]=5;
				md["x"]=6;
				md["x"]=7;
				md["x"]=8;
				md["x"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("MyDynamic (existing)", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md.z++;
				md.z++;
				md.z++;
				md.z++;
				md.z++;
				md.z++;
				md.z++;
				md.z++;
				md.z++;
				md.z++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md.z=0;
				md.z=1;
				md.z=2;
				md.z=3;
				md.z=4;
				md.z=5;
				md.z=6;
				md.z=7;
				md.z=8;
				md.z=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;
				md["z"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				md["z"]=0;
				md["z"]=1;
				md["z"]=2;
				md["z"]=3;
				md["z"]=4;
				md["z"]=5;
				md["z"]=6;
				md["z"]=7;
				md["z"]=8;
				md["z"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("MyDynamic (added)", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				d.x++;
				d.x++;
				d.x++;
				d.x++;
				d.x++;
				d.x++;
				d.x++;
				d.x++;
				d.x++;
				d.x++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				d.x=0;
				d.x=1;
				d.x=2;
				d.x=3;
				d.x=4;
				d.x=5;
				d.x=6;
				d.x=7;
				d.x=8;
				d.x=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;
				d["x"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				d["x"]=0;
				d["x"]=1;
				d["x"]=2;
				d["x"]=3;
				d["x"]=4;
				d["x"]=5;
				d["x"]=6;
				d["x"]=7;
				d["x"]=8;
				d["x"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("Dictionary", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				a.x++;
				a.x++;
				a.x++;
				a.x++;
				a.x++;
				a.x++;
				a.x++;
				a.x++;
				a.x++;
				a.x++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				a.x=0;
				a.x=1;
				a.x=2;
				a.x=3;
				a.x=4;
				a.x=5;
				a.x=6;
				a.x=7;
				a.x=8;
				a.x=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;
				a["x"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				a["x"]=0;
				a["x"]=1;
				a["x"]=2;
				a["x"]=3;
				a["x"]=4;
				a["x"]=5;
				a["x"]=6;
				a["x"]=7;
				a["x"]=8;
				a["x"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("Array", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;
				c.VAL++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				c.VAL=0;
				c.VAL=1;
				c.VAL=2;
				c.VAL=3;
				c.VAL=4;
				c.VAL=5;
				c.VAL=6;
				c.VAL=7;
				c.VAL=8;
				c.VAL=9;
			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;
				c["VAL"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				c["VAL"]=0;
				c["VAL"]=1;
				c["VAL"]=2;
				c["VAL"]=3;
				c["VAL"]=4;
				c["VAL"]=5;
				c["VAL"]=6;
				c["VAL"]=7;
				c["VAL"]=8;
				c["VAL"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("Static Class", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;
				dc.VAL++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				dc.VAL=0;
				dc.VAL=1;
				dc.VAL=2;
				dc.VAL=3;
				dc.VAL=4;
				dc.VAL=5;
				dc.VAL=6;
				dc.VAL=7;
				dc.VAL=8;
				dc.VAL=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;
				dc["VAL"]++;

			}
			afterTime = getTimer();
			readIndexTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				dc["VAL"]=0;
				dc["VAL"]=1;
				dc["VAL"]=2;
				dc["VAL"]=3;
				dc["VAL"]=4;
				dc["VAL"]=5;
				dc["VAL"]=6;
				dc["VAL"]=7;
				dc["VAL"]=8;
				dc["VAL"]=9;

			}
			afterTime = getTimer();
			writeIndexTime = afterTime - beforeTime;
			row("Dynamic Class", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
 
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				o.x++;
				o.x++;
				o.x++;
				o.x++;
				o.x++;
				o.x++;
				o.x++;
				o.x++;
				o.x++;
				o.x++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				o.x=0;
				o.x=1;
				o.x=2;
				o.x=3;
				o.x=4;
				o.x=5;
				o.x=6;
				o.x=7;
				o.x=8;
				o.x=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;
				o["x"]++;

			}
			afterTime = getTimer();
			readDotTime = afterTime - beforeTime;
			beforeTime = getTimer();
			for (i=0; i < REPS; ++i)
			{	
				o["x"]=0;
				o["x"]=1;
				o["x"]=2;
				o["x"]=3;
				o["x"]=4;
				o["x"]=5;
				o["x"]=6;
				o["x"]=7;
				o["x"]=8;
				o["x"]=9;

			}
			afterTime = getTimer();
			writeDotTime = afterTime - beforeTime;
			row("Object", readDotTime, writeDotTime, readIndexTime, writeIndexTime);
		}
 
		private function foo(): void {}



	} 
}