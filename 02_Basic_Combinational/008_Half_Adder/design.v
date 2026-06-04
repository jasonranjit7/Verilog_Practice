module half_adder(input a,
                  input b,
                  output cout,
                  output sum);
  
  xor(sum,a,b);
  and(cout,a,b);
  
endmodule

