0;

% [a,b,c] -> [a,b,c,1]
function e = add1(o)
  [h,w] = size(o);
  e = ones(h,w + 1);
  e(1,1:w) = o(1:w);  
endfunction

% sigmoide Funktion
function s = sig(x)
  s = 1.0/(1.0  + exp(-x));
endfunction

%Erstellt zwei zufällige Matrizen
function [W1,W2] = createRanwomW1W2(m,n,k)
  W1 = rand(n + 1,k);
  W2 = rand(k + 1,m);
endfunction

%Berechnet Diagonalmatrizen mit Ableitungen
function [D1,D2] = createD1D2(o1,o2,m,k)
  D1 = zeros(k,k);
  l = 1;
  for x = 1:k
    D1(x,x) = o1(1,x) * (1-o1(1,x));
  endfor

  D2 = zeros(m,m);

  for x = 1:m
    D2(x,x) = o2(1,x) * (1 - o2(1,x));
  endfor
endfunction

%Neuronales Netz sagt einen Wert vorher
function [r1,r2] = net(input, W1, W2, m, n , k)
  ot = add1(input);
  o11 = ot * W1;

  o1 = o11;
  for i = 1:k
    o1(1,i) = sig(o11(1,i));
  endfor
  
  o2 = add1(o1) * W2;
  for i = 1:m
    o2(1,i) = sig(o2(1,i));
  endfor
  r1 = o1;
  r2 = o2;
endfunction


n = 2; %input
k = 2; %hiddeen units
m = 1; %output units

trainData = [0,0,0;
             1,0,1;
             0,1,1;
             1,1,0];
lines = size(trainData,1);

[W1,W2] = createRanwomW1W2(m,n,k)
for i = 1:50000
   
    currentLine = trainData(mod(i,4)+1,:);
    expected = currentLine(1,3);
    [o1,o2] = net(currentLine(1,1:2),W1,W2,m,n,k);
    [D1,D2] = createD1D2(o1,o2,m,k);
    W22 = W2(1:k,1:m);
    e = o2 - (expected);
    
    delta2 = D2*transpose(e);
    delta1 = D1*W22*delta2;
    
    dW2T = -0.1*delta2*add1(o1);
    dW1T = -0.1*delta1*add1(currentLine(1,1:2));

    W1 = W1 + transpose(dW1T);
    W2 = W2 + transpose(dW2T);
endfor

for i = 1:lines
  currentLine = trainData(i,:);
  [o1,o2] = net(currentLine(1,1:2),W1,W2,m,n,k);
  expected = currentLine(1,3);
  predicted = round(o2);
  fprintf("%d. expected %d      predicted %d\n", i , expected, predicted);
endfor
W1
W2
