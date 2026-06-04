module mux_2x1_tb();
  reg [1:0]i;
  reg s;
  wire y;
  
  mux_2x1 DUT(.i(i),
              .s(s),
              .y(y)
             );
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("i = %b, s = %b, y = %b",i,s,y);
    #10 i=2'b00; s=0;
    #10 i=2'b01; s=0;
    #10 i=2'b10; s=1;
    #10 i=2'b11; s=1;
    #10 $finish();
  end
endmodule
