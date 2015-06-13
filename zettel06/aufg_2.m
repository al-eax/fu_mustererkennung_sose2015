klausuren = importdata('/home/alex/fu_mustererkennung_sose2015/zettel06/klausur.txt');

function plotTrainedData(w, klausuren)
  wr = [w(2,1)/-w(1,1) ; 1];
  fprintf("schwellwert %f\n", wr(1,1));
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
  endfor
endfunction

function matrix = swap(foo,idx_a,idx_b)
   matrix = foo;
   col_a = matrix(idx_a,:);
   matrix(idx_a,:) = matrix(idx_b,:);
   matrix(idx_b,:) = col_a;
endfunction

function r = randomize(r)
  [height,width] = size(r);
  for i = 1:100
    a = randi(height);
    b = randi(height);
    r = swap(r,a,b);
  endfor
endfunction

klausuren = randomize(klausuren);
w = [0;0];
k = 0;
for i = 1:100
  klausuren = randomize(klausuren);
  [x,y] = train(klausuren,w);
  w = x;
  k += w(1,1);
endfor
fprintf("Durschnittlicher Schwellwert %f\n", (k/100));