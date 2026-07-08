module tb_pipo_register();
  reg clk,rst,en;
  reg [3:0] data;
  wire [3:0] out;
  
  pipo_register dut(.clk(clk),
               .rst(rst),
               .data(data),
               .en(en),
               .out(out)
              );
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_pipo_register.dut);
    $monitor("data = %b, en = %b, out = %b", data,en,out);
    rst = 1;
    repeat(1)@(posedge clk);
    rst = 0;
    @(negedge clk)
    en = 1;
    @(negedge clk)
    data = 4'b1111;
    @(negedge clk)
    en = 1;
    @(posedge clk)
    @(negedge clk)
    en = 0;
    data = 4'b1010;
    repeat(2)@(negedge clk);
    $finish();
    
  end
endmodule
