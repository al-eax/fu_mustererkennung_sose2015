0;

function s = sig(x)
  s = 1/(1  + exp(-x));
endfunction

function e = add1(o)
  [h,w] = size(o);
  e = ones(h,w + 1);
  e(1,1:w) = o(1:w);  
endfunction

function e = rem1(o)
  [h,w] = size(o);
  e = o(1,1:w-1);
endfunction

inputUnits = 2;
hiddenUnits = 2;
outputUnits = 1;


n = inputUnits
k = hiddenUnits
m = outputUnits

%TODO negative Werte zulassen
W1 = rand(n + 1,k)
W2 = rand(k + 1,m)

function [r1,r2] = net(input, W1, W2, m, n , k)
  ot = [input(1,1) , input(1,2) , 1];
  o11 = ot * W1;

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

  o2 = o1t * W2;
  for i = 1:m
    o2(1,i) = sig(o1(1,i));
  endfor
  %TODO o1t ohne die Erweiterte 1 benutzen !!
  r1 = o1t(1:2);
  r2 = o2;
endfunction

train = [0 , 0 , 0;
         1 , 0 , 1;
         0 , 1 , 1;
         1 , 1 , 0];
         
%TODO 4 = height(train)
error = 0;
errorQuad = 0;
%for i = 1:4
%  [o1,o2] = net(train(i,1:2),W1,W2,m,n,k)
%  t = train(i,3);
%  error += (o2 - t);
%  errorQuad += power((o2 - t)/2,2);
%endfor

[o1,o2] = net([0 , 0 , 0],W1,W2,m,n,k)
D2 = zeros(m,m);
l = 1;
for x = 1:m
  for y = 1:m
    if x==y
      D2(x,y) = o2(1,l);
      l += 1;
    endif
  endfor
endfor
D2

D1 = zeros(k,k);
l = 1;
for x = 1:k
  for y = 1:k
    if x==y
      D1(x,y) = o1(1,l);
      l += 1;
    endif
  endfor
endfor
D1
W11 = W1(1:n,1:k)
W22 = W2(1:k,1:m)
e = o2 - 0; %o2 - t
delta2 = D2*e
delta1 = D1*W22*delta2

dW2T = -1*delta2*add1(o1)
dW1T = -1*delta1*add1([0,0])

W1 = W1 + transpose(dW1T)
W2 = W2 + transpose(dW2T)