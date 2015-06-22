data = importdata('/home/alex/fu_mustererkennung_sose2015/zettel07/fieldgoal.txt');
[h,w] = size(data);
b = [0;0];

function e = error(data,beta)
  [h,w] = size(data);
  e = 0;
  for i = 1:h
    x = data(i,1);
    y = data(i,2)
    extendedX = [1;x];
    expected = p(extendedX,beta)
    e += abs(y - expected);
  endfor
endfunction

function w = p(x,b)
   w = 1 - 1/(1+exp(transpose(b)*x));
endfunction

function b = lBeta(x,y, beta)
  extendedX = [1;x];
  b = extendedX * (y - p(extendedX ,beta));
endfunction

function l = nambla(beta, data)
  [h,w] = size(data);
  l = [0;0];
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    beta = lBeta(x,y,beta);
  endfor
endfunction

for k = 1:100
  bb = b;
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    b += lBeta(x,y,bb);
  endfor
  error(data,b);
endfor

