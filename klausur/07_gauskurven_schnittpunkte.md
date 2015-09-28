# Schnitte von Gaußkurven

$f(x_i) = \frac{1}{\sqrt{2\pi\sigma^2_i}} * exp(\frac{-(x_i-\mu_i)^2}{2\sigma_i^2})$

__Anmerkung__ $\mu$ gibt den Hochpunkt der Kurve an. $\mu $ gibt die Streckung an.
 ![foo](https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Normal_Distribution_PDF.svg/720px-Normal_Distribution_PDF.svg.png)

__Haben folgende Fälle:__
* Varianz und Erwartungswert sind gleich, __dann unendlich Schnittpunkte__
* Erwartungswert $\mu$ ist gleich, muss zwei Schnittpunkte geben
$$
\frac{1}{\sqrt{2\pi\sigma_1^2}} * exp(\frac{-(x-\mu)^2}{2\sigma_1^2}) = \frac{1}{\sqrt{2\pi\sigma_2^2}} * exp(\frac{-(x-\mu)^2}{2\sigma_2^2})\\...
$$
* Varianz $\sigma^2$ ist gleich, muss einen Schnittpunkt geben
$$
\frac{1}{\sqrt{2\pi\sigma^2}} * exp(\frac{-(x-\mu_1)^2}{2\sigma^2}) = \frac{1}{\sqrt{2\pi\sigma^2}} * exp(\frac{-(x-\mu_2)^2}{2\sigma^2})
\\
exp(\frac{-(x-\mu_1)^2}{2\sigma^2}) = exp(\frac{-(x-\mu_2)^2}{2\sigma^2})
\\
\frac{-(x-\mu_1)^2}{2\sigma^2} = \frac{-(x-\mu_2)^2}{2\sigma^2}
\\
x^2 -2x\mu_1 + \mu_1^2 = x^2 -2x\mu_2 + \mu_2^2\\
-2x\mu_1  + 2x\mu_2  = \mu_2^2 - \mu_1^2\\
...
$$
weiter auflösen.
* $\mu_1 \not= \mu_2$ und $\sigma_1^2 \not= \sigma_2^2$ gibt eine oder zwei Schnittpunkte
