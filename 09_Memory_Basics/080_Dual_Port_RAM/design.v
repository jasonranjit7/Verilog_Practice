module dual_port_ram(
    input [7:0] d_in_a, d_in_b,
    input [4:0] ram_addr_a, ram_addr_b,
    input w_en_a, w_en_b,
    input clk_a, clk_b,
    output reg [7:0] d_out_a, d_out_b 
);
  
  reg [7:0] ram_mem [31:0];
  
  // Port A Logic
  always @(posedge clk_a) begin
    if (w_en_a) begin
      ram_mem[ram_addr_a] <= d_in_a;
    end
    d_out_a <= ram_mem[ram_addr_a];
  end
  
  // Port B Logic
  always @(posedge clk_b) begin
    if (w_en_b) begin
      ram_mem[ram_addr_b] <= d_in_b;
    end
    d_out_b <= ram_mem[ram_addr_b];
  end

endmodule
