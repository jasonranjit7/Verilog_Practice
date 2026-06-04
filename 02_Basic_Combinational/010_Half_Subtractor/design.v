module half_sub(input x,
                  input y,
                  output bout,
                  output diff);
  
  wire not_x;
  
  not(not_x,x);
  
  xor(diff,x,y);
  and(bout,not_x,y);
  
endmodule
