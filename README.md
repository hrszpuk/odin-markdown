# odin-markdown
Reading and writing markdown (.md) files with Odin.

## Example
```
package main

import md "external/odin-markdown"

main :: proc() {
  doc := md::new_document()

  doc, ok := md::load_from_file()
  doc, ok := md::load_from_string()

  md::text(doc, "text", italics=true, bold=true, strikethrough=true)
  md::h1(doc, "header 1") // alias: md::headerX("")
  md::h2(doc, "header 2")
  md::h3(doc, "header 3")
  md::h4(doc, "header 4")
  md::h5(doc, "header 5")
  md::h6(doc, "header 6")
  md::list(doc, string[dynamic]{}, ordered=false, checkbox=false)
  md::link(doc, "text", "link")
  md::blockquote(doc, "text")
  md::codeblock(doc, "text", language="odin")
  md::hr(doc)
  md::table(doc, )
  md::table_header(doc, "#", "Name", "Age")
  md::table_row(doc, "0", "John", "89")
  
  md::write_to_file(doc, "README.md")
  md::write_to_string(doc)
  
  md::destroy_document(doc)
}
