package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.kGAMECLASS;
	public function ParseText(msg:String):String
	{
        const parserResult: * = kGAMECLASS.parser2.parse(msg);
        const interpretResult: * = kGAMECLASS.interpreter.interpret(parserResult.root, kGAMECLASS.titsWrapper, kGAMECLASS.titsInfo);

        var errorText: String = '';
        for each (var error: * in parserResult.errors)
            errorText += error + '\n';
        for each (error in interpretResult.errors)
            errorText += error + '\n';

        return interpretResult.result + (errorText.length > 0 ? '\n' + errorText : '');
	}

}