module encoder_4x2_tb();
  reg [3:0]i;
  wire [1:0]y;
  
  encoder_4x2 DUT(.i(i),
                  .y(y));
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("i = %b, y = %b",i,y);
    #10 i = 4'd1;
    #10 i = 4'd2;
    #10 i = 4'd4;
    #10 i = 4'd8;
    
    #10 $finish();
  end
endmodule
    
