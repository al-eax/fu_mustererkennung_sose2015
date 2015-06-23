data = importdata('/home/alex/fu_mustererkennung_sose2015/zettel07/fieldgoal.txt');

function e = error(beta,data)
  [h,w] = size(data);
  e = 0;
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    extendedX = [1;x];
    expected = p(extendedX,beta);
    e += abs(y - expected);
  endfor
endfunction

function w = p(x,b)
   w = 1 - 1/(1+exp(transpose(b)*x));
endfunction

function b = lBeta(beta,data)
  b = 0;
  [h,w] = size(data);
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    extendedX = [1;x];
    b += extendedX*(y- p(extendedX,beta));
  endfor
endfunction

function b = nextB(beta, data)
  a = 10^(-7);
  b = beta + a * lBeta(beta,data);
endfunction

[h,w] = size(data);
b = [0;0];

for k = 1:100
  b = nextB(b,data);
  error(b,data)
endfor

