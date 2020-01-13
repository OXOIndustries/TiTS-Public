Build using TiTSFDEditor.as3proj

# Language
|Description             |Symbol|
|-------------------------|-----|
|repeat zero or more times|  ~  |
|alternation              | \|  |
|concatenation            |  ,  |
|string literal           |"..."|
|group                    |(...)|

`this` = `text , "[" , identity , ~("." , identity ) , ~(" " , (number|text)) , ~("|" , this) , "]" , text`
> Some language information can be found here
https://github.com/end5/SceneWriter/blob/master/Editor/Parser/LangDef.txt

# How it works
### Lex -> Parse -> Interpret
    Lex: Read the text and create tokens
    Parse: Read the tokens and create an AST (Abstract Syntax Tree)
    Interpret: Interpret the AST and an object to create result text
Code in "editor/Descriptors" is what the interpreter can access. Starts with "TiTSDescriptor".
