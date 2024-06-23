package md

Statement :: struct {
    str: string,
    type: StatementType
}

StatementType :: enum {
    Text,
    Header1,
    Header2,
    Header3,
    Header4,
    Header5,
    Header6,
    List,
    NumberedList,
    TaskList,
    Link,
    Blockquote,
    Codeblock,
    Hr,
    Table,
    Row
}