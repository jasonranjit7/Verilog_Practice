module demux_1x2(input i,
                 input s,
                 output reg [1:0]y);
  
  always@(*) begin
    y = 0;
    case(s)
      1'b0: y[0] = i;
      1'b1: y[1] = i;
    endcase
  end
endmodule
