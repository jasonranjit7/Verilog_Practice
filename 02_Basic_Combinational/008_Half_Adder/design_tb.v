module half_adder_tb();
  reg a,b;
  wire cout, sum;
  
  half_adder ha(.a(a),
                .b(b),
                .cout(cout),
                .sum(sum)
               );
  
  initial begin
    #10 a = 0; b = 0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("a = %b, b = %b, sum = %b, cout = %b", a,b,sum,cout);
    #10 b = 1;
    #10 a = 1; b = 0;
    #10 b = 1;
    #10 $finish();
  end
  
endmodule
