# Normalverteilung und Kovarianzmatrix

## Normalverteilung für eine Dimension
Haben Trainingsdaten, können daraus Erwartungswert bestimmen.
Können auch bestimmen, wir stark die Daten vom Erwartungswert abweichen (Varianz).
Daraus lässt sich Normalverteilung bestimmen:
$f(x) = \frac{1}{\sqrt{2*\pi*varianz}} * exp(- \frac{(x - Erwartungswert)^2}{2*varianz}) = \frac{1}{\sqrt{2*\pi*\sigma^2}} * exp(- \frac{(x - \mu)^2}{2*\sigma^2}) $

Man geht davon aus, dass sich die Eigenschaften neuer Objekte nach der Normalverteilung verhalten. Wenn der Erwartungswert des Alters von Schulabgängern z.B. bei 18 Jahren berechnet wurde, und die Varianz sehr gering ist, geht man davon aus, dass die meisten der künftigen Schulabgänger ebenfalls um die 18 Jahre alt ist.

Hat man nun zwei Klassen, kann man für jede Klasse eine neue Normalverteilungsfunktion berechnen und dann schauen, in welcher Klasse ein Objekt wahrscheinlicher auftaucht.

## multivariate Normalverteilung für mehrere Merkmake (mehrdimensional)
Gibt kaum unterschiede zur eindimensionalen Normalverteilung.

Als Eingabe hat man nun einen Vektor und nicht nur einen einfachen Wert.

Anstatt einem Erwartungswert hat man einen Erwartungsvektor, der ebenfalls mit $\mu$ bezeichnet wird. Der lässt sich einfach als Durchschnitt aller Vektoren berechnen.

Anstatt einer Varianz $\sigma$, hat man eine Kovarianzmatrix $\Sigma$. Berechnung der Matrix wird in anderem Dokument erklärt.

Wenn man $p$-dimensionale Verteilung möchte, dann gilt

$f(x)= \frac{1}{\sqrt{(2\pi)^p} * det(\Sigma)} * exp(-\frac{1}{2} (x-\mu)^T\Sigma^{-1}(x-\mu))$
