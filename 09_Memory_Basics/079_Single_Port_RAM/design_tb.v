`timescale 1ns/1ps

module single_port_ram_tb();
  reg [7:0] d_in;
  reg [4:0] ram_addr;
  reg w_en, clk;
  wire [7:0] d_out;
  
  single_port_ram DUT (
    .d_in(d_in),
    .ram_addr(ram_addr),
    .w_en(w_en),
    .clk(clk),
    .d_out(d_out)
  );
  
  always #10 clk = ~clk;
  
  task write;
    input [4:0] addr;
    input [7:0] data;
    begin
      ram_addr = addr;
      d_in     = data;
      w_en     = 1;
      @(posedge clk);
      #1;
      w_en     = 0;
      $display("[WRITE] Addr: %d | Data Written: 0x%h", addr, data);
    end
  endtask
      
  task read;
    input [4:0] addr;
    begin
      ram_addr = addr;
      w_en     = 0;
      @(posedge clk);
      #1; 
      $display("[READ]  Addr: %d | Data Read:    0x%h", ram_addr, d_out);
    end
  endtask
  
  integer i;
  
  initial begin
    // Waveform setup
    $dumpfile("image.vcd");
    $dumpvars(0, single_port_ram_tb);
    
    // Initialize signals
    clk = 0;
    w_en = 0;
    ram_addr = 0;
    d_in = 0;
    
    @(posedge clk); 
    
    $display("--- Write Cycle ---");
    for (i = 0; i < 10; i = i + 1) begin
      write(i, $urandom_range(16, 255)); 
    end

    $display("\n--- Read Cycle ---");
    for (i = 0; i < 10; i = i + 1) begin
      read(i);
    end
    
    @(posedge clk);
    $display("\nSimulation Finished Successfully.");
    $finish();
  end
endmodule
