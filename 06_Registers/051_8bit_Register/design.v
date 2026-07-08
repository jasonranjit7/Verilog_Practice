module reg_8bit(input clk,
                input rst,
                input [7:0] data,
                input load_en,
                input out_en,
                output reg [7:0] out);
  
  reg [7:0] register;
  
  always@(posedge clk) begin
    if(rst)
      register<=0;
    else if(load_en)
      register<=data;
    
    if(out_en)
      out<=register;
  end
  
endmodule
