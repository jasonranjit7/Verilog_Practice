module mem_system_tb();
  reg clk;
  reg rst;
  reg start;
  reg write;
  reg [4:0] address;
  reg [7:0] data;
  wire [7:0] d_out;
  wire ready;
  
  wire [7:0] ram_data_in;
  wire       w_en;
  wire [4:0] ram_addr;
  wire [7:0] ram_data_out;

  
  mem_controller U_CONTROLLER (
    .clk(clk), .rst(rst),
    .start(start), .write(write), .address(address), .data(data),
    .d_out(d_out), .ready(ready),
    .ram_data_in(ram_data_in), .w_en(w_en), .ram_addr(ram_addr), .ram_data_out(ram_data_out)
  );
  
  single_port_ram U_RAM (
    .clk(clk),
    .d_in(ram_data_in),
    .ram_addr(ram_addr),
    .w_en(w_en),
    .d_out(ram_data_out)
  );
  
  always #10 clk = ~clk;
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0, mem_system_tb);
    
    
    clk     = 0;
    rst     = 1;
    start   = 0;
    write   = 0;
    address = 0;
    data    = 0;
    
     
    #25;
    rst = 0;
    @(posedge clk);
        
    //write
    $display("WRITE: Addr=5, Data=0xA5");
    address = 5;
    data    = 8'hA5;
    write   = 1;
    start   = 1;
    
    @(posedge clk);
    start   = 0; 
    write   = 0;
    
    
    while(!ready) @(posedge clk);
    $display("Write acknowledged! Ready : %b\n", ready);
    
    
    @(posedge clk);
    
    //read
    $display("Read: Addr=5");
    address = 5;
    write   = 0;
    start   = 1;
    
    
    @(posedge clk); 
    start   = 0; 
   
    while(!ready) @(posedge clk);
    
    #1;
    $display("Read complete! Ready=%b | Data Read out: 0x%h", ready, d_out);
    
    if (d_out == 8'hA5)
      $display("\n*** Pass: Read data matches written ***");
    else
      $display("\n*** Fail: Data Mismatch! Expected 0xA5, got 0x%h ***", d_out);
      
    #40;
    $finish();
  end

endmodule
