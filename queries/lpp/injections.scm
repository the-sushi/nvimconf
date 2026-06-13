; Injection queries for lpp — inject Lua and C++ for syntax highlighting

;; Lua line - now just the content, no offset needed
((lua_line) @injection.content
 (#set! injection.language "lua")
 (#set! injection.combined))

;; Lua block - inject the content child directly (doesn't include $$$ markers)
((lua_block
   (lua_block_content) @injection.content)
 (#set! injection.language "lua")
 (#set! injection.combined))

;; Lua inline - inject the whole node but offset to skip $( prefix and ) suffix
((lua_inline) @injection.content
 (#offset! @injection.content 0 2 0 -1)
 (#set! injection.language "lua"))

;; Document text as C++
((doc_text) @injection.content
 (#set! injection.language "cpp")
 (#set! injection.combined))

;; Macro arg raw as C++
((macro_arg_raw) @injection.content
 (#set! injection.language "cpp"))
