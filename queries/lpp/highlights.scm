; Highlighting queries for lpp files
; Basic syntax highlighting for structural elements

; Macro constructs
(macro_call "@" @Operator)
(macro_capture "[" @punctuation.bracket)
(macro_capture "]" @punctuation.bracket)
(macro_tuple_args "(" @punctuation.bracket)
(macro_tuple_args ")" @punctuation.bracket)
(lua_inline "(" @punctuation.bracket)
(lua_inline ")" @punctuation.bracket)
(macro_name_part) @macro_identifier_func
(macro_dot) @punctuation.delimiter
(macro_dot_ident) @macro_identifier_func
(macro_colon) @punctuation.delimiter
(macro_method_ident) @macro_identifier_part
(macro_capture "[" @punctuation.bracket)
(macro_capture "]" @punctuation.bracket)
(macro_string_arg) @string
(inner_string) @string

; Lua markers - use Operator color
(lua_line_marker) @Operator
(lua_block "$$$" @Operator)
(lua_inline "$" @Operator)

; Escape sequences
(escape_sequence) @string.escape
