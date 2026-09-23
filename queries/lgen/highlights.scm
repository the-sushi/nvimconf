; Highlighting for lgen files.

(comment) @comment

(":" @punctuation)
(";" @punctuation)
("," @punctuation)
("^" @punctuation)

("{" @punctuation.bracket)
("}" @punctuation.bracket)
("<" @punctuation.bracket)
(">" @punctuation.bracket)
("[" @punctuation.bracket)
("]" @punctuation.bracket)
("(" @punctuation.bracket)
(")" @punctuation.bracket)

(declspec "*" @operator)
(declspec "&" @operator)

("struct" @keyword)
("abstract" @keyword)
("root" @keyword)
("profile" @keyword)
("unique" @keyword)
("override" @keyword)
("trait" @keyword)
("fun" @keyword)
("var" @keyword)
("enum" @keyword)
("init" @keyword)
("has" @keyword)
("const" @keyword)
("flags" @keyword)
("trailing" @keyword)

(struct_decl (identifier) @type)

(struct_body "{" @punctuation.bracket)
(struct_body "}" @punctuation.bracket)

(base_clause (identifier) @type)
(base_clause ":" @punctuation)

(field (identifier) @variable)

(typespec (identifier) @type)

(attributes (identifier) @attribute)
(attributes ":" @punctuation)

(method (identifier) @function)

(method_params (identifier) @variable.parameter)

(init_constructor (identifier) @variable.parameter)

(enum_decl (identifier) @type)
(enum_body (identifier) @constant)

(trait_decl (identifier) @type)
(has_trait (identifier) @type)

(flags (identifier) @type)
