# Perzeptron Lernalgorithmus
ermöglicht boolsche Funktionen darzustellen, die linear separierbar sind.
XOR lässt sich z.B. nicht darstellen.

[Gutes YT Tutorial Part1 ](https://www.youtube.com/watch?v=ldBsf7qJCMI)
[Part 2](https://www.youtube.com/watch?v=SPwZ6CnoBQM)
[weiteres gutes YT Video](https://www.youtube.com/watch?v=xTg9gklMWJA)

## Aufbau des Perzeptrons

Besteht aus einem Eingabevektor $v$, einem Gewichtsvektor $w$.
Außerdem gibt es einen Lerngeschwindigkeits-Koeffizient  $\alpha$, der anfangs
festgelegt werden muss.
Gewichtsvektor wird Anfangs auf $(0,0)^T$ gesetzt.

Man muss sich festlegen, ob das Perzeptron klassifizieren soll, dann muss
ein Schwellwert $\theta$ definiert werden, oder ob es z.B. ganze Zahlen ausgeben soll.


## Aktivierungsfunktion
Die [Aktivierungsfunktion](https://de.wikipedia.org/wiki/K%C3%BCnstliches_Neuron#Aktivierungsfunktionen) beschreibt, wie sich das Perzeptron verhält, bzw was es als Ergebnis ausgibt.
In unserem Beispiel wird die Schwellwertfunktion verwendet, um zu klassifizieren.

## Lernalgorithmus

Wir behandeln die Klassifizierung.

$D = $ Trainingsdaten (z.B. Punkte in einer Klausur). $Y = $ Ergebnismenge, $1=$ bestanden, $0=$ nicht bestanden.

* Perzeptron soll berechnen, ob Klausur bestanden wurde, oder nicht.
* $\alpha = 1$
* $\theta = 0$ bedeutet, alles größer $0$ steht für bestanden. Alles kleiner-gliehc $0$ nicht bestanden.

* Für jeden Vektor $v$ im Trainingsdatensatz,
  * multipliziere $v$ mit Gewichtsvektor $w$ (Skalarprodukt) und gucke, ob $\theta$ überschritten wurde : if $v*w > \theta$.
  * Wenn ja, dann $vorhersage = 1$, ansonsten $vorhersage = 0$
  * Prüfe jetzt Vorhersage mit richtigem Ergebnis aus $Y$.
  * Wenn $vorhersage == 0 $ aber $richtigesErgebnis==1$
      * Korrigiere nach oben $w = w + \alpha * v$
  * Wenn $vorhersage == 1$ aber $richtigesErgebnis==0$
      * Korrigiere nach unten $w = w - \alpha * v$
* Wiederhole ganz oft.
 ```
 close all
 data = dlmread('klausur.txt')
 p = [data(data(:,2)==1) ones(length(data(data(:,2)==1)),1)] %bestandene Klausuren
 n = [data(data(:,2)==0) ones(length(data(data(:,2)==0)),1)] %nicht bestandene Klausuren
 w=[0,0] %initialwert
 t=0 % Anzahl der falschen Vorhersagen
 for i=0:100
     idx = randperm(length(data),1); %zufällige Klausur
     x = [data(idx,1) 1]; %Punkte der Klausur
     class_x = data(idx,2); %bestanden/durchgefallen
     dot_wx = dot(w,x); %Verrechne Daten mit Gewichten
     if (class_x == 0)
        if (dot_wx>=0) %Wenn Klausur eigentlich bestanden, aber falsch vorhergesagt, weil dot_w >=0 ----> bestanden
            w=w-x %korrigiere w. Es wurde 0 erwartet, aber 1 gefunden, deshalb abziehen.
            t = t+1
        end
     else
        if (dot_wx<=0) %
            w=w+x
            t = t+1
        end
     end
 end
 ```
## Bias-Neuron
Manchmal erweitert man das Perzeptron um einen weiteren Eingabewert, der immer fest ist z.B. 1 oder -1.
Damit bekommt man eine gewisse Festigkeit in das Perzeptron.

Wenn man vorher einen Eingabevektor $v = (v_1,v_2...v_n)^T$ hatte, macht man daraus jetzt einfach $v = (1, v_1,v_2...v_n)^T$ oder $v = (-1, v_1,v_2...v_n)^T$. Der Gewichtsvektor muss dann um ein Element erweitert werden.
