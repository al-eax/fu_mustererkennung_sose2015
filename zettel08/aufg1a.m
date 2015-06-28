0;
function e = exec1(w1,w2,w3,t1,t2)
  if ((w1*t1 + w2*t2 + w3) > 0)
     e = 1;
   else
     e = 0;
   endif
endfunction

function f = getBoolFunc(w1,w2,w3)
  e1 = exec1(w1,w2,w3,0,0);
  e2 = exec1(w1,w2,w3,0,1);
  e3 = exec1(w1,w2,w3,1,0);
  e4 = exec1(w1,w2,w3,1,1);
  
  f = e1*2^0 + e2*2^1 + e3*2^2 + e4*2^3;
endfunction

f1 = getBoolFunc(0.3,0.5,0.4);
f2 = getBoolFunc(-0.8,-0.6,0.5);
f3 = getBoolFunc(0.7,0.6,-1);

fprintf("[0.3,0.5,0.4] -> f%d\n", f1);
fprintf("[-0.8, -0.6, 0.5] -> f%d\n", f2);
fprintf("[0.7,0.6,-1] -> f%d\n", f3);