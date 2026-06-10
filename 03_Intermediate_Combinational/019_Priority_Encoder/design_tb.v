module priority_encoder_8x3_tb();
  reg [7:0] d;
  wire valid;
  wire [2:0] y;
  
  priority_encoder_8x3 DUT(.d(d),
                           .y(y),
                           .valid(valid)
                          );
  
  initial begin
    $dumpfile("image.vcd");            		  
    $dumpvars(0,priority_encoder_8x3_tb);
    $monitor("d = %b, y = %b, valid = %b",d,y,valid);
    #10 d = 8'd0;
    #10 d = 8'd1;
    #10 d = 8'd2;
    #10 d = 8'd4;
    #10 d = 8'd8;
    #10 d = 8'd16;
    #10 d = 8'd32;
    #10 d = 8'd64;
    #10 d = 8'd128;
    #10 $finish();
  end
endmodule
