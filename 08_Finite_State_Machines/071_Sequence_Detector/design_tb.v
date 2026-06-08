`timescale 1ns/1ps
module seq_det_tb();
  wire y;
  reg in, clk, rst;
  
  wire [2:0] state, nxt_state;
  
  seq_det DUT(.in(in),
              .clk(clk),
              .rst(rst),
              .y(y)
             );
  
  always begin
    #5 clk = ~clk;
  end
  
  always @(negedge clk)
  $strobe("time=%0t | rst=%b in=%b y=%b state=%b", 
           $time, rst, in, y, DUT.state);
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,seq_det_tb);
    clk <= 0;
    rst <= 1;
    in <= 0;
    repeat(2)@(negedge clk);
    rst <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1; 		
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 0;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1;
    @(posedge clk) in <= 1; 
    $finish();
    end
endmodule
    
    

