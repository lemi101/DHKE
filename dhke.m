addpath(pwd);
function breaker()
  clc;
  ln = "=================================================";
  disp(ln);
  disp("Diffie-Hellman Key Exchange Breaker");
  disp(ln);
  ya = input("Masukkan ya        : ");
  yb = input("Masukkan yb        : ");
  g  = input("Masukkan Generator : ");
  p  = input("Masukkan Prima     : ");
  disp(ln);
  
  printf("ya = %d\nyb = %d\ng = %d\np = %d\n", ya, yb, g, p);
  disp(ln);
  
  z = true;
  ba = false;
  bb = false;
  a = 0;
  b = 0;
  ca = 0;
  cb = 0;
  
  disp("Count Xa");
  while(z == true)
    for i = 1:1000;
      y =  uint64(g) .^  uint64(i);
      ca =  uint64(mod( uint64(y),  uint64(p)));
      disp(ca);
            
      if(ca == ya) 
        a = i;
        ba = true;
        disp("Xa Found !!!");
        disp(ln);
      endif
      
      if(ba || i == 1000)
        z = false;
        break;
      endif
    endfor
  endwhile
  
  z = true;
  disp("Count Xb");
  
  while(z == true)
    for i = 1:1000;
      y =  uint64(g) .^  uint64(i);
      cb =  uint64(mod( uint64(y),  uint64(p)));
      disp(cb);
      
      if(cb == yb) 
        b = i;
        bb = true;
        disp("Xb Found !!!");
        disp(ln);
      endif
      
      if(bb || i == 1000)
        z = false;
        break;
      endif
    endfor
  endwhile
  
  printf ("Xa = %d\nXb = %d\n", a,b);
  
  kg = 0;
  kx = 0;
  
  if(ya > yb)
    kg = yb;
    kx = a;
  else
    kg = ya;
    kx = b;
  endif
  
  key = mod((kg ** kx), p);
  printf ("Shared Key = %d\n", key);
  disp(ln);
endfunction

breaker();
  
  
  
      
      
  