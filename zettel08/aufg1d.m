0;
function e = exec1(w1,w2,w3,t1,t2)
  if ((w1*t1 + w2*t2 + w3) > 0)
     e = 1;
   else
     e = 0;
   endif
endfunction

function f = getBoolFunc(w1,w2,w3)
  e1 = exec1(w1,w2,w3,-1,-1);
  e2 = exec1(w1,w2,w3,-1,1);
  e3 = exec1(w1,w2,w3,1,-1);
  e4 = exec1(w1,w2,w3,1,1);
  
  f = e1*2^0 + e2*2^1 + e3*2^2 + e4*2^3;
endfunction

n = 10000;
rndweights = zeros(n,3);
functions = zeros(n,1);
[h,w] = size(rndweights);

for i = 1:h
  rndweights(i,:) = -1 + 2*rand(1,3);
endfor

for i = 1:h
  w1 = rndweights(i,1);
  w2 = rndweights(i,2);
  w3 = rndweights(i,3);
  f = getBoolFunc(w1,w2,w3);
  functions(i,1) = f;
endfor

hist(functions);