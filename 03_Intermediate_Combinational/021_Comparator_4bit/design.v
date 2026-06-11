module comparator_4bit(input [3:0]a,
                       input [3:0]b,
                       output greater,
                       output smaller,
                       output equal
                      );
  
  assign greater = (a > b);
  assign smaller = (a < b);
  assign equal   = (a == b);

endmodule
