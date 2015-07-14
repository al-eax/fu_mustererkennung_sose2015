0;
%macht [a,b,c] zu [a,b,c,1]
function e = add1(o)
  [h,w] = size(o);
  e = ones(h,w + 1);
  e(1,1:w) = o(1:w);  
endfunction

function s = sig(x)
  s = 1.0/(1.0  + exp(-x));
endfunction

function [W1,W2] = createRanwomW1W2(m,n,k)
  W1 = zeros(n + 1,k) - 0.5;
  W2 = zeros(k + 1,m) - 0.5;
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
  n = y-1;
endfunction

function n = normDigit(d)
  points = zeros(8,2);
  points(1,:) = d(1,1:2);
  points(2,:) = d(1,3:4);
  points(3,:) = d(1,5:6);
  points(4,:) = d(1,7:8);
  points(5,:) = d(1,9:10);
  points(6,:) = d(1,11:12);
  points(7,:) = d(1,13:14);
  points(8,:) = d(1,15:16);
  m = norm(points(1,:));
  maxIndex = 1;
  for i = 1: size(points,1)
    if norm(points(i,:)) > m
      maxIndex = i;
      m = norm(points(i,:));
    endif
  endfor
  
  n = d / m;
endfunction


function error = getPowErrorSum(resultMat, expectedNumber)
  error = 0;
  e1 = numToOutput(expectedNumber);
  %outputToNum(resultMat)
  %expectedNumber
  
  for i = 1:size(e1,1)
    error += power(e1(i,1) - resultMat(i,1),2);
  endfor
endfunction

data = load("/home/alex/fu_mustererkennung_sose2015/zettel09/pendigits-training.txt");
data = data(1:60,:);

testData = load("/home/alex/fu_mustererkennung_sose2015/zettel09/pendigits-training.txt");
testData = testData(61:90,:);
lines = size(data,1);

n = 16; %input
k = 16; %hidden units
m = 10; %output units
lernkonstante = -1;

%Netz trainieren
[W1,W2] = createRanwomW1W2(m,n,k);
u = 1000
for foo = 1:u
  trainingError = 0;
  for i = 1:lines
    currentLine = data(i,:);
    expected = currentLine(1,17);
    input = normDigit(currentLine(1,1:16));
    [o1,o2] = net(input,W1,W2,m,n,k);
    [D1,D2] = createD1D2(o1,o2,m,k);
    W22 = W2(1:k,1:m);
    e = o2 - numToOutput(expected);
    
    delta2 = D2*transpose(e);
    delta1 = D1*W22*delta2;
    
    dW2T = lernkonstante*delta2*add1(o1);
    dW1T = lernkonstante*delta1*add1(input);

    W1 = W1 + transpose(dW1T);
    W2 = W2 + transpose(dW2T);
    trainingError = getPowErrorSum(o2,expected);
  endfor
  
  %Netz anwenden
  for i = 1:size(testData,1)
    currentLine = testData(i,:);
    [o1,o2] = net(normDigit(currentLine(1,1:16)),W1,W2,m,n,k);
    expected = currentLine(1,17);
    validError = getPowErrorSum(o2,expected);
  endfor
  %fprintf("got it %f ~ %f\n", trainingError,validError);
  if trainingError > validError
    foo
    trainingError
    validError
    fprintf("iterations: %d got it %f > %f\n",foo, trainingError,validError);
    break;
  endif
endfor
u
fprintf("done\n");


