0;

function s = sig(x)
  s = 1.0/(1.0  + exp(-x));
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


n = 2;
k = 2;
m = 1;

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
  
  o2 = add1(o1) * W2;
  for i = 1:m
    o2(1,i) = sig(o2(1,i));
  endfor
  r1 = o1;
  r2 = o2;
endfunction

train = [0 , 0 , 0;
         1 , 0 , 1;
         0 , 1 , 1;
         1 , 1 , 0];

for i = 1:40000
         
%TODO 4 = height(train)
%error = 0;
%errorQuad = 0;
%for i = 1:4
%  [o1,o2] = net(train(i,1:2),W1,W2,m,n,k)
%  t = train(i,3);
%  error += (o2 - t);
%  errorQuad += power((o2 - t)/2,2);
%endfor
  
  r = mod(i,4)+1;
  [o1,o2] = net(train(r,1:2),W1,W2,m,n,k);
  D2 = zeros(m,m);

  for x = 1:m
    D2(x,x) = o2(1,x) * (1 - o2(1,x));
  endfor

  D1 = zeros(k,k);
  l = 1;
  for x = 1:k
    D1(x,x) = o1(1,x) * (1-o1(1,x));
  endfor

  W22 = W2(1:k,1:m);
  e = o2 - train(r,3); %o2 - t
  delta2 = D2*e;
  delta1 = D1*W22*delta2;

  dW2T = -1.1*delta2*add1(o1);
  dW1T = -1.1*delta1*add1(train(r,1:2));

  W1 = W1 + transpose(dW1T);
  W2 = W2 + transpose(dW2T);
endfor
W1
W2
for i = 1:4
  [x,y] = net(train(i,:),W1,W2,m,n,k);
  train(i,:)
  y
endfor