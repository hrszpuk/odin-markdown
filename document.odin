package md

Document :: [dynamic]Statement

document :: proc(whatever: ..any) -> Document {
    yourmum := make([dynamic]Statement)

    for thingymabob in whatever {
        switch ting in thingymabob {
        case string: append(&yourmum, Statement{thingymabob.(string), .Text})
        case Statement: append(&yourmum, thingymabob.(Statement))
        case: delete(yourmum); return nil // Cry about it
        }
    }

    return yourmum
}

destroy_document :: proc(doc: Document) {
    for stmt in doc {
        delete(stmt.str)
    }
    delete(doc)
}
