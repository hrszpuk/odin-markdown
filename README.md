# odin-markdown
Reading and writing markdown (.md) files with Odin.

## Example
```
package main

import md "external/odin-markdown"

main :: proc() {
  md::new()

  md::load(...)
  md::load_from_file()
  md::load_from_string()

  md::text("text", italics=true, bold=true, strikethrough=true, superscript=true, subscript=true)
  md::h1("header 1") // alias: md::headerX("")
  md::h2("header 2")
  md::h3("header 3")
  md::h4("header 4")
  md::h5("header 5")
  md::h6("header 6")
  md::list(string[dynamic]{}, ordered=false, checkbox=false)
  md::link("text", "link")
  md::blockquote("text")
  md::codeblock("text", language="odin")
  md::hr()
  md::table()
  md::table_header()
  md::table_row()

  md::write(...)
  md::write_to_file()
  md::write_to_string()
}
