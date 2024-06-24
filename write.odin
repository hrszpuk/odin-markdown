package md

import "core:strings"

write_to_file :: proc(doc: Document, filename: string) -> bool {
    return false
}

write_to_string :: proc(doc: Document) -> string {
    out := strings.builder_make_len_cap(0, len(doc)*10)
    defer strings.builder_destroy(&out)

    for statement in doc {
        strings.write_string(&out, statement.str)
        strings.write_rune(&out, '\n')
    }

    return strings.clone(strings.to_string(out))
}