module tb_reg_8bit();
  reg clk,rst,load_en,out_en;
  reg [7:0] data;
  wire [7:0] out;
  
  reg_8bit dut(.clk(clk),
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
    $dumpvars(0,tb_reg_8bit.dut);
    $monitor("data = %b, load_en = %b, out_en = %b, out = %b", data,load_en,out_en,out);
    rst = 1;
    repeat(1)@(posedge clk);
    rst = 0;
    @(negedge clk)
    load_en = 1;
    @(negedge clk)
    data = 8'd12;
    @(negedge clk)
    out_en = 1;
    @(posedge clk)
    @(negedge clk)
    load_en = 0;
    data = 8'd32;
    repeat(2)@(negedge clk);
    $finish();
    
  end
endmodule
