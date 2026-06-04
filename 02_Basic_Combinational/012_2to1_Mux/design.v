module mux_2x1(input [1:0]i,
               input s,
               output y);
  wire not_s, and1, and2;
  
  not(not_s,s);
  
  and(and1,not_s,i[0]);
  and(and2,s,i[1]);
  
  or(y,and1,and2); //Y = S'I0+SI1
  
endmodule
