`include "../021_Comparator_4bit/design.v"
module comparator_8bit(input [7:0]a,
                       input [7:0]b,
                       output greater,
                       output smaller,
                       output equal
                      );
  
  wire g1,e1,s1,g2,s2,e2;
  
  comparator_4bit comp1(.a(a[7:4]),
                        .b(b[7:4]),
                        .greater(g1),
                        .smaller(s1),
                        .equal(e1)
                       );
  
  comparator_4bit comp2(.a(a[3:0]),
                        .b(b[3:0]),
                        .greater(g2),
                        .smaller(s2),
                        .equal(e2)
                       );
  
  assign greater = g1 | (g2 & e1);
  
  assign smaller = s1 | (s2 &e1);
  
  assign equal = e1 & e2;
  
endmodule
