module mod_5_counter(input clk,
                  input rst,
                     output reg [2:0]count);
  
  always@(posedge clk or posedge rst)
    begin
      if(rst |  count == 3'd4)
        count <= 3'd0;
      else
        count <= count + 1;
    end
  
endmodule
