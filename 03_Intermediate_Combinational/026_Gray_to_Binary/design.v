module gray_to_binary(input [3:0]g,
                      output reg [3:0]b
                     );
  always@(*) begin
    b[3] = g[3];
    for(integer j=2;j>=0;j=j-1) begin
      b[j] = b[j+1]^g[j];
    end
  end
endmodule
                      
