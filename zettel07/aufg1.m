data = importdata('/home/alex/fu_mustererkennung_sose2015/zettel07/fieldgoal.txt');

function e = error(beta,data)
  [h,w] = size(data);
  e = 0;
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    expected = p(x,beta);
    e += abs(y - expected);
  endfor
endfunction

function w = p(x,b)
   extendedX = [x;1];
   w = exp(transpose(b)*extendedX)/(1+exp(transpose(b)*extendedX));
endfunction

function b = lBeta(beta,data)
  b = 0;
  [h,w] = size(data);
  for i = 1:h
    x = data(i,1);
    y = data(i,2);
    b += [x;1]*(y - p(x,beta));
  endfor
endfunction

function b = nextB(beta, data)
  a = 10^(-7);
  b = beta + a * lBeta(beta,data);
endfunction

function plotResult(beta,data,c)
  [h,w] = size(data);
  for k = 1:100
    plot(k, p(k,beta),c); hold on;
  endfor
endfunction

[h,w] = size(data);
b = [0;0];

for k = 1:1000
  b = nextB(b,data);
  if k == 250
    fprintf("k = %d, beta = (%f,%f) error = %f\n",k,b(1,1),b(2,1), error(b,data));
    plotResult(b,data,"r");
  elseif k == 500
    fprintf("k = %d, beta = (%f,%f) error = %f\n",k,b(1,1),b(2,1), error(b,data));
    plotResult(b,data,"g");
  elseif k == 750
    fprintf("k = %d, beta = (%f,%f) error = %f\n",k,b(1,1),b(2,1), error(b,data));
    plotResult(b,data,"b");
  elseif k == 1000
    fprintf("k = %d, beta = (%f,%f) error = %f\n",k,b(1,1),b(2,1), error(b,data));
    plotResult(b,data,"k");
  endif
endfor