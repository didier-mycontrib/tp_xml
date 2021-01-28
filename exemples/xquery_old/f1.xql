<html>{
  let $subject := document("../xml/biblio.xml")/bibliographie/sujet[2]
  for $book in $subject/livre
     where $book/@prix > 30
    return <h2>{$book/titre}</h2>
}</html>
