module tb_sipo_register();
  reg clk,rst,shift,data;
  wire [3:0] out;
  
  sipo_register dut(.clk(clk),
               		.rst(rst),
               		.data(data),
                    .shift(shift),
               		.out(out)
              );
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_sipo_register.dut);
    $monitor("data = %b, shift = %b, out = %b", data,shift,out);
    rst = 1;
    repeat(2)@(posedge clk);
    rst = 0;
    @(negedge clk)
    @(negedge clk)
    data = 1'b1;
    shift = 1;
    @(negedge clk)
    data = 1'b1;
    @(negedge clk)
    data = 1'b1;
    @(negedge clk)
    data = 1'b1;
    @(negedge clk)
    @(posedge clk)
    repeat(2)@(negedge clk);
    $finish();
    
  end
endmodule
