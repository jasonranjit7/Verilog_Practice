`timescale 1ns/1ps

module dual_port_ram_tb();
  reg [7:0] d_in_a,d_in_b;
  reg [4:0] ram_addr_a,ram_addr_b;
  reg w_en_a, w_en_b, clk_a, clk_b;
  wire [7:0] d_out_a, d_out_b;
  
  dual_port_ram DUT(
    .d_in_a(d_in_a),
    .d_in_b(d_in_b),
    .ram_addr_a(ram_addr_a),
    .ram_addr_b(ram_addr_b),
    .w_en_a(w_en_a),
    .w_en_b(w_en_b),
    .clk_a(clk_a),
    .clk_b(clk_b),
    .d_out_a(d_out_a),
    .d_out_b(d_out_b)
  );
  
  always #10 clk_a = ~clk_a;
  always #10 clk_b = ~clk_b;
  
  task write_a;
    input [4:0] addr;
    input [7:0] data;
    begin
      ram_addr_a = addr;
      d_in_a     = data;
      w_en_a     = 1;
      @(posedge clk_a);
      #1;
      w_en_a     = 0;
      $display("[WRITE PORT A] Addr: %d | Data Written: 0x%h", addr, data);
    end
  endtask
  
  task write_b;
    input [4:0] addr;
    input [7:0] data;
    begin
      ram_addr_b = addr;
      d_in_b     = data;
      w_en_b     = 1;
      @(posedge clk_b);
      #1;
      w_en_b     = 0;
      $display("[WRITE PORT B]  Addr: %d | Data Written: 0x%h", addr, data);
    end
  endtask
      
  task read_a;
    input [4:0] addr;
    begin
      ram_addr_a = addr;
      w_en_a     = 0;
      @(posedge clk_a);
      #1; 
      $display("[READ PORT A]  Addr: %d | Data Read:    0x%h", ram_addr_a, d_out_a);
    end
  endtask
  
  task read_b;
    input [4:0] addr;
    begin
      ram_addr_b = addr;
      w_en_b     = 0;
      @(posedge clk_b);
      #1; 
      $display("[READ PORT B]  Addr: %d | Data Read:    0x%h", ram_addr_b, d_out_b);
    end
  endtask
  
  integer i;
  
  initial begin
    // Waveform setup
    $dumpfile("image.vcd");
    $dumpvars(0, dual_port_ram_tb);
    
    // Initialize signals
    clk_a = 0;
    w_en_a = 0;
    ram_addr_a = 0;
    d_in_a = 0;
    
    clk_b = 0;
    w_en_b = 0;
    ram_addr_b = 0;
    d_in_b = 0;
    
    @(posedge clk_b); 
    @(posedge clk_a); 
    
    $display("--- Write Cycle Port A ---");
    for (i = 0; i < 10; i = i + 1) begin
      write_a(i, $urandom_range(16, 255)); 
    end
    
     @(posedge clk_a);
    
    $display("\n--- Read Cycle Port B ---");
    for (i = 0; i < 10; i = i + 1) begin
      read_a(i);
    end
    
    
    @(posedge clk_b);
    
    $display("--- Write Cycle Port B ---");
    for (i = 0; i < 10; i = i + 1) begin
      write_b(i, $urandom_range(16, 255)); 
    end
    
    @(posedge clk_b);

    $display("\n--- Read Cycle Port A ---");
    for (i = 0; i < 10; i = i + 1) begin
      read_b(i);
    end
    
    
    
    @(posedge clk_a); 
    @(posedge clk_b); 
    $display("\nSimulation Finished Successfully.");
    $finish();
  end
endmodule
