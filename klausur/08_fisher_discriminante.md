# Fisher Discriminante

Haben zwei Klassen $A,B$ und Trainingsdaten als Punktewolken. Suchen jetzt einen Vektor $w$, auf den wir die Punkte abbilden können. $w$ soll so gewählt werden, dass die projezierten Punkte so abgebildet werdne, dass die Klassen am besten unterschieden werden können.

* [gutes Paper](http://subs.emis.de/LNI/Dissertation/Dissertation3/GI-Dissertations.03-7.pdf)

![foo](https://www.projectrhea.org/rhea/images/e/ea/FLD_OldKiwi.jpg)

Nachdem man alle Punkte auf $w$ projeziert hat, lässt sich eine Normalverteilung auf $w$ darstellen.

## Berechnung von $w$
Brauchen Schwerpunkte der Punktewolken, also Mittelpunkt:

$m_A = \frac{1}{n}\sum_{a\in A} a$
$m_B = \frac{1}{n}\sum_{b\in B} b$

Anschließend wird der quadratische Abstand der Punkte zum jeweiligen Mittelpunkt berechnet. Die quadratischen Abstände werden anschließend addiert:
$  S_w = \sum_{a\in A} (a - m_A)^2 + \sum_{b\in B} (b - m_B)^2$

Jetzt $w$ berechnen durch:
$w = S_w^{-1} * (m_B - m_A)$

##Projektion auf $w$
Normiere $w = \frac{w}{|w|}$, jetzt Skalarprodukt verwenden, um Punkte auf $w$ zu projezieren.

## Berechnung der Discriminante
Haben bereits Schwerpunkte/Mittelpunkte. Berechne jetzt noch Varianz beider Punktewolken. Projeziere beide Mittelpunkte & Varianzen mit Skalarprodukt auf $w$ und berechne mit den Projektionen eine Normalverteilung.

Berechne jetzt Schnittpunkt $w_0$ der beiden Normalverteilungen.
