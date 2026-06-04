module full_adder_tb();
  reg a,b,cin;
  wire cout, sum;
  
  full_adder fa(.a(a),
                .b(b),
                .cin(cin),
                .cout(cout),
                .sum(sum)
               );
  
  initial begin
    #10 a = 0; b = 0; cin = 0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("a = %b, b = %b, cin = %b, sum = %b, cout = %b",a,b,cin,sum,cout);
    #10 a = 0; b = 0; cin = 1;
    #10 a = 0; b = 1; cin = 0;
    #10 a = 0; b = 1; cin = 1;
    #10 a = 1; b = 0; cin = 0;
    #10 a = 1; b = 0; cin = 1;
    #10 a = 1; b = 1; cin = 0;
    #10 a = 1; b = 1; cin = 1;
    #10 $finish();
  end
  
endmodule


