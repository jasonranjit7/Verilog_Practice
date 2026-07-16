module single_port_ram(
    input [7:0] d_in,
    input [4:0] ram_addr,
    input w_en,
    input clk,
    output reg [7:0] d_out
);
  
  reg [7:0] ram_mem [31:0];
  
  always @(posedge clk) begin
    if (w_en) begin
      ram_mem[ram_addr] <= d_in;
    end
    d_out <= ram_mem[ram_addr]; 
  end
  
endmodule
