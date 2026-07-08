module tb_piso_register();
  reg clk,rst,load,shift;
  reg [3:0] data;
  wire out;
  
  piso_register dut(.clk(clk),
               		.rst(rst),
                    .load(load),
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
    $dumpvars(0,tb_piso_register.dut);
    $monitor("data = %b, load = %b, shift = %b, out = %b", data,load,shift,out);
    rst = 1;
    repeat(1)@(posedge clk);
    rst = 0;
    @(negedge clk)
    load = 1;
    @(negedge clk)
    data = 4'b1111;
    @(negedge clk)
    load = 0;
    shift = 1;
    @(posedge clk)
    @(negedge clk)
    data = 4'b1010;
    repeat(2)@(negedge clk);
    $finish();
    
  end
endmodule
