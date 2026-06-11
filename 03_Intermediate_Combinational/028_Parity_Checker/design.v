module parity_checker(input [3:0]a,
                      input p,
                      input even_odd, //1 for even, 0 for odd
                      output c
                 );
  
  wire c1 = a[0]^a[1]^a[2]^a[3]^p;
  
  assign c = even_odd?c1:!c1;
  
endmodule
