module demux_1x2_tb();
  reg i,s;
  wire [1:0]y;
  
  demux_1x2 DUT(.i(i),
                .s(s),
                .y(y));
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    i=0; s=0;
    $monitor("i = %b, s = %b, y = %b",i,s,y);
    #10 i = 1; s = 0;
    #10 i = 1; s = 1;
    #10 i = 0; s = 1;
    #10 $finish();
  end
endmodule
