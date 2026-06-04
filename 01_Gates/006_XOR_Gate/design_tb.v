module XOR_tb();
  reg a,b;
  wire y;
  
  XOR_Gate DUT(.a(a),
           .b(b),
           .y(y)
          );
  
  initial begin
    a=0; b=0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("a = %b, b = %b, y = %b",a,b,y);
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish();
  end
endmodule
