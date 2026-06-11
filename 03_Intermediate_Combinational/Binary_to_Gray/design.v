module binary_to_gray(input [3:0]i,
                      output reg [3:0]g
                     );
  always@(*) begin
    g[3] = i[3];
    for(integer j=2;j>=0;j=j-1) begin
      g[j] = i[j+1]^i[j];
    end
  end
endmodule
                      
