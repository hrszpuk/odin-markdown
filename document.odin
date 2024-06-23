package md

Document :: [dynamic]Statement

document :: proc(whatever: ..$E) -> Document {
    yourmum := make([dynamic]Statement)

    for thingymabob in whatever {
        switch type_of(thingymabob) {
        case string: append(&yourmum, Statement{thingymabob, .Text})
        case Statement: append(&yourmum, thingymabob)
        case: append(&yourmum, Statement{string(thingymabob), .Text}) // If the cast fails then fuck you
        }
    }

    return yourmum
}
