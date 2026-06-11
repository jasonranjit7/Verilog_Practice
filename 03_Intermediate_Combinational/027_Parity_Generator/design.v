module parity_gen(input [3:0]a,
                  input even_odd, //1 for even, 0 for odd
                  output p
                 );
  
  wire p1 = a[0]^a[1]^a[2]^a[3];
  
  assign p = even_odd?p1:!p1;
  
endmodule
