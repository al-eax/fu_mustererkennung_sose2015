data = importdata('/home/alex/fu_mustererkennung_sose2015/zettel07/fieldgoal.txt');

b = [0;0];


function e = error(data,beta)
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
   w =(e^(transpose(b)*x))/(1+(e^(transpose(b)*x)));
endfunction

function l = nambla(beta, data)
  [h,w] = size(data);
  l = [0;0];
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    extendedX = [1;x];
    l += extendedX * (y - p(extendedX,beta));
  endfor
endfunction

error(data,b)

alpha = 10^(-7);
for i = 1:250
  b = b - alpha*nambla(b,data);
  alpha = alpha * 2;
endfor
error(data,b)

