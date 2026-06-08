module mod_10_counter_tb();
  reg clk,rst;
  wire [3:0] count;
  
  mod_10_counter DUT(.clk(clk),
                 .rst(rst),
                 .count(count)
                );
  
  always begin
    #1 clk = ~clk;
  end
  
  initial begin
    
    $dumpfile("image.vcd");
    $dumpvars(0,mod_10_counter_tb);
  end
  
  initial begin
    $monitor("count = %b",count);
    clk = 0;
    rst = 1;
    repeat(2)@(negedge clk);
    rst = 0;
    $display("rst = %d",rst);
    repeat(10)@(negedge clk);
    repeat(20)@(negedge clk);
    $finish();
    
  end
endmodule
  
  
