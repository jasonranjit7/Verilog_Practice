module demux_1x4_tb();
  reg i;
  reg [1:0] s;
  wire [3:0]y;
  
  demux_1x4 DUT(.i(i),
                .s(s),
                .y(y));
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    i=0; s=2'b00;
    $monitor("i = %b, s = %b, y = %b",i,s,y);
    #10 i = 1; s = 2'b00;
    #10 i = 1; s = 2'b01;
    #10 i = 1; s = 2'b10;
    #10 i = 1; s = 2'b10;
    #10 $finish();
  end
endmodule
