`include "../008_Half_Adder/design.v"
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
