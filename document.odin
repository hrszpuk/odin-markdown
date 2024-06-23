package md

Document :: [dynamic]Statement

Statement :: struct {
    str: string,
    type: string
}

StatementType :: enum {
    Empty,
    Text,
    Header1,
    Header2,
    Header3,
    Header4,
    Header5,
    Header6,
    List,
    NumberedList,
    CheckboxList,
    Link,
    Blockquote,
    Codeblock,
    Hr,
    Table,
    TableHeader,
    TableRow
}

new_document :: proc() -> Document {
    return make([dynamic]Statement)
}

destroy_document :: proc(doc: Document) {
    delete(doc)
}

