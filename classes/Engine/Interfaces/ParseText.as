package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.kGAMECLASS;
	public function ParseText(msg:String):String
	{
        const tokens: * = kGAMECLASS.lexer.lex(msg);
        const parserResult: * = kGAMECLASS.parser2.parse(tokens, msg);
        const interpretResult: * = kGAMECLASS.interpreter.interpret(parserResult.root, kGAMECLASS.titsDescriptor);

        var errorText: String = '';
        for each (var error: * in parserResult.errors)
            errorText += error + '\n';
        for each (error in interpretResult.errors)
            errorText += error + '\n';

        return interpretResult.result + (errorText.length > 0 ? '\n' + errorText : '');
	}

}