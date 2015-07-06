0;
%macht [a,b,c] zu [a,b,c,1]
function e = add1(o)
  [h,w] = size(o);
  e = ones(h,w + 1);
  e(1,1:w) = o(1:w);  
endfunction

function [W1,W2] = createRanwomW1W2(m,n,k)
  W1 = rand(n + 1,k);
  W2 = rand(k + 1,m);
endfunction

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

function n = numToOutput(i)
  n = zeros(1,10);
  n(1,i+1) = 1;
endfunction

function n = outputToNum(o2)
  [x,y] = max(o2);
  n = y;
endfunction

data = load("/home/alex/fu_mustererkennung_sose2015/zettel09/pendigits-training.txt");
testData = load("/home/alex/fu_mustererkennung_sose2015/zettel09/pendigits-training.txt");
lines = size(data,1);

n = 16; %input
k = 2; %hiddeen units
m = 10; %output units

[W1,W2] = createRanwomW1W2(m,n,k)

for i = 1:100000
  currentLine = data(mod(i,lines)+1,:);
  expected = currentLine(1,17);
  [o1,o2] = net(currentLine(1,1:16),W1,W2,m,n,k);
  [D1,D2] = createD1D2(o1,o2,m,k);
  W22 = W2(1:k,1:m);
  e = o2 - numToOutput(expected);
  
  delta2 = D2*transpose(e);
  delta1 = D1*W22*delta2;
  
  dW2T = -0.10*delta2*add1(o1);
  dW1T = -0.10*delta1*add1(currentLine(1,1:16));

  W1 = W1 + transpose(dW1T);
  W2 = W2 + transpose(dW2T);
endfor

lines = size(testData,1);
for i = 1:lines
  currentLine = testData(i,:);
  [o1,o2] = net(currentLine(1,1:16),W1,W2,m,n,k);
  expected = currentLine(1,17);

  fprintf("%d. expected %d      predicted %d\n", i , expected, outputToNum(o2));
endfor