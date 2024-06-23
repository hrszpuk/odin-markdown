package md

import "core:fmt"

/* Statement procedures are representative of markdown constructs.
 * There are usually three procedures for each construct:
 * 1. *_string will take a string and return a Statement. This is for standard usage: text("text")
 * 2. *_statement will take a Statement and return a Statement. This is for chained usage: link(bold("click here"), "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
 * 3. The explicitly overloaded procedure that simplifies the library's API (i.e. text() instead of text_string() or text_statement()).
 */