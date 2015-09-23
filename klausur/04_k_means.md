# k-Means Algorithmus

Aufgabe des Algorithmus ist es, eine Menge von Objekten automatisch in
$k$ Cluster zu zerlegen. Objekte liegen als Vektoren vor. Algorithmus verwendet
Abstandsmaß, z.B. euklidische Distanz, oder Winkel der Vektoren.

Naiver Algorithmus:
```
1. Wähle k Objekte aus
2. Für jedes Objekt der k Objekte
   Erstelle ein neues Cluster
   Der Mittelpunkt des Clusters ist durch den Vektor des Objektes bestimmt

3. Füge jedes Objekt dem Cluster hinzu, dem es am nächsten ist
4. Berechne den Mittelpunkt des Cluster aus allen Punkten im Cluster neue

5. Wiederhole 3. und 4. solange, bis sich Cluster nicht mehr ändern
```
Man kann die Cluster auch erst nach Schritt 5 erstellen.
