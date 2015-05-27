package classes.Parser
{
	// import classes.CoC;

	public class ParseEngine
	{
		private var _ownerClass:*;			// main game class. Variables are looked-up in this class.
		private var _settingsClass:*;		// global static class used for shoving conf vars around

		public var sceneParserDebug:Boolean = false;

		public var mainParserDebug:Boolean = false;
		public var lookupParserDebug:Boolean = false;
		public var conditionalDebug:Boolean = false;
		public var printCcntentDebug:Boolean = false;
		public var printConditionalEvalDebug:Boolean = false;
		public var printIntermediateParseStateDebug:Boolean = false;


		public function ParseEngine(ownerClass:*, settingsClass:*)
		{
			this._ownerClass = ownerClass;
			this._settingsClass = settingsClass;
		}

		/*
		Parser Syntax:

		// Querying simple PC stat nouns:
			[noun]

		Conditional statements:
		// Simple if statement:
			[if (condition) OUTPUT_IF_TRUE]
		// If-Else statement
			[if (condition) OUTPUT_IF_TRUE | OUTPUT_IF_FALSE]
			// Note - Implicit else indicated by presence of the "|"

		// Object aspect descriptions
			[object aspect]
			// gets the description of aspect "aspect" of object/NPC/PC "object"
			// Eventually, I want this to be able to use introspection to access class attributes directly
			// Maybe even manipulate them, though I haven't thought that out much at the moment.

		// Gender Pronoun Weirdness:
		// PRONOUNS: The parser uses Elverson/Spivak Pronouns specifically to allow characters to be written with non-specific genders.
		// http://en.wikipedia.org/wiki/Spivak_pronoun
		//
		// Cheat Table:
		//           | Subject    | Object       | Possessive Adjective | Possessive Pronoun | Reflexive         |
		// Agendered | ey laughs  | I hugged em  | eir heart warmed     | that is eirs       | ey loves emself   |
		// Masculine | he laughs  | I hugged him | his heart warmed     | that is his        | he loves himself  |
		// Feminine  | she laughs | I hugged her | her heart warmed     | that is hers       | she loves herself |



		[screen (SCREEN_NAME) | screen text]
			// creates a new screen/page.

		[button (SCREEN_NAME)| button_text]
			// Creates a button which jumps to SCREEN_NAME when clicked

		*/


		// this.parserState is used to store the scene-parser state.
		// it is cleared every time recursiveParser is called, and then any scene tags are added
		// as parserState["sceneName"] = "scene content"

		public var parserState:Object = new Object();

		// provides singleArgConverters
		include "./singleArgLookups.as";

		// Does lookup of single argument tags ("[cock]", "[armor]", etc...) in singleArgConverters
		// Supported variables are the options listed in the above
		// singleArgConverters object. If the passed argument is found in the above object,
		// the corresponding anonymous function is called, and it's return-value is returned.
		// If the arg is not present in the singleArgConverters object, an error message is
		// returned.
		// ALWAYS returns a string
		private function convertSingleArg(arg:String):String
		{
			var argResult:String = null;
			var capitalize:Boolean = isUpperCase(arg.charAt(0));

			var argLower:String;
			argLower = arg.toLowerCase()
			if (argLower in singleArgConverters)
			{
				if (lookupParserDebug) trace("Found corresponding anonymous function");
				argResult = singleArgConverters[argLower](this._ownerClass);

				if (lookupParserDebug) trace("Called, return = ", argResult);

				if (capitalize)
					argResult = capitalizeFirstWord(argResult);

				return argResult;
			}
			else
			{

				// ---------------------------------------------------------------------------------
				// TODO: Get rid of this shit.
				// UGLY hack to patch legacy functionality in TiTS
				// This needs to go eventually

				var descriptorArray:Array = arg.split(".");

				obj = this.getObjectFromString(this._ownerClass, descriptorArray[0]);
				if (obj == null)		// Completely bad tag
				{
					var msg:String = "!Unknown subject in \"" + arg + "\"!";
					trace("Warning: " + msg);
					return "<b>" + msg + "</b>";
				}
				if (obj.hasOwnProperty("getDescription") && arg.indexOf(".") > 0)
				{
					return obj.getDescription(descriptorArray[1], "");
				}
				// end hack
				// ---------------------------------------------------------------------------------


				if (lookupParserDebug) trace("Lookup Arg = ", arg);
				var obj:*;
				obj = this.getObjectFromString(this._ownerClass, arg);
				if (obj != null)
				{
					if (obj is Function)
					{
						if (lookupParserDebug) trace("Found corresponding function in owner class");
						return obj();
					}
					else
					{
						if (lookupParserDebug) trace("Found corresponding aspect in owner class");
						return String(obj); 	// explicit cast probably not needed
					}
				}
				else
				{
					if (lookupParserDebug) trace("No lookup found for", arg, " search result is: ", obj);
					msg = "!Unknown tag \"" + arg + "\"!";
					trace("Warning: " + msg);
					return "<b>" + msg + "</b>";
				}
			}
		}

		// provides twoWordNumericTagsLookup and twoWordTagsLookup, which use
		// cockLookups/cockHeadLookups, and rubiLookups/arianLookups respectively
		include "./doubleArgLookups.as";

		private function convertDoubleArg(inputArg:String):String
		{
			var argResult:String = null;

			var thing:*;
			var msg:String;

			var argTemp:Array = inputArg.split(" ");
			if (argTemp.length != 2)
			{
				return "<b>!Not actually a two-word tag!\"" + inputArg + "\"!</b>"
			}
			var subject:String = argTemp[0];
			var aspect:* = argTemp[1];
			var subjectLower:String = argTemp[0].toLowerCase();
			var aspectLower:* = argTemp[1].toLowerCase();

			if (lookupParserDebug) trace("Doing lookup for subject", subject, " aspect ", aspect);

			// Figure out if we need to capitalize the resulting text
			var capitalize:Boolean = isUpperCase(aspect.charAt(0));


			// Only perform lookup in twoWordNumericTagsLookup if aspect can be cast to a valid number

			if ((subjectLower in twoWordNumericTagsLookup) && !isNaN(Number(aspect)))
			{
				aspectLower = Number(aspectLower);

				if (lookupParserDebug) trace("Found corresponding anonymous function");
				argResult = twoWordNumericTagsLookup[subjectLower](this._ownerClass, aspectLower);
				if (capitalize)
					argResult = capitalizeFirstWord(argResult);
				if (lookupParserDebug) trace("Called two word numeric lookup, return = ", argResult);
				return argResult;
			}

			// aspect isn't a number. Look for subject in the normal twoWordTagsLookup
			if (subjectLower in twoWordTagsLookup)
			{
				if (aspectLower in twoWordTagsLookup[subjectLower])
				{

					if (lookupParserDebug) trace("Found corresponding anonymous function");
					argResult = twoWordTagsLookup[subjectLower][aspectLower](this._ownerClass);
					if (capitalize)
						argResult = capitalizeFirstWord(argResult);
					if (lookupParserDebug) trace("Called two word lookup, return = ", argResult);
					return argResult;
				}
				else
				{
					msg = "!Unknown aspect in two-word tag \"" + inputArg + "\"! ASCII Aspect = \"" + aspectLower + "\"";
					trace("Warning: " + msg);
					return "<b>"+ msg +"</b>";
				}

			}



			if (lookupParserDebug) trace("trying to look-up two-word tag in parent")

			// ---------------------------------------------------------------------------------
			// TODO: Get rid of this shit.
			// UGLY hack to patch legacy functionality in TiTS
			// This needs to go eventually

			var descriptorArray:Array = subject.split(".");

			thing = this.getObjectFromString(this._ownerClass, descriptorArray[0]);
			if (thing == null)		// Completely bad tag
			{
				msg = "!Unknown subject in \"" + inputArg + "\"!"
				return "<b>"+ msg +"</b>";
			}
			if (thing.hasOwnProperty("getDescription") && subject.indexOf(".") > 0)
			{
				if(argTemp.length > 1) {
					return thing.getDescription(descriptorArray[1], aspect);
				}
				else {
					return thing.getDescription(descriptorArray[1], "");
				}
			}
			// end hack
			// ---------------------------------------------------------------------------------

			var aspectLookup:* = this.getObjectFromString(this._ownerClass, aspect);

			if (thing != null)
			{
				if (thing is Function)
				{
					if (lookupParserDebug) trace("Found corresponding function in owner class");
					return thing(aspect);
				}
				else if (thing is Array)
				{
					var indice:Number = Number(aspectLower);
					if (isNaN(indice))
						return "<b>Cannot use non-number as indice to Array \"" + inputArg + "\"! Subject = \"" + subject + ", Aspect = " + aspect + "\</b>";
					else
						return thing[indice]
				}
				else if (thing is Object)
				{

					if (thing.hasOwnProperty(aspectLookup))
						return thing[aspectLookup]

					else if (thing.hasOwnProperty(aspect))
						return thing[aspect]
					else
						return "<b>Object does not have aspect as a member \"" + inputArg + "\"! Subject = \"" + subject + ", Aspect = " + aspect + " or " + aspectLookup + "\</b>";
				}
				else
				{
					// This will work, but I don't know why you'd want to
					// the aspect is just ignored
					if (lookupParserDebug) trace("Found corresponding aspect in owner class");
					return String(thing);
				}
			}

			if (lookupParserDebug) trace("No lookup found for", inputArg, " search result is: ", thing);
			msg = "!Unknown subject in two-word tag \"" + inputArg + "\"! Subject = \"" + subject + ", Aspect = " + aspect + "\"";
			trace("Warning: " + msg);
			return "<b>"+ msg +"</b>";
			// return "<b>!Unknown tag \"" + arg + "\"!</b>";

			return argResult;
		}

		// ---------------------------------------------------------------------------------------------------------------------------------------
		// SCENE PARSING ---------------------------------------------------------------------------------------------------------------
		// ---------------------------------------------------------------------------------------------------------------------------------------


		// attempt to return function "inStr" that is a member of "localThis"
		// Properly handles nested classes/objects, e.g. localThis.herp.derp
		// is returned by getFuncFromString(localThis, "herp.derp");
		// returns the relevant function if it exists, null if it does not.
		private function getObjectFromString(localThis:Object, inStr:String):*
		{
			if (inStr in localThis)
			{
				if (lookupParserDebug) trace("item: ", inStr, " in: ", localThis);
				return localThis[inStr];
			}

			if (inStr.indexOf('.') > 0) // *should* be > -1, but if the string starts with a dot, it can't be a valid reference to a nested class anyways.
			{
				var localReference:String;
				var itemName:String;
				localReference = inStr.substr(0, inStr.indexOf('.'));
				itemName = inStr.substr(inStr.indexOf('.')+1);

				// Debugging, what debugging?
				if (lookupParserDebug) trace("localReference = ", localReference);
				if (lookupParserDebug) trace("itemName = ", itemName);
				if (lookupParserDebug) trace("localThis = \"", localThis, "\"");
				if (lookupParserDebug) trace("dereferenced = ", localThis[localReference]);

				// If we have the localReference as a member of the localThis, call this function again to further for
				// the item itemName in localThis[localReference]
				// This allows arbitrarily-nested data-structures, by recursing over the . structure in inStr
				if (localReference in localThis)
				{
					if (lookupParserDebug) trace("have localReference:", localThis[localReference]);
					return getObjectFromString(localThis[localReference], itemName);
				}
				else
				{
					return null;
				}

			}

			if (lookupParserDebug) trace("item: ", inStr, " NOT in: ", localThis);

			return null;

		}

		private var buttonNum:Number;

		// Parses the contents of a scene tag, shoves the unprocessed text in the scene object (this.parserState)
		// under the proper name.
		// Scenes tagged as such:
		//
		// [sceneName | scene contents blaugh]
		//
		// This gets placed in this.parserState so this.parserState["sceneName"] == "scene contents blaugh"
		//
		// Note that parsing of the actual scene contents is deferred untill it's actually called for display.
		private function parseSceneTag(textCtnt:String):void
		{
			var sceneName:String;
			var sceneCont:String;

			sceneName = textCtnt.substring(textCtnt.indexOf(' ') ,textCtnt.indexOf('|'));
			sceneCont = textCtnt.substr(textCtnt.indexOf('|')+1);

			sceneName = stripStr(sceneName);
			if (sceneParserDebug) trace("Adding scene with name \"" + sceneName + "\"")

			// Cleanup the scene content from spurious leading and trailing space.
			sceneCont = trimStr(sceneCont, "\n");
			sceneCont = trimStr(sceneCont, "	");


			this.parserState[sceneName] = stripStr(sceneCont);

		}

		// Called to determine if the contents of a bracket are a parseable statement or not
		// If the contents *are* a parseable, it calls the relevant function to evaluate it
		// if not, it simply returns the contents as passed
		private function parseNonIfStatement(textCtnt:String, depth:int):String
		{

			var retStr:String = "";
			if (printCcntentDebug) trace("Parsing content string: ", textCtnt);


			if (mainParserDebug) trace("Not an if statement")
				// Match a single word, with no leading or trailing space
			var singleWordTagRegExp:RegExp = /^[\w\.]+$/;
			var doubleWordTagRegExp:RegExp = /^[\w\.]+\s[\w\.\-]+$/;

			if (mainParserDebug) trace("string length = ", textCtnt.length);

			if (singleWordTagRegExp.exec(textCtnt))
			{
				if (mainParserDebug) trace("It's a single word!");
				retStr += convertSingleArg(textCtnt);
			}
			else if (doubleWordTagRegExp.exec(textCtnt))
			{
				if (mainParserDebug) trace("Two-word tag!")
				retStr += convertDoubleArg(textCtnt);
			}
			else
			{
				if (mainParserDebug) trace("Cannot parse content. What?", textCtnt)
				trace("WARNING: !Unknown multi - word tag \"" + retStr + "\"!");
				retStr += "<b>!Unknown multi-word tag \"" + retStr + "\"!</b>";
			}

			return retStr;
		}

		import flash.utils.getQualifiedClassName;


		// Actual internal parser function.
		// textCtnt is the text you want parsed, depth is a number that reflects the current recursion depth
		// You pass in the string you want parsed, and the parsed result is returned as a string.
		private function recParser(textCtnt:String, depth:Number):String
		{
			if (mainParserDebug) trace("Recursion call", depth, "---------------------------------------------+++++++++++++++++++++")
			if (printIntermediateParseStateDebug) trace("Parsing contents = ", textCtnt)
			// Depth tracks our recursion depth
			// Basically, we need to handle things differently on the first execution, so we don't mistake single-word print-statements for
			// a tag. Therefore, every call of recParser increments depth by 1

			depth += 1;
			textCtnt = String(textCtnt);
			if (textCtnt.length == 0)	// Short circuit if we've been passed an empty string
				return "";

			var i:Number = 0;

			var bracketCnt:Number = 0;

			var lastBracket:Number = -1;

			var retStr:String = "";

			do
			{
				lastBracket = textCtnt.indexOf("[", lastBracket+1);
				if (textCtnt.charAt(lastBracket-1) == "\\")
				{
					// trace("bracket is escaped 1", lastBracket);
				}
				else if (lastBracket != -1)
				{
					// trace("need to parse bracket", lastBracket);
					break;
				}

			} while (lastBracket != -1)


			if (lastBracket != -1)		// If we have any open brackets
			{
				for (i = lastBracket; i < textCtnt.length; i += 1)
				{
					if (textCtnt.charAt(i) == "[")
					{
						if (textCtnt.charAt(i-1) != "\\")
						{
							//trace("bracket is not escaped - 2");
							bracketCnt += 1;
						}
					}
					else if (textCtnt.charAt(i) == "]")
					{
						if (textCtnt.charAt(i-1) != "\\")
						{
							//trace("bracket is not escaped - 3");
							bracketCnt -= 1;
						}
					}
					if (bracketCnt == 0)	// We've found the matching closing bracket for the opening bracket at textCtnt[lastBracket]
					{
						var prefixTmp:String, postfixTmp:String;

						// Only prepend the prefix if it actually has content.
						prefixTmp = textCtnt.substring(0, lastBracket);
						if (mainParserDebug) trace("prefix content = ", prefixTmp);
						if (prefixTmp)
							retStr += prefixTmp
						// We know there aren't any brackets in the section before the first opening bracket.
						// therefore, we just add it to the returned string


						var tmpStr:String = textCtnt.substring(lastBracket+1, i);
						// evalForSceneControls swallows scene controls, so they won't get parsed further now.
						// therefore, you could *theoretically* have nested scene pages, though I don't know WHY you'd ever want that.

						if (tmpStr)
						{

							if (printCcntentDebug) trace("Parsing bracket contents = ", tmpStr);
							retStr += parseNonIfStatement(recParser(tmpStr, depth), depth);

						}

						// First parse into the text in the brackets (to resolve any nested brackets)
						// then, eval their contents, in case they're an if-statement or other control-flow thing
						// I haven't implemented yet

						// Only parse the trailing string if it has brackets in it.
						// if not, we need to just return the string as-is.
						// Parsing the trailing string if it doesn't have brackets could lead to it being
						// incorrectly interpreted as a multi-word tag (and shit would asplode and shit)

						postfixTmp = textCtnt.substring(i+1, textCtnt.length);
						if (postfixTmp.indexOf("[") != -1)
						{
							if (printCcntentDebug) trace("Need to parse trailing text", postfixTmp)
							retStr += recParser(postfixTmp, depth);	// Parse the trailing text (if any)
							// Note: This leads to LOTS of recursion. Since we basically call recParser once per
							// tag, it means that if a body of text has 30 tags, we'll end up recursing at least
							// 29 times before finishing.
							// Making this tail-call reursive, or just parsing it flatly may be a much better option in
							// the future, if this does become an issue.
						}
						else
						{
							if (printCcntentDebug) trace("No brackets in trailing text", postfixTmp)
							retStr += postfixTmp;
						}

						return retStr;
						// and return the parsed string
					}
				}
			}
			else
			{
				// DERP. We should never have brackets around something that ISN'T a tag intended to be parsed. Therefore, we just need
				// to determine what type of parsing should be done do the tag.
				if (printCcntentDebug) trace("No brackets present in text passed to recParse", textCtnt);


				retStr += textCtnt;

			}

			return retStr;
		}


		// Main parser function.
		// textCtnt is the text you want parsed, depth is a number, which should be 0
		// or not passed at all.
		// You pass in the string you want parsed, and the parsed result is returned as a string.
		public function recursiveParser(contents:String, parseAsMarkdown:Boolean = false, prettyQuotes:Boolean=true):String
		{
			if (mainParserDebug) trace("------------------ Parser called on string -----------------------");
			// Eventually, when this goes properly class-based, we'll add a period, and have this.parserState.

			// Reset the parser's internal state, since we're parsing a new string:
			// trace("Purging scene parser contents")
			this.parserState = new Object();



			var ret:String = "";
			// Run through the parser
			contents = contents.replace(/\\n/g, "\n")
			ret = recParser(contents, 0);
			if (printIntermediateParseStateDebug) trace("Parser intermediate contents = ", ret)
			// Currently, not parsing text as markdown by default because it's fucking with the line-endings.

			if (prettyQuotes)
			{
				// Convert quotes to prettyQuotes
				ret = this.makeQuotesPrettah(ret);
				// Quote conversion has to go before markdown calls
			}

			if (parseAsMarkdown)
			{
				var regexPCloseTag:RegExp = /<\/p>/gi;
				ret = ret.replace(regexPCloseTag,"</p>\n");
				// Finally, add a additional newline after each closing P tag, because flash only
				// outputs one newline per <p></p> tag, apparently flash again feels the need to be a special snowflake
			}

			// cleanup escaped brackets
			ret = ret.replace(/\\\]/g, "]")
			ret = ret.replace(/\\\[/g, "[")

			// And repeated spaces (this has to be done after markdown processing)
			ret = ret.replace(/  +/g, " ");

			/*
			for (var prop in this.parserState)
			{
				trace("this.parserState."+prop+" = "+this.parserState[prop]);
			}
			*/
			/*APRIL FOOLS!
			ret = ret.replace(/credits/g,"dogecoins");
			ret = ret.replace(/Credits/g,"Dogecoins");
			ret = ret.replace(/ausar/g,"dogesar");
			ret = ret.replace(/Ausar/g,"Dogesar");
			ret = ret.replace(/Anno/g,"Oh-No");
			ret = ret.replace(/ANNO/g,"OH-NO");
			ret = ret.replace(/Syri/g,"ChoderDog");
			ret = ret.replace(/SYRI/g,"CHODERDOG");
			ret = ret.replace(/Kiro/g,"Phallesia");
			ret = ret.replace(/KIRO/g,"PHALLESIA");
			ret = ret.replace(/Penny/g,"Space Urta");
			ret = ret.replace(/PENNY/g,"SPACE URTA");
			ret = ret.replace(/Gianna/g,"Sexbox");
			ret = ret.replace(/GIANNA/g,"SEXBOX");
			ret = ret.replace(/Celise/g,"Slimyface");
			ret = ret.replace(/CELISE/g,"SLIMYFACE");
			ret = ret.replace(/Steele/g,"Steelestein");
			ret = ret.replace(/STEELE/g,"STEELESTEIN");
			ret = ret.replace(/Dane/g,"Cockthulu");
			ret = ret.replace(/DANE/g,"COCKTHULU");
			ret = ret.replace(/Dr. Badger/g,"Dr. Horrible");
			ret = ret.replace(/Dr.Badger/g,"Dr.Horrible");
			ret = ret.replace(/BADGER/g,"HORRIBLE");*/

			//trace(ret);
			// trace("Maintext content @ recursiveParser = ", mainText.htmlText.length)
			return ret

		}

		// ---------------------------------------------------------------------------------------------------------------------------------------
		// ---------------------------------------------------------------------------------------------------------------------------------------
		// ---------------------------------------------------------------------------------------------------------------------------------------

		// Make shit look nice

		private function makeQuotesPrettah(inStr:String):String
		{
			inStr = inStr.replace(/(?<= )'|^'/g,									"‘")
						 .replace(/(?<=\w)'(?![^<]*>)/g,							"’")
						 .replace(/(\w)'(\w)/g,										"$1’$2")
						 .replace(/"(?=<i>)|(?<=<i>)"|^"|(?<=\s)"/g,								"\u201c")
						 .replace(/\"$|\"(?<=[^ ])(?![A-z])/g,						"\u201d")
						 .replace(/--/g,											"\u2014");
			return inStr;
		}


		// ---------------------------------------------------------------------------------------------------------------------------------------
		// ---------------------------------------------------------------------------------------------------------------------------------------
		// ---------------------------------------------------------------------------------------------------------------------------------------

		// Stupid string utility functions, because actionscript doesn't have them (WTF?)

		public function stripStr(str:String):String
		{
			return trimStrBack(trimStrFront(str, " "), " ");
			return trimStrBack(trimStrFront(str, "	"), "	");
		}

		public function trimStr(str:String, char:String = " "):String
		{
			return trimStrBack(trimStrFront(str, char), char);
		}

		public function trimStrFront(str:String, char:String = " "):String
		{
			char = stringToCharacter(char);
			if (str.charAt(0) == char) {
				str = trimStrFront(str.substring(1), char);
			}
			return str;
		}

		public function trimStrBack(str:String, char:String = " "):String
		{
			char = stringToCharacter(char);
			if (str.charAt(str.length - 1) == char) {
				str = trimStrBack(str.substring(0, str.length - 1), char);
			}
			return str;
		}
		public function stringToCharacter(str:String):String
		{
			if (str.length == 1)
			{
				return str;
			}
			return str.slice(0, 1);
		}


		public function isUpperCase(char:String):Boolean
		{
			if (!isNaN(Number(char)))
			{
				return false;
			}
			else if (char == char.toUpperCase())
			{
				return true;
			}
			return false;
		}

		public function capitalizeFirstWord(str:String):String
		{

			str = str.charAt(0).toUpperCase()+str.slice(1);
			return str;
		}

	}
}