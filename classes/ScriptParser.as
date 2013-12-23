package classes
{
	
	import flash.utils.Dictionary;
	
	public class ScriptParserNOPE {
		//static var FSVars:Dictionary = new Dictionary();
		var sections:Dictionary;
		var masterText:String;
		var shouldShowStack:Array;
		var choicesBuffer:Array;
		var curChoiceButton:int;
		var errors:Array;
		
		var nextBlock:int;
		var lastBlock:int;
		var earlyExit:Boolean;
		var rawText:String;
		var creator:Object;
		
		public function ScriptParserNOPE(creatorObj:Object) {
			//trace("Script Test");
			creator = creatorObj;
			//trace(ParseScript(testscript1));
			//We should have gotten up to the choices.
			//Lets pull the choices and see what we have.
			//var choices = GetChoiceButtons();
			//trace(choices[2][0]);
			//trace(ParseScriptSection(testScript, choices[1][0]));
		}
		
		public function GetVariable(variableName:String):Object {
			var variableArray:Array = variableName.split(".");
			var curObject:Object = creator;
			for(var i:int = 0; i < variableArray.length; i++) {
				if(variableArray[i].indexOf("[") != -1) {
					var arrayAccess = variableArray[i].split("[");
					curObject = (curObject[arrayAccess[0]])[parseInt(arrayAccess[1])];
				} 
				else if(typeof(curObject[variableArray[i]]) == "function") {
					curObject = curObject[variableArray[i]].call(curObject);
				} 
				else {
					curObject = curObject[variableArray[i]];
				}
				if(curObject == null) {
					errors.push("Error retrieving variable:  " + variableName);
					return null;
				}
			}
			return curObject;
		}

		public function ConvertToVarType(convertString:String, convertToType:Object):Object {
			if(typeof(convertToType) == 'number') {
				return Number(convertString);
			}
			if(typeof(convertToType) == 'boolean') {
				if(convertString == "true") {
					return true;
				}
				return false;
			}
			return convertString;
		}
		
		public function ParseScriptSection(script:String, section:String):String {
			//Same but with the starting section set.
			Init(script);
			if(section != "") {
				lastBlock = GetSection(section);
			}
			ParseText();
			if(errors.length > 0) {
				//We got errors
				return "<B>" + errors.join("\n") + "</B>\n\n" + masterText;
			}
			return masterText;
		}
		public function ParseScript(script:String):String {
			return ParseScriptSection(script, "");
		}
		
		private function Init(raw:String):void {
			rawText = raw;
			lastBlock = 0;
			//FSVars = new Dictionary();
			sections = new Dictionary();
			//FSVars["test"] = true;
			masterText = "";
			shouldShowStack = new Array();
			choicesBuffer = new Array();
			earlyExit = false;
			curChoiceButton = 0;
			errors = new Array();
		}
		
		public function PostParser(parsedText:String):String {
			var pattern:RegExp = /\[(.*?)\]/gi;
			parsedText = parsedText.replace(pattern, ReplaceDescriptor);
			return parsedText;
		}
		
		protected function ParseText():void {
			nextBlock = rawText.indexOf("{", lastBlock); //Keep it simple baby.

			while(nextBlock > -1) {
				//We have code in here!
				//Add what we have to the master text!
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {
					masterText = masterText.concat(PostParser(rawText.slice(lastBlock, nextBlock)));
				}
				
				if(rawText.charAt(nextBlock) === '{') {
					//We are starting a new command!
					//So exciting
					//Give them what we got.  Parse commands returns how much text was traversed.
					nextBlock = ParseCommands(rawText.slice(nextBlock+1), nextBlock);
					//Don't forget to add one because we skipped the brace!
				}
				else {
					//MALFORMED TEXT!  Send some sort of warning, I guess?
					errors.push("Malformed Text!  You shouldn't ever see this!");
				}
				if(earlyExit) {
					break;
				}
				lastBlock = nextBlock;
				nextBlock = rawText.indexOf("{", nextBlock);
			}
			if(!earlyExit) {
				//masterText = masterText.concat(PostParser(rawText.slice(lastBlock, nextBlock)));
				masterText = masterText.concat(PostParser(rawText.slice(lastBlock, rawText.length)));
			}
		}
		
		protected function IfStatement(ifVariable:String, ifConditional:String, ifComparitor:String, commandString:String):Boolean {
			var ifVarObj:Object = GetVariable(ifVariable)
			if(ifVarObj != null) {
				var ifChecker:Object = ConvertToVarType(ifComparitor, ifVarObj);
				if(ifConditional == "=" || ifConditional == "==") {
					return (ifVarObj == ifChecker);
				}
				else if(ifConditional == "<=") {
					return (ifVarObj <= ifChecker);
				}
				else if(ifConditional == ">=") {
					return (ifVarObj >= ifChecker);
				}
				else if(ifConditional == "<") {
					return (ifVarObj < ifChecker);
				}
				else if(ifConditional == ">") {
					return (ifVarObj > ifChecker);
				}
				else if(ifConditional == "!=") {
					return (ifVarObj != ifChecker);
				}
			}
			errors.push("Malformed if statement: " + commandString);
			return false;
		}
		
		protected function ParseCommands(commands:String, scriptLoc:int):int {
			var commandEnd = commands.search("}");
			var commandString:String = commands.substring(0, commandEnd);
			var pattern:RegExp = /^([\w]*)/i;
			var command = commandString.match(pattern)[0];
			//We has our command now!

			if(command == "if" && (shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1])) {
				var ifPattern:RegExp = /^if[\s]*(.+)[\s]+([!=<>]+)[\s]+(.+)[\s]*/;
				var ifOutput = ifPattern.exec(commandString);
				if(ifOutput == null) {
					errors.push("Error parsing if statement: " + commandString);
					return commandEnd+scriptLoc+2;
				}
				shouldShowStack.push(IfStatement(ifOutput[1], ifOutput[2], ifOutput[3], commandString))
			}
			else if(command == "elseif" && !shouldShowStack[shouldShowStack.length-1]) {
				if(shouldShowStack.length == 0) {
					errors.push("Elseif called with no starting if: " + commandString);
				}
				var ifElsePattern:RegExp = /^elseif[\s]*(.+)[\s]+([!=<>]+)[\s]+(.+)[\s]*/;
				var ifElseOutput = ifElsePattern.exec(commandString);
				if(ifElseOutput == null) {
					errors.push("Error parsing if statement: " + commandString);
					return commandEnd+scriptLoc+2;
				}
				shouldShowStack[shouldShowStack.length-1] = IfStatement(ifElseOutput[1], ifElseOutput[2], ifElseOutput[3], commandString);
			}
			else if(command == "else") {
				if(shouldShowStack.length == 0) {
					errors.push("Else called with no matching if: " + commandString);
				}
				shouldShowStack[shouldShowStack.length-1] = !shouldShowStack[shouldShowStack.length-1];
			}
			else if(command == "endif") {
				if(shouldShowStack.length == 0) {
					errors.push("Endif called with no matching if!");
				}
				shouldShowStack.pop();
			}
			else if(command == "section") {
				//Ignore this, it's handled elsewhere
			}
			//All the guys from here down should only be shown if the stack allows it
			else if(command == "addchoice") {
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {				
					var addChoicePattern:RegExp = /\w+\s+(\w+).*?"(.*)".*?/;
					var commandOutput = addChoicePattern.exec(commandString);
					creator["addButton"].apply(this, [curChoiceButton,commandOutput[2],creator[commandOutput[1]]]);
					curChoiceButton += 1;
				}
			}
			else if(command == "stop") {
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {	
					earlyExit = true;
				}
			}
			else if(command == "set") {
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {	
					var setPattern:RegExp = /\w+ (\w+) (\w+)/;
					var commandOutput = setPattern.exec(commandString);
					var convertVar = GetVariable(commandOutput[1]);
					if(convertVar == null) {
						errors.push("Error with set command: " + commandString);
						return commandEnd+scriptLoc+2;
					}
					creator[commandOutput[1]] = ConvertToVarType(commandOutput[2], convertVar);
				}
			}
			else if(command == "addtovar") {
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {	
					var pattern:RegExp = /\w+ (\w+) (\w+)/;
					var commandOutput = pattern.exec(commandString);
						var convertVar = GetVariable(commandOutput[1]);
					if(convertVar == null) {
						errors.push("Error with addtovar command: " + commandString);
						return commandEnd+scriptLoc+2;
					}
					creator[commandOutput[1]] += ConvertToVarType(commandOutput[2], convertVar);
				}
			}
			else if(command == "callhook") {
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {	
					var paramArray = commandString.split(" ");
					var funName = paramArray[1];
					paramArray = paramArray.slice(2);
					//Using number loop because reasons.
					//for(var i:int = 0; i < paramArray.length; i++) {
					//	paramArray[i] = GetVariable(paramArray[i]);
					//}
					creator[funName].apply(creator, paramArray);
				}
			}
			else if(command == "goto") {
				if(shouldShowStack.length == 0 || shouldShowStack[shouldShowStack.length-1]) {	
					var paramArray = commandString.split(" ");
					return GetSection(paramArray[1]);
				}
			}
			else {
				errors.push("Unknown Command: " + commandString);
			}
			return commandEnd+scriptLoc+2;
		}
		
		private function GetNextBlock(script:String):int {
			var pattern:RegExp = /[{}]/; 
			return script.search(pattern);
		}
		
		private function ReplaceDescriptor(matchedSubstring:String, descriptor:String, index:int, str:String):String {
			var paramArray:Array = descriptor.split(" ");
			var descriptorArray:Array = paramArray[0].split(".");
			//trace(descriptorArray[0]);
			//Okay we got stuff!
			var description:String;
			try{
				if(paramArray.length > 1) {
					description = creator[descriptorArray[0]].getDescription(descriptorArray[1], paramArray[1]);
				}
				else {
					description = creator[descriptorArray[0]].getDescription(descriptorArray[1], "");
				}
			}
			catch(e:Error) {
				errors.push("Non existant entity: " + descriptorArray[0]);
			}
			return description;
		}
		
		/*public function GetChoiceButtons():Array {
			//This function gets an array of what the button choices are for that encounter.
			//To access them, simply do:
			//choiceInfo[x][0] = section to jump to
			//choiceInfo[x][1] = text on button
			var temp = choicesBuffer;
			choicesBuffer = new Array();
			return temp;
		}*/
		
		public function GetSection(section:String):int {
			//var pattern:RegExp = new RegExp("{\s*section\s*" + section + "\s*}", "i");
			var searchString = "{section " + section + "}";
			var pattern:RegExp = new RegExp(searchString, "i");
			var sectionStart:int = rawText.search(pattern);
			if(sectionStart == -1) {
				errors.push("Unable to locate section: " + section);
				return 0;
			}
			return sectionStart + searchString.length;
		}
		
		//This is for storing shit!
		
//Unused for now


	}
}


