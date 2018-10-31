
package classes.UIComponents 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class ButtonData 
	{
		/**
		 * Override Tooltip Data Storage
		 */
		private var _tooltipHeader:String;
		private var _tooltipBody:String;
		private var _tooltipComparison:String;
		
		public function get tooltipHeader():String { return _tooltipHeader; }
		public function set tooltipHeader(v:String):void { _tooltipHeader = v; }
		
		public function get tooltipBody():String { return _tooltipBody; }
		public function set tooltipBody(v:String):void { _tooltipBody = v; }
		
		public function get tooltipComparison():String { return _tooltipComparison; }
		public function set tooltipComparison(v:String):void { _tooltipComparison = v; }
		
		/**
		 * Button Activator data storage.
		 */
		private var _function:Function;
		private var _argument:*;
		
		public function get func():Function { return _function; }
		public function set func(v:Function):void { _function = v; }
		
		public function get arg():* { return _argument; }
		public function set arg(v:*):void { _argument = v; }
		
		/**
		 * Button Display Data
		 */
		private var _buttonName:String;
		private var _itemQuantity:int;
		private var _stackSize:int;
		
		public function get buttonName():String { return _buttonName; }
		public function set buttonName(v:String):void { _buttonName = v; }
		
		public function get itemQuantity():int { return _itemQuantity; }
		public function set itemQuantity(v:int):void { _itemQuantity = v; }
		
		public function get stackSize():int { return _stackSize; }
		public function set stackSize(v:int):void { _stackSize = v; }
		
		public function ButtonData() 
		{
			this.clearData();
		}
		
		/**
		 * Set all the common properties in a single call
		 * @param	cap			Button name
		 * @param	func		Assigned functor
		 * @param	arg			Argument to call the functor with
		 * @param	ttHeader	Desired tooltip header to display
		 * @param	ttBody		Desired tooltip body to display
		 */
		public function setData(cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = "", ttBody:String = ""):void
		{
			this.buttonName = cap;
			this.func = func;
			this.arg = arg;
			this.tooltipHeader = ttHeader;
			this.tooltipBody = ttBody;
		}
		
		/**
		 * Clear/Reset stored data to default
		 */
		public function clearData():void
		{
			this.buttonName = "";
			this.tooltipBody = "";
			this.tooltipHeader = "";
			this.tooltipComparison = "";
			this.itemQuantity = 0;
			this.stackSize = 1;
			this.func = null;
			this.arg = null;
		}
	}
}