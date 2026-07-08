module piso_register(input clk,
               input rst,
               input load,      
               input [3:0] data,
               input shift,
               output reg out);
  
  reg [3:0] register;
  always@(posedge clk) begin
    if(rst) begin
      register<=0;
      out<=0;
    end
    else if(load)
      register<=data;
    else if(shift) begin
      out<=register[0];
      register<={1'b0,register[3:1]};
    end
  end
endmodule
