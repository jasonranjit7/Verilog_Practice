module mux_4_tb();
  reg [3:0] i;
  reg [1:0] s;
  wire y;
  
  mux_4 DUT(.i(i),
            .s(s),
            .y(y)
           );
  
  initial begin
    i=1;
    s=0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("s = %b, i = %b, y = %b",s,i,y);
    
    #10 s = 2'd1; i = 4'd2;
    #10 s = 2'd2; i = 4'd4;
    #10 s = 2'd3; i = 4'd8;
    #10 $finish();
  end
endmodule
