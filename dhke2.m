addpath(pwd);
function breaker2()
  clc;
  ln = "=================================================";
  disp(ln);
  disp("Diffie-Hellman Key Exchange Breaker");
  disp(ln);
  sk = input("Shared Key         : ");
  g  = input("Masukkan Generator : ");
  p  = input("Masukkan Prima     : ");
  disp(ln);
  
  x = true;
  bb = true;
  n = 0;
  y = 0;
  b = 0;
  
  while(x == true)
    for i = 100:1000
      disp(i);
      y =  uint64(i) .^  uint64(g);
      n =  uint64(mod( uint64(y),  uint64(p)));
      disp(n); 
      if(n == sk) 
        b = i;
        bb = false;
        disp("Found !!!");
        disp(i);
      endif
      
      if(bb || i == 1000)
        x = false;
        break;
      endif
      
    endfor
  endwhile
  disp('b');
  disp(b);
  
endfunction

breaker2();
  
  
  
      
      
  