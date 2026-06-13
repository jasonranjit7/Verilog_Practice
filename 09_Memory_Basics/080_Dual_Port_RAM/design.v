module dual_port_ram(input [7:0] d_in_a, d_in_b,
                       input [4:0] ram_addr_a, ram_addr_b,
                       input w_en_a, w_en_b,
                       input clk_a, clk_b,
                       input rst_a, rst_b,
                       output [7:0] d_out_a, d_out_b
                      );
  
  reg [7:0] ram_mem [31:0];
  reg [4:0] addr_reg_a;
  
  always @(posedge clk_a or posedge rst_a) begin
    if(rst_a) begin
      for(integer i=0;i<32;i=i+1)
        ram_mem[i]<=0;
      addr_reg_a<=0;
    end
    else begin
      if(w_en_a)
        ram_mem[ram_addr_a] <= d_in_a;
      else 
        addr_reg_a <= ram_addr_a;
    end
  end
  
  assign d_out_a = ram_mem[addr_reg_a];
  
  reg [4:0] addr_reg_b;
  
  always @(posedge clk_b or posedge rst_b) begin
    if(rst_b) begin
      for(integer i=0;i<32;i=i+1)
        ram_mem[i]<=0;
      addr_reg_b<=0;
    end
    else begin
      if(w_en_b)
        ram_mem[ram_addr_b] <= d_in_b;
      else 
        addr_reg_b <= ram_addr_b;
    end
  end
  
  assign d_out_b = ram_mem[addr_reg_b];
  
  
endmodule
        
  
