module mux_8_tb();
  reg [7:0] i;
  reg [2:0] s;
  wire y;
  
  mux_8 DUT(.i(i),
            .s(s),
            .y(y)
           );
  
  initial begin
    i=1;
    s=3'd0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    $monitor("s = %b, i = %b, y = %b",s,i,y);
    
    #10 s = 3'd1; i = 8'd2;
    #10 s = 3'd2; i = 8'd4;
    #10 s = 3'd3; i = 8'd8;
    #10 s = 3'd4; i = 8'd16;
    #10 s = 3'd5; i = 8'd32;
    #10 s = 3'd6; i = 8'd64;
    #10 s = 3'd7; i = 8'd128;
    #10 $finish();
  end
endmodule
    

// module mux_4_tb();
//   reg [3:0] i;
//   reg [1:0] s;
//   wire y;
  
//   mux_4 DUT(.i(i),
//             .s(s),
//             .y(y)
//            );
  
//   initial begin
//     i=1;
//     s='0;
//     $dumpfile("image.vcd");
//     $dumpvars(0);
//     $monitor("s = %b, i = %b, y = %b",s,i,y);
    
//     #10 s = 2'd1; i = 4'd2;
//     #10 s = 2'd2; i = 4'd4;
//     #10 s = 2'd3; i = 4'd8;
//     #10 $finish();
//   end
// endmodule

