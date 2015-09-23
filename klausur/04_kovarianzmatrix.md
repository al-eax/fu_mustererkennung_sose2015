# Kovarianzmatrix

__Kovarianz__ beschreibt den Zusammenhang zwischen zwei Zufallsvariablen.

## Erwartungswert $\mu$
Ist die Summe der Werte, multipliziert mit deren Wahrscheinlichkeit:
$E(X) = \sum_i (x_i * P(X=x_i))$ Wenn alle Werte die gleiche Wahrscheinlichkeit haben (z.B. beim Würfel), dann ist $P(X=x_i)$ immer gleich, $P(X=x_i) = \frac{1}{n}$

Dann ist Erwartungswert der Durchschnitt gemeint.

Für mehrdimensionale Vektoren ist $\mu$ dann ebenfalls die Summe aller Vektoren, geteilt durch die Anzahl der Vektoren: $\mu = \frac{1}{n} \sum_{i=1..n}x_i$

$\mu$ ist in dem Falle dann ein Vektor. Die Komponenten des Vektors, sind die Erwartungswerte der einzelnen Merkmale, also der einzelnen Komponenten der Vektoren.

## Varianz $\sigma^2$
Summe der quadratischen Aweichungen der Werte vom Erwartungswert $\mu$ bzw. Durchschnitt. $var(X)= \sigma^2 = \frac{1}{n}\sum(x_i - \mu)^2$


Für mehrdimensionale Vektoren wird die Abweichung komponentenweise berechnet. $var(X)= \sigma^2 =  \frac{1}{n} \sum_{j=1} ( (x_{j 1} - \mu_{1})^2 ,(x_{j 2} - \mu_{2})^2 , ...)^T$

Am Ende hat man einen Vektor, bei dem jede Komponente die Varianz des Merkmals enthält.

## Kovarianz
Für die Kovarianz von zwei Zufallsvariablen $X , Y$ werden die Abweichungen von Werten und Erwartungswert $\mu_a , \mu_b$ multupliziert und aufsummiert. Berechnung ist also ähnlich, wie bei Varianz:
 $Cov(X,Y) =  \frac{1}{n} \sum_{j=1..n} (x_{j} - \mu_x) * (y_{ j} - \mu_y ) $

__Sonderfall__ wenn $X=Y$ ist, dann ist $Con(X,X)=var(X)$

## Kovarianzmatrix
Haben einen Zufallsvektor $x = (x_1,x_2,...x_n)$ mit $n$ Elementen. Jedes Element ist eine Zufallsvariable.

Erstellen jetzt $n \times n $ Matrix $C$, sodass paarweise Kovarianz aller Zufallsvariablen berechnet wird. D.h. $C_{j,k} = cov(x_j,x_k)$.
* Matrix ist gespiegelt
* auf der Diagonalen sind Varianzen der Zufallsvariablen
