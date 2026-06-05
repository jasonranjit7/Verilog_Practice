module down_counter_tb();
  reg clk,rst;
  wire [3:0] count;
  
  down_counter DUT(.clk(clk),
                 .rst(rst),
                 .count(count)
                );
  
  always begin
    #1 clk = ~clk;
  end
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,down_counter_tb);
  end
  
  initial begin
    clk <= 0;
    rst <= 1;
    $monitor("count = %b",count);
    repeat(5)@(negedge clk)
    rst <= 0;
    repeat(5)@(negedge clk);
    rst <= 1;
    repeat(5)@(negedge clk);
    rst <=0;
    repeat(20)@(negedge clk);
    $finish();
    
  end
endmodule
