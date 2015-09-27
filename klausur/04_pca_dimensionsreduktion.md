# PCA/Dimensionsreduktion/Hauptkomponentenanalyse

Problem: haben große Datensätze mit vielen Merkmalen, d.h. Raum der
Vektoren hat eine hohe Dimension.

Möchten Dimension gerne verringern, um leichter Rechnen zu können.
Frage: Welche Merkmale kann man sich sparen ?

Hierzu werden Hauptkomponenten gesucht.
In einem k-Dimensionalen Raum, suchen wir k Hauptkomponenten.
Eine Hauptkomponente ist eine Gerade, die durch den Datensatz geht.

die 1. Hauptkomponente soll den Datensatz so durchlaufen, dass die Abstände aller
Punkte zu der Linie so gering wie möglich ist.

die 2. Hauptkomponente ist ebenfalls eine Linie und durquärt den Mittelpunkt
aller Punkte. Außerdem muss sie orthogonal (im rechte Winkel) auf der 1. Hauptkomponente stehen. Hauptkomponente soll so ausgferichtet sein, dass sie entlang der größten Streuung geht

die 3. Hauptkomponente ist ebenfalls eine Linie und durquärt den Mittelpunkt
aller Punkte. Außerdem muss sie orthogonal (im rechte Winkel) auf der 2. Hauptkomponente stehen.  Hauptkomponente soll so ausgferichtet sein, dass sie entlang der größten Streuung geht

...

Anschließend berechnet man eine Transformationsmatrix. Aus den berechneren Hauptkomponenten
wird ein neues Koordinatensystem erstellt, die Daten werden in dieses neue Koordinatensystem überführt.

Jetzt lässt sich einfach abrechnen, auf welcher Achse die Daten am wenigsten streuen.
Diese Achse wird dann weggelassen, damit verlieren die Daten eine Dimension.

## Mathematische Berechnung

* [Gutes Skript](ftp://ftp.ifn-magdeburg.de/pub/MBLehre/sv06_130509-ftp.pdf)

Berechne Erwartungsvektor der Daten. Subtrahiere dann von jedem Vektor den Erwartungsvektor.

So erhält man eine neue Datenmenge, die im Erwartungsvektor zentriert ist und den Nullvektor als Erwartungsvektor hat.

Berechne Kovarianzmatrix $C$ vom neuen Datensatz.
Wenn Kovarianzmatrix matrix $ n \times n $  ist, so besitzt sie $n$ Eigenvektoren
mit Eigenwerten. Eigenvektoren stehen orthogonal zueinander.

Sei $D$ Matrix, wobei Eigenwerte auf der Diagonalen liegen und absteigend sortiert sind, rest ist 0.
