module single_port_ram(input [7:0] d_in,
                       input [4:0] ram_addr,
                       input w_en,
                       input clk,
                       input rst,
                       output [7:0] d_out
                      );
  
  reg [7:0] ram_mem [31:0];
  reg [4:0] addr_reg;
  
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      for(integer i=0;i<32;i=i+1)
        ram_mem[i]<=0;
      addr_reg<=0;
    end
    else begin
      if(w_en)
        ram_mem[ram_addr] <= d_in;
      else 
        addr_reg <= ram_addr;
    end
  end
  
  assign d_out = ram_mem[addr_reg];
  
endmodule
        
  
