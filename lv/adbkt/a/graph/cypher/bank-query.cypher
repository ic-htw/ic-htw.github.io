call db.schema.visualization()

MATCH (b:Bank)
RETURN b;
// Diagramm zeigen

MATCH (b:Bank)
RETURN b.name;
// Text

MATCH (b:Bank {name: 'Deutsche Bank'})
RETURN b;
// Diagramm und Table
