module up_counter_tb();
  reg clk,rst;
  wire [3:0] count;
  
  up_counter DUT(.clk(clk),
                 .rst(rst),
                 .count(count)
                );
  
  always begin
    #1 clk = ~clk;
  end
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,up_counter_tb);
  end
  
  initial begin
    clk = 0;
    rst = 1;
    $monitor("count = %b",count);
    #5 rst = 0;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    repeat(20)@(negedge clk);
    $finish();
  end
endmodule
  
  
