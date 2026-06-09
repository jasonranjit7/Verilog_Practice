module ring_counter_tb();
  reg clk,rst;
  wire [3:0] count;
  
  always #10 clk=~clk;
  
  ring_counter DUT(.clk(clk),
                   .rst(rst),
                   .count(count)
                  );
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,ring_counter_tb);    
    $monitor("Time = %0t, count = %b", $time, count);
    clk <=0;
    rst<=1;
    repeat(2)@(negedge clk);
    rst <=0;
    repeat(15)@(negedge clk);
    $finish();
  end
endmodule

