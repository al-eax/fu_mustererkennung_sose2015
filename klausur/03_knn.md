# k-nearest neighbors (KNN)

* Objekte sind durch Vektoren definiert. Eigenschaften der Objekte sind
 Zahlen (Skalare) des Vektors.

* Trainingsdaten sind bereits klassifiziert.

* Will man ein neues Objekt klassifizieren, sucht man die $k$ nächsten Objekte aus den Trainingsdaten, anhand eines Abstandsmaß. Als Abstandsmaß kann die euklidische Distanz, aber auch der Winkel zwischen den Vektoren verwendet werden. Auch der Hemmingabstand bei Texten ist möglich.

* Hat man $k$ Nachbarn, so wertet man die Klasse aus, die am häufigsten in den Nachbarn vorkommt. Zu dieser Klasse wird das neue Objekt klassifiziert.

* Um keine 50/50 Ergebnisse zu erhalten, sollte man bei zwei Klassen $k$ ungerade wählen, bzw. bei mehreren Klassen $k$ sollte die Anzahl der Klassen nicht teilen.

* Der naivste, einfachste Algorithmus zur Bestimmung der $k$ nächsten Nachbarn:

```
Für jedes Objekt der Trainingsdaten:
   berechne Distanz zum neuen Objekt z.B. durch euklidische Distanz
   speichere Distanz in Liste

Sortiere Liste nach Distanz.
```

* ist jedoch sehr Aufwändig, deshalb lieber KD-Bäume o.ä.

* [deutsche Wikipediaartikel zu KNN](1)

[1]:https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm
