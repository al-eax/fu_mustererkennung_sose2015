#logistische Regression
Wird zur Klassifizierung eingesetzt, wenn __nur__ zwei Klassen z.B. ja/nein, krank/gesund... bestehen (binäre Klassifizierung).

Haben wieder Trainingsdatenmenge.

__Beispiel:__ Man soll Anhand des Mietpreises in Euro entscheiden, ob man umzieht, oder nicht. Man soll Anhand einer Anzahl an Metern entscheiden, ob das Tor getroffen wird, oder nicht.


__Wahrscheinlichkeitsfunktion:__
$p(x,\beta) = \frac{exp(\beta^T *x)}{1 +exp(\beta^T *x)}$

$\beta$ bekommt anfangs einen festen Wert: $(0,0)^T$. Dann wird iterativ $\beta$ optimiert.

__Berechnung von neuem $\beta$__
$Schrittweite$ muss gegeben sein (z.B. $10^{-7}$)
berechne $\Delta  l(\beta) = \sum( x_i(y_i - p(x,\beta) )$. Daten stammen aus Trainingsdatensatz, $x_i$ ist Merkmal, $y_i$ ist Klasse 1 oder 0.
Jetzt $\beta$ optimieren: $new\beta = \beta + Schrittweite * \Delta  l(\beta) $

Diese Berechnung wird mehrmals widerholt (z.B. 100000 mal)

__Musterlösung Code__
```
data = dlmread('fieldgoal.txt');
X = [ones(size(data,1),1) data(:,1)]; % Meter
y = data(:,2); % Klassifizierte Werte
beta = zeros(2,1); %Startwert für Beta = (0,0)


for i=1:100000 %Anzahl der Iterationen um gutes beta zu finden.

  p_x_beta = exp(X*beta)./(1.+exp(X*beta)); % Wahrscheinlichkeitsfunktion

  delta = X'*(y-p_x_beta); % Berechne deltaL(x,beta)
  beta = beta + (10e-7)*delta; % optimiere Beta


endfor

t=X*beta;
%p_x_beta = 1./(1.+exp(-t));
p_x_beta = exp(t)./(1.+exp(t));
delta = X'*(y-p_x_beta);
sum(abs(y-p_x_beta))


toplot_x = (0:100)';
t_tmp=[ones(size(toplot_x,1),1) toplot_x]*beta;
toplot_y = 1./(1.+exp(-t_tmp));

hold off
plot(toplot_x,toplot_y);
hold on
plot(X(:,2),y,'o');

```
