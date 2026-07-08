module tb_reg_4bit();
  reg clk,rst,load_en,out_en;
  reg [3:0] data;
  wire [3:0] out;
  
  reg_4bit dut(.clk(clk),
               .rst(rst),
               .data(data),
               .load_en(load_en),
               .out_en(out_en),
               .out(out)
              );
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_reg_4bit.dut);
    $monitor("data = %b, load_en = %b, out_en = %b, out = %b", data,load_en,out_en,out);
    rst = 1;
    repeat(1)@(posedge clk);
    rst = 0;
    @(negedge clk)
    load_en = 1;
    @(negedge clk)
    data = 4'b1111;
    @(negedge clk)
    out_en = 1;
    @(posedge clk)
    @(negedge clk)
    load_en = 0;
    data = 4'b1010;
    repeat(2)@(negedge clk);
    $finish();
    
  end
endmodule
