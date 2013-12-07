package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import fl.motion.Color;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	public class statBarBig extends MovieClip
	{
		//constructor
		public function statBarBig()
		{
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		//data
		//butt wetness
		private var min:Number = 0;
		private var max:Number = 100;
		private var current:Number = 0;
		private var goal:Number = 0;
		//How far does the bar move per frame? 24FPS
		private var rate:Number = 0;
		private var barColor:ColorTransform = new ColorTransform();
		private var glow:GlowFilter = new GlowFilter();
		private var esp:Number;
		private var glowFrames:Number = 0;
		public var clearGlow:Boolean = false;
		public var highBad:Boolean = false;
		public function setMax(arg:Number):void {
			max = arg;
		}
		public function setGoal(arg:Number):void {
			goal = arg;
			if(clearGlow) {
				clearGlow = false;
				values.filters = [];
			}
			glowFrames = 35;
			rate = Math.abs(current - goal) / 35;
		}
		public function getGoal():Number {
			return goal;
		}
		public function clearGlo():void {
			current = goal;
			clearGlow = true;
			glowFrames = 24;
		}
		function update(e:Event):void {
			//REMOVE GLOW
			if(clearGlow) {
				if(glow.alpha == 0) {
					clearGlow = false;
					glowFrames = 0;
				}
				if(glowFrames > 0) {
					if(glowFrames > 0) glowFrames--;
					glow.alpha = (glowFrames / 24);
					if(glowFrames == 0) trace("Clearing Glo: " + glowFrames + " on " + masks.labels.text + ".  Rough Alpha: " + glowFrames/48 + " Real Alpha: " + glow.alpha);
					values.filters = [glow];
				}
			}
			//GLOW IF BUFFED
			else if(glowFrames > 0 && (current < goal && !highBad) || (goal < current && highBad))
			{
				glowFrames--;
				//barColor.color = Color.interpolateColor(0x00CC00, 0x8D31B0, current/goal o)); 
				//hpbar.transform.colorTransform = barColor;
				//This gives the numbers a glowing effect when healing.
				glow.color = 0x0099FF;
				glow.blurX = 10;
				glow.blurY = 10;
				glow.strength = 2;
				glow.alpha = ((48-glowFrames) / 48);
				values.filters = [glow];
				if(glowFrames == 99) trace("Glowing Green: " + glowFrames);
			}
			//GLOW BLACK IF DEBUFFED
			else if(glowFrames > 0)
			{
				glowFrames--;
				//barColor.color = Color.interpolateColor(0x00CC00, 0x8D31B0, current/goal o)); 
				//hpbar.transform.colorTransform = barColor;
				//This gives the numbers a glowing effect when healing.
				glow.color = 0xCC3300;
				glow.blurX = 15;
				glow.blurY = 15;
				glow.strength = 4;
				glow.alpha = ((48-glowFrames) / 48);
				values.filters = [glow];
				if(glowFrames == 99) trace("Glowing ORANGE: " + glowFrames);
			}
			//This part adjusts the bar scrolling and coloration
			if (goal < current)
			{
				if (current <= min)
				{
					current = min;
					goal = min;
				} 
				else
				{
					current -= rate;
					if (goal > current)
					{
						current = goal;
					}
				}
			}
			else if(goal > current)
			{
				if (current >= max)
				{
					current = max;
					goal = max;
				} 
				else
				{
					current += rate;
					if (goal < current)
					{
						current = goal;
					}
				}
			}
			values.text = String(Math.round(current));
			//This controls the color of the bar
			if (current != goal)
			{
				//RED
				if (!highBad)
				{
					if(max == 0) barColor.color = Color.interpolateColor(0xFF0000, 0x8D31B0, current/1); 
					else barColor.color = Color.interpolateColor(0xFF0000, 0x8D31B0, current/max); 
					bar.transform.colorTransform = barColor;
				}
				//GREEN
				else
				{
					if(max == 0) barColor.color = Color.interpolateColor(0x8D31B0, 0xFF0000, current/1); 
					else barColor.color = Color.interpolateColor(0x8D31B0, 0xFF0000, current/max); 
					bar.transform.colorTransform = barColor;
				}
			}	
			if ((current == max && !highBad) || (current == min && highBad))
			{
				barColor.color = 0x8D31B0;
				bar.transform.colorTransform = barColor;
			}
			//Set the width!
			if(max is Number && current is Number) {
				if(current > max) current = max;
				if(max == 0)
				{
					bar.width = 0;
					background.x = -1 * (1) * 180;
				}
				else
				{	
					bar.width = (current / max) * 180;
					background.x = -1 * (1 - current / max) * 180;
				}
			}
		}
	}
}