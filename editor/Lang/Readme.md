# Language
|Description              |Symbol|
|-------------------------|-----|
|repeat zero or more times|  ~  |
|alternation              | \|  |
|concatenation            |  ,  |
|exception                |  -  |
|string literal           |"..."|
|group                    |(...)|

|Name     | Value
|---------|--------
|text     | `anything - "["`
|identity | `text - ("."|" ")`
|action   | `identity , ~("." , identity )`
|arg      | `" " , (number|text)`
|result   | `"|" , code`
|code     | `text , "[" , action , ~arg , ~result , "]" , text`
> Some information on the language definition can be found here
https://github.com/end5/SceneWriter/blob/master/Editor/Parser/LangDef.txt

# How it works: Lex -> Parse -> Interpret
## Lexer
The Lexer reads text and produces a list of Tokens.
A Token is a labeled section of the text.

|Token Type     |Description    |
|---------------|---------------|
|Escape         | "\\"          |
|BracketOpen    | "["           |
|BracketClose   | "]"           |
|Pipe           | "\|"          |
|Dot            | "."           |
|String         | any text      |
|Space          | "  "          |
|Identity       | variable name |
|Newline        | "\n"          |
|Error          | an error      |

Examples:
> `This is text.`
```
String: "This is text."
```
> `My name is [pc.name]`
```
String: "My name is "
BracketOpen: "["
Identity: "pc"
Dot: "."
Identity: "name"
BracketClose: "]"
```
> `Silly mode is [silly|enabled|disabled].`
```
String: "Silly mode is "
BracketOpen: "["
Identity: "silly"
Pipe: "|"
String: "enabled"
Pipe: "|"
String: "disabled"
BracketClose: "]"
String: "."
```
## Parser
The Parser reads a list of Tokens and formulates it into a tree structure using Nodes (AST aka Abstract Syntax Tree).
Each Node has a type and either a value or children (list of Node).

|Node Type  |Value |Children                   |
|-----------|----- |---------------------------|
|Identity   |name  |                           |
|String     |text  |                           |
|Number     |number|                           |
|Concat     |      |list of String/Eval        |
|Eval       |      |Retrieve, Args, Results    |
|Retrieve   |      |list of Identity           |
|Args       |      |list of String/Number      |
|Results    |      |list of Concat/String/Eval |
|Error      |error |                           |

Examples:
> `This is text.`
```
String: "This is text."
```
> `My name is [pc.name]`
```
Concat
┣━ String: "My name is "
┣━ Eval
┣━ Retrieve
┃   ┣━ Identity: "pc"
┃   ┗━ Identity: "name"
┣━ Args
┗━ Results
```
> `Silly mode is [silly|enabled|disabled].`
```
Concat
┣━ String: "Silly mode is "
┣━ Eval
┃   ┣━ Retrieve
┃   ┃   ┗━ Identity: "silly"
┃   ┣━ Args
┃   ┗━ Results
┃       ┣━ String: "enabled"
┃       ┗━ String: "disabled"
┗━ String: ".""
```
### Interpreter
The Interpreter traverses a tree of Nodes (AST) and produces text.
Each Node has a specific operation determined by its type.

|Node Type  |Return Type           |Operation & Output
|-----------|----------------------|----------
|Identity   |string                |its value
|String     |string                |its value
|Number     |number                |its value
|Concat     |string                |combine/concat all children
|Eval       |string                |evaluate/call the output of Retrieve using/passing the output of Args and Results
|Retrieve   |anything              |retrieve the value from memory using its children
|Args       |list of string/number |a list of the output of its children
|Results    |list of string        |a list of the output of its children
|Error      |string                |its value

Examples:
> `This is text.`
```
String = "This is text."
```
> `My name is [pc.name]`
Memory: `pc.name` = `Penny`
```
Concat = "My name is Penny"
┣━ String = "My name is "
┗━ Eval = "Penny"
    ┣━ Retrieve = "Penny"
    ┃   ┣━ Identity = "pc"
    ┃   ┗━ Identity = "name"
    ┣━ Args = empty list
    ┗━ Results = empty list
```
> `Silly mode is [silly|enabled|disabled].`
Memory: `silly` = `false`
```
Concat = "Silly mode is disabled."
┣━ String = "Silly mode is "
┣━ Eval = "disabled"
┃   ┣━ Retrieve = false
┃   ┃   ┗━ Identity = "silly"
┃   ┣━ Args = empty list
┃   ┗━ Results = ["enabled", "disabled"]
┃       ┣━ String = "enabled"
┃       ┗━ String = "disabled"
┗━ String = "."
```
