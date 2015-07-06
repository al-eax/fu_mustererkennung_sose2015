0;

function s = sig(x)
  s = 1/(1  + exp(-x));
endfunction

inputUnits = 2;
hiddenUnits = 2;
outputUnits = 1;


n = inputUnits
k = hiddenUnits
m = outputUnits

%TODO negative Werte zulassen
M1 = rand(n + 1,k)
M2 = rand(k + 1,m)

function r = net(input, M1, M2, m, n , k)
  ot = [input(1,1) , input(1,2) , 1]
  o11 = ot * M1;

  o1 = o11;
  for i = 1:k
    o1(1,i) = sig(o11(1,i));
  endfor

  %TODO warum 3 ? Wert 3 berechnen
  o1t = zeros(1,3);
  for i = 1:2
    o1t(1,i) = o1(1,i);
  endfor
  o1t(1,3) = 1;

  o2 = o1t * M2;
  for i = 1:m
    o2(1,i) = sig(o1(1,i));
  endfor
  o2
endfunction

train = [0 , 0 , 0;
         1 , 0 , 1;
         0 , 1 , 1;
         1 , 1 , 0];
         
%TODO 4 = height(train)
error = 0;
errorQuad = 0;
for i = 1:4
  o2 = net(train(i,1:2),M1,M2,m,n,k);
  t = train(i,3);
  error += (o2 - t);
  errorQuad += power((o2 - t)/2);
endfor

error
errorQuad