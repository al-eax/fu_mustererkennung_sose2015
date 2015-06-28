
klausuren = importdata('/home/alex/fu_mustererkennung_sose2015/zettel06/klausur.txt');


function g = lineareRegression(data)
    [h,w] = size(data);
    Abweichungssumme = 0;
    xSchnitt = sum(data(:,1))/h
    ySchnitt = sum(data(:,2))/h
    bO=0;
    bU=0;
   
    for i = 1:h
      bO += (data(i,1)-xSchnitt)*(data(i,2)-ySchnitt); 
      bU += (data(i,1)-xSchnitt)^2;
    endfor
    
    b = bO/bU
    a = ySchnitt - (b )*xSchnitt
    g = [a,b]
endfunction

function t = lg(x, ab)
  t = ab(1,1)+ab(1,2)*x;
endfunction

function t = lgg(x,ab)
  k = lg(x,ab);
  if k > 0.5
    t = 1;
    else 
   t = 0;
   endif
endfunction

ab = lineareRegression(klausuren);

plot( [-10:10],lg([-10:10],ab));hold on;

[height,w] = size(klausuren);

 for i = 1:height
   klausuren(i,2);
   lgg(klausuren(i,1),ab);
   fprintf("\n");
endfor


function plotTrainedData(klausuren)
  axis("equal"); hold on;
  [height, width] = size(klausuren);
  for i = 1:height
    if klausuren(i,2) == 0
      %nicht bestanden
      plot(klausuren(i,1),0,"r."); hold on;
    else
      %bestanden
      plot(klausuren(i,1),1,"b."); hold on;
    endif
  endfor
endfunction

plotTrainedData(klausuren);

schwellwert = (0.5 - ab(1,1)) / ab(1,2)
plot(schwellwert,0.5,"k."); hold on;