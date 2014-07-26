package classes.TITSSaveEdit.Data 
{
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CockTypesEnum implements IExternalizable
	{
		private var _data:int;
		
		public function get type():int { return _data; }
		public function set type(v:int):void { _data = v; }
		
		public function CockTypesEnum() 
		{
			_data = 0;
		}
		
		/* INTERFACE flash.utils.IExternalizable */
		
		public function writeExternal(output:IDataOutput):void 
		{
			output.writeInt(_data);
		}
		
		public function readExternal(input:IDataInput):void 
		{
			_data = input.readInt();
		}
		
	}

}