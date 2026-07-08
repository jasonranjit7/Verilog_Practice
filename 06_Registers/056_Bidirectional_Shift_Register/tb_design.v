module tb_bi_shift_register();
  reg clk,rst,mode,serial_ip_l,serial_ip_r;
  wire out;
  
  bi_shift_register dut(.clk(clk),
               		.rst(rst),
                    .mode(mode),
                    .serial_ip_l(serial_ip_l),
                    .serial_ip_r(serial_ip_r),
              		.out(out)
              );
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  
  initial begin
    $dumpfile("image.vcd");
    $dumpvars(0,tb_bi_shift_register.dut);
    $monitor("serial_ip_l = %b,serial_ip_r = %b mode = %b, out = %b", serial_ip_l,serial_ip_r, mode, out);
    rst = 1;
    repeat(2)@(posedge clk);
    rst = 0;
    serial_ip_l = 1'b0;
    serial_ip_r = 1'b0;
    @(negedge clk)
    @(negedge clk)
    serial_ip_r = 1'b1;
    mode = 1;
    @(negedge clk)
    serial_ip_r = 1'b1;
    @(negedge clk)
    mode = 1'b0;
    @(negedge clk)
    serial_ip_l = 1'b1;
    mode = 1'b1;
    @(negedge clk)
    @(posedge clk)
    repeat(2)@(negedge clk);
    $finish();
    
  end
endmodule
