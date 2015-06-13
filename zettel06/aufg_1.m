klausuren = importdata('/home/alex/fu_mustererkennung_sose2015/zettel06/klausur.txt');



function plotTrainedData(w, klausuren)
  wr = -[w(2,1) ; -w(1,1)]*2;
  axis("equal"); hold on;
  plot([0,w(1,1)],[0,w(2,1)]); hold on;
  plot([0,wr(1,1)],[0,wr(2,1)],"g-"); hold on;
  [height, width] = size(klausuren);
  for i = 1:height
    if klausuren(i,2) == 0
      %nicht bestanden
      plot(klausuren(i,1),1,"r."); hold on;
    else
      %bestanden
      plot(klausuren(i,1),1,"b."); hold on;
    endif
  endfor
endfunction

function [w1,e1] = train(klausuren,w1)
  e1 = 0;
  w = w1;
  [height, width] = size(klausuren);
  for i = 1:height
    erwarted = klausuren(i,2);
    note = klausuren(i,1);
    klausur = [note;1];
    vorhergesagt = dot(w1,klausur);
    if vorhergesagt > 0
      vorhergesagt = 1;
    else
      vorhergesagt = 0;
    endif
    %Korrektur des Vektors w
    if erwarted == 1 && vorhergesagt == 0
       w1 += klausur;
       w1 = w1/norm(w1);
    elseif erwarted == 0 && vorhergesagt == 1
       w1 -= klausur;
       w1 = w1/norm(w1);
    endif
    e1 += abs(erwarted - vorhergesagt);
    if w(1,1) != w1(1,1) ||  w(2,1) != w1(2,1) 
      w = w1;
      figure;
      plotTrainedData(w1,klausuren);
    endif
  endfor
endfunction

[height,width] = size(klausuren);
w = [0;0];
e = height;
while e > 0
 
  [x,y] = train(klausuren,w);
  w = x;
  e = y % fehler ausgeben lassen
endwhile

