# odin-markdown
Reading and writing markdown (.md) files with Odin.

## Demo
```
package main

import md "external/odin-markdown"

main :: proc() {
  using md
  
  // Load a markdown file
  doc, ok := md.load_from_file()
  doc, ok := md.load_from_string()

  // Create a new markdown file
  doc = document(
    text("text"),
    h1("header 1"), // alias: md::headerX("")
    h2("header 2"),
    h3("header 3"),
    h4("header 4"),
    h5(link("header 5", "#header-6")), // Embed elements
    h6(bold("header 6")),
    list("1", "2", bold("3")),
    link(italics("text"), "link"),
    blockquote("text"),
    codeblock("text", language="odin"),
    hr(),
    table(row("#", "Name", "Age"), row("0", "John", "89")),
  )
  
  // Modify a markdown file
  // - Use standard Odin built-in array procedures (https://odin-lang.org/docs/overview/#dynamic-arrays)
  elem := doc[8]
  assign_at(&doc, 1, checklist("1", "2", strikethrough("3"))
  inject_at(&doc, 1, text("text"))
  append(&doc, text("text"))
  pop(&doc)
  ordered_remove(&doc, 2)
  
  // Write a markdown file
  err := md.write_to_file(doc, "README.md")
  str, err = md.write_to_string(doc); defer delete(str)
  
  // Delete the markdown file data ;)
  delete(doc) 
}
```

## Installation


## Contributing
