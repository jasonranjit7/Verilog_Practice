module mealy_101_tb();
  wire z;
  reg x, clk, rstn;
  
  wire [1:0] state, nxt_state;
  
  mealy_101 DUT(.x(x),
                .clk(clk),
                .rstn(rstn),
                .z(z)
             );
  
  always begin
    #5 clk = ~clk;
  end
  
  always @(negedge clk)
    $strobe("time=%0t | rst=%b in=%b out=%b state=%b", 
           $time, rstn, x, z, DUT.state);
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,mealy_101_tb.DUT);
    clk <= 0;
    rstn <= 0;
    x <= 0;
    repeat(2)@(negedge clk);
    rstn <= 1;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 1; 		
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 0;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 1;
    @(posedge clk) x <= 1; 
    $finish();
    end
endmodule
    
    
