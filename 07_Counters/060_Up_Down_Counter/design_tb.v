module up_down_counter_tb();
  reg clk,rst,up_down;
  wire [3:0] count;
  
  up_down_counter DUT(.clk(clk),
                 .rst(rst),
                 .up_down(up_down),
                 .count(count)
                );
  
  always begin
    #1 clk = ~clk;
  end
  
  initial begin
    
    $dumpfile("image.vcd");
    $dumpvars(0,up_down_counter_tb);
  end
  
  initial begin
    $monitor("count = %b",count);
    clk = 0;
    rst = 1;
    up_down = 1;
    repeat(2)@(negedge clk);
    rst = 0;
    $display("rst = %d",rst);
    repeat(10)@(negedge clk);
    up_down = 0;
    $display("up_down = %d",up_down);
    repeat(20)@(negedge clk);
    $finish();
    
  end
endmodule  
