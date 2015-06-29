0;

points = zeros(10000,3);
[h,w] = size(points);

for i = 1:h
  points(i,:) = -5 + (5+5)*rand(1,3);
  points(i,:) = points(i,:)/norm(points(i,:));
  scatter3(points(i,1),points(i,2),points(i,3)); hold on;
endfor

