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

    fmt.println(write_to_string(doc))
    destroy_document(doc)
}