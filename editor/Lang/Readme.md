# Language
|Description             |Symbol|
|-------------------------|-----|
|repeat zero or more times|  ~  |
|alternation              | \|  |
|concatenation            |  ,  |
|exception                |  -  |
|string literal           |"..."|
|group                    |(...)|

`text` = `anything - "["`
`identity` = `text - ("."|" ")`
`action` = `identity , ~("." , identity )`
`arg` = `" " , (number|text)`
`result` = `"|" , code`
`code` = `text , "[" , action , ~arg , ~result , "]" , text`
> Some language information can be found here
https://github.com/end5/SceneWriter/blob/master/Editor/Parser/LangDef.txt

## How it works
### Lex -> Parse -> Interpret
    Lex: Read the text and create tokens
    Parse: Read the tokens and create an AST (Abstract Syntax Tree)
    Interpret: Interpret the AST and an object to create result text
