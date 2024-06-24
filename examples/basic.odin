package basic

import md ".."
import "core:fmt"

main :: proc() {
    using md

    doc := document(
        text("test"),
        bold("bold"),
        link(bold("click here"), "rickroll"),
        h1("Welcome"),
    )

    write_to_file(doc, "test.md")
    destroy_document(doc)
}