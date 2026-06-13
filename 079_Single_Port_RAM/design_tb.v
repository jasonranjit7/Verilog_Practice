module single_port_ram_tb();
  reg [7:0] d_in;
  reg [4:0] ram_addr;
  reg w_en,clk,rst;
  wire [7:0]d_out;
  
  single_port_ram DUT(.d_in(d_in),
                      .ram_addr(ram_addr),
                      .w_en(w_en),
                      .clk(clk),
                      .rst(rst),
                      .d_out(d_out)
                     );
  
  reg [4:0] addr_r;
  reg [7:0] data_r;
  
  always #10 clk = ~clk;
  
  //task for read op and write op in tb
  task write;
    input [4:0] addr;
    input [7:0] data;
    begin
      ram_addr = addr;
      d_in = data;
      w_en = 1;
      @(posedge clk);
      #1
      w_en = 0;
      $display("data = %b, memory stored = %b",d_in,ram_addr);
    end
  endtask
      
  
  task read;
    input [4:0] addr;
    begin
      ram_addr = addr;
      w_en = 0;
      @(posedge clk);
      $display("address = %b, Read data = %b",ram_addr,d_out);
    end
  endtask
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,single_port_ram_tb.DUT);
    clk = 0;
    rst = 1;
    @(posedge clk); 
    rst = 0;
    // Write random data to random addresses
    repeat (20) begin
      addr_r = $urandom_range(0, 31);
      data_r = $urandom_range(0, 255);
      write(addr_r, data_r);
    end

    // Read back from random addresses
    repeat (10) begin
      addr_r = $urandom_range(0, 31);
      read(addr_r);
    end
    
    @(posedge clk);
    $finish();
  end
endmodule
