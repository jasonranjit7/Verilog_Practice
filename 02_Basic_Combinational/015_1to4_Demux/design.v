module demux_1x4(input i,
                 input [1:0]s,
                 output reg [3:0]y);
  
  always@(*) begin
    y = 0;
    case(s)
      2'b00: y[0] = i;
      2'b01: y[1] = i;
      2'b10: y[1] = i;
      2'b11: y[1] = i;
    endcase
  end
endmodule
