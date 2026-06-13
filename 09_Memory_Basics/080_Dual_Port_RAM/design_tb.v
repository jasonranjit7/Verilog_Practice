module dual_port_ram_tb();
  reg [7:0] d_in_a,d_in_b;
  reg [4:0] ram_addr_a, ram_addr_b;
  reg w_en_a,w_en_b,clk_a,clk_b,rst_a,rst_b;
  wire [7:0]d_out_a,d_out_b;
  
  dual_port_ram DUT(.d_in_a(d_in_a),
                      .ram_addr_a(ram_addr_a),
                      .w_en_a(w_en_a),
                      .clk_a(clk_a),
                      .rst_a(rst_a),
                      .d_out_a(d_out_a),
                      .d_in_b(d_in_b),
                      .ram_addr_b(ram_addr_b),
                      .w_en_b(w_en_b),
                      .clk_b(clk_b),
                      .rst_b(rst_b),
                      .d_out_b(d_out_b)
                     );
  
  reg [4:0] addr_r;
  reg [7:0] data_r;
  
  always #10 clk_a = ~clk_a;
  always #5 clk_b = ~clk_b;
  
  //task for read op and write op in tb
  task write_a;
    input [4:0] addr;
    input [7:0] data;
    begin
      ram_addr_a = addr;
      d_in_a = data;
      w_en_a = 1;
      @(posedge clk_a);
      #1
      w_en_a = 0;
      $display("data = %b, memory stored = %b",d_in_a,ram_addr_a);
    end
  endtask
  
  task write_b;
    input [4:0] addr;
    input [7:0] data;
    begin
      ram_addr_b = addr;
      d_in_b = data;
      w_en_b = 1;
      @(posedge clk_b);
      #1
      w_en_b = 0;
      $display("data = %b, memory stored = %b",d_in_b,ram_addr_b);
    end
  endtask
      
  
  task read_a;
    input [4:0] addr;
    begin
      ram_addr_a = addr;
      w_en_a = 0;
      @(posedge clk_a);
      $display("address = %b, Read data = %b",ram_addr_a,d_out_a);
    end
  endtask
  
  task read_b;
    input [4:0] addr;
    begin
      ram_addr_b = addr;
      w_en_b = 0;
      @(posedge clk_b);
      $display("address = %b, Read data = %b",ram_addr_b,d_out_b);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,dual_port_ram_tb.DUT);
    clk_a = 0;
    clk_b = 0;
    rst_a = 1;
    rst_b = 1;
    @(posedge clk_a); 
    rst_a = 0;
    rst_b = 0;
    // Write random data to random addresses
    $display("write port a");
    repeat (10) begin
      addr_r = $urandom_range(0, 31);
      data_r = $urandom_range(0, 255);
      write_a(addr_r, data_r);
    end
    
    $display("write port b");
    repeat (10) begin
      addr_r = $urandom_range(0, 31);
      data_r = $urandom_range(0, 255);
      write_b(addr_r, data_r);
    end

    
    $display("read port a");
    // Read back from random addresses
    repeat (10) begin
      addr_r = $urandom_range(0, 31);
      read_a(addr_r);
    end
    
    $display("read port b");
    repeat (10) begin
      addr_r = $urandom_range(0, 31);
      read_b(addr_r);
    end
    
    #10
    $finish();
  end
endmodule
