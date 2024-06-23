package md

import "core:fmt"

/* Statement procedures are representative of markdown constructs.
 * There are usually three procedures for each construct:
 * 1. *_string will take a string and return a Statement. This is for standard usage: text("text")
 * 2. *_statement will take a Statement and return a Statement. This is for chained usage: link(bold("click here"), "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
 * 3. The explicitly overloaded procedure that simplifies the library's API (i.e. text() instead of text_string() or text_statement()).
 */

// text (and text_*) procedures create a basic text element.
// The text element is any written content. Equivalent HTML tag would be <p></p>.
text :: proc{text_string, text_statement}

text_string :: proc(text: string) -> Statement {
    return Statement{text, .Text}
}

text_statement :: proc(stmt: Statement) -> Statement {
    return Statement{stmt.str, .Text}
}

// bold (and bold_*) procedures create a "text" element.
// The text inside is made bold using **text** syntax. Equivalent HTML tag would be <b></b>.
bold :: proc{bold_string, bold_statement}

bold_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("**%s**", text), .Text}
}

bold_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("**%s**", stmt.str), .Text}
}

// italics (and italics_*) procedures create a "text" element.
// The text inside is made italic using *text* syntax. Equivalent HTML tag would be <i></i>.
italics :: proc{italics_string, italics_statement}

italics_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("*%s*", text), .Text}
}

italics_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("*%s*", stmt.str), .Text}
}

// strikethrough (and strikethrough_*) procedures create a "text" element.
// The text inside is made strikethrough using ~~text~~ syntax. Equivalent HTML tag would be <s></s>.
strikethrough :: proc{strikethrough_string, strikethrough_statement}

strikethrough_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("~~%s~~", text), .Text}
}

strikethrough_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("~~%s~~", stmt.str), .Text}
}







