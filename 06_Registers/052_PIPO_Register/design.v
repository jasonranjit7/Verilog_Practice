module pipo_register(input clk,
               input rst,
               input [3:0] data,
               input en,
               output reg [3:0] out);
  
  always@(posedge clk) begin
    if(rst)
      out<=0;
    else if(en)
      out<=data;
  end
endmodule
