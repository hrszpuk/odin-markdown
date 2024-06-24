package md
/* WIP
parse :: proc(content: string) -> Document {
    doc := make(Document)
    current_type := StatementType.Text
    buffer := strings.builder_make_len_cap(0, 10)
    skip := false

    for c in content {
        if skip {
           strings.write_rune(&buffer, c)
            if c == '\n' {
                skip = false
                append(&doc, Statement{strings.clone(strings.to_string(buffer)), current_type})
                strings.builder_reset(buffer)
            }
        } else {
            switch c {
            case '#': current_type = .Header1
             }
        }
    }
}*/