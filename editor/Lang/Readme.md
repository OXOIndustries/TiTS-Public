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
The Lexer reads text and groups the characters together to create a Token.

|Token Type     |Symbol
|---------------|------
|Text           | anything except symbols below
|Space          | "  "
|Tab            | "\t"
|Newline        | "\n"
|LeftBracket    | "["
|RightBracket   | "]"
|Dot            | "."
|Pipe           | "\|"
|GreaterThan    | ">"
|Equal          | "="

Examples:
> `This is text.`
```
Text: "This"
Space: " "
Text: "is"
Space: " "
Text: "text"
Dot: "."
```
> `My name is [pc.name]`
```
Text: "My"
Space: " "
Text: "name"
Space: " "
Text: "is"
Space: " "
LeftBracket: "["
Text: "pc"
Dot: "."
Text: "name"
RightBracket: "]"
```
> `Silly mode is [silly|enabled|disabled].`
```
Text: "Silly"
Space: " "
Text: "mode"
Space: " "
Text: "is"
Space: " "
LeftBracket: "["
Text: "silly"
Pipe: "|"
Text: "enabled"
Pipe: "|"
Text: "disabled"
RightBracket: "]"
Dot: "."
```
## Parser
The Parser reads each Token from the Lexer looking for a pattern.
If the Tokens match the pattern, the Parser creates a Node.Using the pattern, The Nodes are organized into a tree structure (AST aka Abstract Syntax Tree).
Each Node has a type, a value and children (list of Nodes).

|Node Type  |Value         |Children
|-----------|--------------|--------
|Identity   |string        |
|String     |string        |
|Number     |number        |
|Concat     |              |list of Node Type String or Eval
|Eval       |operator(int) |[Node Type Retrieve, Node Type Args, Node Type Results]
|Retrieve   |              |list of Node Type Identity
|Args       |              |list of Node Type String or Number
|Results    |              |list of Node Type Concat or String or Eval

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
|Eval       |string                |depending on its value, evaluate/call the output of Retrieve using/passing the output of Args and Results
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
