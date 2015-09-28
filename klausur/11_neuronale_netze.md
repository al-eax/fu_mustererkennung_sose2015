# Neuronales Netz
* [Rojas Tutorial](http://page.mi.fu-berlin.de/rojas/neural/chapter/K7.pdf)

Netz besteht aus mehreren Schichten (Layern).

![foo](https://upload.wikimedia.org/wikipedia/commons/3/3d/Neural_network.svg)

__Eingabeschicht:__ Werte werden an Eingabeschicht gegeben (i.d.R. als Eingabevektor). Kann eine Biaseingabe erhalten.

__Hidden Layers:__ unsichtbare Schicht aus mehreren Perzeptronen.

__Ausgabeschicht:__ Ergebnis der Berechnung

__Gewichte__ werden an den Kanten definiert. Wenn man insgesamt $n$
Schichten hat, hat man $n-1$ Gewichtsmatritzen (Connectionsmatrix).

Zwischen zwei Schichten $S_1, S_2$ gibt es eine Gewichtsmatrix
$M_{1,2}$.
Wenn $S_1$ m Perzeptronen und $S_2$ k Perzeptronen hat, ist $M_{1,2} \in R^{n \times k}$ also $n$ breit und $k$ hoch.

Die Gewichte in der Matrix sind wie folgt angeordnet: $w_{i,j}$
Steht an der Stelle $i,j$ in $M_{1,2}$, wobei $i$ das Perzeptron ist, von dem der Wert kommt und $j$ das Perzeptron ist, welches den Wert empfängt, nachdem das Gewicht multipliziert wurde.



__Aktivierungsfunktion__ ist meistens Sigmond $sig(x)$

__Berechnung__

Wenn Daten von Schicht $S_1$ an $S_2$ an $S_3$ überführt werden sollen, erstelle Gewichtsmatritzen $M_{1,2}, M_{2,3}$.
Eingabevektor multiplozieren $M_{1,2} * v_1$. Auf die einzelnen Elemente des Ergebnisvektors wird die Aktivierungsfunktion angewendet: $v_2 = sig(M_{1,2} * v_1)$.
$v_2$ ist Ausgabe von Schicht $S_2$ und Eingabe von $S_3$

$v_3 = sig(M_{2,3} * v_2)$ ist Ausgabe von Schicht $S_3$

Es ist wichtig, sich die einzelnen Zwischenwerte $v_1, v_2, v_3 ..v_n$ zu merken, sind die Zwischenergebnisse der einzelnen Schichten.

__Feed-forward computation__
* Durchlaufe Berechnung wir oben beschrieben und merke $v_1, v_2, v_3 ... v_{n}$

__backpropagation des Outputlayers__

berechne backpropagated Error $\delta$. Das ist ein Vektor, der aus dem vorhergesachten Ergebis des Netzes $v_{ergebnis}$ und dem eigentlichen Ergebnisvektor $t$ der Trainingsdaten berechnet wird:

$\delta = v_{n} * ( (1,1,1...)^T - v_{n}) * (v_{n} - t)$

__backpropagation der inneren Layer__

Haben $\delta_n$ backpropagated Error der Ausgabeschicht. Berechnen nun $\delta_{n-1}$, der vorherigen Schicht $n-1$:
$\delta_{n-1} = v_{n-1} * (1 - v_{n-1} ) * (M_{n-1 , n} * \delta_n)$, Wobei $M_{n-1 ,n}$ die Gewichtsmatrix der Ausgabeschicht und der letzten inneren/versteckten Schicht ist.

Widerhole obiges, bis alle Layer durchlaufen wurde, und $\delta_1 ,\delta_2 ... \delta_n$ berechnet wurden.

__Gewichte aktualisieren__

Das Gewicht $w_{i,j}$ aus der Gewichtsmatrix $M_{k,l}$ der Schichten $S_k, S_l$ mit $v_k$



#Backpropagaztion-Algorithmus mit Matrizen
