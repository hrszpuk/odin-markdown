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

// h1 (and h1_*) procedures create a h1 element.
// The h1 element is any text appended with #. Equivalent HTML tag would be <h1></h1>.
header1 :: h1
h1 :: proc{h1_string, h1_statement}

h1_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("# %s", text), .Header1}
}

h1_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("# %s", stmt.str), .Header1}
}

// h2 (and h2_*) procedures create a h1 element.
// The h2 element is any text appended with ##. Equivalent HTML tag would be <h2></h2>.
header2 :: h2
h2 :: proc{h2_string, h2_statement}

h2_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("## %s", text), .Header2}
}

h2_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("## %s", stmt.str), .Header2}
}

// h3 (and h3_*) procedures create a h3 element.
// The h3 element is any text appended with ###. Equivalent HTML tag would be <h3></h3>.
header3 :: h3
h3 :: proc{h3_string, h3_statement}

h3_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("### %s", text), .Header3}
}

h3_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("### %s", text), .Header3}
}

// h4 (and h4_*) procedures create a h4 element.
// The h4 element is any text appended with ####. Equivalent HTML tag would be <h4></h4>.
header4 :: h4
h4 :: proc{h4_string, h4_statement}

h4_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("#### %s", text), .Header4}
}

h4_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("#### %s", text), .Header4}
}

// h5 (and h5_*) procedures create a h5 element.
// The h5 element is any text appended with #####. Equivalent HTML tag would be <h5></h5>.
header5 :: h5
h5 :: proc{h5_string, h5_statement}

h5_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("##### %s", text), .Header5}
}

h5_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("##### %s", text), .Header5}
}

// h6 (and h6_*) procedures create a h6 element.
// The h6 element is any text appended with ######. Equivalent HTML tag would be <h6></h6>.
header6 :: h6
h6 :: proc{h6_string, h6_statement}

h6_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("###### %s", text), .Header6}
}

h6_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("###### %s", text), .Header6}
}


// link (and link_*) procedures create a link element.
// The link element is made using the syntax [text](link).
// Equivalent HTML tag would be <a href=></a>.
link :: proc{link_string_string, link_statement_string, link_string_statement, link_statement_statement}

link_string_string :: proc(display_text: string, link_text: string) -> Statement {
    return Statement{fmt.aprintf("[%s](%s)", display_text, link_text), .Link}
}

link_statement_string :: proc(display_text: Statement, link_text: string) -> Statement {
    return Statement{fmt.aprintf("[%s](%s)", display_text.str, link_text), .Link}
}

link_string_statement :: proc(display_text: string, link_text: Statement) -> Statement {
    return Statement{fmt.aprintf("[%s](%s)", display_text, link_text.str), .Link}
}

link_statement_statement :: proc(display_text: Statement, link_text: Statement) -> Statement {
    return Statement{fmt.aprintf("[%s](%s)", display_text.str, link_text.str), .Link}
}

// hr (and hr_*) procedures create a hr element.
// The h6 element is a horizontal rule. Equivalent HTML tag would be <hr></hr>.
hr :: proc() -> Statement {
    return Statement{"---", .Hr}
}

// blockquote (and blockquote_*) procedures create a blockquote element.
// The blockquote element is any text appended with >. Equivalent HTML tag would be <blockquote></blockquote>.
blockquote :: proc{blockquote_string, blockquote_statement}

blockquote_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("> %s", text), .Blockquote}
}

blockquote_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("> %s", stmt.str), .Blockquote}
}

// codeblock (and codeblock_*) procedures create a codeblock element.
// The codeblock element is made using the syntax `text`. Equivalent HTML tag would be <code></code>.
codeblock :: proc{codeblock_string, codeblock_statement}

codeblock_string :: proc(text: string) -> Statement {
    return Statement{fmt.aprintf("`%s`", text), .Codeblock}
}

codeblock_statement :: proc(stmt: Statement) -> Statement {
    return Statement{fmt.aprintf("`%s`", stmt.str), .Codeblock}
}

// The list procedure creates a list element.
// The list element is made by printing each given string on a new line with a prefix.
// The prefix is customisable through the prefix argument (default: "- ").
// Equivalent HTML tag would be <ul></ul> with each given string being <li></li>.
list :: proc(elements: ..$E, prefix := "- ") -> Statement {
    out := ""
    for element in elements {
        switch type_of(element) {
        case string: out += fmt.aprintf("%s%s\ņ", prefix, element)
        case Statement: out += fmt.aprintf("%s%s\ņ", prefix, element.str)
        case: out += fmt.aprintf("%s%v\ņ", prefix, element)
        }
    }
    return Statement{out, .List}
}

// The numbered_list procedure creates a numbered list element.
// The numbered list element is made by printing each given string on a new line with a prefix.
// The prefix starts at 1 and increase by 1 for each line generated..
// Equivalent HTML tag would be <ol></ol> with each given string being <li></li>.
numbered_list :: proc(elements: ..$E) -> Statement {
    out := ""
    i := 1
    for element in elements {
        switch type_of(element) {
        case string: out += fmt.aprintf("%d. %s\ņ", i, element)
        case Statement: out += fmt.aprintf("%d. %s\ņ", i, element.str)
        case: out += fmt.aprintf("%d. %v\ņ", i, element)
        }
        i += 1
    }
    return Statement{out, .NumberedList}
}

// The task_list procedure creates a task list element.
// The task list element is made by printing each given string on a new line with a prefix.
// The prefix is customisable by the prefix argument (default: "- ") but will always be followed by "[ ]" (empty checkbox).
// Equivalent HTML tag would be <ol></ol> with each given string being <li></li>.
task_list :: proc(elements: ..$E, prefix := "- ") -> Statement {
    out := ""
    for element in elements {
        switch type_of(element) {
        case string: out += fmt.aprintf("%s[ ] %s\ņ", prefix, element)
        case Statement: out += fmt.aprintf("%s[ ] %s\ņ", prefix, element.str)
        case: out += fmt.aprintf("%s[ ] %v\ņ", prefix, element)
        }
    }
    return Statement{out, .TaskList}
}







