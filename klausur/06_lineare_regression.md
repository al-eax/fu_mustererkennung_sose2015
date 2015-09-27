# lineare Regression

## Aus Tutorial von Rojas
Haben mehrdimensional Daten (z.B. 3D) wollen, diese linear aproximieren.

$y = X*\phi + e$

$y$ ist der vorherzusagende Wert, $X$ sind die vorhandenen Daten (Datenmatrix), wobei in
der ersten Spalte nur $1$ vorkommt.
$\phi$ ist beinhaltet die Werte der linearen Aproximation.

__Berechnung von $\phi$:__

Brauchen Datenmatrix $X$, ohne die Werte, die später vorhergesagt werden sollen.
$y$ sind Werte, die später vorhergesagt werden sollen.

$\phi = (X^T * X)^{-1} * X^T * y$


Matlabcode zur vorhersage der Größe
```
X = data(: , 2:3); %Hole Alter und Temperatur
y = data(: , 4:4); %Hole Groesse

function phi = calcPhi(X,y)
  phi = inv(transpose(X) * X) * transpose(X) * y;
endfunction

phi = calcPhi(X,y);

newY = X * phi; %Vorhersage der Groesse
```
Code von Nico (phi = beta):
```
y = A(:,4);  % nur die Laengen der Fische
Z = A(:,2:3);  % alle Datenpunkte, ausser Laenge
onesVector = ones(size(Z,1), 1); % Spaltenvektor mit Einsen der gleichen Laenge wie A
X = horzcat(onesVector, Z);  % Einsen-Vektor an Datenpunkte-Matrix drankleben

% X' ist die transponierte Matrix X
beta = inv(X'*X) * X' * y;  % beta ist der Vektor, mit dem Eingabedaten multipliziert werden muessen, damit wir an di
```
