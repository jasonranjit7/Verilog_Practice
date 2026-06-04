module decoder_2x4(input a,
                   input b,
                   input e,
                   output reg [3:0] y);
  
  always@(*) begin
    if(!e)
      y = 0;
    else
      case({a,b})
        2'b00: y = 4'd1;
        2'b01: y = 4'd2;
        2'b10: y = 4'd4;
        2'b11: y = 4'd8;
        default y = 4'd0;
      endcase
  end
endmodule
