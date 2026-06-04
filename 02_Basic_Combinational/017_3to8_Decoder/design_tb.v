module decoder_3x8_tb();
  reg a,b,c,e;
  wire [7:0]y;
  
  decoder_3x8 DUT(.a(a),
                  .b(b),
                  .c(c),
                  .e(e),
                  .y(y));
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    e = 0;
    $monitor("e = %b, a = %b, b = %b, c = %b, y = %b",e,a,b,c,y);
    #10 e = 1; a = 0; b = 0; c = 0;
    #10 e = 1; a = 0; b = 0; c = 1;
    #10 e = 1; a = 0; b = 1; c = 0;
    #10 e = 1; a = 0; b = 1; c = 1;
    #10 e = 1; a = 1; b = 0; c = 0;
    #10 e = 1; a = 1; b = 0; c = 1;
    #10 e = 1; a = 1; b = 1; c = 0;
    #10 e = 1; a = 1; b = 1; c = 1;
    #10 $finish();
  end
endmodule
    
