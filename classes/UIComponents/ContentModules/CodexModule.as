package UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import flash.text.TextField;
	import classes.UIComponents.ContentModuleComponents.CodexTree;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CodexModule extends ContentModule
	{
		private var _codexText:TextField;
		private var _codexTree:CodexTree;
		
		public function CodexModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = false;
			fullButtonTrayEnabled = false;
			_moduleName = "CodexDisplay";
		}
		
	}

}