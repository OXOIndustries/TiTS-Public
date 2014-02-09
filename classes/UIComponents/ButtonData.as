package UIComponents 
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
		
		public function get tooltipHeader():String { return _tooltipHeader; }
		public function set tooltipHeader(v:String):void { _tooltipHeader = v; }
		
		public function get tooltipBody():String { return _tooltipBody; }
		public function set tooltipBody(v:String):void { _tooltipBody = v; }
		
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
		private var _labelText:String;
		
		public function get labelText():String { return _labelText; }
		public function set labelText(v:String):void { _labelText = v; }
		
		public function ButtonData() 
		{
			_tooltipBody = "";
			_tooltipHeader = "";
			_function = null;
			_argument = null;
			_labelText = "";
		}
		
	}

}