module johnson_counter(input clk,
                    input rst,
                    output reg [3:0] count);
  
  always@(posedge clk or posedge rst) begin
    if(rst)
      count <= 1;
    else begin
      count <= {~count[0],count[3:1]};
    end
  end
endmodule
      
