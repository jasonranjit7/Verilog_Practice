module NOT_tb();
  reg a;
  wire y;
  
  NOT_Gate DUT(.a(a),
           .y(y)
          );
  
  initial begin
    a=0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("a = %b,y = %b",a,y);
    #10 a = 0;
    #10 a = 1;
    #10 $finish();
  end
endmodule
