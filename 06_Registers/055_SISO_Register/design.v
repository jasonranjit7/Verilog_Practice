module siso_register(input clk,
               input rst,     
               input data,
               input shift,
               output out);
  
  reg [3:0] register;
  always@(posedge clk) begin
    if(rst) begin
      register<=0;
    end
    else if(shift) begin
      register<={data,register[3:1]};
    end
  end
  
  assign out = register[0];
  
endmodule
