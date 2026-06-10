module priority_encoder_8x3(input [7:0] d,
                            output reg [2:0] y,
                            output reg valid
                           );
  
  always@(*) begin
    casez(d)
      8'b1???????: y = 3'd7;
      8'b01??????: y = 3'd6;
      8'b001?????: y = 3'd5;
      8'b0001????: y = 3'd4;
      8'b00001???: y = 3'd3;
      8'b000001??: y = 3'd2;
      8'b0000001?: y = 3'd1;
      8'b00000001: y = 3'd0;
      default: y = 3'd0;
    endcase
    valid = |d;
  end
  
endmodule
  
