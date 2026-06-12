module half_adder(input a,
                  input b,
                  output cout,
                  output sum);
  
  xor(sum,a,b);
  and(cout,a,b);
  
endmodule

module full_adder(input a,
                  input b,
                  input cin,
                  output sum,
                  output cout);

  wire sum1,cout1,cout2;

  half_adder ha_1(.a(a),
                  .b(b),
                  .cout(cout1),
                  .sum(sum1));
  half_adder ha_2(.a(sum1),
                  .b(cin),
                  .cout(cout2),
                  .sum(sum));

  or(cout,cout1,cout2);

endmodule

module ripple_carry_4bit(input [3:0]a,
                         input [3:0]b,
                         input cin,
                         output [3:0]sum,
                         output cout);
  
  wire cout0,cout1,cout2;
  
  full_adder fa0(.a(a[0]),
                 .b(b[0]),
                 .cin(cin),
                 .sum(sum[0]),
                 .cout(cout0)
                );
  
  full_adder fa1(.a(a[1]),
                 .b(b[1]),
                 .cin(cout0),
                 .sum(sum[1]),
                 .cout(cout1)
                );
  
  full_adder fa2(.a(a[2]),
                 .b(b[2]),
                 .cin(cout1),
                 .sum(sum[2]),
                 .cout(cout2)
                );
  
  full_adder fa3(.a(a[3]),
                 .b(b[3]),
                 .cin(cout2),
                 .sum(sum[3]),
                 .cout(cout)
                );
  
endmodule
  
  
