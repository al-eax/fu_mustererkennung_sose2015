# Bayes-Klassifikator

__TODO__ Aprioti WKT, Aposteriori WKT

Naiver Bayes-Klassifikator beruht auf der Annahme, dass Merkmale unabhängig voneinander sind.

__Satz von Bays__ definiert bedingte Wahrscheinlichkeit. Beschreibt Wahrscheinlichkeit,
dass ein Ereignis $A$ eintritt, unter der Bedingung, dass vorher das Ereignis $B$
eingetreten ist:
$P(A|B) = \frac{P(B|A) * P(A)}{P(B)}$

Angewendet als Klassifikator ist $A$ eine Klasse von mehreren Klassen,
$B$ eine Menge von Merkmalen eines Objektes.

Gesucht wird die Klasse, bei der die Wahrscheinlichkeit am größten ist,
dass ein neues Objekt zu der Klasse gehört:

$a_{besteKlasse} = max_{a \in A}(P(a|b_1,b_2,b_3...))$

Hierbei sind b1,b2,b3... die Merkmale des neuen Objektes. Die Formel lässt sich umformen:
$a_{besteKlasse} =  max_{a \in A}(\frac{P(b1,b2,b3...|a) * P(a)}{P(b1,b2,b3...)})$

__Berechnung__
Hierzu wird der Trainingsdatensatz verwendet
* $P(a)$ ist die Wahrscheinlichkeit, dass $a$ auftritt. Wenn es 3 Klassen gibt, und 30% der Trainingsdaten in der Klasse $a_1$ liegen, dann ist $P(a_1) = 0.3$
* $P(b1,b2,b3...) = 1$, denn es soll nur EIN neues Objekt klassifiziert werden und die Wahrscheinlichkeit, dass genau dieses klassifiziert wird liegt bei 100%.
* $P(b1,b2,b3...|a)$ kann man schwer berechnen, denn der Testdatensatz müsste alle Kombinationen der Merkmake $b1,b2,b3...$ aufweisen. Deshalb vereinfacht
__Naiver Bayes-Klassifikator__ zu $P(b1,b2,b3|a) = P(b1|a)*P(b2|a)*P(b3|a)*...$
Das lässt sich aus den Trainingsdaten ablesen. Bei $P(b_1|a)$ betrachte alle Trainingsdaten in Klasse $a$. Wenn 20% von den Trainingsdaten aus $a$ das Merkmal $b_1$ haben, dann ist $P(b_1|a) = 0.2$

__Vereinfachung__

Nach obigen Überlegungen lässt sich der naive Bayes-Klassifikator vereinfachen zu: $a_besteKlasse = P(b1,b2,b3...|a) * P(a)$

__Links__
* [Gute Beschreibung und sehr gutes Beispiel](1)
* [Nochmals die vereinfachte Formel](2)

[1]:http://his.anthropomatik.kit.edu/users/loesch/LaborWissRepr-DHBW-KA-2011WS/downloads/Repetition-Naive_Bayesian_Networks.pdf
[2]:http://optiv.de/Methoden/KlassMet/index.htm?9
