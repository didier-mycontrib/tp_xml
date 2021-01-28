define function liste_sujet($b)
{
<html><body><ul>
 {
 for $s in $b/bibliographie/sujet
 return <li>{$s/titre/text()}</li>
 }
</ul></body></html>
}

liste_sujet(document("../xml/biblio.xml"))

