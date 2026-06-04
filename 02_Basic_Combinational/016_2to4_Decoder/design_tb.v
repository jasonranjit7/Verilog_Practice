module decoder_2x4_tb();
  reg a,b,e;
  wire [3:0]y;
  
  decoder_2x4 DUT(.a(a),
                  .b(b),
                  .e(e),
                  .y(y));
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    e = 0;
    $monitor("e = %b, a = %b, b = %b, y = %b",a,b,e,y);
    #10 e = 1; a = 0; b = 0;
    #10 e = 1; a = 0; b = 1;
    #10 e = 1; a = 1; b = 0;
    #10 e = 1; a = 1; b = 1;
    #10 $finish();
  end
endmodule
    
