blub = 1;  

function u = vor()

   p = rand(1);
   if (p < 0.5)
     u = -1;
   else
     u = 1;
   endif


endfunction

for i = 1:2000
  x = rand(1)*vor();
  y = rand(1)*vor();
  z = rand(1)*vor();
  vektor = [x;y;z];
  leng = norm(vektor);
  vektor = [x/leng,y/leng,z/leng];
    plot3(x/leng,y/leng,z/leng,'+r');hold on;
endfor
