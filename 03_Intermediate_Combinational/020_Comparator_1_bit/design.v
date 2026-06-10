module comparator_1_bit(input a,
                        input b,
                        output a_greater,
                        output a_smaller,
                        output equal
                       );
  
  assign a_greater = (a>b)?1:0;
  assign a_smaller = (a<b)?1:0;
  assign equal = (a==b)?1:0;
  
endmodule
